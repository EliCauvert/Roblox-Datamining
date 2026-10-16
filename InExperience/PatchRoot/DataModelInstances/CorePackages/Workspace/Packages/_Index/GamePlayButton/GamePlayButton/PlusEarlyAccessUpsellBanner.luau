local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UsePlayButtonStateModule = require(GamePlayButton.usePlayButtonState)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo(function(Frame) --[[ Line: 25 | Named "PlusEarlyAccessUpsellBanner" ]]
	-- upvalues: UseLocalizationFunction (copy), UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), UsePlayButtonStateModule (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		joinEarly = "Feature.RobloxSubscription.Description.JoinEarly"
	})
	local EarlyAccess = UsePlayButtonStateModule(UseRoactServiceFunction(RoactServiceTagsModule.RoactNetworking), Frame.universeId).earlyAccess
	
	return if EarlyAccess == nil or not EarlyAccess.showPlusUpsell then nil else ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-1100 padding-medium stroke-default radius-medium clip",
		testId = "--early-access-plus-upsell",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = EarlyAccess.openUpsell
	}, {
		PlusIcon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = IconName.RobloxPlus,
			size = IconSize.Medium
		}),
		Label = ReactModule.createElement(Text, {
			tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 2,
			Text = UseLocalizationResult.joinEarly
		}),
		Subscribe = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-emphasis",
			RichText = true,
			LayoutOrder = 3,
			testId = "--early-access-subscribe",
			Text = `<u>{UseLocalizationResult.subscribe}</u>`
		})
	})
end)