function addClasses(element, className){
    var search = element.search("class");
    if (search > 0){ //class attribute exists
        var split = element.split('class="');
        var endOfClass = split[1].indexOf('"');
        var classNames = split[1].substring(0,endOfClass);
        //add the className to array of classNames
        var updatedClassNames = classNames.concat(" ").concat(className);
        element = element.replace(classNames,updatedClassNames);
    }
    else{ //add the attribute
        //get the beginning of the attribute
        var match = element.match(/<[a-z]*/);
        //add the attribute
        var classAttribute = match[0].concat(' class = "').concat(className).concat('" ');
        element = element.replace(match[0], classAttribute);
    }
    alert(element); //for debugging
    return element;
}

//for debugging
var htmlElement  = '<p class="foo bar">HI</p>';
var plainElement = '<p name = "woof">HI</p>';
var className = 'hi';
addClasses(htmlElement,className);
addClasses(plainElement,className);