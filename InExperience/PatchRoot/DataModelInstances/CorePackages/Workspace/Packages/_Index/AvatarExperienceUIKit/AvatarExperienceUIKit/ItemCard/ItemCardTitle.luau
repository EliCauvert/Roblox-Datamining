local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local fFlagAXAddTextXAlignmentProp = require(parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp
local fFlagAXRootSlotBasedEditorFlag = require(parent.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag

local function ItemCardTitle(p1)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), fFlagAXRootSlotBasedEditorFlag (ref), fFlagAXAddTextXAlignmentProp (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(text, {
		textStyle = var1.Color.Content.Emphasis,
		fontStyle = if fFlagAXRootSlotBasedEditorFlag and p1.titleTextSize then p1.titleTextSize else var1.Typography.TitleMedium,
		LayoutOrder = p1.LayoutOrder,
		Text = p1.title,
		TextXAlignment = if fFlagAXAddTextXAlignmentProp and p1.TextXAlignment then p1.TextXAlignment else Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
end

return if require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardTitle) else ItemCardTitle