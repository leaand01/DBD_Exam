from pymongo import MongoClient


# Forbind til MongoDB-server (standard er localhost og port 27017)
client = MongoClient("mongodb://localhost:27017/")

# Opret eller vælg DB
db = client["exam_DB"]
