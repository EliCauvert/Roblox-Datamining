return function(p1, p2)
	local var1 = p1
	
	if not var1 then
		return nil
	end
	for i, v in ipairs(p2:split(".")) do
		if var1[v] ~= nil then
			var1 = var1[v]
			continue
		end
		return nil
	end
	return var1
end