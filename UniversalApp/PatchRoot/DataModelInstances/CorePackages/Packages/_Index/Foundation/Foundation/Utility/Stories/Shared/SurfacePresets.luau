local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)

return {
	SURFACE_PRESET_ORDER = {
		"None",
		"Surface_0",
		"Surface_100",
		"Surface_200",
		"Surface_300"
	},
	resolveSurfacePreset = function(p1, p2) --[[ Line: 9 ]]
		return if p2 == "Surface_0" then p1.Color.Surface.Surface_0 elseif p2 == "Surface_100" then p1.Color.Surface.Surface_100 elseif p2 == "Surface_200" then p1.Color.Surface.Surface_200 elseif p2 == "Surface_300" then p1.Color.Surface.Surface_300 else nil
	end
}