/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import model.UserInfo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author liu
 */
@Controller
public class UserInfoController
{
    @RequestMapping(value="/getUser", method=RequestMethod.GET)
    public @ResponseBody UserInfo getUser(HttpServletRequest request, HttpServletResponse response)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from user_info where id=?");
        query.setInteger(0, 0);
        List result = query.list();
        UserInfo retInfo = (UserInfo)result.get(0);
        session.getTransaction().commit();
        return retInfo;
    }
    
}
