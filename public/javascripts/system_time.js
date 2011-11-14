function fullTime(){
    var time = new Date();
    document.getElementById('systemTime').innerHTML=checkTime(time.getHours()) + ":" +
                                                    checkTime(time.getMinutes()) + ":" +
                                                    checkTime(time.getSeconds());
    setTimeout('fullTime()', 1000);
}