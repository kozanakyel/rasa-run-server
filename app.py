import os

if __name__ == '__main__':
    #port = int(os.getenv("PORT"))
    #print(f'Port is {port}')
    port=5005
    #os.system('python -m spacy download en_core_web_md')
    os.system('rasa run --enable-api --cors \"*\" --port {}'.format(port))
    
#rasa run --enable-api --cors "*"
    
    