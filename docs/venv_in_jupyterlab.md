# How To Use a Virtual Environment with Jupyterlab

## 1. Install Jupyterlab

```
pip install jupyterlab   
```

## 2. Make a virtual environment

```
python -m venv <name-of-your-virtual-environment>   
```

## 3. Activate the virtual environment

In Windows, run this:
```
.\<name-of-your-virtual-environment>\Scripts\activate
```

In Linux/Mac, run this:
```
source <name-of-your-virtual-environment>/bin/activate  
```
## 4. Install ipykernel (while inside the virtual environment)

```
pip install ipykernel     
```
## 5. Add your virtual environment as a kernel in Jupyterlab (also while inside the virtual environment)

```
python -m ipykernel install --user --name=<name-of-your-virtual-environment>
```

## Addtional Notes

---

## If you want to deactivate the virtual environment while you are in it

```
deactivate
```

## If you want to see your kernels in Jupyterlab

```
jupyter kernelspec list
```

## If you want to remove a kernel from Jupyterlab

```
jupyter kernelspec uninstall <name-of-your-virtual-environment>
```

_Note: Inspired by Sina Khoshgoftar's Linkedin [post](https://www.linkedin.com/pulse/how-use-virtual-environment-inside-jupyter-lab-sina-khoshgoftar/)._
