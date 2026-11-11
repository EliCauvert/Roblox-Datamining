local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local LineItemLayoutModule = require(script.Parent.LineItemLayout)

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), LineItemLayoutModule (copy), StyledTextLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local FontStyle = {
		LineHeight = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.LineHeight else UseDesignTokensResult.Semantic.Typography.Body.LineHeight,
		Font = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.TitleLarge.Font else UseDesignTokensResult.Semantic.Typography.Subheader.Font,
		FontSize = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.FontSize else UseDesignTokensResult.Semantic.Typography.Body.FontSize,
		LetterSpacing = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.LetterSpacing else UseDesignTokensResult.Semantic.Typography.Body.LetterSpacing
	}
	local Emphasis = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis
	
	return ReactModule.createElement(LineItemLayoutModule, {
		startSlot = ReactModule.createElement(StyledTextLabel, {
			fontStyle = FontStyle,
			colorStyle = Emphasis,
			text = Frame.heading
		}),
		endSlot = ReactModule.createElement(StyledTextLabel, {
			fontStyle = FontStyle,
			colorStyle = Emphasis,
			text = Frame.itemCount
		}),
		LayoutOrder = Frame.LayoutOrder
	})
end