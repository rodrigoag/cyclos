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

import nl.strohalm.cyclos.utils.query.QueryParameters;

/**
 * Query parameters used to search form translation messages
 * @author luis
 */
public class TranslationMessageQuery extends QueryParameters {
    private static final long serialVersionUID = 2119053409471708889L;
    private String			  locale;
    private String            key;
    private String            value;
    private boolean           showOnlyEmpty;

    public String getLocale() {
    	return locale;
    }
    
    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    public boolean isShowOnlyEmpty() {
        return showOnlyEmpty;
    }

    public void setLocale(String locale) {
    	this.locale = locale;
    }
    
    public void setKey(final String key) {
        this.key = key;
    }

    public void setShowOnlyEmpty(final boolean showOnlyEmpty) {
        this.showOnlyEmpty = showOnlyEmpty;
    }

    public void setValue(final String value) {
        this.value = value;
    }
}
