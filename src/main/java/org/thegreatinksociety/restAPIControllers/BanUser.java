package org.thegreatinksociety.restAPIControllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.thegreatinksociety.entities.Books;
import org.thegreatinksociety.entities.Chapters;
import org.thegreatinksociety.entities.PodcastSeries;
import org.thegreatinksociety.entities.Users;
import org.thegreatinksociety.repositories.*;

import java.util.List;

@RestController
public class BanUser {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private BooksRepository booksRepository;

    @Autowired
    private PodcastSeriesRepository podcastSeriesRepository;

    @RequestMapping(value = "/banUser", method = RequestMethod.POST)
    public Users banUser(@RequestParam Long userId){
        Users user = usersRepository.findUsersById(userId);
        user.setStatus(0);

        List<Books> booksList = booksRepository.findByUser_FullNameContainsIgnoreCaseAndPublishStatus(user.getFullName(), 1);
        for (Books book : booksList) {
            book.setPublishStatus(0);
        }

        List<PodcastSeries> podcastSeriesList = podcastSeriesRepository.findByUser_FullNameContainsIgnoreCaseAndPublishStatus(user.getFullName(), 1);
        for (PodcastSeries podcastSeries : podcastSeriesList) {
            podcastSeries.setPublishStatus(0);
        }

        booksRepository.saveAll(booksList);
        podcastSeriesRepository.saveAll(podcastSeriesList);

        Users updatedUser = usersRepository.save(user);
        return updatedUser;
    }
}
