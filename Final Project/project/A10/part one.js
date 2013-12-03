function getClasses(elem) {
    var match = elem.search("class");     //check if class attribute exists
    if (match > 0){
        var split = elem.split('class="');
        var endOfClass = split[1].indexOf('"');
        var classNames = split[1].substring(0,endOfClass);
        var classes = classNames.split(" ");
        alert(classes); //for debugging
        return classes;
    }
    else{
        alert("Class attribute does not exist!");
    }

}

//for debugging
var element  = '<p class="foo bar woof" name ="woof woof">HI</p>';
var elementOne  = '<p name ="woof woof">HI</p>';
var elementTwo = '<p class="foo bar">HI</p>';
getClasses(elementOne);
getClasses(element);
getClasses(elementTwo);