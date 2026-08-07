return function(p0) --[[ line: 1 | named "getBadgeDetailsPageKey" ]]
	return if p0 == nil then "BadgeDetails-Unknown" else `BadgeDetails-{p0}`
end