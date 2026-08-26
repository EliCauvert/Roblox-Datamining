local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local lineItemLayoutModule = require(script.Parent.LineItemLayout)

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref)
	local var1 = useDesignTokens()
	local t = {
		LineHeight = var1.Typography.BodyLarge.LineHeight,
		Font = var1.Typography.TitleLarge.Font,
		FontSize = var1.Typography.BodyLarge.FontSize,
		LetterSpacing = var1.Typography.BodyLarge.LetterSpacing
	}
	local emphasis = var1.Color.Content.Emphasis
	
	return reactModule.createElement(lineItemLayoutModule, {
		startSlot = reactModule.createElement(styledTextLabel, { fontStyle = t, colorStyle = emphasis, text = p1.heading }),
		endSlot = reactModule.createElement(styledTextLabel, {
			fontStyle = t,
			colorStyle = emphasis,
			text = p1.itemCount
		}),
		LayoutOrder = p1.LayoutOrder
	})
end