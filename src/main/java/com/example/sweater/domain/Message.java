package com.example.sweater.domain;

import lombok.*;
import lombok.extern.java.Log;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@EqualsAndHashCode(of = {"id","text"})
@ToString(of = {"id","text"})
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill the message")
    @Length(max = 2048, message = "Message to long (more than 2kB)")
    @NonNull
    private String text;

    @Length(max = 255, message = "Tag to long (more than 255)")
    @NonNull
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    @NonNull
    private User author;

    private String filename;

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

}
