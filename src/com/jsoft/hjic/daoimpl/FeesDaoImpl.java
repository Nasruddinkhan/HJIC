package com.jsoft.hjic.daoimpl;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jsoft.hjic.dao.FeesDao;
import com.jsoft.hjic.model.FeeDetail;
import com.jsoft.hjic.model.FeesBean;
import com.jsoft.hjic.model.MasterFeeBean;
@Repository("feesDAO")
public class FeesDaoImpl implements FeesDao {
	@Resource(name = "mySQLSessionFactory")
	private SessionFactory sessionFactory;
	Session session = null;
	@Override
	public FeeDetail getFeesDetails(String grno) {
		// TODO Auto-generated method stub
		FeeDetail fees = new FeeDetail();
		String sql = " SELECT S.StudentId,  CONCAT(S.FIRSTNAME, ' ', S.LASTNAME) AS  StudentName, S.JoiningDate,   f.class_id, f.exam_fees, IFNULL(f.totalfees,0) as totalfess, f.montly_fees,IFNULL(d.travelFees,0) AS travelFees,   IFNULL(d.totalfess,0) AS balancefees, IFNULL(d.examfeesPayFlag,'N') as payExamFee, "
				+"	IFNULL(d.travelFessPayFlag,'N') as payTravelFee, CASE WHEN d.payMonth IS NULL THEN 'NA' ELSE d.payMonth END AS payMonth  "
				+"	FROM fees_master f,   Students s  "
				+"	left outer join fees_details d  "
				+"	on s.grno = d.grno "
				+"	where s.classid  = f.class_id  "
				+"	AND  f.type = 'E'  "
				+"	AND s.grno = :in_grno";
		try {
			fees.setErrCode("E");
			fees.setErrMsg("record does not exsit");
			session = sessionFactory.getCurrentSession();
			Query query  = session.createSQLQuery(sql);
			query.setString("in_grno", grno);
			List<Object[]>  list = query.list();
			System.out.println(list);
			if(list != null && list.size() > 0){
				for (Object[] row: list) {
					fees.setStudentid(Integer.parseInt(row[0].toString()));
					fees.setStudentName(row[1].toString());
					fees.setDoj(row[2].toString());
					fees.setClassId(row[3].toString());
					fees.setExamfees(Integer.parseInt(row[4].toString()));
					fees.setTotalfees(Integer.parseInt(row[5].toString()));
					fees.setMonthlyfees(Integer.parseInt(row[6].toString()));
					fees.setTravelfees(Integer.parseInt(row[7].toString()));
					fees.setBalancefees(Integer.parseInt(row[8].toString()));
					fees.setPayExamFee(row[9].toString());
					fees.setPayTravelFee(row[10].toString());
					fees.setPayMonth(row[11].toString());
					fees.setErrCode("S");
					fees.setErrMsg("Success");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("FeesDaoImpl.getFeesDetails() Exception @@@ ["+e.getMessage()+"]");
			fees.setErrCode("E");
			fees.setErrMsg("Due to some technical proble");
			e.printStackTrace();
		}
		return fees;
	}

	@Override
	public void saveFeesDetails(FeesBean feesbean) {
		// TODO Auto-generated method stub
		try {
			System.out.println("feesbean.getGrno() ["+feesbean.getGrno()+"]");
			Session session = sessionFactory.getCurrentSession();
			String hqlQ = "from FeesBean u where u.grno=:grno";
			Query createQuery = sessionFactory.getCurrentSession()
					.createQuery(hqlQ);
			createQuery.setString("grno", feesbean.getGrno());
			FeesBean bean =  (FeesBean) createQuery.uniqueResult();
			if(bean != null){
				String getPayMonth = bean.getPayMonth()+","+feesbean.getPayMonth();
				int getTotalfess = bean.getTotalfess() + feesbean.getTotalfess() ;
				System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAA"+getPayMonth + getTotalfess);

				System.out.println("FeesDaoImpl.saveFeesDetails():::=>>>>>>>"+bean);
				Query query =	session.createQuery("update FeesBean set feesPay=:feesPay, classid=:classid, payMonth=:payMonth, monthfees=:monthfees,  examfeesPayFlag=:examfeesPayFlag, examfees=:examfees, travelFessPayFlag=:travelFessPayFlag, travelFees=:travelFees,  financialYear=:financialYear, totalfess=:totalfess where grno=:grno ");
				query.setParameter("feesPay", bean.getFeesPay());
				query.setParameter("classid", bean.getClassid());
				query.setParameter("payMonth", getPayMonth );
				query.setParameter("monthfees", bean.getMonthfees());
				if("N".equals(bean.getExamfeesPayFlag())){
					query.setParameter("examfeesPayFlag", feesbean.getExamfeesPayFlag());
					query.setParameter("examfees", feesbean.getExamfees());

				}else{
					query.setParameter("examfeesPayFlag", bean.getExamfeesPayFlag());
					query.setParameter("examfees", bean.getExamfees());
				}
				if("N".equals(bean.getTravelFessPayFlag())){
					query.setParameter("travelFessPayFlag", feesbean.getTravelFessPayFlag());
					query.setParameter("travelFees", feesbean.getExamfees());
				}else{
					query.setParameter("travelFessPayFlag", bean.getExamfeesPayFlag());
					query.setParameter("travelFees", bean.getTravelFees());
				}
				query.setParameter("financialYear", bean.getFinancialYear());
				query.setParameter("totalfess",getTotalfess);
				query.setParameter("grno", bean.getGrno());
				int updateRow = query.executeUpdate();
				System.out.println("updateRow ["+updateRow+"]");
			}else{
				session.save(feesbean);
			}

		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			System.out.println("FeesDaoImpl.saveFeesDetails() Exception :::==>>>["+e.getMessage()+"]");
			e.printStackTrace();
		}
		/*Integer genVal = (Integer)sessionFactory.getCurrentSession().save(feesbean);
		System.out.println(genVal);*/

	}

	@Override
	public FeeDetail getStudentDetails(String grno) {
		// TODO Auto-generated method stub
		FeeDetail fees = new FeeDetail();
		try {
			System.out.println("grno ["+grno+"]");
			session = sessionFactory.getCurrentSession();
			Query query  = session.createSQLQuery("SELECT S.JoiningDate, s.mobileno,  CONCAT(S.FIRSTNAME, ' ', S.LASTNAME) AS  StudentName FROM Students s  where s.grno =:in_rollNo ");
			query.setString("in_rollNo", grno);
			List<Object[]>  list = query.list();
			if(list != null && list.size() > 0){
				for (Object[] row: list) {
					fees.setDoj(row[0].toString().toString());
					fees.setContactNo(row[1].toString().toString());
					fees.setStudentName(row[2].toString().toString());
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			fees.setErrCode("E");
			fees.setErrMsg("Due to some technical proble");
			e.printStackTrace();
		}
		return fees;
	}

	@Override
	public String saveFeesMasterDetails(MasterFeeBean masterFeeBean) {
		// TODO Auto-generated method stub
		int row=0;
		String msg = "";
		String hqlQ = "SELECT COUNT(*) from  fees_master where class_id=:class_id and type=:type";
		System.out.println("masterFeeBean ["+masterFeeBean+"] ");
		Query qry= sessionFactory.getCurrentSession().createSQLQuery(hqlQ);
		qry.setParameter("class_id", masterFeeBean.getFeesGroup().getClass_id());
		qry.setParameter("type", masterFeeBean.getFeesGroup().getType());
		row = Integer.parseInt(qry.list().get(0).toString());
		System.out.println("masterFeeBean.getFeesGroup().getClass_id()) row ["+row+"]");
		if( row > 0){
			msg ="Record update successfully!!";
			System.out.println("FeesDaoImpl.saveFeesMasterDetails() Update Record sUCCESSFULLY");
			Query query= sessionFactory.getCurrentSession().createSQLQuery("update fees_master set type=:type,exam_fees=:exam_fees,late_fees=:late_fees,montly_fees=:monthly_fees,financial_year=:financial_year where class_id=:claasid");
			query.setParameter("type", masterFeeBean.getFeesGroup().getType());
			query.setParameter("exam_fees", masterFeeBean.getExam_fees());
			query.setParameter("late_fees", masterFeeBean.getLate_fees());
			query.setParameter("monthly_fees", masterFeeBean.getMontly_fees());
			query.setParameter("financial_year", masterFeeBean.getFinancial_year());
			query.setParameter("claasid", masterFeeBean.getFeesGroup().getClass_id());
			query.executeUpdate();
		}else{
			msg ="Record insert successfully!!";
			Query query= sessionFactory.getCurrentSession().createSQLQuery("INSERT INTO fees_master (class_id,type,exam_fees,late_fees,montly_fees,financial_year) VALUES (:claasid, :type, :exam_fees, :late_fees, :monthly_fees, :financial_year)");
			query.setParameter("claasid", masterFeeBean.getFeesGroup().getClass_id());
			System.out.println("masterFeeBean.getFeesGroup().getClass_id())");
			query.setParameter("type", masterFeeBean.getFeesGroup().getType());
			query.setParameter("exam_fees", masterFeeBean.getExam_fees());
			query.setParameter("late_fees", masterFeeBean.getLate_fees());
			query.setParameter("monthly_fees", masterFeeBean.getMontly_fees());
			query.setParameter("financial_year", masterFeeBean.getFinancial_year());
			query.executeUpdate();
		}
		return msg;
	}

	@Override
	public List<MasterFeeBean> getFeesMasterDtl() {
		// TODO Auto-generated method stub
		String hqlC = "from MasterFeeBean";
		return sessionFactory.getCurrentSession().createQuery(hqlC).list();
	}

	@Override
	public int deleteFeesMasterByClassId(String classId, String medium) {
		Query query= sessionFactory.getCurrentSession().createSQLQuery("delete from fees_master  where class_id=:classId and type=:medium");
		query.setParameter("classId", classId);
		query.setParameter("medium", medium);
		
		return query.executeUpdate();
	}
}
