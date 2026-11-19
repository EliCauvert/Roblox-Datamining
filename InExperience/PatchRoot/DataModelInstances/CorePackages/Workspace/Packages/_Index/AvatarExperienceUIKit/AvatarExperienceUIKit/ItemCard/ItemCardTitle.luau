local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local FFlagAXAddTextXAlignmentProp = require(Parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp
local FFlagAXItemCardComponentsMemo = require(Parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo
local FFlagAXItemCardTitleMaxLines = require(Parent.AvatarExperienceFlags).FFlagAXItemCardTitleMaxLines

local function ItemCardTitle(Label)
	-- upvalues: UseTokensFunction (copy), FFlagAXItemCardTitleMaxLines (copy), UseTextSizeOffsetFunction (copy), ReactModule (copy), Text (copy), FFlagAXAddTextXAlignmentProp (copy)
	local UseTokensResult = UseTokensFunction()
	local v1 = nil
	local MaxLines = nil
	local UISizeConstraint = nil
	
	if FFlagAXItemCardTitleMaxLines then
		local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
		local TitleTextSize = if Label.titleTextSize then Label.titleTextSize else UseTokensResult.Typography.TitleMedium
		v1 = TitleTextSize
		MaxLines = Label.maxLines
		
		if MaxLines then
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(1e999, (math.ceil(((TitleTextSize.FontSize or 0) + UseTextSizeOffsetResult) * (TitleTextSize.LineHeight or 1) * MaxLines)))
			})
		end
	end
	return ReactModule.createElement(Text, {
		textStyle = UseTokensResult.Color.Content.Emphasis,
		fontStyle = if FFlagAXItemCardTitleMaxLines and Label.maxLines then v1 elseif Label.titleTextSize then Label.titleTextSize else UseTokensResult.Typography.TitleMedium,
		LayoutOrder = Label.LayoutOrder,
		Text = Label.title,
		TextXAlignment = if FFlagAXAddTextXAlignmentProp and Label.TextXAlignment then Label.TextXAlignment else Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextWrapped = if MaxLines then true else nil,
		TextTruncate = Enum.TextTruncate.SplitWord
	}, if FFlagAXItemCardTitleMaxLines then { MaxLines = UISizeConstraint } else nil)
end

return if FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardTitle) else ItemCardTitle