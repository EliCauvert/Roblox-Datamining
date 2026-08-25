local t = {}
local var1 = 0

function t.currentSession()
	-- upvalues: var1 (write)
	return var1
end

function t.cancel()
	-- upvalues: var1 (write)
	var1 += 1
end

return t