package com.database;

import java.sql.*;
public class Database{
  private String ip = "";
  private String port = "";
  private String url = "";
  private String user = "";
  private String password = "";
  private String db = "";
  private String driver = "com.mysql.jdbc.Driver";
  private Connection con = null;
  private Statement stmt = null;
  private ResultSet rs = null;

  public Database() {
  }

  public void connectDB() {
    try {
      url = "jdbc:mysql://" + ip + ":" + port + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
      Class.forName(driver);
      con = DriverManager.getConnection(url, user, password);
      stmt = con.createStatement();
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }

  public void query(String sql) {
    try {
      rs = stmt.executeQuery(sql);
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }

  public void insertData(String name, String password, String birthday, String memo) {
    try {
      String sql = "INSERT INTO users (name, password, birthday, memo) VALUES (?, ?, ?, ?)";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, name);
      ps.setString(2, password);
      ps.setString(3, birthday);
      ps.setString(4, memo);
      int a = ps.executeUpdate();
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }

  public void editData(String id, String name, String password, String birthday, String memo) {
    try {
      String sql = "UPDATE users SET name = '" + name + "', password = '" + password + "', birthday = '" + birthday + "', memo = '" + memo + "' WHERE id = " + id;
      int a = stmt.executeUpdate(sql);
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }

  public void deleteData(String id) {
    try {
      String sql = "DELETE FROM users WHERE id = " + id + ";";
      int a = stmt.executeUpdate(sql);
    } catch(Exception ex) {
      System.out.println(ex);
    }
  }

  public Connection getCon() {
    return con;
  }
  public ResultSet getRS() {
    return rs;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }
  public void setPort(String port) {
    this.port = port;
  }
  public void setUrl(String ip, String port) {
    this.url = "jdbc:mysql://" + ip + ":" + port + "/";
  }
  public void setDb(String dbName) {
    this.db = dbName;
  }
  public void setUser(String username) {
    this.user = username;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public void setDriver(String driver) {
    this.driver = driver;
  }
}
