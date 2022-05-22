package com.music.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.music.util.AlbumDBConnect;

@WebServlet("/DeleteAlbumServlet")
public class DeleteAlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean deleted = false;

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		try {
			String album_title = request.getParameter("album_title");

			deleted = AlbumDBConnect.deletealbum(album_title);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (deleted == true) {
			RequestDispatcher dis = request.getRequestDispatcher("/successat");
			dis.forward(request, response);
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Delete not successful!!!');");
			out.println("</script>");
		}

	}

}