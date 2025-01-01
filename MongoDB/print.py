from pprint import pprint  # pretty print
from CreateDB import db


# print alle collections i db
collections = db.list_collection_names()
print('\nAll collections in exam_DB: ', collections)

# print all documents in each collection
for collection_name in ['customers', 'inventory', 'orders', 'logs']:
    print(f"\nDocuments in collection '{collection_name}':")
    collection = db[collection_name]

    # Hent alle dokumenter i collection
    documents = collection.find()

    # Udskriv dokumenter
    for doc in documents:
        pprint(doc)
