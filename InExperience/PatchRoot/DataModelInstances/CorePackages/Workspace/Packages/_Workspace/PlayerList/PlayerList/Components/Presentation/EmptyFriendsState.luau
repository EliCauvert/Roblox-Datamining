local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)
local UseLegacyAndTransparencyAwarePanelStyleModule = require(Parent.Hooks.useLegacyAndTransparencyAwarePanelStyle)

return ReactModule.memo(function(p1)
	-- upvalues: UseLegacyAndTransparencyAwarePanelStyleModule (copy), FFlagPlayerListLocalizeGameTextModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseLegacyAndTransparencyAwarePanelStyleModuleResult = UseLegacyAndTransparencyAwarePanelStyleModule(p1.useLegacyPanelStyling)
	
	return ReactModule.createElement(View, {
		tag = UseLegacyAndTransparencyAwarePanelStyleModuleResult.panelTag,
		LayoutOrder = p1.layoutOrder,
		backgroundStyle = UseLegacyAndTransparencyAwarePanelStyleModuleResult.backgroundStyle
	}, {
		Message = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			TextWrapped = true,
			Text = if FFlagPlayerListLocalizeGameTextModule then UseLocalizationFunction({ friendsEmpty = "InGame.PlayerList.FriendsEmpty" }).friendsEmpty else "None of your friends have played this experience yet."
		})
	})
end)