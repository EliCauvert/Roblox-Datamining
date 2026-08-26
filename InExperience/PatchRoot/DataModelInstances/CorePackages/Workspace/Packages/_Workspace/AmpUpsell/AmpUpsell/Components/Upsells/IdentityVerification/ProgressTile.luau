local parent = script:FindFirstAncestor("AmpUpsell").Parent
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local reactModule = require(parent.React)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), imageSetLabel (ref), images (ref), loading (ref), iconSize (ref), styledTextLabel (ref)
	local frameHeight = p1.frameHeight
	local var1 = useStyle()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, frameHeight),
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		StatusIcon = if p1.finished then reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, frameHeight, 0, frameHeight),
			ScaleType = Enum.ScaleType.Fit,
			Image = images["icons/status/success"],
			ImageTransparency = var1.Theme.SystemPrimaryDefault.Transparency,
			ImageColor3 = var1.Theme.IconEmphasis.Color
		}) else reactModule.createElement(loading, { size = iconSize.Small }),
		TextFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, (-frameHeight) - 12, 0, frameHeight)
		}, {
			ProgressText = reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				text = p1.progressText,
				fontStyle = var1.Font.CaptionBody,
				colorStyle = var1.Theme.TextDefault,
				size = UDim2.new(1, 0, 1, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		})
	})
end