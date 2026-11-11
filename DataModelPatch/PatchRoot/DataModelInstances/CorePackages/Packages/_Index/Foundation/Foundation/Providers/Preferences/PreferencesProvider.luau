local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local PreferencesContextModule = require(script.Parent.PreferencesContext)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	preferredTransparency = 1,
	reducedMotion = false,
	scale = 1,
	preferredTextSize = Enum.PreferredTextSize.Medium
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), PreferencesContextModule (copy)
	return ReactModule.createElement(PreferencesContextModule.Provider, {
		value = WithDefaultsModule({
			preferredTextSize = p1.preferredTextSize,
			preferredTransparency = p1.preferredTransparency,
			reducedMotion = p1.reducedMotion
		}, config)
	}, p1.children)
end