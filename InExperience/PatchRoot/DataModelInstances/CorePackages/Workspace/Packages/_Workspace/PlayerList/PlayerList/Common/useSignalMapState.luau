local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.CoreScriptsRoactCommon)

return function(value)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var2, var3 = reactModule.useState(value)
	reactModule.useLayoutEffect(function()
		-- upvalues: var3 (ref), value (ref), signalsModule (copy)
		var3(value)
		
		return signalsModule.createEffect(function(p0)
			-- upvalues: value (copy), var3 (copy)
			value.getCount(p0)
			var3(value)
		end)
	end, { value })
	
	return var2
end