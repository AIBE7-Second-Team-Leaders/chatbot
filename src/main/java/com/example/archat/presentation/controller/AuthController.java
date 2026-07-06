package com.example.archat.presentation.controller;

import com.example.archat.domain.model.AuthUser;
import com.example.archat.infrastructure.auth.SupabaseAuthClient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/auth/session")
public class AuthController extends BaseController {
    private final SupabaseAuthClient supabaseAuthClient = SupabaseAuthClient.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accessToken = req.getParameter("accessToken");

        if (accessToken == null || accessToken.isBlank()) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        try {
            AuthUser user = supabaseAuthClient.getUser(accessToken);

            HttpSession session = req.getSession();
            session.setAttribute("loginUserId", user.id());
            session.setAttribute("loginEmail", user.email());

            resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }
}
