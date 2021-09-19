package enrollment;
import java.sql.*;

public class students {
	
	public int studentid;
	public String completename;
	public String degreeid;
    
    public students () {};
    public int modRecord()  {
    	try {
    		// 1. Instantiate a connection variable
    		Connection conn;
    		// 2. Connect to your DB
    		conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345");
    		// 3. Indicate a notice of successful connection
    		System.out.println("Connection successful!");
    		// 4. Prepare our INSERT Statement
    		PreparedStatement pstmt = conn.prepareStatement("UPDATE students SET studentid=?, completename=?, degreeid=?");
    		// 5. Supply the statement with values
    		pstmt.setInt(1, studentid);
    		pstmt.setString(1, completename);
    		pstmt.setString(1, degreeid);
    		// 6. Execute the SQL Statement
    		pstmt.executeUpdate();
    		pstmt.close();
    		conn.close();
    		return 1;
    	} catch (SQLException e) {
    		System.out.println(e.getMessage());
    		return 0;
    	}
    }
    public int delRecord()  { return 0; };
    public int addRecord()  { return 0; };
    
    public int viewRecord() {
    	try {
    		// 1. Instantiate a connection variable
    		Connection conn;
    		// 2. Connect to your DB
    		conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345");
    		// 3. Indicate a notice of successful connection
    		System.out.println("Connection successful!");
    		// 4. Prepare our INSERT Statement
    		PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM students WHERE studentid=?");
    		// 5. Supply the statement with values
    		pstmt.setInt(1, studentid);
    		// 6. Execute the SQL Statement
    		ResultSet rs = pstmt.executeQuery();
    		
    		// 7. Get the results
    		while (rs.next()) {
    			studentid = rs.getInt("studentid");
    			completename = rs.getString("completename");
    			degreeid = rs.getString("degreeid");
    		}
    		
    		rs.close();
    		pstmt.close();
    		conn.close();
    		return 1;
    	} catch (SQLException e) {
    		System.out.println(e.getMessage());
    		return 0;
    	}
    }
    
    public static void main(String args[]) {
    	students S = new students();
    	
    	//og
    	S.studentid=10100001;
    	S.completename="Angela Reyes";
    	S.degreeid="BSCS";
    	
    	//new
    	S.studentid=101;
    	S.completename="Phil Dunphy";
    	S.degreeid="BSIT";
    	
    	S.modRecord();
    	S.studentid=101;
    	S.viewRecord();
    	System.out.println(S.studentid);
    	System.out.println(S.completename);
    	System.out.println(S.degreeid);
}	
}
