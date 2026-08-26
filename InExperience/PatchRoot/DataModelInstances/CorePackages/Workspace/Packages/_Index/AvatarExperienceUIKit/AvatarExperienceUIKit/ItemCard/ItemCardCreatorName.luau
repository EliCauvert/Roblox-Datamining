local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local verifiedBadgesModule = require(parent.VerifiedBadges)
local fFlagAXAddTextXAlignmentProp = require(parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp

local function ItemCardCreatorName(p1)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), verifiedBadgesModule (ref), fFlagAXAddTextXAlignmentProp (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(text, {
		textStyle = var1.Color.Content.Default,
		fontStyle = var1.Typography.BodyMedium,
		LayoutOrder = p1.LayoutOrder,
		Text = if p1.hasVerifiedBadge then `{p1.name}{verifiedBadgesModule.emoji.verified}` else p1.name,
		TextXAlignment = if fFlagAXAddTextXAlignmentProp and p1.TextXAlignment then p1.TextXAlignment else Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
end

return if require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardCreatorName) else ItemCardCreatorName