local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore

local var1 = function(p1, p2)
	return p1 == p2
end

return function(value, p1)
	-- upvalues: useStore (ref), reactModule (ref), signalsModule (ref), var1 (ref)
	local var2 = useStore()
	local state = var2:getState()
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), state (ref)
		return signalsModule.createSignal(state)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		var4(var2:getState())
		local changedConnection = var2.changed:connect(var4)
		
		return function()
			-- upvalues: changedConnection (ref)
			changedConnection:disconnect()
		end
	end, { var2 })
	
	return reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), value (ref), var3 (ref), p1 (ref), var1 (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: value (copy), var3 (copy)
			return value(var3(p2))
		end, p1 or var1)
	end, { var3, value, p1 })
end