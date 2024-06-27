package com.audiro.repository;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteDestination {
    private Integer favoriteDestinationId;
    private Integer usersId;
    private Integer destinationId;
}
