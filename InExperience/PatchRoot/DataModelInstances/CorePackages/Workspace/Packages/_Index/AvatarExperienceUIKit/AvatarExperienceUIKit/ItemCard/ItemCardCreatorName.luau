local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local verifiedBadgesModule = require(parent.VerifiedBadges)
local fFlagAXAddTextXAlignmentProp = require(parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp
local fFlagAXUpdateItemCardCreatorNameFontStyle = require(parent.AvatarExperienceFlags).FFlagAXUpdateItemCardCreatorNameFontStyle

local function ItemCardCreatorName(p0) --[[ line: 21 ]]
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), fFlagAXUpdateItemCardCreatorNameFontStyle (ref), verifiedBadgesModule (ref), fFlagAXAddTextXAlignmentProp (ref)
	local var4 = useTokens()
	
	return reactModule.createElement(text, {
		textStyle = var4.Color.Content.Default,
		fontStyle = if fFlagAXUpdateItemCardCreatorNameFontStyle then var4.Typography.BodyMedium else var4.Typography.BodySmall,
		LayoutOrder = p0.LayoutOrder,
		Text = if p0.hasVerifiedBadge then `{p0.name}{verifiedBadgesModule.emoji.verified}` else p0.name,
		TextXAlignment = if fFlagAXAddTextXAlignmentProp and p0.TextXAlignment then p0.TextXAlignment else Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
end

return if require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardCreatorName) else ItemCardCreatorName