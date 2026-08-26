return function(p1)
	return if p1.DisplayName == nil or p1.DisplayName == "" then p1.Name else p1.DisplayName
end