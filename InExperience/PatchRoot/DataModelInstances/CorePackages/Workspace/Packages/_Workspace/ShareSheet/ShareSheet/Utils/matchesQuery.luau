return function(Pattern, ...): boolean --[[ Line: 1 | Named "matchesQuery" ]]
	for _, value in { ... } do
		if string.find(string.lower(value), Pattern, 1, true) ~= nil then
			return true
		end
	end
	return false
end