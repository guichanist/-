<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="928532416878-1ng6og2sddinhr5qljdenvd0g3g4t9s6.apps.googleusercontent.com">
 <script src="https://apis.google.com/js/platform.js" async defer></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function onSignIn(googleUser) {

    var profile = googleUser.getBasicProfile();

    jQuery("#id").html(profile.getId());
    jQuery("#name").html(profile.getName());
    jQuery("#email").html(profile.getEmail());
    jQuery("#image_url").attr('src', profile.getImageUrl());
}
</script>
</head>
<body>
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<br/>
id : <span id="id"></span><br/>
name : <span id="name"></span><br/>
email : <span id="email"></span><br/>
image_url<br/>
<img id="image_url" src="#"/>
</body>
</html>
