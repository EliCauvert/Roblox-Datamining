return function(p1, Text: string) --[[ Line: 1 ]]
	local v1 = p1
	
	for _, value in ipairs(Text:split(".")) do
		if v1[value] == nil then
			return nil
		end
		v1 = v1[value]
	end
	return v1
end