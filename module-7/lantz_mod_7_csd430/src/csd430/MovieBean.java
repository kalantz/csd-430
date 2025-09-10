package src.csd430;

import java.io.Serializable;

public class MovieBean implements Serializable {
   private int movie_id;
   private String title;
   private int release_year;
   private String director;
   private int runtime_minutes;
   private String rating;

   public MovieBean() {
   }

   public int getMovie_id() {
      return this.movie_id;
   }

   public void setMovie_id(int movie_id) {
      this.movie_id = movie_id;
   }

   public String getTitle() {
      return this.title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public int getRelease_year() {
      return this.release_year;
   }

   public void setRelease_year(int release_year) {
      this.release_year = release_year;
   }

   public String getDirector() {
      return this.director;
   }

   public void setDirector(String director) {
      this.director = director;
   }

   public int getRuntime_minutes() {
      return this.runtime_minutes;
   }

   public void setRuntime_minutes(int runtime_minutes) {
      this.runtime_minutes = runtime_minutes;
   }

   public String getRating() {
      return this.rating;
   }

   public void setRating(String rating) {
      this.rating = rating;
   }
}
