<dependency>
    <groupId>org.bouncycastle</groupId>
    <artifactId>bcprov-jdk15on</artifactId>
    <version>1.68</version>
</dependency>



    import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.File;
import java.security.KeyStore;
import java.security.Security;

public class ExemploRestAssuredComCertificado {

    public static void main(String[] args) {
        // Caminho para o arquivo cert.crt
        String certificadoPath = "caminho/do/seu/certificado/cert.crt";

        // Caminho para o arquivo chave.key
        String chavePath = "caminho/do/seu/arquivo/chave.key";

        // Adiciona o provedor Bouncy Castle
        Security.addProvider(new BouncyCastleProvider());

        // Faz a chamada usando o certificado e a chave privada
        RequestSpecification request = RestAssured.given().relaxedHTTPSValidation()
                .config(RestAssured.config().sslConfig().keyStore(loadKeyStore(chavePath, "")).and().trustStore(certificadoPath));

        // Exemplo de chamada (substitua pelo seu código real)
        // request.get("/seu-endpoint").then().statusCode(200);
    }

    private static KeyStore loadKeyStore(String chavePath, String senha) {
        try {
            KeyStore keyStore = KeyStore.getInstance("PKCS12", "BC");
            keyStore.load(null, null);

            // Adiciona a chave privada ao KeyStore
            keyStore.setKeyEntry("alias", // escolha um alias
                    KeyUtils.loadPrivateKey(chavePath, ""), // senha da chave privada
                    new char[0], // senha da chave privada (char[])
                    KeyUtils.loadCertificateChain(chavePath)); // certificado associado à chave privada

            return keyStore;
        } catch (Exception e) {
            throw new RuntimeException("Erro ao carregar o KeyStore", e);
        }
    }
}
