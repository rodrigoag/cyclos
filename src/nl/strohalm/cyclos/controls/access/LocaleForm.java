package nl.strohalm.cyclos.controls.access;

import org.apache.struts.action.ActionForm;

public class LocaleForm extends ActionForm {
	private static final long serialVersionUID = 3244062547033162991L;
	
	private String language;
	private String country;
	private String page;
	
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	
	
}
