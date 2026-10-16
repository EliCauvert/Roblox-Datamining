local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local UseLegacyAndTransparencyAwarePanelStyleModule = require(Parent.Hooks.useLegacyAndTransparencyAwarePanelStyle)

return ReactModule.memo(function(p1) --[[ Line: 19 | Named "LoadingStateImpl" ]]
	-- upvalues: UseLegacyAndTransparencyAwarePanelStyleModule (copy), ReactModule (copy), View (copy), Loading (copy), IconSize (copy)
	local UseLegacyAndTransparencyAwarePanelStyleModuleResult = UseLegacyAndTransparencyAwarePanelStyleModule(p1.useLegacyPanelStyling)
	
	return ReactModule.createElement(View, {
		tag = UseLegacyAndTransparencyAwarePanelStyleModuleResult.panelTag,
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = UseLegacyAndTransparencyAwarePanelStyleModuleResult.backgroundStyle
	}, {
		Spinner = ReactModule.createElement(Loading, { size = IconSize.XLarge })
	})
end)