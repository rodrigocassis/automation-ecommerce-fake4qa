import io.restassured.RestAssured;
import io.restassured.config.SSLConfig;
import io.restassured.specification.RequestSpecification;

import java.io.File;

public class ExemploRestAssuredComCertificado {

    public static void main(String[] args) {
        // Caminho para o arquivo cert.crt
        String certificadoPath = "caminho/do/seu/certificado/cert.crt";

        // Caminho para o arquivo chave.key
        String chavePath = "caminho/do/seu/arquivo/chave.key";

        // Configuração do RestAssured
        RestAssured.baseURI = "https://sua-api.com";
        RestAssured.useRelaxedHTTPSValidation();

        // Configuração do certificado e chave privada
        SSLConfig sslConfig = new SSLConfig().with().keyStore(chavePath, "").and().trustStore(certificadoPath);

        // Configura o RestAssured para usar o certificado e chave privada
        RestAssured.config = RestAssured.config().sslConfig(sslConfig);

        // Faz a chamada usando o certificado configurado
        RequestSpecification request = RestAssured.given();

        // Seu código de requisição continua aqui
        // Exemplo: request.get("/seu-endpoint").then().statusCode(200);

        // Lembre-se de ajustar o endpoint conforme necessário
    }
}
