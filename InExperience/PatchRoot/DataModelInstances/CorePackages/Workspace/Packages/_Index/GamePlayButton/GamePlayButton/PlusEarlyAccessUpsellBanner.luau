local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local roactServiceTagsModule = require(parent.RoactServiceTags)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local usePlayButtonStateModule = require(gamePlayButton.usePlayButtonState)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), useRoactService (ref), roactServiceTagsModule (ref), usePlayButtonStateModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var1 = useLocalization({
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		joinEarly = "Feature.RobloxSubscription.Description.JoinEarly"
	})
	local earlyAccess = usePlayButtonStateModule(useRoactService(roactServiceTagsModule.RoactNetworking), p1.universeId).earlyAccess
	
	return if earlyAccess == nil or not earlyAccess.showPlusUpsell then nil else reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-1100 padding-medium stroke-default radius-medium clip",
		testId = "--early-access-plus-upsell",
		LayoutOrder = p1.LayoutOrder,
		onActivated = earlyAccess.openUpsell
	}, {
		PlusIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.RobloxPlus,
			size = iconSize.Medium
		}),
		Label = reactModule.createElement(text, {
			tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 2,
			Text = var1.joinEarly
		}),
		Subscribe = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-emphasis",
			RichText = true,
			LayoutOrder = 3,
			testId = "--early-access-subscribe",
			Text = `<u>{var1.subscribe}</u>`
		})
	})
end)