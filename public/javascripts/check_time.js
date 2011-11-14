function checkTime(i){
    if( i<10 && i.toString().indexOf("0")!=0)
        return "0"+i;
    else{
        if (i==0)
            return "00";
        return i;
    }
}