from flask import Flask,jsonify
from flask_restx import Resource,Api

#intiate app 

app = Flask(__name__)

api=Api(app)

# set config 
app.config.from_object('src.config.DevelopmentConfig')

class Ping(Resource):
    def get(self):
        return{
            "status":"sucess",
            "message":"pong"
        }
    
api.add_resource(Ping,'/ping')
