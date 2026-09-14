local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)

return {
	SURFACE_PRESET_ORDER = {
		"None",
		"Surface_0",
		"Surface_100",
		"Surface_200",
		"Surface_300"
	},
	resolveSurfacePreset = function(value, p1)
		return if p1 == "Surface_0" then value.Color.Surface.Surface_0 elseif p1 == "Surface_100" then value.Color.Surface.Surface_100 elseif p1 == "Surface_200" then value.Color.Surface.Surface_200 elseif p1 == "Surface_300" then value.Color.Surface.Surface_300 else nil
	end
}