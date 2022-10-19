package com.poly.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import com.poly.util.JpaUtil;

public class AbstractDao<T> {

	public static final EntityManager entityManager = JpaUtil.getEntityManager();

	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}

	public T findById(Class<T> clazz, Integer id) {
		return entityManager.find(clazz, id);
	}

	public List<T> findAll(Class<T> clazz, boolean existIsActive) {
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");

		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		return query.getResultList();
	}
	
	public List<T> findAll(Class<T> clazz, boolean existIsActive, int pageNumber, int pageSize) {
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");

		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		query.setFirstResult((pageNumber - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();

		/*
		 * tổng : 5 phần tử muốn 1 trang / 2 phần tử -> số trang = 3 trang1 : 2 phần tử
		 * [0] [1] trang2 : 2 phần tử [2] [3] trang3 : 1 phần tử [4] muốn lấy các phần
		 * tử ở trang thứ 2 >>> pagaNumber = 3, pageSize = 2 2 * 2 = 4 >>> bắt đầu lấy
		 * từ phần tử thứ 4 và lấy tổng cộng 2 phần tử
		 */
	}

	// select o from user o where o.username = ?0 and o.password = ?1;
	// findOne(User.class, sql, "hungnt", "nth201102")
	public T findOne(Class<T> clazz, String sql, Object ... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<T> result = query.getResultList();
		if (result.isEmpty()) {
			return null; // nếu result kh chứa pt nào, database k trả về pt nào thì trả về null
		}
		return result.get(0); // nếu k empty thì trả về pt thứ 0
	}

	public List<T> findMary(Class<T> clazz, String sql, Object ... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Object[]> findManyByNativeQuery(String sql, Object ... params) {
		Query query = entityManager.createNativeQuery(sql);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}

	// insert
	public T create(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity); // insert
			entityManager.getTransaction().commit();
			System.out.println("Create succeed");
			return entity;
			
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot insert entity " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}

	}

	// update
	public T update(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(entity); // update
			entityManager.getTransaction().commit();
			System.out.println("Update succeed");
			return entity;

		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot update entity " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}

	}

	// delete
	public T delete(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(entity); // delete
			entityManager.getTransaction().commit();
			System.out.println("Delete succeed");
			return entity;

		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot delete entity " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
	public List<T> callStored(String namedStored, Map<String, Object> params){
		StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery(namedStored);
		params.forEach((key, value) -> query.setParameter(key, value));
		return (List<T>) query.getResultList();
	}

}
