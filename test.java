import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;

import javax.net.ssl.KeyManagerFactory;
import java.io.FileInputStream;
import java.security.KeyStore;

public class ExemploRestAssuredComCertificado {

    public static void main(String[] args) {
        // Caminho para o arquivo cert.crt
        String certificadoPath = "caminho/do/seu/certificado/cert.crt";

        // Caminho para o arquivo chave.key
        String chavePath = "caminho/do/seu/arquivo/chave.key";

        // Configuração do RestAssured
        RestAssured.baseURI = "sua_base_uri";
        RestAssured.useRelaxedHTTPSValidation();

        try {
            // Carrega o certificado
            KeyStore keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
            keyStore.load(new FileInputStream(certificadoPath), null);

            // Configura o RestAssured para usar o certificado e chave privada
            KeyManagerFactory keyManagerFactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
            keyManagerFactory.init(keyStore, null);

            RestAssured.config = RestAssured.config().sslConfig().keyStore(keyStore);
            RestAssured.config = RestAssured.config().sslConfig().keyManager(keyManagerFactory);

            // Faz a chamada usando o certificado configurado
            RequestSpecification request = RestAssured.given();
            // ... seu código de requisição continua aqui
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
