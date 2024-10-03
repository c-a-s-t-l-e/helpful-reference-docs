# How To Use a Virtual Environment with Jupyterlab

## 1. Install Jupyterlab

```
pip install jupyterlab   
```

## 2. Make a virtual environment

```
python -m venv <name-of-your-virtual-environment>   
```

## 3. Activate the Virtual Environment

In Windows, run this:
```
.\<name-of-your-virtual-environment>\Scripts\activate
```

In Linux/Mac, run this:
```
source <name-of-your-virtual-environment>/bin/activate  
```
## 4. Install ipykernel (While Inside the Virtual Environment)

```
pip install ipykernel     
```
## 5. Add Your Virtual Environment as a Kernel in Jupyterlab (Also While Inside the Virtual Environment)

```
python -m ipykernel install --user --name=<name-of-your-virtual-environment>
```

## Addtional Notes

# If You Want to Deactivate the Virtual Environment While You Are In It

```
deactivate
```

## If You Want To See Your Kernels in Jupyterlab

```
jupyter kernelspec list
```

## If You Want to Remove a Kernel from Jupyterlab

```
jupyter kernelspec uninstall <name-of-your-virtual-environment>
```

_Note: Inspired by Sina Khoshgoftar's Linkedin [post](https://www.linkedin.com/pulse/how-use-virtual-environment-inside-jupyter-lab-sina-khoshgoftar/)._
