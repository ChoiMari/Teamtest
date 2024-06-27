package com.audiro.repository;


import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteUsers {
    private Integer favoriteUsersId;
    private Integer usersId;
    private Integer interestedUserId;
}
