package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import model.Diachi745;
import model.Hoten745;
import model.Thanhvien745;

public class ThanhvienDAO745 extends DAO745{

	public ThanhvienDAO745() {
		// TODO Auto-generated constructor stub
	}
	public boolean kiemtraDN(Thanhvien745 tv) {
		boolean kq = false;
		if(tv.getUsername().contains("=")||tv.getUsername().contains("true")||tv.getPassword().contains("=")||tv.getPassword().contains("true")) {
			return false;
		}
		String sql = "{CALL kiemtraDN(?,?)}";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, tv.getUsername());
			cs.setString(2, tv.getPassword());
			ResultSet rs = cs.executeQuery();
			if(rs.next()) {
				tv.setId(rs.getInt("thanhvien_id"));
				tv.setSdt(rs.getString("sdt"));
				tv.setVaitro(rs.getString("vaitro"));
				//hoten
				Hoten745 ht = new Hoten745();
				ht.setHodem(rs.getString("hodem"));
				ht.setTen(rs.getString("ten"));
				tv.setHt(ht);
				//dia chi
				Diachi745 dc = new Diachi745();
				dc.setXa(rs.getString("xa"));
				dc.setHuyen(rs.getString("huyen"));
				dc.setTinh(rs.getString("tinh"));
				tv.setDc(dc);
				kq = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = false;
		}
		return kq;
	}
}