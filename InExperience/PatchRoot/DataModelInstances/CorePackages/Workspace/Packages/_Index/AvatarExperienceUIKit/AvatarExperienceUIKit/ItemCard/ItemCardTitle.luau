local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local fFlagAXAddTextXAlignmentProp = require(parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp
local fFlagAXRootSlotBasedEditorFlag = require(parent.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag

local function ItemCardTitle(p0)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), fFlagAXRootSlotBasedEditorFlag (ref), fFlagAXAddTextXAlignmentProp (ref)
	local var3 = useTokens()
	
	return reactModule.createElement(text, {
		textStyle = var3.Color.Content.Emphasis,
		fontStyle = if fFlagAXRootSlotBasedEditorFlag and p0.titleTextSize then p0.titleTextSize else var3.Typography.TitleMedium,
		LayoutOrder = p0.LayoutOrder,
		Text = p0.title,
		TextXAlignment = if fFlagAXAddTextXAlignmentProp and p0.TextXAlignment then p0.TextXAlignment else Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
end

return if require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardTitle) else ItemCardTitle