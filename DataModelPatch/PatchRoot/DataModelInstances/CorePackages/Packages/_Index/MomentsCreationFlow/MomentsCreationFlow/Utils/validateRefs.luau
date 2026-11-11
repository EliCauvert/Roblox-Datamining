return function(List): boolean
	for _, value in List do
		if value.current == nil then
			return false
		end
	end
	return true
end