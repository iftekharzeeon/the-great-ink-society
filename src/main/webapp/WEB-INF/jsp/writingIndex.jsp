<%@ include file="header.jsp" %>

<link rel="stylesheet" href="css/writing-podcast/style.css"/>
<link rel="stylesheet" href="css/writing-podcast/banner.css"/>
<link rel="stylesheet" href="css/writing-podcast/main.css"/>

<!-- #header -->
<!-- start banner Area -->
<div class="parallax-content baner-content active" id="home" style="background-image: url('${coverLink}');">
    <div class="container">
        <div class="first-content"></div>
    </div>
</div>


<!-- Details Modal Start -->
<div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Book title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" onclick="location.reload()">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="modalBody">

            </div>
            <div class="modal-footer" id="modalFooter">
            </div>
        </div>
    </div>
</div>

<!-- Details Modal End -->
<!-- End banner Area -->

<!-- Last Viewed Start -->

<div class="container">
    <div class="row">
        ${lastDesign}
    </div>
</div>

<!-- Last Viewed End -->

<!-- Genre Start -->
<div>
    <div class="top-category-widget-area pt-90 pb-90">
        <div class="container text-center">
            <h2 class="font-weight-medium" style="margin-bottom: 40px; color: azure;">Something You Prefer</h2>
            <div class="row mx-auto my-auto">
                <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
                    <div class="carousel-inner w-100" role="listbox">
                        ${genreDesign}
                    </div>
                    <a class="carousel-control-prev w-auto" href="#recipeCarousel" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle"
                    aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next w-auto" href="#recipeCarousel" role="button" data-slide="next">
              <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle"
                    aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<br/>

<!-- Genre End -->

<!-- Most Popular Start -->

<div class="latest-products">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Most Popular</h2>
                    <a href="#">View More <i class="fa fa-angle-right"></i></a>
                </div>
            </div>
            <div class="row" id="most-popular-row">

            </div>
        </div>
    </div>
</div>

<!-- Most Popular End -->

<!-- Most Recent Start -->

<div class="latest-products">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Most Recent</h2>
                    <a href="#">View More<i class="fa fa-angle-right"></i></a>
                </div>
            </div>
            <div class="row" id="most-recent-row">

            </div>
        </div>
    </div>
</div>

<!-- Most Recent End -->

<!-- Followers Post -->

<div class="container">
    <div class="row">
        <div class="latest-products" id="following-row">
        </div>
    </div>
</div>

<!-- Followers End -->

<%@ include file="footer.jsp" %>

