## 🧩 Prerequisite: Complete NVIDIA GPU & Deep Learning Base Setup

Before using this Docker-based environment, it is strongly recommended to follow the
initial GPU preparation steps provided in the companion repository:

🔗 **Complete Deep-Learning NVIDIA GPU Setup (Linux)**  
https://github.com/ibrar-syed/complete_deep-learning-nvidia_gpu-setup-linux

This companion repo includes a full, standardized setup for:

### ✅ System-Level GPU Preparation
- Installing the correct **NVIDIA drivers** (validated and compatible versions)
- Setting up **CUDA Toolkit**  
- Ensuring matching **cuDNN** libraries
- Configuring environment variables (`PATH`, `LD_LIBRARY_PATH`)
- Verifying GPU access through:
  - `nvidia-smi`
  - CUDA samples
  - cuDNN tests

### 🧱 Why This Setup Matters
Docker containers rely on the **host system’s drivers**, not the container’s.  
Therefore, your system **must** have a properly configured GPU environment *before*
you run any CUDA-enabled Docker containers.

Following the steps in the prerequisite repo ensures:

- CUDA and cuDNN versions correctly align with the base Docker images  
- GPUs are fully accessible inside Docker via the NVIDIA Container Toolkit  
- No conflicts between OS-level drivers and container-level runtimes  
- Smooth performance for PyTorch, MONAI, and diffusion-based models  

### 📘 What You Will Have After Completing the Prerequisite Repo
✔ NVIDIA drivers installed and verified  
✔ CUDA + cuDNN fully configured  
✔ `nvidia-smi` functioning correctly  
✔ GPU detected by PyTorch in a clean base environment  
✔ NVIDIA Container Toolkit ready for Docker integration  

Once your system is fully configured, return to this repository to build and run:

➡️ A **reproducible Docker environment**  
➡️ GPU-enabled **ModelApp container**  
➡️ JupyterLab inside Docker  
➡️ Training/inference pipelines fully isolated inside containers

---
