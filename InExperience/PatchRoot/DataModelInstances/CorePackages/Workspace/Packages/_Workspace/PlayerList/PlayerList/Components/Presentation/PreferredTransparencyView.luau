local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local fFlagPlayerListReskinPanelStrokeModule = require(parent.Flags.FFlagPlayerListReskinPanelStroke)

return function(p0) --[[ line: 13 | named "PreferredTransparencyView" ]]
	-- upvalues: useTokens (ref), usePreferences (ref), reactModule (ref), view (ref), fFlagPlayerListReskinPanelStrokeModule (ref)
	local overMedia200 = useTokens().Color.OverMedia.OverMedia_200
	local var3 = overMedia200.Transparency * usePreferences().preferredTransparency
	
	return reactModule.createElement(view, {
		Size = p0.size,
		tag = {
			["col radius-medium"] = true,
			["stroke-standard stroke-default"] = fFlagPlayerListReskinPanelStrokeModule
		},
		backgroundStyle = reactModule.useMemo(function() --[[ line: 23 ]]
			-- upvalues: overMedia200 (ref), var3 (ref)
			return { Color3 = overMedia200.Color3, Transparency = var3 }
		end, { overMedia200.Color3, var3 }),
		Visible = p0.visible
	}, p0.children)
end