<script>
    $(document).ready(function () {
        let username = '<%=session.getAttribute("username")%>';
        let userId = '<%=session.getAttribute("userId")%>';
        $.post("<%=GlobalVariable.localUrl%>/getMostPopularBooks", {}, function (result) {
            for (var i = 0; i < result.length; i++) {
                let userProfileUrl = '<%=GlobalVariable.localUrl%>/getProfile?id=' + result[i].user.id;
                let url = '<%=GlobalVariable.localUrl%>/bookDetailsViewer?id=' + result[i].id;
                let design = '<div class="col-md-4">' +
                    '<div class="product-item">' +
                    '<a data-toggle="modal" data-target="#detailsModal" href="#"><img src="' + result[i].coverPhotoLink + '" alt="No Cover Photo" onclick="openModal(' + userId + ',' + result[i].id + ')"/></a>' +
                    '<div class="down-content">' +
                    '<h4>' + result[i].bookName + '</h4>' +
                    '<small><i class="fas fa-user"></i><a href="' + userProfileUrl + '"> &nbsp;' + result[i].user.fullName + '&nbsp; </a><i class="fas fa-heart" style="color:red;"></i> ' + result[i].numberOfLikes + ' &nbsp; <i class="fas fa-comments"></i> ' + result[i].numberOfComments + '</small>' +
                    '<hr>' +
                    '<p style="margin-bottom: 5px;">' + result[i].description + '</p>' +
                    '<br>' +
                    '<span style="margin-right: 65%; color: grey;"> Chapters : ' + result[i].numberOfChapters + ' </span>' +
                    '<span><b><a href="' + url + '">Start Reading</a></b></span>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                document.getElementById('most-popular-row').innerHTML += design;
            }
        });
        $.post("<%=GlobalVariable.localUrl%>/getMostRecentBooks", {}, function (result) {
            for (var i = 0; i < result.length; i++) {
                let userProfileUrl = '<%=GlobalVariable.localUrl%>/getProfile?id=' + result[i].user.id;
                let url = '<%=GlobalVariable.localUrl%>/bookDetailsViewer?id=' + result[i].id;
                let design = '<div class="col-md-4">' +
                    '<div class="product-item">' +
                    '<a data-toggle="modal" data-target="#detailsModal" href="#"><img src="' + result[i].coverPhotoLink + '" alt="No Cover Photo" onclick="openModal(' + userId + ',' + result[i].id + ')"/></a>' +
                    '<div class="down-content">' +
                    '<h4>' + result[i].bookName + '</h4>' +
                    '<small><i class="fas fa-user"></i><a href="' + userProfileUrl + '"> &nbsp;' + result[i].user.fullName + '&nbsp; </a><i class="fas fa-heart" style="color:red;"></i> ' + result[i].numberOfLikes + ' &nbsp; <i class="fas fa-comments"></i> ' + result[i].numberOfComments + '</small>' +
                    '<hr>' +
                    '<p style="margin-bottom: 5px;">' + result[i].description + '</p>' +
                    '<br>' +
                    '<span style="margin-right: 65%; color: grey;"> Chapters : ' + result[i].numberOfChapters + ' </span>' +
                    '<span><b><a href="' + url + '">Start Reading</a></b></span>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                document.getElementById('most-recent-row').innerHTML += design;
            }
        });
        $.post("<%=GlobalVariable.localUrl%>/getMyFollowingsBooks", {userId: userId}, function (result) {
            if (result.length != 0) {
                let design = '<div class="section-heading"><h2>From Your Followings</h2></div>';

                for (var i = 0; i < result.length; i++) {
                    let userProfileUrl = '<%=GlobalVariable.localUrl%>/getProfile?id=' + result[i].user.id;
                    let url = '<%=GlobalVariable.localUrl%>/bookDetailsViewer?id=' + result[i].id;
                    design += '<div><div class="d-block d-md-flex podcast-entry bg-white mb-5" data-aos="fade-up">' +
                        '<div class="image" style="background-image: url(' + result[i].coverPhotoLink + ')"></div>' +
                        '<div class="text">' +
                        '<h3 class="font-weight-medium" style="font-size: 1.3rem;"><a data-toggle="modal" data-target="#detailsModal" href="#" onclick="openModal(' + userId + ',' + result[i].id + ')">' + result[i].bookName + '</a></h3>' +
                        '<hr>' +
                        '<h6 class="font-weight-light" style="margin-top: 7px; margin-bottom: 8px; font-size: 1.1rem;"> Chapters : ' + result[i].numberOfChapters + '</h6>' +
                        '<div class="text-white mb-3">' +
                        '<span style="font-size: 95%;" class="text-black-opacity-05"><small><i class="fas fa-user"></i><a href="' + userProfileUrl + '">' + result[i].user.fullName + '</a><span class="sep"><i class="fas fa-heart" style="color:red;"></i></span>' + result[i].numberOfLikes + ' &nbsp; <iclass="fas fa-comments"></i> ' + result[i].numberOfComments + '  </small></span>' +
                        '</div>' +
                        '<hr>' +
                        '<p class="mb-4">' + '<a href="' + url + '">(...Continue)</a></p>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                }
                design += '<div class="section-heading">' +
                    '<a href="#">View More <i class="fa fa-angle-right"></i></a>' +
                    '</div>';
                document.getElementById('following-row').innerHTML += design;
            }
        });

    });

    $("#recipeCarousel").carousel({
        interval: 10000,
    });

    $(".carousel .carousel-item").each(function () {
        var minPerSlide = 3;
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(":first");
        }
        next.children(":first-child").clone().appendTo($(this));

        for (var i = 0; i < minPerSlide; i++) {
            next = next.next();
            if (!next.length) {
                next = $(this).siblings(":first");
            }

            next.children(":first-child").clone().appendTo($(this));
        }
    });

    function bookDetails(bookId) {
        location.href = "<%=GlobalVariable.localUrl%>/bookDetails?id=" + bookId;
    }

    function voteBook(userId, bookId) {
        if (userId == null) {
            alert('You need to login first');
            location.href = "<%=GlobalVariable.localUrl%>/signIn";
        } else {
            $.post("<%=GlobalVariable.localUrl%>/likeUnlikeBook", {userId: userId, bookId: bookId}, function (result) {
                console.log(result.status);
                openModal(userId, bookId);
            });
        }

    }

    function openModal(userId, bookId) {
        console.log(bookId);

        $.post("<%=GlobalVariable.localUrl%>/getSingleBookDetails", {bookId: bookId}, function (result) {

            $("#modalTitle").html(result.bookName);

            let awardCount = 0;
            for (var i = 0; i < result.user.award.length; i++) {
                if (result.user.award[i].winnerBookId == bookId) {
                    awardCount++;
                }
            }

            let modalBodyDesign = '<div class="container">' +
                '<div class="row">' +
                '<div class="col-lg-8">' +
                '<div class="container-fluid">' +
                '<div class="text-center">' +
                '<img style="max-width: -webkit-fill-available; height: auto; min-width: 300px; max-height: 350px;" src="' + result.coverPhotoLink + '">' +
                '<hr>' +
                '<h4>Description</h4> &nbsp;' +
                '<p class="text-left">' + result.description + '</p>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="col-lg-4">' +
                '<div class="container extra">' +
                '<div class="row">' +
                '<p><i class="fas fa-book-open"></i> Chapters Published : ' + result.numberOfChapters + '</p> &nbsp;' +
                '<br><br>' +
                '<p><i class="fas fa-language"></i> Language : ' + result.language.languageName + '</p>' +
                '<p><i class="fas fa-theater-masks"></i> Genre : ' + result.genre.name + '</p>' +
                '<p><i class="fas fa-clock"></i> Last Updated : ' + result.lastUpdatedDate + '</p>' +
                '<br><br>' +
                '<p><i class="fas fa-eye"></i> Total Views : ' + result.totalViews + '</p>' +
                '<p><i class="fas fa-comments"></i> Total Comments : ' + result.numberOfComments + '</p>' +
                '<p> <i style="color: #daa520" class="fas fa-trophy"></i> Awards Won : ' + awardCount + '</p>' +
                '<br><br>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
            document.getElementById('modalBody').innerHTML = modalBodyDesign;

            let modalFooterDesign = '<div class="text-left">' +
                '<div name="heart" id="heart" class="text-left" style="margin-right: 550px;">' +
                '<i id="voteId" style="font-size: 25px;" class="fa fa-heart-o" aria-hidden="true" onclick="voteBook(' + userId + ',' + bookId + ')">&nbsp;' + result.numberOfLikes + '</i>' +
                '</div>' +
                '</div>' +
                '<button type="button" class="btn btn-primary" onclick="bookDetails(' + bookId + ')">View Details</button>' +
                '</div>' +
                '</div>';
            document.getElementById('modalFooter').innerHTML = modalFooterDesign;
        });
    }

</script>

</body>

</html>