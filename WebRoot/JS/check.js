/**
 * 
 */
function create_code() {
	  function shuffle() {
	        var arr = ['1', 'r', 'Q', '4', 'S', '6', 'w', 'u', 'D', 'I', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
	            'q', '2', 's', 't', '8', 'v', '7', 'x', 'y', 'z', 'A', 'B', 'C', '9', 'E', 'F', 'G', 'H', '0', 'J', 'K', 'L', 'M', 'N', 'O', 'P', '3', 'R',
	            '5', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
	        return arr.sort(function () {
	            return (Math.random() - .5);
	        });
	    }
	var arr1="";
	var code = shuffle();
	for( var i=0 ; i<4 ;i++){
		arr1 = arr1+code[i];
	}
	document.getElementById("ss").innerHTML=arr1;
	document.getElementById("test").value = arr1;
}
window.onload=create_code;

