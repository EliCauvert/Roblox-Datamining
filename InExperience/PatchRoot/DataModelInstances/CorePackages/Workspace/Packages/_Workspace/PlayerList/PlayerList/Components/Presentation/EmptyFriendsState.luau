local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)
local useLegacyAndTransparencyAwarePanelStyleModule = require(parent.Hooks.useLegacyAndTransparencyAwarePanelStyle)

return reactModule.memo(function(p0)
	-- upvalues: useLegacyAndTransparencyAwarePanelStyleModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	local var4 = useLegacyAndTransparencyAwarePanelStyleModule(p0.useLegacyPanelStyling)
	
	return reactModule.createElement(view, {
		tag = var4.panelTag,
		LayoutOrder = p0.layoutOrder,
		backgroundStyle = var4.backgroundStyle
	}, {
		Message = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			TextWrapped = true,
			Text = if fFlagPlayerListLocalizeGameTextModule then useLocalization({ friendsEmpty = "InGame.PlayerList.FriendsEmpty" }).friendsEmpty else "None of your friends have played this experience yet."
		})
	})
end)