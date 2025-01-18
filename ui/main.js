$(document).ready(function(){
    window.addEventListener('message', function( event ) {
        if (event.data.action == 'open') {
            $('#badge').fadeIn(400);
            $('#badge').css('background', 'url(designs/'+event.data.design+')');
            $('#avatar').css('background-image', 'url('+event.data.avatar+')');
            if (!event.data.callsign) {
                event.data.callsign = "UNASSIGNED BADGE NUMBER"
            }
            if (!event.data.rank) {
                event.data.rank = ""
            }
            $('#callsign').text(event.data.number + "-" + event.data.callsign);
            $('#name').text(event.data.rank + " " + event.data.name);
        } else if (event.data.action == 'close') {
            $('#badge').fadeOut(300);
        }
    });
});