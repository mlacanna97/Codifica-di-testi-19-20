// Dati prima cartolina 
var nodofronte;
var nodoretro;
var nodorisultato1;
var nodorisultato2;
// Dati seconda cartolina
var nodofronte2;
var nodoretro2;
var nodorisultato3;
var nodorisultato4;


function gestorefronte (){
	try {

		if(nodorisultato1.style.display==="block"){
			nodorisultato1.style.display="none";
			nodorisultato2.style.display="block";
			nodofronte.innerHTML = "Visualizza Fronte";
			
	  }
		else{
			nodorisultato1.style.display="block";
			nodorisultato2.style.display="none";
						nodofronte.innerHTML = "Visualizza Retro";
		}
	} catch (e) {
		alert("gestorefronte" + e);
	}

} 

function gestorefronte2 (){
	try{

	if(nodorisultato3.style.display==="block"){
			nodorisultato3.style.display="none";
			nodorisultato4.style.display="block";
			nodofronte2.innerHTML = "Visualizza Fronte";
			
	  }
		else{
			nodorisultato3.style.display="block";
			nodorisultato4.style.display="none";
			nodofronte2.innerHTML = "Visualizza Retro";

		}
	} catch (e) {
		alert("gestorefronte2" + e);
	}
}

function gestoreView1(){
	try{
		$("#Retro_1").css({"width":"auto"});
		if(nodorisultato1.style.transform == "skew(0deg, 0deg)"){
		nodorisultato1.style.transform = "skew(0deg, 10deg)";
				$("#Retro_1").css({"width":"50%"});
	}
	else{
		nodorisultato1.style.transform = "skew(0deg, 0deg)";
				$("#Retro_1").css({"width":"auto"});
	}
	}
	catch(e){
		alert("gestoreView1: " +e );
	}
}
function gestoreView2(){
	try{
		$("#Retro_2").css({"width":"auto"});
		if(nodorisultato2.style.transform == "skew(0deg, 0deg)"){
		nodorisultato2.style.transform = "skew(0deg, 10deg)";
				$("#Retro_2").css({"width":"50%"});
	}
	else{
		nodorisultato2.style.transform = "skew(0deg, 0deg)";
				$("#Retro_2").css({"width":"auto"});
	}
	}
	catch(e){
		alert("gestoreView2: " +e );
	}
}

function gestoreView3(){
	try{
		$("#Retro_3").css({"width":"auto"});
		if(nodorisultato3.style.transform == "skew(0deg, 0deg)"){
		nodorisultato3.style.transform = "skew(0deg, 10deg)";
				$("#Retro_3").css({"width":"50%"});
	}
	else{
		nodorisultato3.style.transform = "skew(0deg, 0deg)";
				$("#Retro_3").css({"width":"auto"});
	}
	}
	catch(e){
		alert("gestoreView3: " +e );
	}
}

function gestoreView4(){
	try{
		$("#Retro_4").css({"width":"auto"});
		if(nodorisultato4.style.transform == "skew(0deg, 0deg)"){
		nodorisultato4.style.transform = "skew(0deg, 10deg)";
				$("#Retro_4").css({"width":"50%"});
	}
	else{
		nodorisultato4.style.transform = "skew(0deg, 0deg)";
				$("#Retro_4").css({"width":"auto"});
	}
	}
	catch(e){
		alert("gestoreView4: " +e );
	}
}



	// ****************************************************************************************************************************************************************************************************//


function gestoreLoad () {
	try{
		// Dati relativi al Primo grafico
		nodofronte = document.getElementById("bottone_fronte1");
		nodoretro = document.getElementById("bottone_retro1");
		nodorisultato1 = document.getElementById("Retro_1");
    	nodorisultato2 = document.getElementById("Retro_2");
		nodofronte.onclick = gestorefronte;
		nodorisultato1.onclick = gestoreView1;
		nodorisultato2.onclick = gestoreView2;

		gestorefronte();
		// Dati relativi al Secondo grafico
		nodofronte2 = document.getElementById("bottone_fronte2");
		nodoretro2 = document.getElementById("bottone_retro2");
		nodorisultato3 = document.getElementById("Retro_3");
		nodorisultato4 = document.getElementById("Retro_4");
		nodofronte2.onclick = gestorefronte2;
				nodorisultato3.onclick = gestoreView3;
						nodorisultato4.onclick = gestoreView4;
		gestorefronte2();

	} catch (e) {
		alert("gestoreLoad" + e);
	}
}

window.onload = gestoreLoad;
