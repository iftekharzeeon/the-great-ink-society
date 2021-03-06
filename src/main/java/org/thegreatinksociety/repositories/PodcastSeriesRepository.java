package org.thegreatinksociety.repositories;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.thegreatinksociety.entities.PodcastSeries;

import java.util.List;

public interface PodcastSeriesRepository extends CrudRepository<PodcastSeries, Long> {
    PodcastSeries findPodcastSeriesById(Long podcastId);

    List<PodcastSeries> findByUser_UserName(String userName);

    List<PodcastSeries> findByPublishStatusOrderByNumberOfLikesDesc(Pageable pageable, int publishStatus);

    List<PodcastSeries> findByPublishStatusOrderByCreationDateDesc(Pageable pageable, int publishStatus);

    List<PodcastSeries> findByUser_IdAndPublishStatusOrderByNumberOfLikesDesc(Long userId, int publishStatus);


}
