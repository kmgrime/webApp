# Website with Python and Streamlit

Personal project built to be able to do test deployments with IaC and other Cloud Native services.

## Prerequisites

- Python
- PIP
- Streamlit

## Installation

### Python

```
https://www.python.org/downloads/
```

macOS

```
$ brew install python
```

Windows

```
$ winget install python
```

Linux

```
$ apt-get install python
```

### PIP

Python comes with an ensurepip module1, which can install pip in a Python environment.<br>

Linux and macOS

```
$ python -m ensurepip --upgrade
```

Windows

```
C:> py -m ensurepip --upgrade
```

### Streamlit
```
$ pip install streamlit
```

## Deployment
```
$ az deployment sub create --template-file ./build/main.bicep --parameters 'build/parameters.dev.json' --location norwayeast --output jsonc
```
