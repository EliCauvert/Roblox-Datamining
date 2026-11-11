local Foundation = script:FindFirstAncestor("Foundation")
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Components.Types)

return function(p1, p2)
	-- upvalues: ConstantsModule (copy)
	return if p2 then {
		Color3 = p1.Color3,
		Transparency = 1 - (1 - (p1.Transparency or 0)) * ConstantsModule.DISABLED_TRANSPARENCY
	} else p1
end