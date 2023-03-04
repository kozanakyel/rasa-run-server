import os

if __name__ == '__main__':
    port = int(os.getenv("PORT"))
    print(f'Port is {port}')
    os.system('rasa run --enable-api --cors \"*\" --port {}'.format(port))