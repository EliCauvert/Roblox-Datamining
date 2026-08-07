local function serializeFilterSelections(p0) --[[ line: 3 ]]
	if p0 == nil then
		return nil
	end
	local t = {}
	
	for i in p0 do
		table.insert(t, i)
	end
	if #t == 0 then
		return nil
	end
	table.sort(t)
	local t_1 = {}
	
	for i_1, v in t do
		table.insert(t_1, `{v}={p0[v]}`)
	end
	return table.concat(t_1, "&")
end

return function(p1, p2, p3) --[[ line: 22 | named "getChartsSortDetailPageKey" ]]
	-- upvalues: serializeFilterSelections (ref)
	local _ = nil
	local var3 = if p1 == nil or p1 == "" then "ChartsSortDetail-Unknown" elseif p2 and p2 ~= "" then `ChartsSortDetail-{p1}-{p2}` else `ChartsSortDetail-{p1}`
	local var4 = serializeFilterSelections(p3)
	
	return if var4 then `{var3}?{var4}` else var3
end