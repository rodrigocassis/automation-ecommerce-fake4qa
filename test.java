import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;

import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

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

        // Configuração do usuário e senha do proxy (se necessário)
        String proxyUser = "seu_usuario";
        String proxyPassword = "sua_senha";

        try {
            // Configuração do RestAssured
            RestAssured.baseURI = apiUrl;
            RestAssured.useRelaxedHTTPSValidation(); // Use se o certificado não for validado por uma CA confiável

            // Carregamento do certificado como X509Certificate
            CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
            X509Certificate certificate = (X509Certificate) certificateFactory.generateCertificate(new FileInputStream(certificadoPath));

            // Configuração do KeyStore para o certificado
            KeyStore trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
            trustStore.load(null, null);
            trustStore.setCertificateEntry("alias", certificate);

            // Faz a chamada usando o certificado, a chave privada e o proxy
            RequestSpecification request = RestAssured.given().relaxedHTTPSValidation()
                    .keyStore(chavePath, "")
                    .and()
                    .trustStore(trustStore)
                    .proxy(proxyHost, proxyPort)
                    .proxyUser(proxyUser)
                    .proxyPassword(proxyPassword);

            // Parâmetros do formulário
            String parametroId = "3423423455";

            // Faz a chamada POST
            request
                .formParam("meu_id", parametroId)
                .post()
                .then()
                .statusCode(200);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
