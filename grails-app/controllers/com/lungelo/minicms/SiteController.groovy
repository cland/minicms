package com.lungelo.minicms

class SiteController {

    def index() {
		println "Indec controller..."
		//redirect (action: "home")
		List<Content> siteContent = Content.findAllByTitle("home");
		String section1;
		String section2;
		String section3;
		siteContent.each { Content content->
			println content.displayLocation;
			if(content.displayStatus != null){
				if("section1".equals(content.displayLocation)){
					section1 = content.body;
				}
				if("section2".equals(content.displayLocation)){
					println content.displayLocation;
					section2 = content.body;
				}
				if("section3".equals(content.displayLocation)){
					section3 = content.body;
					println content.displayLocation;
				}
			}
		}
		//TODO: Add Jays change requests
		return [section1: section1?:"", section2: section2?:"", 
			section3: section3?:"", title: siteContent?.first()?.title ?: null,
			content: siteContent]
		
	}
	
	def home(){
		println "In the site controller";
		List<Content> siteContent = Content.findAllByTitle("home");
		String section1;
		String section2;
		String section3;
		siteContent.each { Content content->
			println content.displayLocation;
			if(content.displayStatus != null){
				if("section1".equals(content.displayLocation)){
					println "" + content.displayLocation;
					section1 = content.body;
				}
				if("section2".equals(content.displayLocation)){
					println content.displayLocation;
					section2 = content.body;
				}
				if("section3".equals(content.displayLocation)){
					section3 = content.body;
					println content.displayLocation;
				}
			}
		}
		return [section1: section1, section2: section2, section3: section3, title: siteContent?.first()?.title ?: null]
		
	}
}
