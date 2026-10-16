function getUpdatedSelectedCapturesArray(List, p1) --[[ Line: 1 ]]
	local List1 = {}
	local Flag = false
	
	for _, value in ipairs(List) do
		if value == p1 then
			Flag = true
		else
			table.insert(List1, value)
		end
	end
	if not Flag then
		table.insert(List1, p1)
	end
	return List1
end

return getUpdatedSelectedCapturesArray