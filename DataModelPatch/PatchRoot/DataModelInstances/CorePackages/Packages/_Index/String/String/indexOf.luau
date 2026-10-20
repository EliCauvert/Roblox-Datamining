local Text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(Text1: string, Text2: string, p1: number)
	-- upvalues: Text (copy)
	local CountText1 = #Text1
	local v1 = if p1 == nil then 1 elseif p1 < 1 then 1 else p1
	
	if #Text2 == 0 then
		return if CountText1 < v1 then CountText1 else v1
	end
	if CountText1 < v1 then
		return -1
	end
	local _1 = Text2:gsub(Text, "%%%1")
	local Count_1 = #_1
	
	for i = v1, CountText1 do
		if string.sub(Text1, i, i + Count_1 - 1) == _1 then
			return i
		end
	end
	return -1
end