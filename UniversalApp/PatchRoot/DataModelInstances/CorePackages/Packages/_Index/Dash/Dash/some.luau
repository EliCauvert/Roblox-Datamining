return function(List, Callback): boolean --[[ Line: 12 | Named "some" ]]
	for i, value in List do
		if Callback(value, i) then
			return true
		end
	end
	return false
end