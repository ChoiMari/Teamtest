package com.audiro.repository;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoritePost {
    private Integer favoritePostId;
    private Integer usersId;
    private Integer postId;
}
