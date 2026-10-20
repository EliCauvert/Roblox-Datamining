return function(p1)
	return if p1.mutualFriendsCount == 0 then "" elseif p1.mutualFriendsCount == 1 then p1.localized.singularMutualConnection else p1.localized.mutualConnections
end