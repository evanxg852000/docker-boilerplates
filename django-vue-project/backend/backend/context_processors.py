import os 

def env_vars(request):
    data = {}
    data['app_env'] = os.environ.get('APP_ENV')
    return data