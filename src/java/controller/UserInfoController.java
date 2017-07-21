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
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author liu
 */
@Controller
@RequestMapping("/user/*")
public class UserInfoController
{
    @RequestMapping("getUser.do")
    public @ResponseBody Map<String, Object> getUser(HttpServletRequest hsr, HttpServletResponse hsr1)
    {
        Map<String, Object> retMap = new HashMap<String, Object>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List result = session.createQuery("from UserInfo").list();
        retMap.put("from", "getUsers.do");
        retMap.put("data", result);
        session.getTransaction().commit();
        return retMap;
    }
    
}
