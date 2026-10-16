return function(List, UserId) --[[ Line: 11 | Named "getPlayer" ]]
	for _, value in pairs(List) do
		if value.userId == UserId then
			return value
		end
	end
	return nil
end