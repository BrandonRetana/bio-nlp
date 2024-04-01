import subprocess

def huggingface_login():
    try:
        subprocess.run(["huggingface-cli", "login"], check=True)
        print("Login exitoso.")
    except subprocess.CalledProcessError as e:
        print("Error en el login:", e)

# Llamamos a la función para realizar el login
huggingface_login()
