local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local useLegacyAndTransparencyAwarePanelStyleModule = require(parent.Hooks.useLegacyAndTransparencyAwarePanelStyle)

return reactModule.memo(function(p0) --[[ line: 19 | named "LoadingStateImpl" ]]
	-- upvalues: useLegacyAndTransparencyAwarePanelStyleModule (ref), reactModule (ref), view (ref), loading (ref), iconSize (ref)
	local var3 = useLegacyAndTransparencyAwarePanelStyleModule(p0.useLegacyPanelStyling)
	
	return reactModule.createElement(view, {
		tag = var3.panelTag,
		LayoutOrder = p0.layoutOrder,
		backgroundStyle = var3.backgroundStyle
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.XLarge })
	})
end)