var settings = {};               //global parameters
settings.partialCache = {};      //cache for partial pages
settings.divBody = document.getElementById("spa_body");      //div for loading partials, defined in index.html

// Main Object here
var miniSPA = {};

miniSPA.changeUrl = function() {          //handle url change
    var url = location.hash.replace('#','');
    if(url === ''){
        url = 'home';           //default page
    }
    if(! window[url]){
        url = "notfound";
    }
    miniSPA.ajaxRequest(window[url].partial, 'GET', '',function(status, page){
        if(status == 404){
            url = 'notfound';       //404 page
            miniSPA.ajaxRequest(window[url].partial,'GET','',function(status, page404){
                settings.divBody.innerHTML = page404;
                miniSPA.initFunc(url);              //load 404 controller
            });
        }
        else{
            settings.divBody.innerHTML = page;
            miniSPA.initFunc(url);              //load url controller
            //run script
            var scripts = settings.divBody.getElementsByTagName("script");
            RunScripts(scripts, 0, "", function(script_txt){eval(script_txt);});
        }
    });
};

//run scripts method
function RunScripts(scripts, now_run, script_txt, callback)
{
    if(scripts == null || scripts.length <= 0)
    {
        return;
    }
    if(scripts[now_run].src.length > 0)
    {
        miniSPA.ajaxRequest(scripts[now_run].src, 'GET', '', function(status, page){
            script_txt += page;
            //recursion
            if(now_run < scripts.length - 1)
            {
                    RunScripts(scripts, (now_run + 1), script_txt, callback);
            }
            else
            {
                    callback(script_txt);
            }
        });
    }
    else
    {
            script_txt += scripts[now_run].innerHTML;
            //recursion
            if(now_run < scripts.length - 1)
            {
                    RunScripts(scripts, (now_run + 1), script_txt, callback);
            }
            else
            {
                    callback(script_txt);
            }
    }
}


miniSPA.ajaxRequest = function(url, method, data, callback) {    //load partial page
    if(settings.partialCache[url]){
        callback(200, settings.partialCache[url]);
    }
    else {
        var xmlhttp;
        if(window.XMLHttpRequest){
            xmlhttp = new XMLHttpRequest();
            xmlhttp.open(method, url, true);
            if(method === 'POST'){
                xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            }
            xmlhttp.send(data);
            xmlhttp.onreadystatechange = function(){
                if(xmlhttp.readyState == 4){
                    switch(xmlhttp.status) {
                        case 404:                             //if the url is invalid, show the 404 page
                            url = 'notfound';
                            break;
                        default:
                            var parts = url.split('.');
                            if(parts.length>1 && parts[parts.length-1] == 'html'){         //only cache static html pages
                                settings.partialCache[url] = xmlhttp.responseText;        //cache partials to improve performance
                            }
                    }
                    callback(xmlhttp.status, xmlhttp.responseText);
                }
            };
        }
        else{
            alert('Sorry, your browser is too old to run this app.');
            callback(404, {});
        }
    }
};

miniSPA.render = function(url){
    settings.rootScope = window[url];
    miniSPA.refresh(settings.divBody, settings.rootScope);
};

miniSPA.refresh = function(node, scope) {
    var children = node.childNodes;
    if(node.nodeType != 3){                            //traverse child nodes, Node.TEXT_NODE == 3
        for(var k=0; k<node.attributes.length; k++){
            node.setAttribute(node.attributes[k].name, miniSPA.feedData(node.attributes[k].value, scope));       //replace variables defined in attributes
        }
        var childrenCount = children.length;
        for(var j=0; j<childrenCount; j++){
            if(children[j].nodeType != 3 && children[j].hasAttribute('data-repeat')){     //handle repeat items
                var item = children[j].dataset.item;
                var repeat = children[j].dataset.repeat;
                children[j].removeAttribute('data-repeat');
                var repeatNode = children[j];
                for(var prop in scope[repeat]){
                    repeatNode = children[j].cloneNode(true);                  //clone sibling nodes for the repeated node
                    node.appendChild(repeatNode);
                    var repeatScope = scope;
                    var obj = {};
                    obj.key = prop;
                    obj.value = scope[repeat][prop];                           //add the key/value pair to current scope
                    repeatScope[item] = obj;
                    miniSPA.refresh(repeatNode,repeatScope);                           //iterate over all the cloned nodes
                }
                node.removeChild(children[j]);                                 //remove the empty template node
                childrenCount--;
            }
            else{
                miniSPA.refresh(children[j],scope);                                    //not for repeating, just iterate the child node
            }
        }
    }
    else{
        node.textContent = miniSPA.feedData(node.textContent, scope);           //replace variables defined in the template
    }
};

miniSPA.feedData = function(template, scope){                                     //replace variables with data in current scope
    return template.replace(/\{\{([^}]+)\}\}/gmi, function(model){
        var properties = model.substring(2,model.length-2).split('.');          //split all levels of properties
        var result = scope;
        for(var n in properties){
            if(result){
                switch(properties[n]){                  //move down to the deserved value
                    case 'key':
                        result = result.key;
                        break;
                    case 'value':
                        result = result.value;
                        break;
                    case 'length':                     //get length from the object
                        var length = 0;
                        for(var x in result) length ++;
                        result = length;
                        break;
                    default:
                        result = result[properties[n]];
                }
            }
        }
        return result;
    });
};

miniSPA.initFunc = function(partial) {                            //execute the controller function responsible for current template
    var fn = window[partial].init;
    if(typeof fn === 'function') {
        fn();
    }
};

miniSPA.ajaxRequest(notfound.partial, 'GET','',function(status, partial){
    settings.partialCache.notfound = partial;
});        //cache 404 page first
