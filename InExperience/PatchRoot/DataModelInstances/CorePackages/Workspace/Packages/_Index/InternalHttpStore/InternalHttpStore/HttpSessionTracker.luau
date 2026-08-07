local t = {}
local var1 = 0

function t.currentSession() --[[ line: 5 ]]
	-- upvalues: var1 (write)
	return var1
end

function t.cancelAll() --[[ line: 9 ]]
	-- upvalues: var1 (write)
	var1 += 1
end

return t