package LAS;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Read_marc{
	
	static Scanner scan = new Scanner(System.in);
	
	private ArrayList<ArrayList<String>> MARC = new ArrayList<ArrayList<String>>();
	private Book book;
	
	public void setMARC(String filepath) {
		try {
			//System.out.print("불러올 MARC파일의 이름과 확장자를 입력해주세요 (ex) 1.txt): ");
			//String filepath = scan.nextLine();
			File file = new File(filepath); //
			BufferedReader filedata = new BufferedReader(new InputStreamReader(new FileInputStream(file),"utf-8")); //텍스트 파일을 utf-8로 글자로 만들어 출력
			String marcdata = filedata.readLine();
			filedata.close();
			
			//String reader = marcdata.substring(0,24); //리더부분
			int triang = marcdata.indexOf("");//마크 지정문자(삼각형) 넣은상태임. 디렉토리와 가변필드를 구분지어줄 첫번째 삼각형 지정문자 (여기선 안보임)
			String directory = marcdata.substring(24,triang); //디렉토리 부분
			String varfield = marcdata.substring(triang); //가변필드 부분
			byte utf8Bytes[] = varfield.getBytes("utf-8"); //가변필드 utf-8로 바이트 배열로 만든것
			int CountDirectory = (directory.length() / 12); //디렉토리길이 / 12 해서 몇개의 디렉토리를 가지고 있는지
			ArrayList<String> DirectoryList = new ArrayList<String>(); // 디렉토리를 넣을 리스트생성
			
			//여기서 디렉토리를 각각나눠 리스트로 넣는 부분
			int first = 0;
			int last = 12;
			for(int i=0; i<CountDirectory; i++) {
				String cutdirectory = directory.substring(first,last);
				DirectoryList.add(cutdirectory);
				first = first+12;
				last = last+12;
			}
			
			//여기서 디렉토리가 지시한 부분을 가변필드에서 가져오는 작업
			for(int i=0; i<DirectoryList.size(); i++) {
				String cutdir = DirectoryList.get(i).toString();
				String symbol = cutdir.substring(0,3);
				int fieldlength = Integer.parseInt(cutdir.substring(3,7));
				int fieldstart = Integer.parseInt(cutdir.substring(7,12));
				String cutvar = new String(utf8Bytes, fieldstart, fieldlength, "utf-8");
				
				ArrayList<String> tag_line = new ArrayList<String>(); //각 태그별 정보를 담을 리스트
				List<String> line = Arrays.asList(cutvar.split(""));
				tag_line.add(symbol);
				tag_line.addAll(line); //삼각형 모양(아스키코드 30번) 으로 나눈것;
				MARC.add(tag_line);
			}
		}
		catch(Exception e) {
			System.out.println("marc read 오류");
		}
	}
	public ArrayList<ArrayList<String>> getMARC() {return MARC;}
	/*
	 * TAG list index
	 * 0-ISBN
	 * 1-AUTHOR
	 * 2-CO_AUTHOR
	 * 3-TITLE
	 * 4-PUB_YEAR
	 * 5-PUBLISHER
	 * 6-KDC
	 * 7-DDC
	 * 8-SUBJECT
	 * 9-ISBN_SET
	 * 10-PRICE
	 */
	public void setBook() {
		book = new Book();
		
		for(int i=0;i<MARC.size();i++) {
			List<String> marcLine = (ArrayList<String>) MARC.get(i);
			String tagnum = (String) marcLine.get(0); //각 태그 별 태그넘버
			String control = (String) marcLine.get(1); //각 태그 별 제어필드
			
			switch(tagnum) {
				case "020":
					//SET_ISBN
					if(control.contains("1")) { //020태그의 제어필드가 1이 있다면. 그것은 세트 ISBN이다.
						for(int index=2;index<marcLine.size();index++) { //태그넘버와 제어필드를 건너뛴 인덱스 번호, 즉 내용
							if(marcLine.get(index).startsWith("a")) {
								book.setSET_ISBN(marcLine.get(index).substring(1,14));
							}
						}
					}
					//ISBN,PRICE
					else {
						for(int index=2;index<marcLine.size();index++) {
							if(marcLine.get(index).startsWith("a")) {book.setISBN(marcLine.get(index).substring(1,14));}
							if(marcLine.get(index).startsWith("c")) {book.setPRICE(Integer.parseInt(replaceSideStr(marcLine.get(index).substring(1))));}
						}
					}	
					break;
				case "056":
					//KDC
					for(int index=2;index<marcLine.size();index++) {
						if(marcLine.get(index).startsWith("a")) {book.setKDC(marcLine.get(index).substring(1));}
					}
					break;
				case "082":
					//DDC
					for(int index=2;index<marcLine.size();index++) {
						if(marcLine.get(index).startsWith("a")) {book.setDDC(marcLine.get(index).substring(1));}
					}
					break;
				case "245":
					//TITLE
					for(int index=2;index<marcLine.size();index++) {
						String TITLE = null;
						String CO_AUTHOR = null;
						if(marcLine.get(index).startsWith("a")) {TITLE += marcLine.get(index).substring(1);}
						if(marcLine.get(index).startsWith("b")) {TITLE += marcLine.get(index).substring(1);}
						if(marcLine.get(index).startsWith("p")) {TITLE += " "+marcLine.get(index).substring(1);}
						if(marcLine.get(index).startsWith("n")) {TITLE += " "+marcLine.get(index).substring(1);}
						if(marcLine.get(index).startsWith("d")) {book.setAUTHOR(marcLine.get(index).substring(1));}
						if(marcLine.get(index).startsWith("e")) {CO_AUTHOR += marcLine.get(index).substring(1);}
						if(TITLE!=null) {
							book.setTITLE(TITLE);
						}
						if(CO_AUTHOR!=null) {
							book.setCO_AUTHOR(CO_AUTHOR);
						}
					}
					break;
				case "260":
					//publisher,pub_year
					for(int index=2;index<marcLine.size();index++) {
						if(marcLine.get(index).startsWith("b")) {book.setPUBLISHER(marcLine.get(index).substring(1));}
						if(marcLine.get(index).startsWith("c")) {book.setPUB_YEAR(marcLine.get(index).substring(1));}
					}
					break;
				case "650":
					//subject
					for(int index=2;index<marcLine.size();index++) {
						if(marcLine.get(index).startsWith("a")) {book.setSUBJECT(marcLine.get(index).substring(1));}
					}
					break;
			}	
		}
	}
	
	public Book getBook(){return book;}
	//public String getTAG(int index){return book.get(index);}
	
	public String replaceSideStr(String str) {
		return str.replaceAll("[^A-Za-z가-힣0-9 .]++", "").trim();
	}
	
	
	
	
}
