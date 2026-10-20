return function(List, p1): boolean
	if p1 == nil then
		return false
	end
	for _, value in List do
		if value == p1 then
			return true
		end
	end
	return false
end