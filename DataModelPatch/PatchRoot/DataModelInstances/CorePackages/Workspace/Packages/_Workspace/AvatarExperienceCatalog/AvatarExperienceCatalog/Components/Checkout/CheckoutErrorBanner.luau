local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		checkoutErrorTitleSingular = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular",
		checkoutErrorDescription = "Feature.Catalog.Message.Checkout.PurchaseFailed",
		checkoutErrorTitlePlural = {
			"Feature.Catalog.Title.Checkout.PurchaseFailedPlural",
			count = p1.erroredItemCount
		}
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y row gap-medium bg-surface-200 items-center radius-medium padding-large",
		testId = "CheckoutErrorBanner"
	}, {
		CheckoutErrorIcon = ReactModule.createElement(FoundationModule.Icon, {
			name = FoundationModule.Enums.IconName.TriangleExclamation,
			variant = FoundationModule.Enums.IconVariant.Filled,
			size = FoundationModule.Enums.InputSize.Large
		}),
		CheckoutTextRows = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 col gap-small fill auto-y" }, {
			CheckoutErrorTitle = ReactModule.createElement(FoundationModule.Text, {
				tag = "size-full-0 auto-y text-wrap fill text-label-medium text-align-x-left content-emphasis",
				Text = if p1.erroredItemCount == 1 then UseLocalizationResult.checkoutErrorTitleSingular else UseLocalizationResult.checkoutErrorTitlePlural
			}),
			CheckoutErrorDescription = ReactModule.createElement(FoundationModule.Text, {
				tag = "size-full-0 auto-y text-wrap fill text-body-medium text-align-x-left content-default",
				Text = UseLocalizationResult.checkoutErrorDescription
			})
		})
	})
end)