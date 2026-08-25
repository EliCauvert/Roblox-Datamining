local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local lineItemLayoutModule = require(script.Parent.LineItemLayout)

return function(p0)
	-- upvalues: useDesignTokens (ref), reactModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref)
	local var2 = useDesignTokens()
	local t = {
		LineHeight = var2.Typography.BodyLarge.LineHeight,
		Font = var2.Typography.TitleLarge.Font,
		FontSize = var2.Typography.BodyLarge.FontSize,
		LetterSpacing = var2.Typography.BodyLarge.LetterSpacing
	}
	local emphasis = var2.Color.Content.Emphasis
	
	return reactModule.createElement(lineItemLayoutModule, {
		startSlot = reactModule.createElement(styledTextLabel, { fontStyle = t, colorStyle = emphasis, text = p0.heading }),
		endSlot = reactModule.createElement(styledTextLabel, {
			fontStyle = t,
			colorStyle = emphasis,
			text = p0.itemCount
		}),
		LayoutOrder = p0.LayoutOrder
	})
end