return function(p1): string
	return if p1 == nil then "BadgeDetails-Unknown" else `BadgeDetails-{p1}`
end