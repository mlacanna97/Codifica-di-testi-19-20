// Dati prima cartolina 
var nodofronte;
var nodoretro;
var nodorisultato;
var nododescrizione
// Dati seconda cartolina
var nodofronte2;
var nodoretro2;
var nodorisultato2;
var nododescrizione2;

function gestorefronte (){
	try {

		img = document.createElement("IMG");
		img.src="7694-224F.jpg";
		if(nodorisultato.firstChild==null){
				nodorisultato.appendChild(img);
	  }
		else{
			nodorisultato.replaceChild(img,nodorisultato.firstChild)
		}
		nododescrizione.innerHTML = "\<b>\Cartolina numero:\</b>\ 7694-224 \<br\>\<b>\ Tipo  visualizzazione:\</b>\ Frontale  \<br\> \<b>\Collocazione specifica: \</b>\Museo Civico Etnografico 'Giovanni Podenzana', Sezione dei cimeli garibaldini e della Prima Guerrra Mondiale\<br/>\<b>\Ente di Appartenenza:\</b>\ Comune della Spezia \<br\>\<b>\Encoding by:\</b>\ Tommaso Castagneto \<br\>\<b>\ Compilatore:\</b>\ Tommaso Castagneto \<br\>\<b>\ Responsabile scientifico:\</b>\ Giacomo Paolicchi e Enrica Salvatori \<br\> \<b>\Funzionario responsabile:\</b>\ Marzia Ratti";
	} catch (e) {
		alert("gestorefronte" + e);
	}

} 

function gestoreretro (){
	try {
		img = document.createElement("IMG");
		img.src="7694-224R.jpg";
		img.setAttribute("usemap","#224mapped");
		if(nodorisultato.firstChild==null){
				nodorisultato.appendChild(img);
	  }
		else{
			nodorisultato.replaceChild(img,nodorisultato.firstChild)
		}

		nododescrizione.innerHTML = "\<b>\Cartolina numero:\</b>\ 7694-224 \<br\>\<b>\ Tipo visualizzazione:\</b>\ Retro \<br\>\<b>\ Retro:\</b>\ Sul retro troviamo stampato 'Visto Rev.Stampa - Milano 1920'. \<br\> \<b>\Francobollo - Regno d'Italia.\</b>";		
	} catch (e) {
		alert("gestoreretro" + e);
	}


	// ****************************************************************************************************************************************************************************************************//
	
}

function gestorefronte2 (){
	try{

		img2 = document.createElement("IMG");
		img2.src="7694-227F.jpg";
		if(nodorisultato2.firstChild==null){
				nodorisultato2.appendChild(img2);
		}
		else{
			nodorisultato2.replaceChild(img2,nodorisultato2.firstChild)
		}
		nododescrizione2.innerHTML = "\<b>\Cartolina numero:\</b>\ 7694-227 \<br\>\<b>\ Tipo visualizzazione:\</b>\ Frontale \<br\>\<b>\Collocazione specifica: \</b>\Museo Civico Etnografico 'Giovanni Podenzana', Sezione dei cimeli garibaldini e della Prima Guerrra Mondiale\<br/>  \<b>\Ente di Appartenenza:\</b>\ Comune della Spezia \<br\>\<b>\ Encoding by:\</b>\ Tommaso Castagneto \<br\>\<b>\Compilatore: \</b>\Tommaso Castagneto \<br\>\<b>\ Responsabile scientifico:\</b>\ Giacomo Paolicchi e Enrica Salvatori \<br\>  \<b>\Funzionario responsabile:\</b>\ E.Ratti";

	} catch (e) {
		alert("gestorefronte2" + e);
	}
}

function gestoreretro2 (){
	try{
		img = document.createElement("IMG");
		img.src="7694-227R.jpg";
		img.setAttribute("usemap","#227mapped");
		if(nodorisultato2.firstChild==null){
				nodorisultato2.appendChild(img);
		}
		else{
			nodorisultato2.replaceChild(img,nodorisultato2.firstChild)
		}
		nododescrizione2.innerHTML = "\<b>\Cartolina numero: 7694-227\</b>\ \<br\> \<b>\Tipo visualizzazione:\</b>\ Retro \<br\><b>\Descrizione Retro:\</b>\ Sul retro troviamo due stampe: 'Copyright (Prop. Artist. Riservata)' e 'Serie N 870 - V. Revis. Stampa N 2614'.\<br\>\<b>\ Francobollo - Regno d'Italia.\<b>";

	} catch (e) {
		alert("gestoreretro2" + e);
	}
}


	// ****************************************************************************************************************************************************************************************************//


function gestoreLoad () {
	try{
		// Dati relativi al Primo grafico
		nododescrizione = document.getElementById("descrizione1");
		nodofronte = document.getElementById("fronte1");
		nodoretro = document.getElementById("retro1");
		nodorisultato = document.getElementById("risultato1");
		nodofronte.onclick = gestorefronte;
		nodoretro.onclick = gestoreretro;
		gestorefronte();
		// Dati relativi al Secondo grafico
		nododescrizione2 = document.getElementById("descrizione2");
		nodofronte2 = document.getElementById("fronte2");
		nodoretro2 = document.getElementById("retro2");
		nodorisultato2 = document.getElementById("risultato2");
		nodofronte2.onclick = gestorefronte2;
		nodoretro2.onclick = gestoreretro2;
		gestorefronte2();

	} catch (e) {
		alert("gestoreLoad" + e);
	}
}

window.onload = gestoreLoad;