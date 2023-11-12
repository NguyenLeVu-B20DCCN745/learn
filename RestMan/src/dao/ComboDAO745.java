package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Combo745;
import model.ComboMonan745;
import model.Monan745;

public class ComboDAO745 extends DAO745 {

    public ComboDAO745() {
        // TODO Auto-generated constructor stub
    }

    public void themCombo(Combo745 combo) {
        String sql = "INSERT INTO combo745 (ten, mota) VALUES (?, ?)";
        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setString(1, combo.getTen());
            cs.setString(2, combo.getMota());
            cs.executeUpdate();

            // Lấy ID của combo vừa thêm
            try (ResultSet rs = cs.getGeneratedKeys()) {
                if (rs.next()) {
                    int comboId = rs.getInt(1);

                    // Thêm các món ăn vào bảng combo_monan745
                    for (ComboMonan745 comboMonan : combo.getDsmon()) {
                        themMonAnVaoCombo(comboId, comboMonan.getMonan().getId());
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void themMonAnVaoCombo(int comboId, int monAnId) {
        String sql = "INSERT INTO combomonan745 (combo_id, monan_id) VALUES (?, ?)";
        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setInt(1, comboId);
            cs.setInt(2, monAnId);
            cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Combo745> getList() {
        List<Combo745> dsCombo = new ArrayList<>();
        String sql = "SELECT * FROM combo745";

        try (CallableStatement cs = con.prepareCall(sql);
                ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Combo745 combo = new Combo745();
                combo.setId(rs.getInt("id"));
                combo.setTen(rs.getString("ten"));
                combo.setMota(rs.getString("mota"));

                // Lấy danh sách món ăn của combo
                combo.setDsmon(getDsMonAnOfCombo(combo.getId()));

                dsCombo.add(combo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dsCombo;
    }

    private ArrayList<ComboMonan745> getDsMonAnOfCombo(int comboId) {
        ArrayList<ComboMonan745> dsMonAnCombo = new ArrayList<>();
        String sql = "SELECT monan_id FROM combo_monan745 WHERE combo_id = ?";

        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setInt(1, comboId);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    ComboMonan745 comboMonan = new ComboMonan745();
                    comboMonan.setId(rs.getInt("id"));

                    // Lấy thông tin món ăn từ bảng monan745
                    MonanDAO745 monanDAO = new MonanDAO745();
                    Monan745 monan = monanDAO.getMonan(rs.getInt("monan_id"));
                    comboMonan.setMonan(monan);

                    dsMonAnCombo.add(comboMonan);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dsMonAnCombo;
    }
}
