import importlib.metadata
import subprocess
import sys

def install_package(package):
    subprocess.check_call([sys.executable, "-m", "pip", "install", package])

def check_and_install(package):
    try:
        dist = importlib.metadata.distribution(package)
        print(f"{dist.metadata['Name']} ({dist.version}) is installed")
    except importlib.metadata.PackageNotFoundError:
        print(f"{package} is NOT installed")
        print(f"Installing {package}...")
        install_package(package)

# Example usage:
# check_and_install('numpy')

