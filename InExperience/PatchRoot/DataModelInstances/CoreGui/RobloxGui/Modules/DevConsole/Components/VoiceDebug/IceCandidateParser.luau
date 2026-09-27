local t = {
	candidateType = nil,
	protocol = nil,
	priority = nil,
	component = nil
}

return function(p1)
	-- upvalues: t (ref)
	if p1 == nil or p1 == "" then
		return t
	end
	local t_1 = {}
	
	for i in string.gmatch(p1, "%S+") do
		table.insert(t_1, i)
	end
	local var1 = nil
	
	for i_1, v in t_1 do
		if v == "typ" then
			var1 = t_1[i_1 + 1]
			break
		end
	end
	return if var1 == nil then t else {
		candidateType = var1,
		protocol = t_1[3],
		priority = t_1[4],
		component = t_1[2]
	}
end