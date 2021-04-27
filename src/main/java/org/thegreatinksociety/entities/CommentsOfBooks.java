package org.thegreatinksociety.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity @Data @NoArgsConstructor @AllArgsConstructor
public class CommentsOfBooks {

    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long commentId;

    @Column(length = 500)
    private String commentDescription;

    @ManyToOne
    private Users user;

    @ManyToOne
    private Chapters chapter;

    @ManyToOne
    private Books book;

    @Temporal(TemporalType.DATE)
    private Date commentDate;

}
