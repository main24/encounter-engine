function levelTime(initialTimeAtLevel){
    var currentLevelEnteredTime = initialTimeAtLevel.split(":");

    if (currentLevelEnteredTime[2] == 59)
    {
        currentLevelEnteredTime[2] = 0;
        if (currentLevelEnteredTime[1] == 59)
        {
            currentLevelEnteredTime[1] = 0;
            currentLevelEnteredTime[0] ++;
        }
        else
            currentLevelEnteredTime[1] ++;
    }
    else
        currentLevelEnteredTime[2] ++;

    var currentTimeAtLevel = checkTime(currentLevelEnteredTime[0]) + ':' +
                             checkTime(currentLevelEnteredTime[1]) + ':' +
                             checkTime(currentLevelEnteredTime[2]);

    document.getElementById('levelTime').innerHTML = currentTimeAtLevel;

    setTimeout(function(){levelTime(currentTimeAtLevel);}, 1000);
}