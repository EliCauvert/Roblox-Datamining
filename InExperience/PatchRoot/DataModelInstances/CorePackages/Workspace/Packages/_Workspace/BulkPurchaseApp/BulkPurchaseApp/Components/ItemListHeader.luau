local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local LineItemLayoutModule = require(script.Parent.LineItemLayout)

return function(Frame) --[[ Line: 17 | Named "ItemListHeader" ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), LineItemLayoutModule (copy), StyledTextLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local FontStyle = {
		LineHeight = UseDesignTokensResult.Typography.BodyLarge.LineHeight,
		Font = UseDesignTokensResult.Typography.TitleLarge.Font,
		FontSize = UseDesignTokensResult.Typography.BodyLarge.FontSize,
		LetterSpacing = UseDesignTokensResult.Typography.BodyLarge.LetterSpacing
	}
	local Emphasis = UseDesignTokensResult.Color.Content.Emphasis
	
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