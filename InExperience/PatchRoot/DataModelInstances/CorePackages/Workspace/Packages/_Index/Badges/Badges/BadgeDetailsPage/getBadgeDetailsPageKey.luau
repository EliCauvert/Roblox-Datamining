return function(p1): string --[[ Line: 1 | Named "getBadgeDetailsPageKey" ]]
	return if p1 == nil then "BadgeDetails-Unknown" else `BadgeDetails-{p1}`
end