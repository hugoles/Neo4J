//Query 2
MATCH(:Perfil{nome:'José'})-[:AMIGO]->(amigo)-[:Comentou]->(PostFot)<-[:PostouFoto]-(:Perfil{nome:'Mauro'}) return amigo