local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local FFlagAXAddTextXAlignmentProp = require(Parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp

local function ItemCardCreatorName(Label) --[[ Line: 19 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy), VerifiedBadgesModule (copy), FFlagAXAddTextXAlignmentProp (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Text, {
		textStyle = UseTokensResult.Color.Content.Default,
		fontStyle = UseTokensResult.Typography.BodyMedium,
		LayoutOrder = Label.LayoutOrder,
		Text = if Label.hasVerifiedBadge then `{Label.name}{VerifiedBadgesModule.emoji.verified}` else Label.name,
		TextXAlignment = if FFlagAXAddTextXAlignmentProp and Label.TextXAlignment then Label.TextXAlignment else Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
end

return if require(Parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardCreatorName) else ItemCardCreatorName