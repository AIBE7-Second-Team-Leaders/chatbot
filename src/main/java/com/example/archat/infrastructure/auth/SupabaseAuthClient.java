package com.example.archat.infrastructure.auth;

import com.example.archat.domain.model.AuthUser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class SupabaseAuthClient {
    private static final String SUPABASE_URL = "https://sbxlfgdwogpdondzyvia.supabase.co";
    private static final String SUPABASE_KEY = "sb_publishable_XHbMwByaC6Niq019201IXA_CBg83ih0";

    private final HttpClient httpClient = HttpClient.newHttpClient();
    private final ObjectMapper objectMapper = new ObjectMapper();

    public AuthUser getUser(String accessToken) {
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(SUPABASE_URL + "/auth/v1/user"))
                    .header("apikey", SUPABASE_KEY)
                    .header("Authorization", "Bearer " + accessToken)
                    .GET()
                    .build();
            HttpResponse<String> response = httpClient.send(
                    request,
                    HttpResponse.BodyHandlers.ofString()
            );
            if (response.statusCode() != 200) {
                throw new IllegalArgumentException("Supabase 사용자 인증 실패");
            }

            JsonNode jsonNode = objectMapper.readTree(response.body());

            return new AuthUser(
                    jsonNode.get("id").asText(),
                    jsonNode.get("email").asText()
            );
        } catch (Exception e) {
            throw new RuntimeException("Supabase 사용자 정보를 가져오지 못했습니다.", e);
        }
    }

    private SupabaseAuthClient() {
    }

    private static final SupabaseAuthClient instance = new SupabaseAuthClient();

    public static SupabaseAuthClient getInstance() {
        return instance;
    }
}
