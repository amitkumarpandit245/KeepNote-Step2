package com.stackroute.keepnote.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stackroute.keepnote.model.Note;

/*
 * This class is implementing the NoteDAO interface. This class has to be annotated with @Repository
 * annotation.
 * @Repository - is an annotation that marks the specific class as a Data Access Object, thus 
 * 				 clarifying it's role.
 * @Transactional - The transactional annotation itself defines the scope of a single database 
 * 					transaction. The database transaction happens inside the scope of a persistence 
 * 					context.  
 * */
@Repository
@Transactional
public class NoteDAOImpl implements NoteDAO {

	/*
	 * Autowiring should be implemented for the SessionFactory.
	 */
	@Autowired
	private SessionFactory sessionFactory;
	

	public NoteDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;
	}
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	/*
	 * Save the note in the database(note) table.
	 */

	public boolean saveNote(Note note) {
		Session session=getSession();
		session.save(note);
		return true;

	}

	/*
	 * Remove the note from the database(note) table.
	 */

	public boolean deleteNote(int noteId) {
		Session session=getSession();
		session.delete(getNoteById(noteId));
		return true;

	}

	/*
	 * retrieve all existing notes sorted by created Date in descending
	 * order(showing latest note first)
	 */
	public List<Note> getAllNotes() {
		Session session=getSession();
		Query query=session.createQuery("from Note");  //HQL statement
		List<Note> noteList=query.list();
		return noteList;

	}

	/*
	 * retrieve specific note from the database(note) table
	 */
	public Note getNoteById(int noteId) {
		Session session=getSession();
		Note note=session.find(Note.class, noteId);
		return note;

	}

	/* Update existing note */

	public boolean UpdateNote(Note note) {
		Session session=getSession();
		session.update(note);
		return true;

	}

}
