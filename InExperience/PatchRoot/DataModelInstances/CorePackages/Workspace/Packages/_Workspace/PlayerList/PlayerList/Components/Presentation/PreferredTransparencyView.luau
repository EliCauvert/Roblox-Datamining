local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences

return function(p0) --[[ line: 11 | named "PreferredTransparencyView" ]]
	-- upvalues: useTokens (ref), usePreferences (ref), reactModule (ref), view (ref)
	local overMedia200 = useTokens().Color.OverMedia.OverMedia_200
	local var2 = overMedia200.Transparency * usePreferences().preferredTransparency
	
	return reactModule.createElement(view, {
		tag = "col radius-medium",
		Size = p0.size,
		backgroundStyle = reactModule.useMemo(function() --[[ line: 21 ]]
			-- upvalues: overMedia200 (ref), var2 (ref)
			return { Color3 = overMedia200.Color3, Transparency = var2 }
		end, { overMedia200.Color3, var2 }),
		Visible = p0.visible
	}, p0.children)
end