local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local UIBloxModule = require(Parent.UIBlox)
local ReactModule = require(Parent.React)
local IconSize = UIBloxModule.App.Constant.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 26 | Named "IDVErrorScreen" ]]
	-- upvalues: UseStyleFunction (copy), UseSelectorFunction (copy), ReactModule (copy), PartialPageModal (copy), ButtonType (copy), ImageSetLabel (copy), IconSize (copy), Images (copy), StyledTextLabel (copy)
	local ErrorTitle = p1.errorTitle
	local ErrorDescription = p1.errorDescription
	local OnCloseFunction = p1.onClose
	local ButtonText = p1.buttonText
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement(PartialPageModal, {
		bottomPadding = 20,
		title = ErrorTitle,
		screenSize = UseSelectorFunction(function(p2) --[[ Line: 32 ]]
			return p2.ScreenSize
		end),
		onCloseClicked = function() --[[ Line: 39 ]]
			-- upvalues: OnCloseFunction (copy)
			OnCloseFunction()
		end,
		buttonStackProps = {
			buttonHeight = 48,
			forcedFillDirection = Enum.FillDirection.Horizontal,
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = function() --[[ Line: 51 ]]
							-- upvalues: OnCloseFunction (copy)
							OnCloseFunction()
						end,
						text = ButtonText
					}
				}
			}
		}
	}, {
		ViewFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 20)
			}),
			ImageIcon = ReactModule.createElement(ImageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, IconSize.XXLarge, 0, IconSize.XXLarge),
				ScaleType = Enum.ScaleType.Fit,
				Image = Images["icons/graphic/error_xlarge"],
				ImageTransparency = UseStyleResult.Theme.SystemPrimaryDefault.Transparency
			}),
			ErrorText = ReactModule.createElement(StyledTextLabel, {
				lineHeight = 1,
				layoutOrder = 2,
				text = ErrorDescription,
				fontStyle = UseStyleResult.Font.CaptionBody,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.XY
			})
		})
	})
end