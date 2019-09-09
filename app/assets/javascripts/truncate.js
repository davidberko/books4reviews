$(".read-more-<%= @user.id %>").on("click", function(e){
          e.preventDefault()
          $(this).parent().html('<%= escape_javascript @user.bio %>').append("<p class='show-less-link' style='color: blue; cursor:pointer'>show less</p>");
            $(".show-less-link").on("click", function(){
            $(this).parent().html( "<%= escape_javascript truncate(@user.bio, escape: false, length: 120)%>")
          });
        });