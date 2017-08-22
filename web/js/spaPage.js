var home = {};            //default partial page, which will be loaded initially
home.partial = "./page/module_home/index.html";
home.init = function(){   //bootstrap method
                          //nothing but static content only to render
};
var notfound = {};               //404 page
notfound.partial = "./page/module_home/404.html";
notfound.init = function(){
    //alert('找不到页面，请点击导航栏右侧的返回主页按钮！');
};
