package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.annotations.GenerationTime;
import org.hibernate.criterion.Restrictions;

import showscom.dataLayer.sessionFactory.SessionFactoryAdapter;
import showscom.domainLayer.domainModel.Espectacle;
import showscom.domainLayer.domainModel.Estrena;
import showscom.domainLayer.domainModel.Local;
import showscom.domainLayer.domainModel.Representacio;
import showscom.domainLayer.domainModel.RepresentacioPK;
import showscom.domainLayer.domainModel.Sessio;
import showscom.domainLayer.domainModel.TipusSessio;

public class CreaRepresentacions {

	private final static SessionFactory sessionFactory = SessionFactoryAdapter.getSessionFactory();

	@SuppressWarnings("unchecked")
	private static Sessio creaSessio(TipusSessio tipusSessio) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Sessio sessio = null;

		try {
			tx = session.beginTransaction();
			List<Sessio> listSes = session.createCriteria(Sessio.class).add(Restrictions.eq("sessio", tipusSessio))
					.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
			if (listSes.size() == 0) {
				sessio = new Sessio(tipusSessio);
				session.save(sessio);
			} else {
				System.out.println("Sessio ja esta a la BD");
				sessio = listSes.get(0);
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return sessio;
	}

	@SuppressWarnings("unchecked")
	private static Espectacle creaEspectacle(String titol, int participants) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Espectacle espectacle = null;

		try {
			tx = session.beginTransaction();
			List<Espectacle> listEsp = session.createCriteria(Espectacle.class).add(Restrictions.eq("titol", titol))
					.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
			if (listEsp.size() == 0) {
				espectacle = new Espectacle(titol, participants);
				session.save(espectacle);
			} else {
				System.out.println("Espectacle ja esta a la BD");
				espectacle = listEsp.get(0);
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return espectacle;
	}

	@SuppressWarnings("unchecked")
	private static Local creaLocal(String nom, String adreca) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Local local = null;

		try {
			tx = session.beginTransaction();
			List<Local> listLoc = session.createCriteria(Local.class).add(Restrictions.eq("nom", nom))
					.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
			if (listLoc.size() == 0) {
				local = new Local(nom, adreca);
				session.save(local);
			} else {
				System.out.println("Local ja esta a la BD");
				local = listLoc.get(0);
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return local;
	}

	@SuppressWarnings("unchecked")
	private static Representacio creaRepresentacio(Sessio sessio, Local local, String titolE, float preu, Date data,
			int nombreSeientsLliures) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Representacio representacio = null;

		try {
			tx = session.beginTransaction();
			List<Representacio> listRepr = session.createCriteria(Representacio.class)
					.add(Restrictions.eq("representacioPK.nomLocal", local.getNom()))
					.add(Restrictions.eq("representacioPK.sessio", sessio.getSessio().name()))
					.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
			if (listRepr.size() == 0) {
				representacio = new Representacio(sessio, local, titolE, preu, data, nombreSeientsLliures);
				session.save(representacio);
			} else {
				System.out.println("Representacio ja esta a la BD");
				representacio = listRepr.get(0);
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return representacio;
	}

	@SuppressWarnings("unchecked")
	private static Estrena creaEstrena(Sessio sessio, Local local, String titolE, float preu, Date data,
			int nombreSeientsLliures, int recarrec) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Estrena estrena = null;

		try {
			tx = session.beginTransaction();
			List<Estrena> listEstr = session.createCriteria(Estrena.class)
					.add(Restrictions.eq("representacioPK.sessio", sessio.getSessio().name()))
					.add(Restrictions.eq("representacioPK.nomLocal", local.getNom()))
					.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
			if (listEstr.size() == 0) {
				estrena = new Estrena(sessio, local, titolE, preu, data, nombreSeientsLliures, recarrec);
				session.save(estrena);
			} else {
				System.out.println("Representacio ja esta a la BD");
				estrena = listEstr.get(0);
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return estrena;
	}

	public static void main(String args[]) throws ParseException {
		Sessio ses = creaSessio(TipusSessio.MATI);
		if (ses != null)
			System.out.println(ses.getSessio());

		Espectacle esp = creaEspectacle("Lago de los cisnes", 10);
		if (esp != null)
			System.out.println(esp.getTitol() + " " + esp.getParticipants());

		Local loc = creaLocal("disgor", "travessera");
		if (loc != null)
			System.out.println(loc.getNom() + " " + loc.getAdreca());

		Local loc2 = creaLocal("disgor2", "travessera");
		if (loc2 != null)
			System.out.println(loc2.getNom() + " " + loc2.getAdreca());

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date d = sdf.parse("21/12/2012");
		Representacio repr = creaRepresentacio(ses, loc, "Lago de los cisnes", 9.80f, d, 100);
		if (repr != null)
			System.out.println(repr.getRepresentacioPK().getSessio() + " " + repr.getRepresentacioPK().getNomLocal()
					+ " " + repr.getRepresentacioPK().getTitolEspectacle() + " " + repr.getPreu() + " " + repr.getData()
					+ " " + repr.getNombreSeientsLliures());

		Representacio repr2 = creaRepresentacio(ses, loc2, esp.getTitol(), 9.80f, d, 100);
		Espectacle esp2 = creaEspectacle("Lago de los cisnes 2", 10);
		Representacio repr3 = creaRepresentacio(ses, loc, esp2.getTitol(), 9.80f, d, 100);
		System.out.println(repr3.getRepresentacioPK().getSessio() + " " + repr3.getRepresentacioPK().getNomLocal() + " "
				+ repr3.getRepresentacioPK().getTitolEspectacle() + " " + repr3.getPreu() + " " + repr3.getData() + " "
				+ repr3.getNombreSeientsLliures() + " " + repr3.getSessio().getSessio().name() + " " + repr3.getLocal().getNom());

		/*
		 * Estrena estr = creaEstrena(ses, loc2, esp.getTitol(), 9.80f, d, 100,
		 * 10); if (estr != null)
		 * System.out.println(estr.getRepresentacioPK().getSessio() + " " +
		 * estr.getRepresentacioPK().getNomLocal() + " " +
		 * estr.getRepresentacioPK().getTitolEspectacle() + " " + estr.getPreu()
		 * + " " + estr.getData() + " " + estr.getNombreSeientsLliures() + " " +
		 * estr.getRecarrec());
		 */
	}
}