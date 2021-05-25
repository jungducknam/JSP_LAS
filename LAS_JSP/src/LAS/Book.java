package LAS;

public class Book {
	private String SET_ISBN=null;
	private String ISBN=null;
	private int PRICE=0;
	private String KDC=null;
	private String DDC=null;
	private String TITLE=null;
	private String AUTHOR=null;
	private String CO_AUTHOR=null;
	private String PUB_YEAR=null;
	private String PUBLISHER=null;
	private String SUBJECT=null;
	
	public Book() {}

	public String getSET_ISBN() {return SET_ISBN;}
	public void setSET_ISBN(String sET_ISBN) {SET_ISBN = sET_ISBN;}

	public String getISBN() {return ISBN;}
	public void setISBN(String iSBN) {ISBN = iSBN;}

	public int getPRICE() {return PRICE;}
	public void setPRICE(int pRICE) {PRICE = pRICE;}
	public void setPRICE(String pRICE) {PRICE = Integer.parseInt(pRICE);}

	public String getKDC() {return KDC;}
	public void setKDC(String kDC) {KDC = kDC;}

	public String getDDC() {return DDC;}
	public void setDDC(String dDC) {DDC = dDC;}

	public String getTITLE() {return TITLE;}
	public void setTITLE(String tITLE) {TITLE = tITLE;}

	public String getAUTHOR() {return AUTHOR;}
	public void setAUTHOR(String aUTHOR) {AUTHOR = aUTHOR;}

	public String getCO_AUTHOR() {return CO_AUTHOR;}
	public void setCO_AUTHOR(String cO_AUTHOR) {CO_AUTHOR = cO_AUTHOR;}

	public String getPUB_YEAR() {return PUB_YEAR;}
	public void setPUB_YEAR(String pUB_YEAR) {PUB_YEAR = pUB_YEAR;}

	public String getPUBLISHER() {return PUBLISHER;}
	public void setPUBLISHER(String pUBLISHER) {PUBLISHER = pUBLISHER;}

	public String getSUBJECT() {return SUBJECT;}
	public void setSUBJECT(String sUBJECT) {SUBJECT = sUBJECT;}
	
	
	
}
