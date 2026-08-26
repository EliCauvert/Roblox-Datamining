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

return function(p1)
	-- upvalues: flagsModule (ref), reactModule (ref), withDefaultsModule (ref), t (ref), preferencesContextModule (ref)
	return reactModule.createElement(preferencesContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: withDefaultsModule (copy), p1 (ref), t (copy)
			return withDefaultsModule({
				preferredTextSize = p1.preferredTextSize,
				preferredTransparency = p1.preferredTransparency,
				reducedMotion = p1.reducedMotion
			}, t)
		end, {
			p1.preferredTextSize,
			p1.preferredTransparency,
			p1.reducedMotion
		}) else withDefaultsModule({
			preferredTextSize = p1.preferredTextSize,
			preferredTransparency = p1.preferredTransparency,
			reducedMotion = p1.reducedMotion
		}, t)
	}, p1.children)
end