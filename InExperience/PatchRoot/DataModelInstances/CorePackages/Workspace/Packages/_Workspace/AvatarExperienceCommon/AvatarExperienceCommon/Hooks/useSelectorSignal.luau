local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore

local var2 = function(p0, p1) --[[ line: 16 ]]
	return p0 == p1
end

return function(value, p2) --[[ line: 20 | named "useSelectorSignal" ]]
	-- upvalues: useStore (ref), reactModule (ref), signalsModule (ref), var2 (ref)
	local var3 = useStore()
	local state = var3:getState()
	local var5, var6 = reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: signalsModule (copy), state (ref)
		return signalsModule.createSignal(state)
	end, {})
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: var3 (ref), var6 (ref)
		var6(var3:getState())
		local changedConnection = var3.changed:connect(var6)
		
		return function() --[[ line: 32 ]]
			-- upvalues: changedConnection (ref)
			changedConnection:disconnect()
		end
	end, { var3 })
	
	return reactModule.useMemo(function() --[[ line: 37 ]]
		-- upvalues: signalsModule (copy), value (ref), var5 (ref), p2 (ref), var2 (copy)
		return signalsModule.createComputed(function(p3) --[[ line: 38 ]]
			-- upvalues: value (copy), var5 (copy)
			return value(var5(p3))
		end, p2 or var2)
	end, { var5, value, p2 })
end