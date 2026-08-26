local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var1, var2 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref)
		return signalsModule.createSignal(p1)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2(p1)
	end, { p1 })
	
	return var1
end