package LAS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class userDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	Statement stmt;
	
	public User readDB_user(String ID) {
		User user = new User();
		String sql = "select * from users where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, ID);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				user.setName(rs.getString("name"));
				user.setID(rs.getString("id"));
				user.setPW(rs.getString("pw"));
				user.setBirth(rs.getDate("birth"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setLoan(rs.getDate("loan"));
				user.setAD_Level(rs.getString("ad_level"));
			}
		}catch(Exception e) {
			System.out.println("user읽기 오류");
		}finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}
	public List<User> readAllDB_user(){
		List<User> user_list = new ArrayList<User>();
		String sql = "select * from users";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setID(rs.getString("id"));
				user.setPW(rs.getString("pw"));
				user.setBirth(rs.getDate("birth"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setLoan(rs.getDate("loan"));
				user.setAD_Level(rs.getString("ad_level"));
				user_list.add(user);
			}
		}
		catch(Exception e) {
			System.out.println("user_all 읽기 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return user_list;
	}
	
	public Book readDB_book(String isbn) {
		Book book = new Book();
		String sql = "select * from collections where isbn = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				book.setISBN(rs.getString("isbn"));
				book.setAUTHOR(rs.getString("author"));
				book.setCO_AUTHOR(rs.getString("co_author"));
				book.setTITLE(rs.getString("title"));
				book.setPUB_YEAR(rs.getString("pub_year"));
				book.setPUBLISHER(rs.getString("publisher"));
				book.setKDC(rs.getString("kdc"));
				book.setDDC(rs.getString("ddc"));
				book.setSUBJECT(rs.getString("subject"));
				book.setSET_ISBN(rs.getString("isbn_set"));
				book.setPRICE(rs.getInt("price"));
			}
		}
		catch(Exception e) {
			System.out.println("book 읽기 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return book;
		
	}
	
	public List<Book> readALLDB_book() {
		List<Book> book_list = new ArrayList<Book>();
		String sql = "select * from collections";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Book book = new Book();
				book.setISBN(rs.getString("isbn"));
				book.setAUTHOR(rs.getString("author"));
				book.setCO_AUTHOR(rs.getString("co_author"));
				book.setTITLE(rs.getString("title"));
				book.setPUB_YEAR(rs.getString("pub_year"));
				book.setPUBLISHER(rs.getString("publisher"));
				book.setKDC(rs.getString("kdc"));
				book.setDDC(rs.getString("ddc"));
				book.setSUBJECT(rs.getString("subject"));
				book.setSET_ISBN(rs.getString("isbn_set"));
				book.setPRICE(rs.getInt("price"));
				
				book_list.add(book);
			}
		}
		catch(Exception e) {
			System.out.println("book_all 읽기 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return book_list;
	}
	
	public List<Book> search_Book(String cond){
		List<Book> book_list = new ArrayList<Book>();
		String sql = "select * from collections where title like ? or author like ? or subject like ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,"%"+cond+"%");
			ps.setString(2,"%"+cond+"%");
			ps.setString(3,"%"+cond+"%");
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				Book book = new Book();
				book.setISBN(rs.getString("isbn"));
				book.setAUTHOR(rs.getString("author"));
				book.setCO_AUTHOR(rs.getString("co_author"));
				book.setTITLE(rs.getString("title"));
				book.setPUB_YEAR(rs.getString("pub_year"));
				book.setPUBLISHER(rs.getString("publisher"));
				book.setKDC(rs.getString("kdc"));
				book.setDDC(rs.getString("ddc"));
				book.setSUBJECT(rs.getString("subject"));
				book.setSET_ISBN(rs.getString("isbn_set"));
				book.setPRICE(rs.getInt("price"));
				
				book_list.add(book);
			}
		}
		catch(Exception e) {
			System.out.println("book_all 읽기 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return book_list;
	}
	
	public boolean idcheck(String id) {
		String sql = "select pw from users where id = '"+id+"'";
		try {
			con=DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next())
				return true;
			else
				return false;
		}
		catch(Exception e) {
			System.out.println("아이디 read오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return false;
	}
	
	public ArrayList<ArrayList<String>> readDB_loans(String id) {
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		ArrayList<String> line = new ArrayList<String>();
		String where_cond = "";
		String sql = "select c.title,l.isbn to_char(l.getday,'yy-mm-dd'), to_char(l.checkday,'yy-mm-dd'),to_char(l.backday,'yy-mm-dd') from loans l join collections c on c.isbn = l.isbn";
		if(id!=null) {
			where_cond = " where id = "+id;
		}
		sql = sql+where_cond;
		try {
			con=DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				line.add(rs.getString(1));
				line.add(rs.getString(2));
				line.add(rs.getString(3));
				line.add(rs.getString(4));
				line.add(rs.getString(5));
				result.add(line);
			}
		}
		catch(Exception e) {
			System.out.println("아이디 read오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return result;
	}
	
	public int countcheck(String id) {
		String sql="select count(*) from loans where id = '"+id+"'";
		int count=0;
		try {
			con=DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count =  Integer.parseInt(rs.getString(1));
			}
		}
		catch(Exception e) {
			System.out.println("아이디 read오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return count;
	}
	
	public boolean loancheck(String isbn) {
		String sql = "select * from loans where isbn = '"+isbn+"' and backday is null";
		try {
			con=DBCon.getCon();
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				return true;
			else
				return false;
		}
		catch(Exception e) {
			System.out.println("loan check 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return false;
	}
	
	public boolean reservationcheck(String isbn) {
		String sql = "select * from reservation where isbn = '"+isbn+"'";
		try {
			con = DBCon.getCon();
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				return true;
			else
				return false;
		}
		catch(Exception e) {
			System.out.println("reservation check 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return false;
	}
	public String reservationcheck_getId(String isbn) {
		String sql = "select id from reservation where isbn = '"+isbn+"'";
		String id=null;
		try {
			con = DBCon.getCon();
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				id = rs.getString("id");
		}
		catch(Exception e) {
			System.out.println("reservation check 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return id;
	}
	
	public void insertDB_user(User user) {
		String sql = "insert into users (id, pw, name, birth, phone, address, loan, ad_level) values (?,?,?,?,?,?,?,?)";
		try {
			con = DBCon.getCon();
			ps=con.prepareStatement(sql);
			ps.setString(1,user.getID());
			ps.setString(2,user.getPW());
			ps.setString(3,user.getName());
			ps.setDate(4,user.getBirth());
			ps.setString(5,user.getPhone());
			ps.setString(6, user.getAddress());
			ps.setDate(7, null);
			ps.setString(8, null);
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("user insert 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	public void insertDB_book(String filepath) {
		Read_marc marc = new Read_marc();
		//System.out.println("insertbookDB"+filepath);
		marc.setMARC(filepath);//마크파일 폴더위치는 WebContents에 marc_data폴더에 있음. 경로를 그곳으로 다 지정했음
		marc.setBook();
		Book book =  marc.getBook();//marc처리 완료한 데이터는 book클래스의 객체로 나온다
		
		String sql = "insert into collections(isbn,author,co_author,title,pub_year,publisher,kdc,ddc,subject,isbn_set,price)"+
					" values(?,?,?,?,?,?,?,?,?,?,?)";
		//System.out.println(book.getISBN()+"\t"+ book.getAUTHOR()+"\t"+ book.getCO_AUTHOR()+"\t"+  book.getTITLE()+"\t"+ book.getPUB_YEAR()+"\t"+ book.getPUBLISHER()+"\t"+book.getKDC()+"\t"+ book.getDDC()+"\t"+ book.getSUBJECT()+"\t"+ book.getSET_ISBN()+"\t"+ book.getPRICE());
		
		try {
			con = DBCon.getCon();
			ps=con.prepareStatement(sql);
			ps.setString(1, book.getISBN());
			ps.setString(2, book.getAUTHOR());
			ps.setString(3, book.getCO_AUTHOR());
			ps.setString(4, book.getTITLE());
			ps.setString(5, book.getPUB_YEAR());
			ps.setString(6, book.getPUBLISHER());
			ps.setString(7, book.getKDC());
			ps.setString(8, book.getDDC());
			ps.setString(9, book.getSUBJECT());
			ps.setString(10, book.getSET_ISBN());
			ps.setInt(11, book.getPRICE());
			ps.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("book insert 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	public void insertDB_loans(String id,String isbn){
		boolean loancheck = loancheck(isbn);
		boolean reservcheck = reservationcheck(isbn);
		if(loancheck == false) {
			if(reservcheck == false) {
				String sql = "insert into loans(id,isbn,getday,checkday,backday) values('"+id+"', '"+isbn+"', sysdate, sysdate+7, null)";
				try {
					con = DBCon.getCon();
					Statement stmt = con.createStatement();
					stmt.executeUpdate(sql);	
				}
				catch(Exception e) {
					System.out.println(e);
					System.out.println("loan insert 오류");
				}
				finally {
					DBCon.close(con, ps, rs);
				}
			}
			else if(reservcheck ==true && reservationcheck_getId(isbn).equals(id)) {
				String sql = "insert into loans(id,isbn,getday,checkday) values('"+id+"', '"+isbn+"', sysdate, sysdate+7)";
				try {
					con = DBCon.getCon();
					Statement stmt = con.createStatement();
					stmt.executeUpdate(sql);	
				}
				catch(Exception e) {
					System.out.println(e);
					System.out.println("loan insert 오류");
				}
				finally {
					DBCon.close(con, ps, rs);
					deleteDB_reservation(id,isbn); //예약 삭제
				}
			}
			else {System.out.println("예약중인 도서");}
		}
		else {System.out.println("대출중인 도서");}
	}
	
	public void insertDB_reserv(String id, String isbn) {
		boolean loancheck = loancheck(isbn); //대출하고 있는지, 대출중이지 않으면 false
		boolean reservationcheck = reservationcheck(isbn); 
		if(loancheck == true) {
			if(reservationcheck == false) {
				String sql = "insert into reservation values(?,?)";
				try {
					con = DBCon.getCon();
					ps = con.prepareStatement(sql);
					ps.setString(1, id);
					ps.setString(1, isbn);
					ps.executeUpdate();
				}
				catch(Exception e) {
					System.out.println("예약 오류");
				}
				finally {
					DBCon.close(con, ps, rs);
				}
			}
			else {
				System.out.println("누군가 예약중인 도서입니다.");
			}
		}
		else {
			System.out.println("대출중인 도서가 아닙니다.");
		}
	}
	
	public void deleteDB_user(String userid) {
		String sql = "delete users where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("user delete 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	public void deleteDB_book(String isbn) {
		String sql = "delete collections where isbn = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, isbn);
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("book delete 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	public void deleteDB_reservation(String id,String isbn) {
		String sql = "delete reservation where id = ? and isbn = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, isbn);
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("reservation delete 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	public void dbUpdate_level(String id,String level) {
		String sql = "update users set "+"ad_level = ? where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,level);
			ps.setString(2,id);
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("record update 오류(level)");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	public void dbUpdate_user(User user) {
		String sql = "update users set "+"name = ?, birth = ?, phone = ?, address = ? where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,user.getName());
			ps.setDate(2,user.getBirth());	
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("record update 오류(level)");
		}
		finally {
			DBCon.close(con, ps, rs);
		}
	}
	
	public void dbUpdate_loanday(String id,String isbn) {
		String sql = "update loans set checkday = checkday+7 where id = ? and isbn = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1,id);
			ps.setString(2,isbn);	
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("대출일 연장 오류");
		}
		finally {
			DBCon.close(con, ps, rs);
		}	
	}
}
