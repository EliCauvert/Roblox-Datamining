local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local UIBloxModule = require(Parent.UIBlox)
local ReactModule = require(Parent.React)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ImageSetLabel (copy), IconSize (copy), Images (copy), StyledTextLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local FrameHeight = p1.frameHeight
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, FrameHeight),
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		ImageIcon = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0, IconSize.Large, 0, IconSize.Large),
			ScaleType = Enum.ScaleType.Fit,
			Image = Images[p1.imagePath],
			ImageTransparency = UseStyleResult.Theme.SystemPrimaryDefault.Transparency
		}),
		TextFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -48, 0, FrameHeight)
		}, {
			TextLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Header = ReactModule.createElement(StyledTextLabel, {
				lineHeight = 1,
				layoutOrder = 1,
				text = p1.headerText,
				fontStyle = UseStyleResult.Font.Header2,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0.5, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			}),
			Body = ReactModule.createElement(StyledTextLabel, {
				lineHeight = 1,
				layoutOrder = 2,
				text = p1.descriptionText,
				fontStyle = UseStyleResult.Font.CaptionBody,
				colorStyle = UseStyleResult.Theme.TextDefault,
				size = UDim2.new(1, 0, 0.5, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center
			})
		})
	})
end