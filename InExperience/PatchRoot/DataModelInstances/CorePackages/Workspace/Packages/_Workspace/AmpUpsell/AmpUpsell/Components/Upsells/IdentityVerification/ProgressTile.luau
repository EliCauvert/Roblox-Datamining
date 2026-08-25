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

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), imageSetLabel (ref), images (ref), loading (ref), iconSize (ref), styledTextLabel (ref)
	local frameHeight = p0.frameHeight
	local var3 = useStyle()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, frameHeight),
		LayoutOrder = p0.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		StatusIcon = if p0.finished then reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, frameHeight, 0, frameHeight),
			ScaleType = Enum.ScaleType.Fit,
			Image = images["icons/status/success"],
			ImageTransparency = var3.Theme.SystemPrimaryDefault.Transparency,
			ImageColor3 = var3.Theme.IconEmphasis.Color
		}) else reactModule.createElement(loading, { size = iconSize.Small }),
		TextFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, (-frameHeight) - 12, 0, frameHeight)
		}, {
			ProgressText = reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				text = p0.progressText,
				fontStyle = var3.Font.CaptionBody,
				colorStyle = var3.Theme.TextDefault,
				size = UDim2.new(1, 0, 1, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		})
	})
end