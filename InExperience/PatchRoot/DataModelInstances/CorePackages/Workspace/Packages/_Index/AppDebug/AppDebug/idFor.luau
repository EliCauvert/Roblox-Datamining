local var1 = 1
local tbl = setmetatable({}, { __mode = "k" })

return function(p1)
	-- upvalues: tbl (ref), var1 (write)
	if p1 == nil then
		return 0
	end
	local var2 = tbl[p1]
	
	if not var2 then
		var2 = var1
		var1 += 1
		tbl[p1] = var2
	end
	return var2
end