local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local EducationalTooltip = FoundationModule.EducationalTooltip
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), RobloxSubscriptionPurchaseAppModule (copy), SignalsReactModule (copy), ReactModule (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.RobloxSubscription.ToolTip.EarlyAccess.Title",
		body = "Feature.RobloxSubscription.ToolTip.EarlyAccess.Body"
	})
	
	return if SignalsReactModule.useSignalState(RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals.get().getHasRobloxSubscription) then ReactModule.createElement(EducationalTooltip, {
		isOpen = p1.isOpen,
		onClose = p1.onRequestClose,
		onPressedOutside = p1.onRequestClose,
		anchorRef = p1.anchorRef,
		title = UseLocalizationResult.title,
		text = UseLocalizationResult.body,
		side = PopoverSide.Top,
		align = PopoverAlign.Center
	}) else nil
end)