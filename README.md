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


