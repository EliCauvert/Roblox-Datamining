local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UIBloxModule = require(Parent.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

function UpsellModal(p1)
	-- upvalues: UseTokensFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), PartialPageModal (copy), ButtonType (copy), StyledTextLabel (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 0)
	}, {
		Content = ReactModule.createElement(PartialPageModal, {
			title = p1.titleText,
			screenSize = UseScreenSizeFunction(),
			onCloseClicked = p1.onCloseModal,
			buttonStackProps = {
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttonHeight = UseTokensResult.Size.Size_1200,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							isDisabled = false,
							onActivated = p1.onCancelButtonClick,
							text = p1.cancelButtonText
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = p1.onActionButtonClick,
							text = p1.actionButtonText
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
					PaddingTop = UDim.new(0, UseTokensResult.Padding.XXLarge),
					PaddingBottom = UDim.new(0, UseTokensResult.Padding.XXLarge)
				}),
				Text = ReactModule.createElement(StyledTextLabel, {
					fluidSizing = false,
					fontStyle = UseTokensResult.Typography.BodyLarge,
					colorStyle = UseTokensResult.Color.Content.Emphasis,
					size = UDim2.new(1, 0, 0, 0),
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y,
					text = p1.bodyText
				})
			})
		})
	})
end

return UpsellModal