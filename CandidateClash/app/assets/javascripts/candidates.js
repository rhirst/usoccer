function show_candidate() {
	var candidate_name = document.getElementById("name");
	var candidate_info =""
	candidate_info += '<h2>'+'Credability: '+ "<%= politician.credability %>" +'%'+'</h2>'

	document.getElementById("candidate_info").innerHTML = candidate_info;
}