return function(List): boolean --[[ Line: 1 | Named "validateRefs" ]]
	for _, value in List do
		if value.current == nil then
			return false
		end
	end
	return true
end