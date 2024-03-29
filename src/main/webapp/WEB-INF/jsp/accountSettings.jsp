<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="css/reading/main.css"/>
<link rel="stylesheet" href="css/profile/style.css"/>
<link rel="stylesheet" href="css/writing-podcast/style.css"/>
<link rel="stylesheet" href="css/writing-podcast/banner.css"/>
<link rel="stylesheet" href="css/writing-podcast/main.css"/>

<style>
    .cycle-tab-container {
        margin: 0px;
        padding: 20px;
        box-shadow: 0 0 10px 2px #ddd;
    }

    .cycle-tab-container a {
        color: #173649;
        font-size: 18px;
        font-family: roboto;
        text-align: center;
    }

    .tab-pane {
        height: auto !important;
        margin-top: 15px;
        width: auto;
        max-width: 100%;
    }

    .fade {
        opacity: 0;
        /*   transition: opacity 4s ease-in-out; */
    }

    .fade.active {
        opacity: 1;
    }

    .cycle-tab-item {
        width: 135px;
    }

    .cycle-tab-item:after {
        display: block;
        content: "";
        border-bottom: solid 3px orange;
        transform: scaleX(0);
        /*   transition: transform 0ms ease-out; */
    }

    .cycle-tab-item.active:after {
        transform: scaleX(1);
        transform-origin: 0% 50%;
        /*   transition: transform 5000ms ease-in; */
    }

    .nav-link:focus,
    .nav-link:hover,
    .cycle-tab-item.active a {
        border-color: transparent !important;
        color: orange;
    }

    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        transition: 0.3s;
        border-radius: 5px;
        cursor: pointer;
        width: 28%;
        padding: unset;
        height: fit-content;
    }

    .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
    }

    img {
        border-radius: 5px 5px 0 0;
    }

    .card-img-top {
        object-fit: contain;
        height: 132px;
    }

    .tab-content {
        margin: 0px;
        padding: 20px;
        box-shadow: 0 0 10px 2px #ddd;
        width: -webkit-fill-available;
    }

    .card-horizontal {
        display: flex;
        flex: 1 1 auto;
    }

    .profile-pic {
        align-content: center;
        background-position: center;
        background-blend-mode: multiply;
        vertical-align: middle;
        text-align: center;
        color: transparent;
        transition: all .3s ease;
        text-decoration: none;
    }

    .profile-pic img {
        height: 150px;
        width: 150px;
        border-radius: 50%;
        cursor: pointer;
    }

    .profile-pic img:hover {
        background-color: rgba(0, 0, 0, .5);
        color: #fff;
        transition: all .3s ease;
        text-decoration: none;
        opacity: 0.6;
    }

    .profile-pic span {
        display: inline-block;
        padding-top: 4.5em;
        padding-bottom: 4.5em;
    }

    form input[type="file"] {
        cursor: pointer;
    }
</style>

<div class="modal show" id="pictureModal" tabindex="-1" role="dialog" aria-labelledby="pictureModalTitle"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">New Profile Picture</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<%=GlobalVariable.localUrl%>\userProfilePictureUpdate" id="profilePicForm" method="POST">
                <div class="modal-body">
                    <label for="profilePictureUpload" style="cursor: pointer">
                        <b>Upload From Device</b>
                    </label>
                    <input type="file" class="form-control" name="profilePictureUpload"
                           id="profilePictureUpload">
                    <input id="profilePicFileName" name="profilePicName" type="hidden" value="">
                    <progress id="uploader" value="0" max="100">0%</progress>
                </div>
                <div class="modal-footer justify-content-center">
                    <button onclick="validateForm()" type="button" name="profilePicUpdate" value="profilePicUpdate" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- start banner Area -->
<section class="banner-area relative" id="personal2">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12" style="margin-top: 60px">
                <div class="profile-pic" data-toggle="modal" data-target="#pictureModal">
                    <img id="profilePicture" class="img-circle img-profile img-thumbnail lazy"
                         alt="Update" />
                </div>
                <p>
                <h3 style="color: white;" id="profileFullName">Full Name</h3>
                <h6 style="color: rgb(196, 190, 190);" id="profileUsername">@</h6>
                </p>
                <p>
                    <i style="color: #daa520" class="fas fa-trophy" id="numberOfAwards"></i> &nbsp; &nbsp;
                    <i style="color: #abf6ff" class="fas fa-award" id="numberOfBadges"></i> &nbsp; &nbsp;
                    <i style="color: #ffabab" class="fas fa-users" id="numberOfFollowers"></i>
                </p>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Details Modal Start -->


