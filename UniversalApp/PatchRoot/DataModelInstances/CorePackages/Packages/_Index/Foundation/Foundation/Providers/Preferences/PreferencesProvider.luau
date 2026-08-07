local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local preferencesContextModule = require(parent.PreferencesContext)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	preferredTransparency = 1,
	reducedMotion = false,
	scale = 1,
	preferredTextSize = Enum.PreferredTextSize.Medium
}

return function(p0) --[[ line: 30 | named "PreferencesProvider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), preferencesContextModule (ref)
	return reactModule.createElement(preferencesContextModule.Provider, {
		value = withDefaultsModule({
			preferredTextSize = p0.preferredTextSize,
			preferredTransparency = p0.preferredTransparency,
			reducedMotion = p0.reducedMotion
		}, t)
	}, p0.children)
end