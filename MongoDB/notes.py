"""I powershell kørt kommandoerne
docker stop mongo
docker run --name mongo_exam -d -p 27017:27017 mongodb/mongodb-community-server:7.0.5-ubuntu2204
docker start mongo

kan måske også bare starte fra docker. Kunne ikke connecte til mongoDB fra pycharm, chatgpt sagde porten ikke var sat ordentligt op hvilket tror ovenstående linje fikser


ChatGPT:
Når du kører docker ps og ser, at din container mongo_exam er oppe og kører med portbindingen 0.0.0.0:27017->27017/tcp, betyder det, at MongoDB er tilgængelig på din maskine via port 27017.
"""