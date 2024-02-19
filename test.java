import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;
import io.restassured.response.Response;

import java.io.File;

public class ExemploChamadaAPIComCertificadoEProxy {

    public static void main(String[] args) {
        // Caminho para o arquivo cert.crt
        String certificadoPath = "caminho/do/seu/certificado/cert.crt";

        // Caminho para o arquivo chave.key
        String chavePath = "caminho/do/seu/arquivo/chave.key";

        // URL da API
        String apiUrl = "https://token.com.br/token/";

        // Configuração do proxy (substitua pelos seus valores)
        String proxyHost = "seu_proxy_host";
        int proxyPort = 8080;

        // Configuração do RestAssured
        RestAssured.baseURI = apiUrl;
        RestAssured.useRelaxedHTTPSValidation(); // Use se o certificado não for validado por uma CA confiável

        // Configuração do certificado e chave privada
        RequestSpecification request = RestAssured.given().relaxedHTTPSValidation()
                .config(RestAssured.config()
                        .sslConfig()
                        .keyStore(chavePath, "")
                        .and()
                        .trustStore(certificadoPath))
                .proxy(proxyHost, proxyPort); // Configuração do proxy

        // Parâmetros do formulário
        String parametroId = "3423423455";

        // Faz a chamada POST
        Response response = request
                .formParam("meu_id", parametroId)
                .post();

        // Exibe o status code e a resposta
        System.out.println("Status Code: " + response.getStatusCode());
        System.out.println("Resposta: " + response.getBody().asString());
    }
}
