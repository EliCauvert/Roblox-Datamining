return function(p0, p1)
	local var0 = p0
	
	for i, v in ipairs(p1:split(".")) do
		if var0[v] ~= nil then
			var0 = var0[v]
			continue
		end
		return nil
	end
	return var0
end