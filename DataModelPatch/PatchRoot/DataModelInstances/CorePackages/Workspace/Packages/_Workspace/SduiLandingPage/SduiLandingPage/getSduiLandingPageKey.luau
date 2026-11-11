return function(p1): string
	return if p1 == nil or p1 == "" then "SduiLandingPage-Unknown" else `SduiLandingPage-{p1}`
end