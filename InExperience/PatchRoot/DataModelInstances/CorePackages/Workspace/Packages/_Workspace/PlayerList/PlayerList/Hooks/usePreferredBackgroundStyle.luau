local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local usePreferredTransparencyBindingModule = require(parent.Hooks.usePreferredTransparencyBinding)

return function(value)
	-- upvalues: usePreferredTransparencyBindingModule (ref), reactModule (ref)
	local var1 = usePreferredTransparencyBindingModule()
	local color3 = value.Color3
	local transparency = value.Transparency
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), color3 (ref), transparency (ref)
		return var1:map(function(p1)
			-- upvalues: color3 (copy), transparency (copy)
			return { Color3 = color3, Transparency = transparency * p1 }
		end)
	end, { var1, color3, transparency })
end