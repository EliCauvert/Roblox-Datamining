local foundation = script:FindFirstAncestor("Foundation")
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Components.Types)

return function(p0, p1)
	-- upvalues: constantsModule (ref)
	return if p1 then {
		Color3 = p0.Color3,
		Transparency = 1 - (1 - (p0.Transparency or 0)) * constantsModule.DISABLED_TRANSPARENCY
	} else p0
end