import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;

import java.io.File;

public class ExemploRestAssuredComCertificado {

    public static void main(String[] args) {
        // Caminho para o arquivo cert.crt
        String certificadoPath = "caminho/do/seu/certificado/cert.crt";

        // Caminho para o arquivo chave.key
        String chavePath = "caminho/do/seu/arquivo/chave.key";

        // Configuração do RestAssured
        RestAssured.baseURI = "sua_base_uri";
        RestAssured.useRelaxedHTTPSValidation();

        // Configuração do certificado e chave privada
        RestAssured.config = RestAssured.config().sslConfig(
                RestAssured.config().sslConfig().keyStore(chavePath, "")
        );

        // Faz a chamada usando o certificado configurado
        RequestSpecification request = RestAssured.given();
        // ... seu código de requisição continua aqui
    }
}
