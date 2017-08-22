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
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author liu
 */
@ControllerAdvice
@RequestMapping("/user")
public class UserInfoController
{
    @RequestMapping(value="/getUser.do", method=RequestMethod.GET)
    public @ResponseBody Map getUser(HttpServletRequest request, HttpServletResponse response)
    {
        HashMap retMap = new HashMap();
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from UserInfo");
        List<UserInfo> result = query.list();
        session.getTransaction().commit();
        retMap.put("result", response.getStatus());
        retMap.put("list_data", result);
//        session.close();
        return retMap;
    }
}
