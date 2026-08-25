return function(p0)
	return if p0.DisplayName == nil or p0.DisplayName == "" then p0.Name else p0.DisplayName
end