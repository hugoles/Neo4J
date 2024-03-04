// Criar nós para os perfis
CREATE (Jose:Perfil {
  nome: "José",
  data_nascimento: "10/05/1980",
  pais: "Brasil",
  cidade: "São Paulo",
  sexo: "Masculino",
  religiao: "Católica",
  estado_civil: "Solteiro"
})

CREATE (Mauro:Perfil {
  nome: "Mauro",
  data_nascimento: "15/09/1992",
  pais: "Brasil",
  cidade: "Rio de Janeiro",
  sexo: "Masculino",
  religiao: "Ateu",
  estado_civil: "Casado"
})

CREATE (Leda:Perfil {
  nome: "Leda",
  data_nascimento: "22/03/1985",
  pais: "Brasil",
  cidade: "Belo Horizonte",
  sexo: "Feminino",
  religiao: "Evangelica",
  estado_civil: "Divorciada"
})

CREATE (Erika:Perfil {
  nome: "Erika",
  data_nascimento: "05/11/1990",
  pais: "Brasil",
  cidade: "Curitiba",
  sexo: "Feminino",
  religiao: "Budista",
  estado_civil: "Solteira"
})

CREATE (Daniel:Perfil {
  nome: "Daniel",
  data_nascimento: "12/07/1988",
  pais: "Brasil",
  cidade: "Fortaleza",
  sexo: "Masculino",
  religiao: "Hindu",
  estado_civil: "Casado"
})

CREATE (Edilson:Perfil {
  nome: "Edilson",
  data_nascimento: "30/01/1983",
  pais: "Brasil",
  cidade: "Salvador",
  sexo: "Masculino",
  religiao: "Islamica",
  estado_civil: "Divorciado"
})

CREATE (Aline:Perfil {
  nome: "Aline",
  data_nascimento: "18/04/1995",
  pais: "Brasil",
  cidade: "Recife",
  sexo: "Feminino",
  religiao: "Espírita",
  estado_civil: "Solteira"
})

CREATE (Mauro)-[:AMIGO]->(Alines)
CREATE (Mauro)-[:AMIGO]->(Leda)
CREATE (Mauro)-[:AMIGO]->(Erika)
CREATE (Mauro)-[:AMIGO]->(Daniel)

CREATE (Leda)-[:AMIGO]->(Mauro)
CREATE (Leda)-[:AMIGO]->(Erika)
CREATE (Leda)-[:AMIGO]->(Edilson)

CREATE (Erika)-[:AMIGO]->(Mauro)
CREATE (Erika)-[:AMIGO]->(Leda)
CREATE (Erika)-[:AMIGO]->(Aline)

CREATE (Daniel)-[:AMIGO]->(Mauro)
CREATE (Daniel)-[:AMIGO]->(Edilson)
CREATE (Daniel)-[:AMIGO]->(Aline)

CREATE (Edilson)-[:AMIGO]->(Mauro)
CREATE (Edilson)-[:AMIGO]->(Leda)
CREATE (Edilson)-[:AMIGO]->(Daniel)

CREATE (Aline)-[:AMIGO]->(Daniel)
CREATE (Aline)-[:AMIGO]->(Mauro)
CREATE (Aline)-[:AMIGO]->(Erika)
CREATE (Aline)-[:AMIGO]->(Jose)

CREATE (Jose)-[:AMIGO]->(Aline)

CREATE (MMensagem:Mensagem {nome: "mensagens de Mauro",
                            mensagem: "Bom dia"})
                            
CREATE (Mauro)-[:EnviouMensagem]->(MMensagem)

FOREACH (recipientName IN ['Aline','Daniel','Erika','Edilson'] |
  MERGE (recipient:Perfil {nome: recipientName})
  CREATE (MMensagem)-[:EnviouMensagem]->(recipient)
)


CREATE (MFoto:PostFot {nome: "Mauro foto"})
CREATE (Mauro)-[:PostouFoto]->(MFoto)

FOREACH (recipientName IN ['Aline','Daniel','Erika','Edilson'] |
  MERGE (recipient:Perfil {nome: recipientName})
  CREATE (recipient)-[:Comentou{comentarios:"GATOOOO"}]->(MFoto)
)

CREATE (APoema:PostText {
    nome: "A Pedra",
    conteudo: "No meio da pedra tinha uma pedra, tinha uma pedra no meio da pedra. Tinha uma pedra, no meio da pedra tinha uma pedra. Nunca me esquecerei dessa pedra na vida de minhas pedras tão fatigadas. Nunca me esquecerei que no meio da pedra tinha uma pedra, tinha uma pedra no meio da pedra, no meio da pedra tinha uma pedra."})
CREATE (Aline)-[:PostouTexto]->(APoema)
FOREACH (recipientName IN ['José','Mauro','Erika','Daniel'] |
  MERGE (recipient:Perfil {nome: recipientName})
  CREATE (recipient)-[:Comentou{comentarios:"Pedra"}]->(APoema)
)


CREATE (AMensagem:Mensagem {nome: "mensagens de Aline",
                            mensagem: "Que mensagem chata"})                   
CREATE (Aline)-[:EnviouMensagem]->(AMensagem)
CREATE (AMensagem)-[:EnviouMensagem]->(Jose)

return Aline,Edilson,Jose,Mauro,Erika,Daniel,MMensagem,MFoto,APoema,AMensagem