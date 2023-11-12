package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Monan745;

public class MonanDAO745 extends DAO745 {

	public MonanDAO745() {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Monan745> getList(String key) {
		ArrayList<Monan745> ds = new ArrayList<>();

		String sql = "{CALL layMonan(?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, key);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				Monan745 a = new Monan745();
				a.setId(rs.getInt("id"));
				a.setTen(rs.getString("ten"));
				a.setGia(rs.getFloat("gia"));
				a.setMota(rs.getString("mota"));
				ds.add(a);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ds;
	}

	public Monan745 getMonan(int id) {
        Monan745 a = new Monan745();
        String sql = "{CALL layMonanById(?)}";
        try (CallableStatement cs = con.prepareCall(sql)) {
            // Đặt giá trị cho tham số
            cs.setInt(1, id);

            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    a.setId(rs.getInt("id"));
                    a.setTen(rs.getString("ten"));
                    a.setGia(rs.getFloat("gia"));
                    a.setMota(rs.getString("mota"));
                }
            }
        } catch (Exception e) {
        	// TODO: handle exception
            e.printStackTrace();
        }
        return a;
    }
}