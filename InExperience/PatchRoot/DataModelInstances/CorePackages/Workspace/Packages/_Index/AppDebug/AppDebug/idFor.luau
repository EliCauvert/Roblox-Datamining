local var0 = 1
local tbl = setmetatable({}, { __mode = "k" })

return function(p0) --[[ line: 15 | named "idFor" ]]
	-- upvalues: tbl (ref), var0 (write)
	if p0 == nil then
		return 0
	end
	local var2 = tbl[p0]
	
	if not var2 then
		var2 = var0
		var0 += 1
		tbl[p0] = var2
	end
	return var2
end