We vertrekken voor deze demo van OSLO compliant jsonld files van verkeersboetes. Deze kunnen terug gevonden worden in deze map



# Start Docker

1. Voordat je aan de slag kan gaan, dient Docker geïnstalleerd te zijn (https://www.docker.com/products/docker-desktop/)
2. Zorg ervoor dat de volgende poorten vrij zijn: 8080, 8000, 9003, 9004 en 27017
3. Om zeker te zijn dat de LDES Client via docker de gepubliceerde LDES in localhost correct kan uitlezen, gebruiken we de hostname van jouw laptop/desktop.
   Ga naar een bash terminal (bv. in Visual Studio Code) en gebruik dit command
   
   `export HOSTNAME=$(hostname)`
  
# Start LDES server
4. Start de LDES server met volgend commando:
```bash
cd Demo_verkeersboete

docker compose up -d
```

Wanneer je nu naar 
http://localhost:8080/verkeersboete gaat, zal je zien dat er reeds een LDES gepubliceerd is, maar nog zonder members.

# Publiceer de json-ld files als LDES members naar Apache NiFi listener:

4. ga eerst naar mapje met alle verkeersboetes:
```bash
cd verkeersboetes

curl -X POST http://localhost:9004/contentListener -H "Content-Type: application/ld+json" -d @verkeersboete1.jsonld
```

# Publiceer de json-ld files als LDES members via Linked data interactions orchestrator:

Ingest verkeersboete gebruik makend van Linked Data Transformation Orchestrator (LDTO) Workflow
Met deze stappen kan een een jsonld file omgezet worden naar een versie object met behulp van de [VSDS Linked Data Transformation Orchestrator (LDTO)](https://github.com/Informatievlaanderen/VSDS-Linked-Data-Interactions) workflow (see [config](./ldio-workflow.config.yml)).

```bash
cd verkeersboetes

curl -X POST http://localhost:9003/data  -H "Content-Type: application/ld+json" -d "@verkeersboete1.jsonld"
```

# Bekijken van gepubliceerde LDES

5. Controleer of de eerste pagina de verkeersboete bevat
```bash
curl http://localhost:8080/verkeersboete/by-page?pageNumber=1
```

# LDES verkeersboetes offline zetten
6. Stop systems
```bash
docker compose down
```