<br/>
<!-- Nav tabs Start -->
<div class="container">
    <br>
    <br>
    <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a style="cursor: pointer;" class="nav-link active show" id="v-pills-editprofile-tab" data-toggle="pill"
               data-target="#v-pills-editprofile" role="tab" aria-controls="v-pills-editprofile"
               aria-selected="true">Edit Profile
            </a>
            <a style="cursor: pointer;" class="nav-link" id="v-pills-mytags-tab" data-toggle="pill"
               data-target="#v-pills-mytags" role="tab" aria-controls="v-pills-mytags" aria-selected="false">
                Followed Tags
            </a>
            <a style="cursor: pointer;" class="nav-link" id="v-pills-myprivacy-tab" data-toggle="pill"
               data-target="#v-pills-myprivacy" role="tab" aria-controls="v-pills-myprivacy" aria-selected="false">
                Privacy Settings</a>
            <a style="cursor: pointer;" class="nav-link" id="v-pills-helpsupport-tab" data-toggle="pill"
               data-target="#v-pills-helpsupport" role="tab" aria-controls="v-pills-helpsupport" aria-selected="false">
                Help & Support</a>
        </div>
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade active show in" id="v-pills-editprofile" role="tabpanel"
                 aria-labelledby="v-pills-editprofile-tab">
                <div class="card-body">
                    <form action="<%=GlobalVariable.localUrl%>/userProfileUpdate" method="POST">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h3 class="mb-2 text-primary">Personal Details</h3>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label style="font-weight:500;" for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName"
                                           placeholder="Enter full name" required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label style="font-weight:500;" for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                           placeholder="Enter email ID" required>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label style="font-weight:500;" for="phone">Mobile</label>
                                    <input type="text" class="form-control" id="phone" name="phone"
                                           placeholder="Enter phone number">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label style="font-weight:500;" for="username">Username</label>
                                    <input type="text" class="form-control" disabled id="username" name="username"
                                           placeholder="Username">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label style="font-weight:500;" for="location">Location</label>
                                    <input type="text" class="form-control" id="location" name="location"
                                           placeholder="Location">
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label style="font-weight:500;" for="gender">Gender</label>
                                    <input type="text" class="form-control" id="gender" name="gender" disabled
                                           placeholder="Gender">
                                </div>
                            </div>
                            <div class="form-group">
                                <label style="font-weight:500;" for="bio">Bio</label>
                                <textarea class="form-control" id="bio" name="bio" placeholder="User Bio"></textarea>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">
                                    <button type="submit" id="submit" name="submit" class="btn btn-primary">Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-mytags" role="tabpanel" aria-labelledby="v-pills-mytags-tab">
                <div class="container-fluid">
                    <div class="row" id="mytags-row" style="margin-left: 1px; row-gap: 15px; column-gap: 5.1%;">

                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="v-pills-myprivacy" role="tabpanel" aria-labelledby="v-pills-myprivacy-tab">
                <div class="team-boxed">
                    <div class="container">
                        <div class="row people" id="myprivacy-row">

                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-helpsupport" role="tabpanel" aria-labelledby="v-pills-helpsupport-tab">
                <div class="team-boxed">
                    <div class="container">
                        <div class="row people" id="helpsupport-row">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<!-- Nav Tabs End -->

<%@ include file="footer.jsp" %>
<script>

    $(document).ready(function () {
        let username = '<%=session.getAttribute("username")%>';
        let userId = '<%=session.getAttribute("userId")%>';
        $.post("<%=GlobalVariable.localUrl%>/getMyProfileInfo", {username: username}, function (result) {

            if (result.profilePicLink != null) {
                document.getElementById("profilePicture").src = result.profilePicLink;
            }
            $("#profileFullName").html(result.fullName);
            $("#profileUsername").html("@" + result.userName);
            $("#numberOfAwards").html("  " + result.numberOfAwards);
            $("#numberOfBadges").html("  " + result.numberOfBadges);
            $("#numberOfFollowers").html("  " + result.followers);
            $("#username").val(result.userName);
            $("#fullName").val(result.fullName);
            $("#email").val(result.email);
            $("#bio").val(result.bio);
            $("#phone").val(result.mobile);
            $("#location").val(result.location);
            $("#gender").val(result.gender);
        });
    });

    function bookDetails(element) {
        location.href = "<%=GlobalVariable.localUrl%>/bookDetailsUser?id=" + element.id;
    }


    function tabChange() {
        var tabs = $(".nav-tabs > li");
        var active = tabs.filter(".active");
        var next = active.next("li").length
            ? active.next("li").find("a")
            : tabs.filter(":first-child").find("a");
        next.tab("show");

        $(".tab-pane").hover(
            function () {
                clearInterval(tabCycle);
            },
            function () {
                // tabCycle = setInterval(tabChange, 5000);
            }
        );
    }


    let file;
    let fileExtension;
    const uploader = document.getElementById('uploader');
    const fileButton = document.getElementById('profilePictureUpload');

    fileButton.addEventListener('change', function(e) {
        console.log("here");
        file = e.target.files[0];
    });

    function validateForm() {
        const firebaseConfig = {
            apiKey: "${FIREBASE_API_KEY}",
            authDomain: "${FIREBASE_AUTH_DOMAIN}",
            projectId: "${FIREBASE_PROJECT_ID}",
            storageBucket: "${FIREBASE_STORAGE_BUCKET}",
            messagingSenderId: "${FIREBASE_MESSAGING_SENDER_ID}",
            appId: "${FIREBASE_APP_ID}",
            measurementId: "${FIREBASE_MEASUREMENT_ID}"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        console.log("firebase initialized.");

        let fileName = '';

        if (file === undefined) {
            fileName = 'male_dp.jpg';

            const storageRef = firebase.storage().ref('profilePic/' + fileName);
            console.log(storageRef);
            storageRef.getDownloadURL()
                .then((downloadURL) => {
                    $("#profilePicFileName").val(downloadURL);
                    document.getElementById("profilePicForm").submit();
                })
                .catch((error) => {
                    console.log(error);
                });
        } else {
            fileExtension = file.name.split('.').pop();
            if (fileExtension === 'jpg' || fileExtension === 'png' || fileExtension === 'jpeg') {
                const storageRef = firebase.storage().ref('profilePic/' + file.name);
                const task = storageRef.put(file);
                task.on('state_changed', function progress(snapshot) {
                    uploader.value = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;

                }, function error(err) {
                    console.log(err);
                }, function complete() {
                    // get the uploaded image url back
                    task.snapshot.ref.getDownloadURL().then(
                        function (downloadURL) {
                            // You get your url from here
                            console.log('File uploaded');
                            $("#profilePicFileName").val(downloadURL);
                            document.getElementById("profilePicForm").submit();
                        });
                });
            } else {
                alert('Invalid image format');
            }
        }
    }

</script>
</body>

</html>