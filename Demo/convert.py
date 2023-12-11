from rdflib import Graph

# Load RDF data from the Turtle file
rdf_file_path = './test.ttl'
graph = Graph()
graph.parse(rdf_file_path, format='ttl')

# SPARQL SELECT query
sparql_query = """
SELECT 
  (STR(?geometry) as ?geometrie)
WHERE {
  OPTIONAL { 
    ?s <http://www.opengis.net/ont/geosparql#asWKT> ?geometry .

  }
 
}




"""


"""
PREFIX schema: <https://schema.org/>

SELECT (STR(?value) AS ?value)
WHERE {
  ?subject schema:value ?value.
}
"""

# Execute the SPARQL query
query_result = graph.query(sparql_query)

# Print the results
for row in query_result:
    print(row)
