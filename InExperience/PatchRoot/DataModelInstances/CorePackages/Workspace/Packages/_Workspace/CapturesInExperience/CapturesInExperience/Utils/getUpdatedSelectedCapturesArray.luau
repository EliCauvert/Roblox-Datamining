function getUpdatedSelectedCapturesArray(p0, p1) --[[ line: 1 ]]
	local t = {}
	local var1 = false
	
	for i, v in ipairs(p0) do
		if v == p1 then
			var1 = true
		else
			table.insert(t, v)
		end
	end
	if not var1 then
		table.insert(t, p1)
	end
	return t
end

return getUpdatedSelectedCapturesArray