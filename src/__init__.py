import os
import sys
from flask import Flask,jsonify
from flask_restx import Resource,Api

# intiate app 

app = Flask(__name__)

api=Api(app)

# set config 
app_settings=os.getenv("APP_SETTINGS")
app.config.from_object(app_settings)

class Ping(Resource):
    def get(self):
        return{
            "status":"sucess",
            "message":"pong"
        }
print(app.config,file=sys.stderr)   
api.add_resource(Ping,'/ping')
