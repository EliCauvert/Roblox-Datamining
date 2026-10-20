local function serializeFilterSelections(List): string?
	if List == nil then
		return nil
	end
	local List1 = {}
	
	for i in List do
		table.insert(List1, i)
	end
	if #List1 == 0 then
		return nil
	end
	table.sort(List1)
	local List2 = {}
	
	for _, value in List1 do
		table.insert(List2, `{value}={List[value]}`)
	end
	return table.concat(List2, "&")
end

return function(p1, p2, p3): string
	-- upvalues: serializeFilterSelections (copy)
	local ChartsSortDetailUnknown: string = if p1 == nil or p1 == "" then "ChartsSortDetail-Unknown" elseif p2 and p2 ~= "" then `ChartsSortDetail-{p1}-{p2}` else `ChartsSortDetail-{p1}`
	local SerializeFilterSelectionsResult = serializeFilterSelections(p3)
	
	return if SerializeFilterSelectionsResult then `{ChartsSortDetailUnknown}?{SerializeFilterSelectionsResult}` else ChartsSortDetailUnknown
end