package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDAO {
	private Connection conn;

	public ContactDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean saveContact(Contact c) {
		boolean f = false;
		try {
			String sql = "Insert into contact(name,email,phno,about,userId) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getUserId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return f;
	}

	public List<Contact> getAllContact(int uId) {
		List<Contact> list = new ArrayList<>();
		Contact c = null;
		try {
			String sql = "select * from contact Where userId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setAbout(rs.getString(5));
				list.add(c);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	// Edit code

	public Contact getContactByID(int cid) {
		Contact c = new Contact();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from contact where id=?");
			ps.setInt(1, cid);

			ResultSet rSet = ps.executeQuery();
			while (rSet.next()) {
				c.setId(rSet.getInt(1));
				c.setName(rSet.getString(2));
				c.setEmail(rSet.getString(3));
				c.setPhno(rSet.getString(4));
				c.setAbout(rSet.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	// update Contact

	public boolean updateContact(Contact c) {
		boolean f = false;
		try {
			String sql = "update contact set name=?,email=?,phno=?,about=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return f;

	}

	public boolean deleteContactById(int id) {
		boolean f = false;

		try {
			String sql = "delete from contact where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
