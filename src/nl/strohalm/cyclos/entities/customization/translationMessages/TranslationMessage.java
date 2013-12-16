/*
    This file is part of Cyclos (www.cyclos.org).
    A project of the Social Trade Organisation (www.socialtrade.org).

    Cyclos is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Cyclos is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Cyclos; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

 */
package nl.strohalm.cyclos.entities.customization.translationMessages;

import java.util.Locale;

import nl.strohalm.cyclos.entities.Entity;

/**
 * A resource bundle key
 * @author luis
 */
public class TranslationMessage extends Entity {
    private static final long serialVersionUID = -5301317219230694326L;
    private String            key;
    private String            value;
    private String			  locale;
    
    public static String localeKey(Locale locale, String key) {
    	return localeKey(locale.toString(), key);
    }
    
    public static String localeKey(String locale, String key) {
    	return String.format("%s:%s", locale, key);
    }

    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    public void setKey(final String key) {
        this.key = key;
    }

    public void setValue(final String value) {
        this.value = value;
    }

    public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	@Override
    public String toString() {
        return getId() + " - " + key + " - " + locale;
    }
}
