if ((navigator.userAgent.indexOf('Android') > 0 && navigator.userAgent.indexOf('Mobile') > 0) || navigator.userAgent.indexOf('iPod') > 0 || (navigator.userAgent.indexOf('iPhone') > 0 && navigator.userAgent.indexOf('iPad') == -1)) {
document.write('<meta name="viewport" content="width=device-width, initial-scale=1.0">');
document.write('<meta name="format-detection" content="telephone=no">');
}else if(navigator.userAgent.indexOf('Android') > 0 || navigator.userAgent.indexOf('iPad') > 0){
document.write('<meta name="viewport" content="width=device-width, initial-scale=1.0">');
document.write('<meta name="format-detection" content="telephone=no">');
}else{
}

