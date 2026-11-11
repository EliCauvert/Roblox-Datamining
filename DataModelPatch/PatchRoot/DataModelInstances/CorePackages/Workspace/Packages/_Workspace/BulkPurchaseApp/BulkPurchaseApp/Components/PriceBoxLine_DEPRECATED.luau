local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local LineItemLayoutModule = require(script.Parent.LineItemLayout)
local PriceDEPRECATEDModule = require(script.Parent.Price_DEPRECATED)
local PriceBoxLineVariantEnumModule = require(BulkPurchaseApp.Enums.PriceBoxLineVariantEnum)

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), PriceBoxLineVariantEnumModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), LineItemLayoutModule (copy), StyledTextLabel (copy), PriceDEPRECATEDModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Config = if Frame.variant == PriceBoxLineVariantEnumModule.Danger then {
		LineHeight = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.LineHeight else UseDesignTokensResult.Semantic.Typography.Body.LineHeight,
		Font = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.TitleLarge.Font else UseDesignTokensResult.Semantic.Typography.Subheader.Font,
		FontSize = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.FontSize else UseDesignTokensResult.Semantic.Typography.Body.FontSize,
		LetterSpacing = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.LetterSpacing else UseDesignTokensResult.Semantic.Typography.Body.LetterSpacing
	} elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge else UseDesignTokensResult.Semantic.Typography.Body
	local Emphasis = if Frame.variant == PriceBoxLineVariantEnumModule.Highlight then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis elseif Frame.variant == PriceBoxLineVariantEnumModule.Danger then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.System.Alert else UseDesignTokensResult.Semantic.Color.Common.Alert elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default
	
	return ReactModule.createElement(LineItemLayoutModule, {
		LayoutOrder = Frame.LayoutOrder,
		startSlot = ReactModule.createElement(StyledTextLabel, {
			fontStyle = Config,
			colorStyle = Emphasis,
			text = Frame.text
		}),
		endSlot = ReactModule.createElement(PriceDEPRECATEDModule, {
			colorStyle = Emphasis,
			fontStyle = Config,
			amount = Frame.amount
		})
	})
end