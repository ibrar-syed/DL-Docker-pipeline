# ================================================================
# Dockerfile for ModelApp (GPU + Conda + JupyterLab)
# ================================================================

FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

WORKDIR /workspace

# ---------------------------------------------------------------
# System dependencies
# ---------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    git wget curl vim nano ca-certificates python3-pip python3-dev \
    libglib2.0-0 libsm6 libxext6 libxrender-dev x11-apps xauth && \
    rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------------
# Install Miniconda
# ---------------------------------------------------------------
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/opt/conda/bin:$PATH

# ---------------------------------------------------------------
# Copy and create environment
# ---------------------------------------------------------------
COPY environment.yml /tmp/environment.yml

RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r && \
    conda env create -f /tmp/environment.yml

SHELL ["bash", "-c"]
RUN echo "conda activate modelapp" >> ~/.bashrc
ENV CONDA_DEFAULT_ENV=modelapp
ENV PATH=/opt/conda/envs/modelapp/bin:$PATH

# ---------------------------------------------------------------
# JupyterLab and Ports
# ---------------------------------------------------------------
RUN conda run -n modelapp pip install jupyterlab
EXPOSE 8888

CMD ["bash", "-c", "source activate modelapp && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]
