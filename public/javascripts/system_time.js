function fullTime(sysTime){
    sysTime.setTime(sysTime.getTime() + 1000);
    document.getElementById('systemTime').innerHTML=checkTime(sysTime.getHours()) + ":" +
                                                    checkTime(sysTime.getMinutes()) + ":" +
                                                    checkTime(sysTime.getSeconds());
    setTimeout(function(){fullTime(sysTime);}, 1000);
}