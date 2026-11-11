local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local ReactModule = require(Parent.React)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy), Loading (copy), IconSize (copy), StyledTextLabel (copy)
	local FrameHeight = p1.frameHeight
	local LayoutOrder = p1.layoutOrder
	local Finished = p1.finished
	local ProgressText = p1.progressText
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, FrameHeight),
		LayoutOrder = LayoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		StatusIcon = if Finished then ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, FrameHeight, 0, FrameHeight),
			ScaleType = Enum.ScaleType.Fit,
			Image = Images["icons/status/success"],
			ImageTransparency = UseStyleResult.Theme.SystemPrimaryDefault.Transparency,
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color
		}) else ReactModule.createElement(Loading, { size = IconSize.Small }),
		TextFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -FrameHeight - 12, 0, FrameHeight)
		}, {
			ProgressText = ReactModule.createElement(StyledTextLabel, {
				lineHeight = 1,
				text = ProgressText,
				fontStyle = UseStyleResult.Font.CaptionBody,
				colorStyle = UseStyleResult.Theme.TextDefault,
				size = UDim2.new(1, 0, 1, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		})
	})
end