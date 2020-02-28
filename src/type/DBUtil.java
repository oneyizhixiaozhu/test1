package type;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库连接工具
 * @author Hu
 *
 */
public class DBUtil {

	public static String db_url = "jdbc:mysql://localhost:3306/test";
	public static String db_user = "root";
	public static String db_pass = "20183629";

	public static Connection getConn () {
		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");//加载驱动
			conn = DriverManager.getConnection(db_url, db_user, db_pass);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}



	/**
	 *
	 * @param sql 执行的sql语句
	 * @param args 参数
	 * @return true代表执行成功  反之亦然
	 */
	public static boolean executeUpdate(String sql,Object... args){
		PreparedStatement ps =null;
		Connection conn=getConn();

		try {
			ps = conn.prepareStatement(sql);

			for (int i=0;i<args.length;i++){
				ps.setObject(i+1, args[i]);
			}
			int i = ps.executeUpdate();
			return  i>0;
		} catch (SQLException e) {
			e.printStackTrace();
			return  false;
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
	}

	/**
	 *
	 * @param sql
	 * @return 查询到的结果集
	 */
	public static ResultSet executeQuery(String sql){

		try {
			PreparedStatement ps = getConn().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			return  rs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}


	/**
	 * 关闭连接
	 * @param state
	 * @param conn
	 */
	public static void close (Statement state, Connection conn) {
		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close (ResultSet rs, Statement state, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) throws SQLException {
//		executeUpdate("update jbxx set ptbh='111' where ptbh='1' ");
//		ResultSet rs=executeQuery("select * from jbxx");
//		if(rs.next())
//		System.out.print(rs.getString("ptbh"));
		
		
	}
}
