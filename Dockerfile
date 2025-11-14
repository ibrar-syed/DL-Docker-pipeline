# ---------- Stage 1: build environment ----------
FROM nvidia/cuda:12.1.0-devel-ubuntu22.04 as builder
ARG MINICONDA_VERSION=latest
ENV PATH=/opt/conda/bin:$PATH
# system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget ca-certificates git bzip2 libglib2.0-0 libsm6 libxext6 libxrender-dev \
    build-essential && rm -rf /var/lib/apt/lists/*

# install miniconda
RUN wget -qO /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh \
 && bash /tmp/miniconda.sh -b -p /opt/conda \
 && rm /tmp/miniconda.sh

# Install mamba for faster env creation
RUN conda install -n base -c conda-forge mamba -y && conda clean -afy

# Copy environment spec and create env
COPY environment.yml /tmp/environment.yml
RUN mamba env create -f /tmp/environment.yml -n modelapp && conda clean -afy

# ---------- Stage 2: runtime ----------
FROM nvidia/cuda:12.1.0-runtime-ubuntu22.04
ENV PATH=/opt/conda/bin:/opt/conda/envs/modelapp/bin:$PATH
# copy conda from builder
COPY --from=builder /opt/conda /opt/conda

# create non-root user
ARG USERNAME=modeluser
ARG UID=1000
RUN useradd -m -u ${UID} ${USERNAME} && \
    mkdir -p /workspace && chown -R ${USERNAME}:${USERNAME} /workspace

WORKDIR /workspace
USER ${USERNAME}

# jupyter port
EXPOSE 8888

# Minimal entrypoint which activates env and runs jupyterlab
ENTRYPOINT ["bash", "-lc", "source /opt/conda/etc/profile.d/conda.sh && conda activate modelapp && exec \"$@\""]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
