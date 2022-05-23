<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/playlist.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Icons -->
<script src="https://kit.fontawesome.com/f994c4283d.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="body">
		<div class="left_side">
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>
		<div class="right_side">
			<jsp:include page="header.jsp"></jsp:include>

			<div class='playlist_body'>
				<img
					src="https://newjams-images.scdn.co/image/ab676477000033ad/dt/v3/discover-weekly/34ynaJrTL7O7H9qogkydYaiDGBXWeHhXFp5z4FJB9RH2LbydQr2W4IlnAqz8amim3POE-QLCGzTqIQrY8_f3tPF5CwOSqtIH4iAlnbDzPKo=/NDE6ODFUODItMTAtMjIwMg=="
					alt='' />

				<div class='playlist_des'>
					<strong>PLAYLIST</strong>
					<h2>Discover Weekly</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
			</div>

			<div class='songs_list'>
				<div class='song'>
					<img class='song_album'
						src="https://newjams-images.scdn.co/image/ab676477000033ad/dt/v3/discover-weekly/34ynaJrTL7O7H9qogkydYaiDGBXWeHhXFp5z4FJB9RH2LbydQr2W4IlnAqz8amim3POE-QLCGzTqIQrY8_f3tPF5CwOSqtIH4iAlnbDzPKo=/NDE6ODFUODItMTAtMjIwMg=="
						alt='' />
					<div class='song_des'>
						<h1>Easy On Me</h1>
						<p>Adele - Easy On Me</p>
					</div>
				</div>

				<div class='song'>
					<img class='song_album'
						src="https://newjams-images.scdn.co/image/ab676477000033ad/dt/v3/discover-weekly/34ynaJrTL7O7H9qogkydYaiDGBXWeHhXFp5z4FJB9RH2LbydQr2W4IlnAqz8amim3POE-QLCGzTqIQrY8_f3tPF5CwOSqtIH4iAlnbDzPKo=/NDE6ODFUODItMTAtMjIwMg=="
						alt='' />
					<div class='song_des'>
						<h1>Shivers</h1>
						<p>Shivers - Ed Sheeran</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="player.jsp"></jsp:include>
</body>
</html>