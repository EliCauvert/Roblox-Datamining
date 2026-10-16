return function(List, Callback) --[[ Line: 13 | Named "find" ]]
	for i, value in List do
		if Callback(value, i) then
			return value
		end
	end
	return nil
end