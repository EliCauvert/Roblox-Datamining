return function(p0) --[[ line: 14 ]]
	return if p0.mutualFriendsCount == 0 then "" elseif p0.mutualFriendsCount == 1 then p0.localized.singularMutualConnection else p0.localized.mutualConnections
end