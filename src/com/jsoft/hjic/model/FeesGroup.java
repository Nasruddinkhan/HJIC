package com.jsoft.hjic.model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Embeddable
public class FeesGroup implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@NotNull
	@Size(max = 20)
	private String  class_id;
	@NotNull
	@Size(max = 1)
	private String type;
	public String getType() {
		return type;
	}
	@Override
	public String toString() {
		return "FeesGroup [class_id=" + class_id + ", type=" + type + "]";
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}


}
