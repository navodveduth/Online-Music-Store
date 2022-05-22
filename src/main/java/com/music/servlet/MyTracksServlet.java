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

@WebServlet("/MyTracksServlet")
public class MyTracksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userId");
		String userimg = request.getParameter("userImg");
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", userid);
		session.setAttribute("userImg", userimg);
		
		String Username = (String) session.getAttribute("uname");

		try {
			List<RegularUser> userDetails = RegularUserDBConnect.getUserDetails(Username);
			request.setAttribute("userDetails", userDetails);

			List<Song> songDetails = SongDBConnect.getSongDetails(userid);
			request.setAttribute("songDetails", songDetails);
			
			List<Album> albumDetails = AlbumDBConnect.getAlbumDetails(userid);
			request.setAttribute("albumDetails", albumDetails);

			RequestDispatcher dis = request.getRequestDispatcher("my-tracks.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
