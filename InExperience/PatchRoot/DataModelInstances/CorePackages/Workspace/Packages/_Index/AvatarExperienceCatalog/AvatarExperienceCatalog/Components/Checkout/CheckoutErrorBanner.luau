local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), foundationModule (ref)
	local var1 = useLocalization({
		checkoutErrorTitleSingular = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular",
		checkoutErrorDescription = "Feature.Catalog.Message.Checkout.PurchaseFailed",
		checkoutErrorTitlePlural = {
			"Feature.Catalog.Title.Checkout.PurchaseFailedPlural",
			count = p1.erroredItemCount
		}
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y row gap-medium bg-surface-200 items-center radius-medium padding-large",
		testId = "CheckoutErrorBanner"
	}, {
		CheckoutErrorIcon = reactModule.createElement(foundationModule.Icon, {
			name = foundationModule.Enums.IconName.TriangleExclamation,
			variant = foundationModule.Enums.IconVariant.Filled,
			size = foundationModule.Enums.InputSize.Large
		}),
		CheckoutTextRows = reactModule.createElement(foundationModule.View, { tag = "size-full-0 col gap-small fill auto-y" }, {
			CheckoutErrorTitle = reactModule.createElement(foundationModule.Text, {
				tag = "size-full-0 auto-y text-wrap fill text-label-medium text-align-x-left content-emphasis",
				Text = if p1.erroredItemCount == 1 then var1.checkoutErrorTitleSingular else var1.checkoutErrorTitlePlural
			}),
			CheckoutErrorDescription = reactModule.createElement(foundationModule.Text, {
				tag = "size-full-0 auto-y text-wrap fill text-body-medium text-align-x-left content-default",
				Text = var1.checkoutErrorDescription
			})
		})
	})
end)