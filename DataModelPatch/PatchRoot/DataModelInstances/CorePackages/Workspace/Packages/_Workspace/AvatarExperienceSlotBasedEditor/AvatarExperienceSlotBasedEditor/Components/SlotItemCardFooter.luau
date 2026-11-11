local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local ResponsiveModule = require(Parent.Responsive)
local FFlagAXAddTextXAlignmentProp = require(Parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp
local FFlagAXCustomizeMakeupSupport = require(Parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), ReactModule (copy), Text (copy), FFlagAXCustomizeMakeupSupport (copy), FFlagAXAddTextXAlignmentProp (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.BreakpointConfig.Enum.Portrait
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		ItemCardFooterLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.XSmall)
		}),
		ItemCardFooterInfo = if Frame.title then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ItemCardFooterInfoLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, UseTokensResult.Gap.XXSmall)
			}),
			ItemCardFooterInfoTitle = if Frame.title then ReactModule.createElement(Text, {
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = if IsUseOrientationResultMatch then UseTokensResult.Typography.CaptionSmall elseif FFlagAXCustomizeMakeupSupport then UseTokensResult.Typography.CaptionMedium else UseTokensResult.Typography.LabelMedium,
				LayoutOrder = if FFlagAXCustomizeMakeupSupport then 1 else Frame.LayoutOrder,
				Text = Frame.title,
				TextXAlignment = if FFlagAXAddTextXAlignmentProp and Frame.TextXAlignment then Frame.TextXAlignment else Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextTruncate = Enum.TextTruncate.SplitWord
			}) else nil
		}) else nil
	})
end