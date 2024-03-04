//Query 1
MATCH (:Perfil {nome:'José'})-[:AMIGO]->(amigo)-[:AMIGO]->(amigo_do_amigo)
RETURN amigo_do_amigo


