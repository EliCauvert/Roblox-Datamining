local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local TextKeysModule = require(ProfileQRCode.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local _Color3 = Color3.new(1, 1, 1)
local IconsCommonRefresh = Images["icons/common/refresh"]
local IconsGraphicErrorXlarge = Images["icons/graphic/error_xlarge"]

return function(p1) --[[ Line: 30 ]]
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), _Color3 (copy), IconSize (copy), ImageSetLabel (copy), IconsGraphicErrorXlarge (copy), StyledTextLabel (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy), IconsCommonRefresh (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ImageWrapper = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				BackgroundColor3 = _Color3,
				Size = UDim2.fromOffset(IconSize.XLarge, IconSize.XLarge)
			}, {
				FailedImage = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = IconsGraphicErrorXlarge,
					Size = UDim2.fromOffset(IconSize.XLarge, IconSize.XLarge),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			}),
			Spacer1 = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 0, 12)
			}),
			FailedMessage = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 3,
				fluidSizing = false,
				richText = false,
				size = UDim2.new(1, 0, 0, 0),
				text = UseLocalizationFunction({ failedToLoadMessage = TextKeysModule.FailedToLoad }).failedToLoadMessage,
				fontStyle = UseStyleResult.Font.CaptionBody,
				colorStyle = UseStyleResult.Theme.TextMuted,
				automaticSize = Enum.AutomaticSize.Y,
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center
			}),
			Spacer2 = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(0, 0, 0, 20)
			}),
			RetryButton = ReactModule.createElement(Button, {
				layoutOrder = 5,
				buttonType = ButtonType.Secondary,
				standardSize = StandardButtonSize.Regular,
				icon = IconsCommonRefresh,
				onActivated = p1.onActivated
			})
		})
	})
end