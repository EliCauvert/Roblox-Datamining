local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local LineItemLayoutModule = require(script.Parent.LineItemLayout)
local PriceDEPRECATEDModule = require(script.Parent.Price_DEPRECATED)
local PriceBoxLineVariantEnumModule = require(BulkPurchaseApp.Enums.PriceBoxLineVariantEnum)

return function(Frame) --[[ Line: 21 | Named "PriceBoxLine_DEPRECATED" ]]
	-- upvalues: UseDesignTokensFunction (copy), PriceBoxLineVariantEnumModule (copy), ReactModule (copy), LineItemLayoutModule (copy), StyledTextLabel (copy), PriceDEPRECATEDModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Config = if Frame.variant == PriceBoxLineVariantEnumModule.Danger then {
		LineHeight = UseDesignTokensResult.Typography.BodyLarge.LineHeight,
		Font = UseDesignTokensResult.Typography.TitleLarge.Font,
		FontSize = UseDesignTokensResult.Typography.BodyLarge.FontSize,
		LetterSpacing = UseDesignTokensResult.Typography.BodyLarge.LetterSpacing
	} else UseDesignTokensResult.Typography.BodyLarge
	local Emphasis = if Frame.variant == PriceBoxLineVariantEnumModule.Highlight then UseDesignTokensResult.Color.Content.Emphasis elseif Frame.variant == PriceBoxLineVariantEnumModule.Danger then UseDesignTokensResult.Color.System.Alert else UseDesignTokensResult.Color.Content.Default
	
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