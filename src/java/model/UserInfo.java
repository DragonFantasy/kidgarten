/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author liu
 */
public class UserInfo implements Serializable
{
    private int id;
    private String name;
    private String recommand;
    
    public UserInfo()
    {
    }
    
    public UserInfo(int id, String name, String recommand)
    {
        this.id = id;
        this.name = name;
        this.recommand = recommand;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRecommand() {
        return recommand;
    }

    public void setRecommand(String recommand) {
        this.recommand = recommand;
    }
}
