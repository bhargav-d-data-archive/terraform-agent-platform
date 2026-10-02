from fastapi import FastAPI
import os

app = FastAPI(title="Terraform Agent Platform")

@app.get("/")
def root():
    return {
        "service": "terraform-agent-platform",
        "environment": os.getenv("ENVIRONMENT", "unknown"),
        "status": "running"
    }

@app.get("/health")
def health():
    return {"status": "healthy"}
