local parent = script:FindFirstAncestor("AmpUpsell").Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel

return function(p0) --[[ line: 19 ]]
	-- upvalues: useStyle (ref), reactModule (ref), imageSetLabel (ref), iconSize (ref), images (ref), styledTextLabel (ref)
	local var2 = useStyle()
	local frameHeight = p0.frameHeight
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, frameHeight),
		LayoutOrder = p0.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		ImageIcon = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0, iconSize.Large, 0, iconSize.Large),
			ScaleType = Enum.ScaleType.Fit,
			Image = images[p0.imagePath],
			ImageTransparency = var2.Theme.SystemPrimaryDefault.Transparency
		}),
		TextFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -48, 0, frameHeight)
		}, {
			TextLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Header = reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				layoutOrder = 1,
				text = p0.headerText,
				fontStyle = var2.Font.Header2,
				colorStyle = var2.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0.5, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			}),
			Body = reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				layoutOrder = 2,
				text = p0.descriptionText,
				fontStyle = var2.Font.CaptionBody,
				colorStyle = var2.Theme.TextDefault,
				size = UDim2.new(1, 0, 0.5, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		})
	})
end