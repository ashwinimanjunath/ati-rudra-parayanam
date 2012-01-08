(function($) {
	$.embed_vedam_pdf = function(pdf_url, audio_url) {
		if (pdf_url) {
			var $e = $("#pdf");
			new PDFObject({
				url : pdf_url,
				width : $e.width(),
				height : $e.height(),
				pdfOpenParams: { zoom: '120,100,10' }
			}).embed("pdf");
		}
		
		if (audio_url) {
			var audioHtml = ['<audio controls="controls" style = "width:350px"><source src="'];
			audioHtml.push (audio_url);
			audioHtml.push ('" type="audio/mp3" />Your browser does not support the audio tag.</audio>');
			$("#audio")
				.html(audioHtml.join (""));
		}
	};
})(jQuery);