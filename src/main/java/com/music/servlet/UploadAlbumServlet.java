package com.music.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.music.util.AlbumDBConnect;

@WebServlet("/UploadAlbumServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UploadAlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Name of the directory where uploaded files will be saved
	private static final String UPLOAD_DIR = "songs";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean uploaded = false;
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		// gets absolute path of the web application
		String appPath = request.getServletContext().getRealPath("");

		// constructs path of the directory to save uploaded file
		String savePath = appPath + File.separator + UPLOAD_DIR;

		// if directory does not exists creates the upload directory
		File SaveDir = new File(savePath);
		if (!SaveDir.exists()) {
			SaveDir.mkdir();
		}

		try {
			String albumName = request.getParameter("album_name");
			String artist = request.getParameter("artist_name");
			String albumDes = request.getParameter("album_des");
			String[] tracks = request.getParameterValues("songs");

			HttpSession session = request.getSession();
			String userID = (String) session.getAttribute("userId");

			Part imageName = request.getPart("image");
			String imgName = extractFileName(imageName);
			// refines the image file name
			imgName = new File(imgName).getName();
			imageName.write(savePath + File.separator + imgName);

			for (int i = 0; i < tracks.length; i++) {
				uploaded = AlbumDBConnect.uploadalbum(albumName, artist, albumDes, imgName, tracks[i] + ".mp3", userID);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (uploaded == true) {
			RequestDispatcher dis = request.getRequestDispatcher("/successat");
			dis.forward(request, response);
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Upload not successful!!!');");
			out.println("</script>");
		}
	}

	/*
	 * reference- https://stackoverflow.com/a/24853637
	 * https://codejava.net/java-ee/servlet/java-file-upload-example-with-servlet-30
	 * -api
	 */
	/*
	 * Extracts file name from HTTP header content-disposition
	 */
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}