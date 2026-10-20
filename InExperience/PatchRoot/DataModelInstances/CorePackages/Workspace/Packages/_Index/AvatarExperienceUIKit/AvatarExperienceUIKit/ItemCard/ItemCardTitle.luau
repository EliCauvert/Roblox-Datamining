local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAXAddTextXAlignmentProp = require(Parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp

local function ItemCardTitle(Label)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy), FFlagAXAddTextXAlignmentProp (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Text, {
		textStyle = UseTokensResult.Color.Content.Emphasis,
		fontStyle = if Label.titleTextSize then Label.titleTextSize else UseTokensResult.Typography.TitleMedium,
		LayoutOrder = Label.LayoutOrder,
		Text = Label.title,
		TextXAlignment = if FFlagAXAddTextXAlignmentProp and Label.TextXAlignment then Label.TextXAlignment else Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextTruncate = Enum.TextTruncate.SplitWord
	})
end

return if require(Parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardTitle) else ItemCardTitle