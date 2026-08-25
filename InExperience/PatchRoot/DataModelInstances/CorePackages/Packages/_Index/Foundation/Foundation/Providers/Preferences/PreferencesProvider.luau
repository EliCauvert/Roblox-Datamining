local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local preferencesContextModule = require(parent.PreferencesContext)
local flagsModule = require(foundation.Utility.Flags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	preferredTransparency = 1,
	reducedMotion = false,
	scale = 1,
	preferredTextSize = Enum.PreferredTextSize.Medium
}

return function(p0)
	-- upvalues: flagsModule (ref), reactModule (ref), withDefaultsModule (ref), t (ref), preferencesContextModule (ref)
	return reactModule.createElement(preferencesContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: withDefaultsModule (copy), p0 (ref), t (copy)
			return withDefaultsModule({
				preferredTextSize = p0.preferredTextSize,
				preferredTransparency = p0.preferredTransparency,
				reducedMotion = p0.reducedMotion
			}, t)
		end, {
			p0.preferredTextSize,
			p0.preferredTransparency,
			p0.reducedMotion
		}) else withDefaultsModule({
			preferredTextSize = p0.preferredTextSize,
			preferredTransparency = p0.preferredTransparency,
			reducedMotion = p0.reducedMotion
		}, t)
	}, p0.children)
end