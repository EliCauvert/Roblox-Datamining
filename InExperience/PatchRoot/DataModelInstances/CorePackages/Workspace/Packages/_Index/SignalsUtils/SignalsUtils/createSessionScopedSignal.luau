local parent = script:FindFirstAncestor("SignalsUtils").Parent
local signalsModule = require(parent.Signals)
local getCurrentUserId = require(parent.UserLib).Stores.LocalUserIdStore.getCurrentUserId

return function(value, p0) --[[ line: 19 | named "createSessionScopedSignal" ]]
	-- upvalues: signalsModule (ref), getCurrentUserId (ref)
	local var1 = signalsModule.createComputed(function(p1) --[[ line: 23 ]]
		-- upvalues: getCurrentUserId (copy), signalsModule (copy), value (ref), p0 (ref)
		getCurrentUserId(p1)
		local var2, var3 = signalsModule.createSignal(value, p0)
		
		return { getter = var2, setter = var3 }
	end)
	
	return function(p2) --[[ line: 30 | named "getter" ]]
		-- upvalues: var1 (ref)
		return var1(p2).getter(p2)
	end, function(value) --[[ line: 33 | named "setter" ]]
		-- upvalues: var1 (ref)
		var1().setter(value)
	end
end