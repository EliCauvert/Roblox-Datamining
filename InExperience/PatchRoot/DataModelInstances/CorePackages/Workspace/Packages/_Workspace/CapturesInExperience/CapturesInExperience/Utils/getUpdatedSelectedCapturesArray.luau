function getUpdatedSelectedCapturesArray(p1, p2)
	local t = {}
	local var1 = false
	
	for i, v in ipairs(p1) do
		if v == p2 then
			var1 = true
		else
			table.insert(t, v)
		end
	end
	if not var1 then
		table.insert(t, p2)
	end
	return t
end

return getUpdatedSelectedCapturesArray