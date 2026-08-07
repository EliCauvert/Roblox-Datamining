local parent = script:FindFirstAncestor("AmpUpsell").Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local iconSize = UIBloxModule.App.Constant.IconSize
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0) --[[ line: 26 | named "IDVErrorScreen" ]]
	-- upvalues: useStyle (ref), useSelector (ref), reactModule (ref), partialPageModal (ref), buttonType (ref), imageSetLabel (ref), iconSize (ref), images (ref), styledTextLabel (ref)
	local errorTitle = p0.errorTitle
	local errorDescription = p0.errorDescription
	local onClose = p0.onClose
	local var2 = useStyle()
	
	return reactModule.createElement(partialPageModal, {
		bottomPadding = 20,
		title = errorTitle,
		screenSize = useSelector(function(p1) --[[ line: 32 ]]
			return p1.ScreenSize
		end),
		onCloseClicked = function() --[[ line: 39 ]]
			-- upvalues: onClose (ref)
			onClose()
		end,
		buttonStackProps = {
			buttonHeight = 48,
			forcedFillDirection = Enum.FillDirection.Horizontal,
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = function() --[[ line: 51 ]]
							-- upvalues: onClose (ref)
							onClose()
						end,
						text = p0.buttonText
					}
				}
			}
		}
	}, {
		ViewFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 20)
			}),
			ImageIcon = reactModule.createElement(imageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, iconSize.XXLarge, 0, iconSize.XXLarge),
				ScaleType = Enum.ScaleType.Fit,
				Image = images["icons/graphic/error_xlarge"],
				ImageTransparency = var2.Theme.SystemPrimaryDefault.Transparency
			}),
			ErrorText = reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				layoutOrder = 2,
				text = errorDescription,
				fontStyle = var2.Font.CaptionBody,
				colorStyle = var2.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.XY
			})
		})
	})
end