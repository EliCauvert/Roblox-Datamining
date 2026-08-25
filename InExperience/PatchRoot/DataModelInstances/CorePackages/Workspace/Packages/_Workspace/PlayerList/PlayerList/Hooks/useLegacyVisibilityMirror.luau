local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(p0)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var2, var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p0 (ref)
		return signalsModule.createSignal(p0)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p0 (ref)
		var3(p0)
	end, { p0 })
	
	return var2
end