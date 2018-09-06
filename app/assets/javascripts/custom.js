// function len_chk(maxlen){  
 
// //   alert("아 좀 제대로 되어라...");

// var temp; //들어오는 문자값...
// var msglen;
// msglen = maxlen * 2;
// var val = document.getElementById('new_post').post_content.value;
// var l = document.getElementById('new_post').post_content.value.length; 
// var tmpstr = "" ;

//   if (l == 0) {
//     val = maxlen * 2;
//   } else {
//     for(var k = 0 ; k < l ; k++) {
//       temp = val.charAt(k);
      
//       if (escape(temp).length > 4) {
//         msglen -= 2;
//       } else {
//         msglen--;
//       }
      
//       if(msglen < 0) {
//         alert("영문 " + (maxlen*2) + "자 한글 " + maxlen + "자 까지 남길 수 있습니다.");
//         document.getElementById('new_post').post_content.value = tmpstr;
//         break;
//       } else {
//         tmpstr += temp;
//       }
//     }
//   }

// }


// var el;                                                    

// function countCharacters(e) {                                    
//   var textEntered, countRemaining, counter;          
//   textEntered = document.getElementById('textarea').value;  
//   counter = (140 - (textEntered.length));
//   countRemaining = document.getElementById('counter'); 
//   countRemaining.textContent = counter;       
// }
// el = document.getElementById('textarea');                   
// el.addEventListener('keyup', countCharacters, false);


// (function($) {
//     /**
// 	 * attaches a character counter to each textarea element in the jQuery object
// 	 * usage: $("#myTextArea").charCounter(max, settings);
// 	 */
	
// 	$.fn.charCounter = function (max, settings) {
// 		max = max || 200;
// 		settings = $.extend({
// 			container: "<span></span>",
// 			classname: "charcounter",
// 			format: "(%1 자 남았습니다.)",
// 			pulse: true,
// 			delay: 0
// 		}, settings);
// 		var p, timeout;
		
// 		function count(el, container) {
// 			el = $(el);
// 			if (el.val().length > max) {
// 			    el.val(el.val().substring(0, max));
// 			    if (settings.pulse && !p) {
// 			    	pulse(container, true);
// 			    };
// 			};
// 			if (settings.delay > 0) {
// 				if (timeout) {
// 					window.clearTimeout(timeout);
// 				}
// 				timeout = window.setTimeout(function () {
// 					container.html(settings.format.replace(/%1/, (max - el.val().length)));
// 				}, settings.delay);
// 			} else {
// 				container.html(settings.format.replace(/%1/, (max - el.val().length)));
// 			}
// 		};
		
// 		function pulse(el, again) {
// 			if (p) {
// 				window.clearTimeout(p);
// 				p = null;
// 			};
// 			el.animate({ opacity: 0.1 }, 100, function () {
// 				$(this).animate({ opacity: 1.0 }, 100);
// 			});
// 			if (again) {
// 				p = window.setTimeout(function () { pulse(el) }, 200);
// 			};
// 		};
		
// 		return this.each(function () {
// 			var container;
// 			if (!settings.container.match(/^<.+>$/)) {
// 				// use existing element to hold counter message
// 				container = $(settings.container);
// 			} else {
// 				// append element to hold counter message (clean up old element first)
// 				$(this).next("." + settings.classname).remove();
// 				container = $(settings.container)
// 								.insertAfter(this)
// 								.addClass(settings.classname);
// 			}
// 			$(this)
// 				.unbind(".charCounter")
// 				.bind("keydown.charCounter", function () { count(this, container); })
// 				.bind("keypress.charCounter", function () { count(this, container); })
// 				.bind("keyup.charCounter", function () { count(this, container); })
// 				.bind("focus.charCounter", function () { count(this, container); })
// 				.bind("mouseover.charCounter", function () { count(this, container); })
// 				.bind("mouseout.charCounter", function () { count(this, container); })
// 				.bind("paste.charCounter", function () { 
// 					var me = this;
// 					setTimeout(function () { count(me, container); }, 10);
// 				});
// 			if (this.addEventListener) {
// 				this.addEventListener('input', function () { count(this, container); }, false);
// 			};
// 			count(this, container);
// 		});
// 	};

// })(jQuery);

// $(function() {
//     $(".counted").charCounter(200,{container: "#counter"});
// });
