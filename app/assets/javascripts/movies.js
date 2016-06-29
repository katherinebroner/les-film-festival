$(document).ready(function() {

  // reveal review form
  $("#add-new-review").on("click", "a", function(e) {
    e.preventDefault();
    var url = $(e.target).attr("href");

    $.ajax({
      type: "GET",
      url: url
    }).done(function(response){
      $(this).hide();
      $(this).parent().append(response);

    }.bind(this));
  });

  // cancel review form
  $("#add-new-review").on("click", ".close-comment", function(e) {
    e.preventDefault();
    $("#add-new-review").find(".container").remove();
    $("#add-new-review").find("a").show();
  });

  // post new review to movie show page
  $("#add-new-review").on("submit", "#review_form", function(e){
    e.preventDefault();
    var type = e.target.method
    var url = e.target.action
    var data = $(e.target).serialize();

    $.ajax({
      type: type,
      url: url,
      data: data
    }).done(function(response){
      if(response.includes("judge")) {
        if($("#list-of-judge-reviews").find(".no-reviews").length == 0) {
          $("#list-of-judge-reviews").append(response);
        } else {
          $("#list-of-judge-reviews").find(".no-reviews").hide();
          $("#list-of-judge-reviews").append(response);
        };
      } else {
        if($("#list-of-user-reviews").find(".no-reviews").length == 0) {
          $("#list-of-user-reviews").append(response);
        } else {
          $("#list-of-user-reviews").find(".no-reviews").hide();
          $("#list-of-user-reviews").append(response);
        };
      };
      $("#add-new-review").find("a").show();
      $(this).parent().remove();
    }.bind(this))
  });

  // delete user review
  $("#list-of-user-reviews").on("click", ".delete-link", function(e) {
    e.preventDefault();
    var url = $(e.target).attr("href");

    $.ajax({
      url: url,
      type: "GET"
    }).done(function(response) {
      $(this).closest(".review-info").remove();
       if($("#list-of-user-reviews").find(".no-reviews").length == 1 && $("#list-of-user-reviews").children(".review-info").length == 0) {
        $("#list-of-user-reviews").find(".no-reviews").show();
      } else if($("#list-of-user-reviews").children().length == 0) {
        $("#list-of-user-reviews").append("<p class='no-reviews'>There are no user reviews currently!</p>");
      };
    }.bind(this));
  });

  // delete judge review
  $("#list-of-judge-reviews").on("click", ".delete-link", function(e) {
    e.preventDefault();
    var url = $(e.target).attr("href");

    $.ajax({
      url: url,
      type: "GET"
    }).done(function(response) {
      $(this).closest(".review-info").remove();
      if($("#list-of-judge-reviews").find(".no-reviews").length == 1 && $("#list-of-judge-reviews").children(".review-info").length == 0) {
        $("#list-of-judge-reviews").find(".no-reviews").show();
      } else if($("#list-of-judge-reviews").children().length == 0) {
        $("#list-of-judge-reviews").append("<p class='no-reviews'>There are no judge reviews currently!</p>");
      };
    }.bind(this));
  });

  // reveal comment form for users
  $("#list-of-user-reviews").on("click", ".new-comment-link", function(e) {
    e.preventDefault();
    var url = $(e.target).attr("href");

    $.ajax({
      url: url,
      type: "GET"
    }).done(function(response){
      $(this).parent().append(response);
      $(this).hide();
    }.bind(this));
  });

  // cancel comment form for users
  $("#list-of-user-reviews").on("click", ".close-comment", function(e) {
    e.preventDefault();

    $(e.target).closest(".leave-comment-info").find(".new-comment-link").show();
    $(e.target).parent().remove();
  });

  // post comment to user section
  $("#list-of-user-reviews").on("submit", "#comment_form", function(e) {
    e.preventDefault();
    var url = e.target.action;
    var type = e.target.method;
    var data = $(e.target).serialize();

    $.ajax({
      url: url,
      type: type,
      data: data
    }).done(function(response) {
      if ($(this).parent().siblings(".comment-list").find(".no-comments").length == 0) {
        $(this).parent().siblings(".comment-list").append(response);
      } else {
        $(this).parent().siblings(".comment-list").find("p").hide();
        $(this).parent().siblings(".comment-list").append(response);
      };
      $(this).siblings().show();
      $(this).remove();
    }.bind(this));
  });

   // reveal comment form for judge section
  $("#list-of-judge-reviews").on("click", ".new-comment-link", function(e) {
    e.preventDefault();
    var url = $(e.target).attr("href");

    $.ajax({
      url: url,
      type: "GET"
    }).done(function(response){
      $(this).parent().append(response);
      $(this).hide();
    }.bind(this));
  });

  // cancel comment form for judges
  $("#list-of-judge-reviews").on("click", ".close-comment", function(e) {
    e.preventDefault();

    $(e.target).closest(".leave-comment-info").find(".new-comment-link").show();
    $(e.target).parent().remove();
  });

  // post comment to judge section
  $("#list-of-judge-reviews").on("submit", "#comment_form", function(e) {
    e.preventDefault();
    var url = e.target.action;
    var type = e.target.method;
    var data = $(e.target).serialize();

    $.ajax({
      url: url,
      type: type,
      data: data
    }).done(function(response) {
      if ($(this).parent().siblings(".comment-list").find(".no-comments").length == 0) {
        $(this).parent().siblings(".comment-list").append(response);
      } else {
        $(this).parent().siblings(".comment-list").find(".no-comments").hide();
        $(this).parent().siblings(".comment-list").append(response);
      };
      $(this).siblings().show();
      $(this).remove();
    }.bind(this));
  });

  // delete comment from user section
  $("#list-of-user-reviews").on("click", ".delete-comment-link", function(e) {
    e.preventDefault();
    var url = $(e.target).attr("href");

    $.ajax({
      url: url,
      type: "GET"
    }).done(function(response) {
      if($(this).closest(".review-info").find(".no-comments").length == 1 && $(this).closest(".review-info").find(".comment-list").children().length == 2) {
        $(this).closest(".review-info").find(".no-comments").show();
      } else if($(this).closest(".review-info").find(".comment-list").children().length == 1) {
        $(this).closest(".review-info").find(".comment-list").append("<p class='no-comments'>There are no comments for this review currently!</p>");
      };
      $(this).closest(".comment-info").remove();
    }.bind(this));
  });

  // delete comment from judge section
  $("#list-of-judge-reviews").on("click", ".delete-comment-link", function(e) {
    e.preventDefault();
    var url = $(e.target).attr("href");

    $.ajax({
      url: url,
      type: "GET"
    }).done(function(response) {
      if($(this).closest(".review-info").find(".no-comments").length == 1 && $(this).closest(".review-info").find(".comment-list").children().length == 2) {
        $(this).closest(".review-info").find(".no-comments").show();
      } else if($(this).closest(".review-info").find(".comment-list").children().length == 1) {
        $(this).closest(".review-info").find(".comment-list").append("<p class='no-comments'>There are no comments for this review currently!</p>");
      };
      $(this).closest(".comment-info").remove();
    }.bind(this));
  });
});
