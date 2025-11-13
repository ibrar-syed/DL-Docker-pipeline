# DL-Docker-pipeline
A reproducible Docker-based pipeline for running Machine/Deep learning exps, with GPU support. This repository provides pre-configured Docker images, environment files, and scripts for: 
- - Setting up GPU-enabled containers
- - Running training and inference
- - Managing environments reproducible
 
  - # ModelApp — GPU-Enabled Dockerized ML Environment

A complete, reproducible setup for deep learning experiments using **Docker**, **Conda**, and **JupyterLab** with GPU support.

---

## 📁 Project Structure

ModelApp/
├── Dockerfile
├── environment.yml
├── requirements.txt
├── src/
│ ├── train.py
│ └── inference.py
├── notebooks/
│ └── demo_notebook.ipynb
└── data/


---

## 🚀 Quick Start

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/<your-username>/ModelApp.git
cd ModelApp


2️⃣ Build the Docker Image
sudo docker build -t modelapp-container .

3️⃣ Run the Container (GPU + Jupyter)
docker run --gpus all -it --rm \
  -p 8888:8888 \
  -v $(pwd):/workspace \
  modelapp-container

-------------------------------------------------------------------------------------------------
📎 Flags:

--gpus all → enables GPU access inside container

-p 8888:8888 → maps JupyterLab port

-v $(pwd):/workspace → mounts project folder

Once running, open the browser link that appears (e.g. http://127.0.0.1:8888/lab?...).
---------------------------------------------------------------------------------------------------

4️⃣ Verify GPU Access

Inside the container:

nvidia-smi
python -c "import torch; print(torch.cuda.is_available())"


**You should see your GPU and True.**



🧩 Development Inside Container

**To open a terminal inside container:**

docker exec -it <container_id> /bin/bash




##To run training:
python train.py


------------------------------------------------------------------------------------------------------------------
✅ Why This Setup?

Reproducible ML experiments

Full GPU acceleration

No “it works on my machine” issues

Portable across OS/machines

Seamless JupyterLab workflowcd /workspace/src

---------------------------------------------------------------------------------------------------------------------
👥 Contributing

Fork this repo

Create a new branch (feature/my-feature)

Commit your changes

Submit a pull request 🚀
