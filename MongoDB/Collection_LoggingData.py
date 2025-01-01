import uuid
from datetime import datetime, timedelta
from CreateDB import db


# Opret en collection for logging data
logs_collection = db["logs"]

# load
customers = db["customers"].find()
inventory = db["inventory"].find()

customers = list(customers)


# Indsæt nogle dokumenter
logs_data = [
    # one session
    {"session_id": str(uuid.uuid4()),
    "timestamp": datetime.utcnow(),
     # Embed customer info
     "customer": {
         "customer_id": customers[0]["customer_id"],
         "full_name": customers[0]["full_name"],
         "email": customers[0]["email"],
         "address": customers[0]["address"]
         },
     "status": "200",
     "error": ""
     },

    # another session
    {"session_id": str(uuid.uuid4()),
     # Embed customer info
     "customer": {
         "customer_id": customers[2]["customer_id"],
         "full_name": customers[2]["full_name"],
         "email": customers[2]["email"],
         "address": customers[2]["address"]
         },
     "status": "503",
     "error": "MongoDB server temporarily unavailable"
     }
]

logs_collection.insert_many(logs_data)



# Migration efter 1år
log_data2 = {"session_id": str(uuid.uuid4()),
             # "timestamp": datetime.utcnow(),  # New renaming we must keep in mind when considering logs before and after the migration. This key-value pair could also have been kept as is.
             "session_start": datetime.utcnow(),
             "session_end": datetime.utcnow() + timedelta(minutes=12),
             # Embed customer info
             "customer": {
                 "customer_id": customers[3]["customer_id"],
                 "full_name": customers[3]["full_name"],
                 "email": customers[3]["email"],
                 "address": customers[3]["address"],
                 "mobile": customers[3]["mobile"],  # husk at inkluder ny customer data efter migration. HUSK kun NYE kunder har disse felter
                 "birthday": customers[3]["birthday"]
                 },
             "status": "200",
             "error": "",
             "clicked_items": [
                 {"item_id": inventory[0]["item_id"], "item": inventory[0]["item"], "minutes": 1},
                 {"item_id": inventory[1]["item_id"], "item": inventory[1]["item"], "minutes": 5},
                 {"item_id": inventory[2]["item_id"], "item": inventory[2]["item"], "minutes": 3},
                 ],
             "purchased_items": {"item_id": inventory[1]["item_id"], "item": inventory[1]["item"], "minutes": 5}
             }
# log_data2 = {"session_id": str(uuid.uuid4()),
#              # "timestamp": datetime.utcnow(),  # New renaming we must keep in mind when considering logs before and after the migration. This key-value pair could also have been kept as is.
#              "session_start": datetime.utcnow(),
#              "session_end": datetime.utcnow() + timedelta(minutes=12),
#              # Embed customer info
#              "customer": {
#                  "customer_id": customers[5]["customer_id"],
#                  "full_name": customers[5]["full_name"],
#                  "email": customers[5]["email"],
#                  "address": customers[5]["address"],
#                  "mobile": customers[5]["mobile"],  # husk at inkluder ny customer data efter migration. HUSK kun NYE kunder har disse felter
#                  "birthday": customers[5]["birthday"]
#                  },
#              "status": "200",
#              "error": "",
#              "clicked_items": [
#                  {"item_id": inventory[0]["item_id"], "item": inventory[0]["item"], "minutes": 1},
#                  {"item_id": inventory[1]["item_id"], "item": inventory[1]["item"], "minutes": 5},
#                  {"item_id": inventory[2]["item_id"], "item": inventory[2]["item"], "minutes": 3},
#                  ],
#              "purchased_items": {"item_id": inventory[1]["item_id"], "item": inventory[1]["item"], "minutes": 5}
#              }

logs_collection.insert_one(log_data2)
