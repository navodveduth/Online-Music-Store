package com.music.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.music.util.AlbumDBConnect;
import com.music.util.RegularUserDBConnect;
import com.music.util.SongDBConnect;
import com.music.model.Album;
import com.music.model.RegularUser;
import com.music.model.Song;

@WebServlet("/SuccessATServlet")
public class SuccessATServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userId =  (String) session.getAttribute("userId");
		String Username = (String) session.getAttribute("uname");

		try {
			List<RegularUser> userDetails = RegularUserDBConnect.getUserDetails(Username);
			request.setAttribute("userDetails", userDetails);

			List<Song> songDetails = SongDBConnect.getSongDetails(userId);
			request.setAttribute("songDetails", songDetails);
			
			List<Album> albumDetails = AlbumDBConnect.getAlbumDetails(userId);
			request.setAttribute("albumDetails", albumDetails);

			RequestDispatcher dis = request.getRequestDispatcher("my-tracks.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
