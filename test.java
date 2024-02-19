import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;

public class ExemploRestAssuredComCertificado {

    public static void main(String[] args) {
        // Caminho para o arquivo cert.crt
        String certificadoPath = "caminho/do/seu/certificado/cert.crt";

        // Caminho para o arquivo chave.key
        String chavePath = "caminho/do/seu/arquivo/chave.key";

        // Faz a chamada usando o certificado e a chave privada
        RequestSpecification request = RestAssured.given().relaxedHTTPSValidation()
                .config(RestAssured.config().sslConfig().keyStore(chavePath, "").and().trustStore(certificadoPath));

        // Exemplo de chamada (substitua pelo seu código real)
        // request.get("/seu-endpoint").then().statusCode(200);
    }
}
