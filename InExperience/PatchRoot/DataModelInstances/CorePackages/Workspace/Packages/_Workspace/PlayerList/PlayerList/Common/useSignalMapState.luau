local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.CoreScriptsRoactCommon)

return function(value)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var1, var2 = reactModule.useState(value)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), value (ref), signalsModule (copy)
		var2(value)
		
		return signalsModule.createEffect(function(p1)
			-- upvalues: value (copy), var2 (copy)
			value.getCount(p1)
			var2(value)
		end)
	end, { value })
	
	return var1
end