Feature: Gestão de pets
    Como um gestor da pest store
    Desejo gerenciar os pets
    Para ter o controle das informações cadastradas

    Scenario: Cadastrar um pet utilizando ID
        Given url "https://petstore.swagger.io/v2"
        #baseurl
        And path "pet", "191919"
        #rota e parametros
        And form field name = "gato preto"
        And form field status = "available"
        When method post
        Then status 200
        And match response contains { code: 200, type: "unknown", message: "191919" }

    Scenario: Procurando por usuário
        Given url "https://petstore.swagger.io/v2"
        And path "pet", "191919"
        When method get
        Then status 200
        And match response contains { name: "gato preto", id: 191919 }
    
    Scenario: title
        Given url "https://petstore.swagger.io/v2"
        And path "pet"
        And request
        """
            {
                "id": 191919,
                "category": {
                    "id": 0,
                    "name": "gato preto Frajola"
                },
                "name": "gato preto Frajola",
                "photoUrls": [
                    "string"
                ],
                "tags": [
                    {
                    "id": 0,
                    "name": "string"
                    }
                ],
                "status": "available"
            }
        """

            When method put
            Then status 200
            And match response contains { name: "gato preto Frajola", id: 191919 }
      
        #java -jar karate.jar petstore.feature