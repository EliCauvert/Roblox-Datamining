return function(List, Callback) --[[ Line: 6 | Named "filter" ]]
	local t = {}
	
	for i, value in List do
		if Callback(value, i) then
			t[i] = value
		end
	end
	return t
end