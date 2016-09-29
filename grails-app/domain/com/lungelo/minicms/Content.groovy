package com.lungelo.minicms
import com.macrobit.grails.plugins.attachmentable.core.Attachmentable
class Content {
	String appName;
	String title;
    String description;
    String body;
    String displayLocation; //(STAFF, HOME)
    Boolean displayStatus;    //(true/false) this makes it visible.
    Boolean attachmentAbility //Ability to attach images
	static attachmentable = true
    static constraints = {
		appName(nullable: false)
		title nullable: false
		description nullable: false
		body nullable: false, size: 2..5000
		displayLocation nullable: false
		displayStatus nullable: false
		attachmentAbility nullable: true
    }
}
