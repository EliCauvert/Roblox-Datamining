local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local UsePreferredTransparencyBindingModule = require(Parent.Hooks.usePreferredTransparencyBinding)

return function(p1)
	-- upvalues: UsePreferredTransparencyBindingModule (copy), ReactModule (copy)
	local UsePreferredTransparencyBindingModuleResult = UsePreferredTransparencyBindingModule()
	local _Color3 = p1.Color3
	local Transparency = p1.Transparency
	
	return ReactModule.useMemo(function()
		-- upvalues: UsePreferredTransparencyBindingModuleResult (copy), _Color3 (copy), Transparency (copy)
		return UsePreferredTransparencyBindingModuleResult:map(function(p2)
			-- upvalues: _Color3 (upval), Transparency (upval)
			return { Color3 = _Color3, Transparency = Transparency * p2 }
		end)
	end, {
		UsePreferredTransparencyBindingModuleResult,
		_Color3,
		Transparency
	})
end