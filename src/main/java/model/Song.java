package model;

public class Song {
	int sId;
	String sName;
	String aName;
	String price;
	
	@Override
	public String toString() {
		return "Song [sId=" + sId + ", sName=" + sName + ", aName=" + aName + ", price=" + price + "]";
	}
	public Song(String sName, String aName, String price) {
		super();
		this.sName = sName;
		this.aName = aName;
		this.price = price;
	}	
	public Song() {
		super();
		
	}
	public Song(int sId, String sName, String aName, String price) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.aName = aName;
		this.price = price;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
		
}
