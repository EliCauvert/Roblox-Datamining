local function serializeFilterSelections(p1)
	if p1 == nil then
		return nil
	end
	local t = {}
	
	for i in p1 do
		table.insert(t, i)
	end
	if #t == 0 then
		return nil
	end
	table.sort(t)
	local t_1 = {}
	
	for i_1, v in t do
		table.insert(t_1, `{v}={p1[v]}`)
	end
	return table.concat(t_1, "&")
end

return function(p2, p3, p4)
	-- upvalues: serializeFilterSelections (ref)
	local _ = nil
	local var1 = if p2 == nil or p2 == "" then "ChartsSortDetail-Unknown" elseif p3 and p3 ~= "" then `ChartsSortDetail-{p2}-{p3}` else `ChartsSortDetail-{p2}`
	local var2 = serializeFilterSelections(p4)
	
	return if var2 then `{var1}?{var2}` else var1
end