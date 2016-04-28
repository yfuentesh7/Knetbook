/**
 * Created by yoendry on 26/04/16.
 */
$(function(){
    $("#search").on('focusin', function(){
        $("#label-for-search").css('display', 'none');
        $(".icon-close").css('display', 'inline');
    });
    $("#search").on('focusout', function(){
        $("#label-for-search").css('display', 'inline');
        $(".icon-close").css('display', 'none');
        $("#search").val("");
    });
});
