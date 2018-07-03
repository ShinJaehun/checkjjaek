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