local parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), badge (ref), badgeVariant (ref), text (ref)
	local var1 = useLocalization({
		getFreeTrialText = "Feature.RobloxSubscription.Label.FreeTrialText",
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		newBadge = "Feature.Catalog.Label.New"
	})
	
	return if p1.shouldShowNewBadge then reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall auto-xy",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0)
	}, {
		NewBadge = reactModule.createElement(badge, {
			LayoutOrder = 1,
			text = var1.newBadge,
			variant = badgeVariant.Contrast
		})
	}) else reactModule.createElement(view, {
		tag = "auto-xy",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0)
	}, {
		SubscribeText = reactModule.createElement(text, {
			tag = "auto-xy text-body-small content-default",
			RichText = true,
			Text = "<u>" .. reactModule.useCallback(function()
				-- upvalues: p1 (ref), var1 (ref)
				return if p1.productInfo.isFreeTrial then var1.getFreeTrialText else var1.subscribe
			end, {
				p1.productInfo.isFreeTrial,
				var1.getFreeTrialText,
				var1.subscribe
			})() .. "</u>"
		})
	})
end