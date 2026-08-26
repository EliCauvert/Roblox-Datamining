local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local IAPExperienceModule = require(parent.IAPExperience)
local formatEconomicRestrictionText = IAPExperienceModule.Utility.formatEconomicRestrictionText
local addEconomicRestrictionKeysToLocalization = IAPExperienceModule.Utility.addEconomicRestrictionKeysToLocalization
local alertPromptModule = require(bulkPurchaseApp.Components.AlertPrompt)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)

local function BulkPurchaseErrorText(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), styledTextLabel (ref)
	local var1 = useDesignTokens()
	
	return reactModule.createElement(styledTextLabel, {
		size = UDim2.fromScale(1, 0),
		automaticSize = Enum.AutomaticSize.Y,
		fontStyle = var1.Typography.BodyLarge,
		colorStyle = var1.Color.Content.Default,
		textXAlignment = Enum.TextXAlignment.Center,
		text = p1.text,
		layoutOrder = p1.layoutOrder
	})
end

local t = {
	[errorCodeEnumModule.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientRobux",
	[errorCodeEnumModule.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuotaExceeded",
	[errorCodeEnumModule.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotForSale",
	[errorCodeEnumModule.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonAlreadyOwned",
	[errorCodeEnumModule.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPurchaserIsSeller",
	[errorCodeEnumModule.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableForPurchaser",
	[errorCodeEnumModule.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPriceMismatch",
	[errorCodeEnumModule.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuantityLimitExceeded",
	[errorCodeEnumModule.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientMembership",
	[errorCodeEnumModule.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonGeneric",
	[errorCodeEnumModule.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonSoldOut",
	[errorCodeEnumModule.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReason2SV",
	[errorCodeEnumModule.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableInExperience"
}
local t_1 = {
	[errorCodeEnumModule.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainMoreRobux",
	[errorCodeEnumModule.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainWait",
	[errorCodeEnumModule.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[errorCodeEnumModule.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[errorCodeEnumModule.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[errorCodeEnumModule.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[errorCodeEnumModule.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow",
	[errorCodeEnumModule.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[errorCodeEnumModule.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[errorCodeEnumModule.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainLater",
	[errorCodeEnumModule.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow",
	[errorCodeEnumModule.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[errorCodeEnumModule.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems"
}

return function(p1)
	-- upvalues: useDesignTokens (ref), t (ref), t_1 (ref), addEconomicRestrictionKeysToLocalization (ref), useLocalization (ref), errorCodeEnumModule (ref), formatEconomicRestrictionText (ref), reactModule (ref), BulkPurchaseErrorText (ref), alertPromptModule (ref)
	local var1 = useDesignTokens()
	local _ = nil
	local t_2 = {
		title = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorHeading",
		dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA",
		errorReason = t[p1.errorCode],
		tryAgain = t_1[p1.errorCode]
	}
	addEconomicRestrictionKeysToLocalization(t_2)
	local var2 = useLocalization(t_2)
	
	if p1.errorCode == errorCodeEnumModule.EconomicRestriction and p1.errorMetadata then
		var2.errorReason = formatEconomicRestrictionText(var2, p1.errorMetadata, true)
	end
	return reactModule.createElement(alertPromptModule, {
		title = var2.title,
		dismissCTA = var2.dismissCTA,
		onDismiss = p1.onDismiss,
		middleContent = function()
			-- upvalues: reactModule (copy), var1 (ref), BulkPurchaseErrorText (copy), var2 (write)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, var1.Size.Size_400)
				}),
				ErrorReason = reactModule.createElement(BulkPurchaseErrorText, { layoutOrder = 1, text = var2.errorReason }),
				TryAgain = if var2.tryAgain then reactModule.createElement(BulkPurchaseErrorText, { layoutOrder = 2, text = var2.tryAgain }) else nil
			})
		end
	})
end