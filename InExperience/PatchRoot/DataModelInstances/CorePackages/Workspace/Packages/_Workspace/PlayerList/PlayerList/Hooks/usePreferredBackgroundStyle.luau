local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local usePreferredTransparencyBindingModule = require(parent.Hooks.usePreferredTransparencyBinding)

return function(value)
	-- upvalues: usePreferredTransparencyBindingModule (ref), reactModule (ref)
	local var2 = usePreferredTransparencyBindingModule()
	local color3 = value.Color3
	local transparency = value.Transparency
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), color3 (ref), transparency (ref)
		return var2:map(function(p0)
			-- upvalues: color3 (copy), transparency (copy)
			return { Color3 = color3, Transparency = transparency * p0 }
		end)
	end, { var2, color3, transparency })
end