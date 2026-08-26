local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local textKeysModule = require(profileQRCode.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local color3 = Color3.new(1, 1, 1)
local refresh = images["icons/common/refresh"]
local errorXlarge = images["icons/graphic/error_xlarge"]

return function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), color3 (ref), iconSize (ref), imageSetLabel (ref), errorXlarge (ref), styledTextLabel (ref), button (ref), buttonType (ref), standardButtonSize (ref), refresh (ref)
	local var1 = useStyle()
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Wrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ImageWrapper = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				BackgroundColor3 = color3,
				Size = UDim2.fromOffset(iconSize.XLarge, iconSize.XLarge)
			}, {
				FailedImage = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = errorXlarge,
					Size = UDim2.fromOffset(iconSize.XLarge, iconSize.XLarge),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			}),
			Spacer1 = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 12)
			}),
			FailedMessage = reactModule.createElement(styledTextLabel, {
				layoutOrder = 3,
				fluidSizing = false,
				richText = false,
				size = UDim2.new(1, 0, 0, 0),
				text = useLocalization({ failedToLoadMessage = textKeysModule.FailedToLoad }).failedToLoadMessage,
				fontStyle = var1.Font.CaptionBody,
				colorStyle = var1.Theme.TextMuted,
				automaticSize = Enum.AutomaticSize.Y,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center
			}),
			Spacer2 = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(0, 0, 0, 20)
			}),
			RetryButton = reactModule.createElement(button, {
				layoutOrder = 5,
				buttonType = buttonType.Secondary,
				standardSize = standardButtonSize.Regular,
				icon = refresh,
				onActivated = p1.onActivated
			})
		})
	})
end