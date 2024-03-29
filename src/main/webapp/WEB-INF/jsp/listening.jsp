<%--
  Created by IntelliJ IDEA.
  User: Zeeon
  Date: 7/30/2021
  Time: 4:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="css/reading/main.css">

<style>
  /* Can Not Select */
  .unselectable {
    -webkit-user-select: none;
    -webkit-touch-callout: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
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

  .card-horizontal {
    display: flex;
    flex: 1 1 auto;
  }

  .fa-heart-o {
    color: red;
    cursor: pointer;
  }

  .fa-heart {
    color: red;
    cursor: pointer;
  }
</style>
<!-- CSS END -->

<!-- start banner Area -->
<section class="banner-area relative" id="home"   style="background-image: url('https://firebasestorage.googleapis.com/v0/b/the-great-ink-society-6e0c8.appspot.com/o/img%2Fwhite-headphones-on-wooden-table-with-nature-background-free-photo.jpg?alt=media&token=5c1c5634-e5e6-43f1-95e6-049967d1675c')">
    <div class="overlay overlay-bg"  style="opacity: 40%"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <a href="<%=GlobalVariable.localUrl%>/podcastDetailsUser?id=${podcastId}">
                    <h1 class="text-white">
                        ${podcastName}
                    </h1>
                </a>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<div class="modal show" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalTitle"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Report</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<%=GlobalVariable.localUrl%>\reportSubmit" id="reportForm" method="POST">
                <div class="modal-body">
                    <label for="reportSubmit">
                        <b>Write down your description</b>
                    </label>
                    <textarea required class="form-control" name="reportDesc"
                              id="reportSubmit"></textarea>
                    <br>
                    <label for="referenceLink">
                        <b>Enter the reference link(Optional)</b>
                    </label>
                    <input id="referenceLink" type="text" name="referenceLink">
                    <input id="chapterId" name="chapterId" type="hidden" value="${episodeId}">
                    <input id="bookId" name="bookId" type="hidden" value="${podcastId}">
                    <input id="authorId" name="authorId" type="hidden" value="${userId}">
                    <input name="page" type="hidden" value="2">
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Start post-content Area -->
<section class="post-content-area single-post-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 posts-list">
                <div class="single-post row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <img style="max-width: -webkit-fill-available; height: auto; min-width: 300px; max-height: 350px;"
                                 src="${podcastCoverPhotoLink}">
                        </div>
                    </div>
                    <h3 class="mt-20 mb-10"> ${episodeName} </h3>
                    <a class="mb-10" href="#">${genre}</a>
                    <div class="user-details row">
                        <div class="col-lg-12">
                            <i class="fas fa-calendar-alt"></i> ${date} &nbsp; &nbsp; &nbsp;
                            <i class="fas fa-heart"> ${totalReacts}</i>&nbsp; &nbsp;
                            <i class="fas fa-eye"></i> ${totalViews} Views &nbsp; &nbsp; &nbsp;
                            <i class="fas fa-comments"></i> ${totalComments} Comments
                        </div>
                    </div>
                    <hr style="margin-top: 10px;">
                    <div class="col-lg-12 unselectable">
                        <div class="row mt-10 mb-30">
                            <div class="col-lg-12 mt-10">
                                <div class="card" style="width: 100%;">
                                    <div class="card-horizontal">
                                        <div class="card-body">
                                            <hr>
                                            <div class="player">
                                                <audio id="player2" preload="none" controls style="max-width: 100%">
                                                    <source src="${audioFileLink}" type="audio/mp3" />
                                                </audio>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                            </div>
                            <div name="heart" id="heart" class="text-left">
                                <i style="font-size: 25px;" class="fa fa-heart-o" aria-hidden="true"></i>
                            </div>
                            <div id="reportORunpublishButton" class="text-right">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="navigation-area">
                    <div class="row">
                        <div
                                class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                            <div class="detials">
                                <p> <a href="#"><i class="fas fa-chevron-circle-left"></i> Previous Episode </a> </p>
                                <a href="#">
                                    <h4>0. Episode Name</h4>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                            <div class="detials">
                                <p><a href="#"> Next Episode  <i class="fas fa-chevron-circle-right"></i></a></p>
                                <a href="#">
                                    <h4>02. Episode Name </h4>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="comments" class="comments-area">
                    <h4 id="numberOfComments"></h4>
                </div>
                <div class="comment-form">
                    <h4>Leave a Comment</h4>
                    <form action="<%=GlobalVariable.localUrl%>/submitCommentOfEpisode" method="POST">
                        <div class="form-group">
								<textarea class="form-control mb-10" rows="5" name="commentDesc"
                                          placeholder="Your Comment..." onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = 'Your Comment...'" required=""></textarea>
                            <input type="hidden" name="episodeId" value="${episodeId}">
                            <input type="hidden" name="podcastId" value="${podcastId}">
                        </div>
                        <button type="submit" class="primary-btn text-uppercase">Post Comment</button>
                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="widget-wrap">
                    <div class="single-sidebar-widget user-info-widget">
                        <img src="${userProfileLink}" alt="">
                        <a href="<%=GlobalVariable.localUrl%>/getProfile?id=${userId}">
                            <h4>${userFullName}</h4>
                        </a>
                        <p>
                            <i class="fas fa-user-friends"></i> ${userFollowers} &nbsp; <i class="fas fa-award"></i> ${numberOfBadges} &nbsp; <i
                                style="color: #DAA520;" class="fas fa-trophy"></i> ${numberOfAwards} &nbsp; <i class="fas fa-heart"
                                                                                                               style="color:red;"></i> ${numberOfReacts}
                        </p>
                        <p>
                            ${userBio}
                        </p>
                    </div>
                    <div class="single-sidebar-widget popular-post-widget">
                        <h4 class="popular-title">Popular From This Author</h4>
                        <div id="sameUploaderPodcasts" class="popular-post-list">

                        </div>
                        <span> <a style="margin-left: 70%;" href=""> View More </a> </span>
                    </div>
                    <div class="single-sidebar-widget popular-post-widget">
                        <h4 class="popular-title">More From This Genre</h4>
                        <div id="sameGenrePodcasts" class="popular-post-list">

                        </div>
                        <span> <a style="margin-left: 70%;" href=""> View More </a> </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End post-content Area -->

<!-- start footer Area -->
<%@ include file="footer.jsp" %>
<!-- End footer Area -->

<script>
    document.addEventListener("DOMContentLoaded", function () {

        let episodeLiked = ${episodeLiked};

        console.log('is Liked', episodeLiked);

        if (episodeLiked === 1) {
            console.log('here');
            $("#heart").html('<i style="font-size: 25px;" class="fa fa-heart" aria-hidden="true"></i>');
            $("#heart").addClass("liked");
        } else {
            $("#heart").html('<i style="font-size: 25px;" class="fa fa-heart-o" aria-hidden="true"></i>');
            $("#heart").removeClass("liked");
        }

        var mediaElements = document.querySelectorAll("video, audio"),
            total = mediaElements.length;

        for (var i = 0; i < total; i++) {
            new MediaElementPlayer(mediaElements[i], {
                pluginPath:
                    "https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/",
                shimScriptAccess: "always",
                success: function () {
                    var target = document.body.querySelectorAll(".player"),
                        targetTotal = target.length;
                    for (var j = 0; j < targetTotal; j++) {
                        target[j].style.visibility = "visible";
                    }
                },
            });
        }

        let isUploader = ${isUploader};
        let buttonsDesign = '';
        console.log(isUploader);
        if (isUploader === 1) {
            buttonsDesign = '<button onclick="unpublishEpisode(${episodeId})" class="btn btn-outline-warning"><i class="fas fa-trash-alt"></i> Unpublish</button>';
        } else {
            buttonsDesign = '<button class="btn btn-outline-warning"><i class="fas fa-flag"></i> Report</button>';
        }

        document.getElementById('reportORunpublishButton').innerHTML = buttonsDesign;

        $.post("<%=GlobalVariable.localUrl%>/getCommentsOfEpisode", {episodeId: ${episodeId}, podcastId: ${podcastId}}, function(result) {
            console.log(result);
            let design = '';
            result.map(comment => {

                design += '<div class="comment-list"> ' +
                    '<div class="single-comment justify-content-between d-flex">' +
                    '<div class="user justify-content-between d-flex">' +
                    '<div class="thumb">' +
                    '<img src="img/blog/c2.jpg" alt="">' +
                    '</div>' +
                    '<div class="desc">' +
                    '<h5><a href="#">' + comment.user.fullName + '</a></h5>' +
                    '<p class="date">' + moment(comment.commentDate).format('MMMM Do YYYY, h:mm:ss a') + '</p>' +
                    '<p class="comment">' + comment.commentDescription + '</p>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
            });
            document.getElementById('numberOfComments').innerHTML = result.length + ' Comments';
            document.getElementById('comments').innerHTML += design;
        });

        $.post("<%=GlobalVariable.localUrl%>/getSameGenrePodcasts", {genreId: ${genreId}}, function (result) {
            console.log(result);

            let genrePodcastDesign = '';

            result.map( podcast => {
                genrePodcastDesign += '<div class="single-post-list d-flex flex-row align-items-center">' +
                    ' <div class="thumb">' +
                    '<img style="width: 100px; height: 100px;" src="' + podcast.coverPhotoLink + '" alt="">' +
                    '</div>' +
                    '<div class="details">' +
                    '<a href="<%=GlobalVariable.localUrl%>/podcastDetailsUser?id=' + podcast.id + '">' +
                    '<h6>' + podcast.seriesName + '</h6>' +
                    '</a>' +
                    '<p><i class="fas fa-heart" style="color:red;"></i> ' + podcast.numberOfLikes + ' &nbsp; <i class="fas fa-comments"></i> ' + podcast.numberOfComments + '</p>' +
                    ' </div>' +
                    '</div>';
            });

            document.getElementById('sameGenrePodcasts').innerHTML = genrePodcastDesign;
        });

        $.post("<%=GlobalVariable.localUrl%>/getSameUploaderPodcasts", {userId: ${userId}}, function (result) {
            console.log(result);

            let sameUploaderPodcastDesign = '';

            result.map( podcast => {
                sameUploaderPodcastDesign += '<div class="single-post-list d-flex flex-row align-items-center">' +
                    ' <div class="thumb">' +
                    '<img style="width: 100px; height: 100px;" src="' + podcast.coverPhotoLink + '" alt="">' +
                    '</div>' +
                    '<div class="details">' +
                    '<a href="<%=GlobalVariable.localUrl%>/podcastDetailsUser?id=' + podcast.id + '">' +
                    '<h6>' + podcast.seriesName + '</h6>' +
                    '</a>' +
                    '<p><i class="fas fa-heart" style="color:red;"></i> ' + podcast.numberOfLikes + ' &nbsp; <i class="fas fa-comments"></i> ' + bpodcastook.numberOfComments + '</p>' +
                    ' </div>' +
                    '</div>';
            });

            document.getElementById('sameUploaderPodcasts').innerHTML = sameUploaderPodcastDesign;
        });
    });

    function unpublishEpisode(episodeId) {
        $.post("<%=GlobalVariable.localUrl%>/unpublishEpisode", {episodeId: episodeId}, function (result){
            console.log(result);
            if (result) {
                location.href = "<%=GlobalVariable.localUrl%>/podcastDetailsUser?id=" + ${podcastId};
            }
        });
    }

    $("#heart").click(function () {
        $.post("<%=GlobalVariable.localUrl%>/episodeLike", {userId: ${userId}, chapterId: ${episodeId}}, function (result) {
            console.log(result);
            if (result === true) {
                if ($("#heart").hasClass("liked")) {
                    $("#heart").html('<i style="font-size: 25px;" class="fa fa-heart-o" aria-hidden="true"></i>');
                    $("#heart").removeClass("liked");

                    totalReacts = totalReacts + 1;
                    console.log(totalReacts);
                    document.getElementById("totalReacts").innerHTML = totalReacts;
                } else {
                    $("#heart").html('<i style="font-size: 25px;" class="fa fa-heart" aria-hidden="true"></i>');
                    $("#heart").addClass("liked");
                }
            } else {
                alert('You already liked this chapter');
            }
        });

    });

</script>
</body>

</html>