package org.thegreatinksociety.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity @Data @NoArgsConstructor @AllArgsConstructor
public class BookLists {

    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @OneToOne
    private Users user;

    private String listName;
    private int listType;
    private int numberOfBooks;
    private int privacyStatus; //0->Private 1->Public

    @Temporal(TemporalType.DATE)
    private Date creationDate;
}