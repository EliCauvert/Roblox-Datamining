local text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(p0, p1, p2) --[[ line: 23 ]]
	-- upvalues: text (ref)
	local p0Count = #p0
	local var2 = if p2 ~= nil then 1 elseif p2 < 1 then 1 else p2
	
	if #p1 == 0 then
		return if p0Count < var2 then p0Count else var2
	elseif p0Count < var2 then
		return -1
	end
	local var3 = p1:gsub(text, "%%%1")
	var3 = #var3
	
	for i = var2, p0Count do
		if string.sub(p0, i, i + var3 - 1) ~= var3 then
			continue
		end
		return i
	end
	return -1
end