local foundation = script:FindFirstAncestor("Foundation")
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Components.Types)

return function(p1, p2)
	-- upvalues: constantsModule (ref)
	return if p2 then {
		Color3 = p1.Color3,
		Transparency = 1 - (1 - (p1.Transparency or 0)) * constantsModule.DISABLED_TRANSPARENCY
	} else p1
end