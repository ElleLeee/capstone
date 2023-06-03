/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import models.Availabletime;
import models.Consentform;

/**
 *
 * @author 00cap
 */
public class AvailabletimeDB {
    public List<Availabletime> findAllPassed() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllPassed", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    
    public List<Availabletime> findAllPassedBooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllPassedBooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllPassedUnbooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllPassedUnbooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllUpcoming() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllUpcoming", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllUpcomingBooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllUpcomingBooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public List<Availabletime> findAllUpcomingUnbooked() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        List<Availabletime> times = em.createNamedQuery("Availabletime.findAllUpcomingUnbooked", Availabletime.class).getResultList();
            return times;
    } finally {
        em.close();
    }
    }
    public Availabletime findByTimeId(int timeId) throws Exception {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    try {
        Availabletime time = em.find(Availabletime.class, timeId);
        return time;
    } finally {
        em.close();
        }
    }
    
    //insert 
    public void insert(Availabletime avt) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(avt);
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    public void delete(Availabletime avt) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.remove(em.merge(avt));
            trans.commit();
        }catch(Exception ex){
            trans.rollback();
        }finally {
            em.close();
        }
    }
    
    //maybe need methods to find booked/unbooked upcoming and passed by passed in weeks parameter? Probably need focus on
    // other features first

}