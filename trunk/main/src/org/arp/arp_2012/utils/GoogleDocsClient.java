package org.arp.arp_2012.utils;

import java.net.URL;

import com.google.gdata.client.docs.DocsService;

public class GoogleDocsClient {

	public GoogleDocsClient() {
		final DocsService service = new DocsService("Document List Demo");
		//service.setUserCredentials("raghuram.kanadam@gmail.com", "1kanadam3");
	}
}
