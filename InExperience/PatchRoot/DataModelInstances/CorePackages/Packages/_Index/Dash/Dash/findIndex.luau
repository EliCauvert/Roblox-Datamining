return function(List, Callback) --[[ Line: 10 | Named "findIndex" ]]
	for i, value in ipairs(List) do
		if Callback(value, i) then
			return i
		end
	end
	return nil
end