var redirectModal = document.getElementById("redirect-modal"), redirectTimer = document.getElementById("redirect-modal-timer"),
  redirectCookie = 'redirectShareOk', redirectModalTimer = null;

function startRedirectModalTimer() {
  if(!redirectTimer.getAttribute('data-init')) {
      redirectTimer.setAttribute('data-init', redirectTimer.innerHTML);
  } else {
    redirectTimer.innerHTML = redirectTimer.getAttribute('data-init');
  }
  redirectModalTimer = setInterval(function() {
    if(!redirectTimer) return;
    var n = parseInt(redirectTimer.innerHTML);
    if(n < 1) {
      redirectModal.style.display = "none";
      window.location = redirectModal.getAttribute("data-link");
      return;
    }
    redirectTimer.innerHTML = n - 1;              
  }, 1000);
}

function redirect_getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}

function redirect_setCookie(name, value, options) {
  options = options || {}; //по умолчанию нет параметров (допустимые: expires, domain, secure, path)
  var expires = options.expires;

  if (typeof expires == "number" && expires) { //если указано время жизни, и это число
    var d = new Date();
    d.setTime(d.getTime() + expires * 1000); //expires в секундах
    expires = options.expires = d;
  }
  if (expires && expires.toUTCString) {
    options.expires = expires.toUTCString();
  }

  value = encodeURIComponent(value); 
  var data = name + "=" + value; //строка в формате cookie имеет вид "имя_куки=значение"

  for (var propName in options) {   //дописываем параметры кук (domain, secure, path)
    data += "; " + propName;
    var propValue = options[propName];
    if (propValue !== true) {
      data += "=" + propValue;
    }
  }

  document.cookie = data; //сохраняем куку
}

document.addEventListener("DOMContentLoaded", function() { 
  var links = document.getElementsByClassName("redirect-modal-start"), shares = document.getElementsByClassName("redirect-modal-share-link");
  for(var i = 0; i < links.length; ++i) {
    links[i].setAttribute("data-href", links[i].getAttribute("href")); 
    links[i].onclick = function(e) {
      if(!redirectModal || redirect_getCookie(redirectCookie)) {
        return true;
      }
      redirectModal.setAttribute("data-link", this.getAttribute("data-href")); 
      redirectModal.style.display = "block";
      startRedirectModalTimer();
      e.preventDefault();   
      return false;
    };
  } 
  for(var i = 0; i < shares.length; ++i) {
    shares[i].onclick = function(e) {
      redirect_setCookie(redirectCookie, 1, { path: '/', expires: 3600*24*365 });
      redirectTimer.innerHTML = 1;  
    }
  } 
  
  if(redirectModal) {
    var crm = redirectModal.getElementsByClassName('modal-dialog__close');
    for(var i = 0; i < crm.length; ++i) {
      crm[i].onclick = function() {
          redirectModal.style.display = "none";
          if(redirectModalTimer) clearInterval(redirectModalTimer);
      }
    }
  }
  
});
