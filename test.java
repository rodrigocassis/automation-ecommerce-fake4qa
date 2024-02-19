import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;

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

        // Configuração do usuário e senha do proxy (se necessário)
        String proxyUser = "seu_usuario";
        String proxyPassword = "sua_senha";

        // Configuração do RestAssured
        RestAssured.baseURI = apiUrl;
        RestAssured.useRelaxedHTTPSValidation(); // Use se o certificado não for validado por uma CA confiável

        // Faz a chamada usando o certificado e a chave privada
        RequestSpecification request = RestAssured.given().relaxedHTTPSValidation()
                .keyStore(chavePath, "")
                .and()
                .trustStore(certificadoPath)
                .proxy(proxyHost, proxyPort) // Configuração do proxy
                .proxyUser(proxyUser) // Configuração do usuário do proxy
                .proxyPassword(proxyPassword); // Configuração da senha do proxy

        // Parâmetros do formulário
        String parametroId = "3423423455";

        // Faz a chamada POST
        request
            .formParam("meu_id", parametroId)
            .post()
            .then()
            .statusCode(200);
    }
}
