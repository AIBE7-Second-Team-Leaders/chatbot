package com.example.archat.domain.model;

/// Supabase 사용자 정보를 서버 세션에 저장하기 전에 잠깐 담아두는 모델
public record AuthUser(
        String id,
        String email
) {
}