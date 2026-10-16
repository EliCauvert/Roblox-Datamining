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

return function(p1) --[[ Line: 30 | Named "PreferencesProvider" ]]
	-- upvalues: ReactModule (copy), WithDefaultsModule (copy), config (copy), PreferencesContextModule (copy)
	return ReactModule.createElement(PreferencesContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 32 ]]
			-- upvalues: WithDefaultsModule (upval), p1 (copy), config (upval)
			return WithDefaultsModule({
				preferredTextSize = p1.preferredTextSize,
				preferredTransparency = p1.preferredTransparency,
				reducedMotion = p1.reducedMotion
			}, config)
		end, {
			p1.preferredTextSize,
			p1.preferredTransparency,
			p1.reducedMotion
		})
	}, p1.children)
end