using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using UniversityApi.Models;

namespace UniversityApi.Controllers
{
    public class booksController : ApiController
    {
        private UniversityDBEntities2 db = new UniversityDBEntities2();

        // GET: api/books
        public IQueryable<books> Getbooks()
        {
            return db.books;
        }

        // GET: api/books/5
        [ResponseType(typeof(books))]
        public IHttpActionResult Getbooks(int id)
        {
            books books = db.books.Find(id);
            if (books == null)
            {
                return NotFound();
            }

            return Ok(books);
        }

        // PUT: api/books/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putbooks(int id, books books)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != books.book_id)
            {
                return BadRequest();
            }

            db.Entry(books).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!booksExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/books
        [ResponseType(typeof(books))]
        public IHttpActionResult Postbooks(books books)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.books.Add(books);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = books.book_id }, books);
        }

        // DELETE: api/books/5
        [ResponseType(typeof(books))]
        public IHttpActionResult Deletebooks(int id)
        {
            books books = db.books.Find(id);
            if (books == null)
            {
                return NotFound();
            }

            db.books.Remove(books);
            db.SaveChanges();

            return Ok(books);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool booksExists(int id)
        {
            return db.books.Count(e => e.book_id == id) > 0;
        }
    }
}