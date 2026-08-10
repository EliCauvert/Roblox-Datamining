local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(p0) --[[ line: 7 | named "useLegacyVisibilityMirror" ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var2, var3 = reactModule.useMemo(function() --[[ line: 9 ]]
		-- upvalues: signalsModule (copy), p0 (ref)
		return signalsModule.createSignal(p0)
	end, {})
	reactModule.useEffect(function() --[[ line: 13 ]]
		-- upvalues: var3 (ref), p0 (ref)
		var3(p0)
	end, { p0 })
	
	return var2
end