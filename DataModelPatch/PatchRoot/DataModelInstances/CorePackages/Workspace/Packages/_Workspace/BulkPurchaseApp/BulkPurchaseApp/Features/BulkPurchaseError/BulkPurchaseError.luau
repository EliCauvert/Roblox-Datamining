local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local IAPExperienceModule = require(Parent.IAPExperience)
local FormatEconomicRestrictionTextFunction = IAPExperienceModule.Utility.formatEconomicRestrictionText
local AddEconomicRestrictionKeysToLocalizationFunction = IAPExperienceModule.Utility.addEconomicRestrictionKeysToLocalization
local AlertPromptModule = require(BulkPurchaseApp.Components.AlertPrompt)
local ErrorCodeEnumModule = require(BulkPurchaseApp.Enums.ErrorCodeEnum)

local function BulkPurchaseErrorText(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), StyledTextLabel (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(StyledTextLabel, {
		size = UDim2.fromScale(1, 0),
		automaticSize = Enum.AutomaticSize.Y,
		fontStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge else UseDesignTokensResult.Semantic.Typography.Body,
		colorStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default,
		textXAlignment = Enum.TextXAlignment.Center,
		text = p1.text,
		layoutOrder = p1.layoutOrder
	})
end

local config = {
	[ErrorCodeEnumModule.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientRobux",
	[ErrorCodeEnumModule.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuotaExceeded",
	[ErrorCodeEnumModule.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotForSale",
	[ErrorCodeEnumModule.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonAlreadyOwned",
	[ErrorCodeEnumModule.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPurchaserIsSeller",
	[ErrorCodeEnumModule.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableForPurchaser",
	[ErrorCodeEnumModule.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPriceMismatch",
	[ErrorCodeEnumModule.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuantityLimitExceeded",
	[ErrorCodeEnumModule.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientMembership",
	[ErrorCodeEnumModule.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonGeneric",
	[ErrorCodeEnumModule.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonSoldOut",
	[ErrorCodeEnumModule.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReason2SV",
	[ErrorCodeEnumModule.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableInExperience"
}
local config1 = {
	[ErrorCodeEnumModule.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainMoreRobux",
	[ErrorCodeEnumModule.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainWait",
	[ErrorCodeEnumModule.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[ErrorCodeEnumModule.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[ErrorCodeEnumModule.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[ErrorCodeEnumModule.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[ErrorCodeEnumModule.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow",
	[ErrorCodeEnumModule.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[ErrorCodeEnumModule.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[ErrorCodeEnumModule.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainLater",
	[ErrorCodeEnumModule.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow",
	[ErrorCodeEnumModule.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems",
	[ErrorCodeEnumModule.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems"
}

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), config (copy), config1 (copy), AddEconomicRestrictionKeysToLocalizationFunction (copy), UseLocalizationFunction (copy), ErrorCodeEnumModule (copy), FormatEconomicRestrictionTextFunction (copy), ReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), BulkPurchaseErrorText (copy), AlertPromptModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = nil
	local config2 = {
		title = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorHeading",
		dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA",
		errorReason = config[p1.errorCode],
		tryAgain = config1[p1.errorCode]
	}
	AddEconomicRestrictionKeysToLocalizationFunction(config2)
	UseLocalizationResult = UseLocalizationFunction(config2)
	
	if p1.errorCode == ErrorCodeEnumModule.EconomicRestriction and p1.errorMetadata then
		UseLocalizationResult.errorReason = FormatEconomicRestrictionTextFunction(UseLocalizationResult, p1.errorMetadata, true)
	end
	return ReactModule.createElement(AlertPromptModule, {
		title = UseLocalizationResult.title,
		dismissCTA = UseLocalizationResult.dismissCTA,
		onDismiss = p1.onDismiss,
		middleContent = function()
			-- upvalues: ReactModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), UseDesignTokensResult (copy), BulkPurchaseErrorText (upval), UseLocalizationResult (ref)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Space_200)
				}),
				ErrorReason = ReactModule.createElement(BulkPurchaseErrorText, {
					layoutOrder = 1,
					text = UseLocalizationResult.errorReason
				}),
				TryAgain = if UseLocalizationResult.tryAgain then ReactModule.createElement(BulkPurchaseErrorText, { layoutOrder = 2, text = UseLocalizationResult.tryAgain }) else nil
			})
		end
	})
end