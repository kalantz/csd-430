/**
 * Kypton Lantz
 * August 27, 2025
 * Module 4 Assignment: JavaBean
 */

package beans;

import java.io.Serializable;

public class FavoriteMovies implements Serializable {
    private String title;
    private int releaseYear;
    private String genre;

    public FavoriteMovies() {}

    public FavoriteMovies(String title,int releaseYear, String genre) {
        this.title = title;
        this.releaseYear = releaseYear;
        this.genre = genre;
    }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public int getReleaseYear() { return releaseYear; }
    public void setReleaseYear(int releaseYear) { this.releaseYear = releaseYear; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
}