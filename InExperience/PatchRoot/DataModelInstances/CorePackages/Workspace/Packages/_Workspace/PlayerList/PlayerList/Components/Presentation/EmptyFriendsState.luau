local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local constantsModule = require(parent.Common.Constants)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)

return reactModule.memo(function(p0) --[[ line: 20 | named "EmptyFriendsStateImpl" ]]
	-- upvalues: constantsModule (ref), fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = if p0.useLegacyPanelStyling then constantsModule.LEGACY_STATE_PANEL_TAG else constantsModule.STATE_PANEL_TAG,
		LayoutOrder = p0.layoutOrder
	}, {
		Message = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			TextWrapped = true,
			Text = if fFlagPlayerListLocalizeGameTextModule then useLocalization({ friendsEmpty = "InGame.PlayerList.FriendsEmpty" }).friendsEmpty else "None of your friends have played this experience yet."
		})
	})
end)