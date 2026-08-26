local text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(p1, p2, p3)
	-- upvalues: text (ref)
	local p0Count = #p1
	local var1 = if p3 ~= nil then 1 elseif p3 < 1 then 1 else p3
	
	if #p2 == 0 then
		return if p0Count < var1 then p0Count else var1
	elseif p0Count < var1 then
		return -1
	end
	local var2 = p2:gsub(text, "%%%1")
	var2 = #var2
	
	for i = var1, p0Count do
		if string.sub(p1, i, i + var2 - 1) ~= var2 then
			continue
		end
		return i
	end
	return -1
end