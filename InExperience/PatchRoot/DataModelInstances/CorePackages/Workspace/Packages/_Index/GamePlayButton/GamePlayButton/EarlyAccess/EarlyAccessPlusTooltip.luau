local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local educationalTooltip = foundationModule.EducationalTooltip
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), robloxSubscriptionPurchaseAppModule (ref), signalsReactModule (ref), reactModule (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref)
	local var1 = useLocalization({
		title = "Feature.RobloxSubscription.ToolTip.EarlyAccess.Title",
		body = "Feature.RobloxSubscription.ToolTip.EarlyAccess.Body"
	})
	
	return if signalsReactModule.useSignalState(robloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals.get().getHasRobloxSubscription) then reactModule.createElement(educationalTooltip, {
		isOpen = p1.isOpen,
		onClose = p1.onRequestClose,
		onPressedOutside = p1.onRequestClose,
		anchorRef = p1.anchorRef,
		title = var1.title,
		text = var1.body,
		side = popoverSide.Top,
		align = popoverAlign.Center
	}) else nil
end)