local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local useLegacyAndTransparencyAwarePanelStyleModule = require(parent.Hooks.useLegacyAndTransparencyAwarePanelStyle)

return reactModule.memo(function(p1)
	-- upvalues: useLegacyAndTransparencyAwarePanelStyleModule (ref), reactModule (ref), view (ref), loading (ref), iconSize (ref)
	local var1 = useLegacyAndTransparencyAwarePanelStyleModule(p1.useLegacyPanelStyling)
	
	return reactModule.createElement(view, {
		tag = var1.panelTag,
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = var1.backgroundStyle
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.XLarge })
	})
end)