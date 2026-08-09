local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local UIBloxModule = require(parent.UIBlox)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useTokens = require(parent.Foundation).Hooks.useTokens

function UpsellModal(p0) --[[ line: 26 ]]
	-- upvalues: useTokens (ref), useScreenSize (ref), reactModule (ref), partialPageModal (ref), buttonType (ref), styledTextLabel (ref)
	local var2 = useTokens()
	
	return reactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 0)
	}, {
		Content = reactModule.createElement(partialPageModal, {
			title = p0.titleText,
			screenSize = useScreenSize(),
			onCloseClicked = p0.onCloseModal,
			buttonStackProps = {
				forcedFillDirection = Enum.FillDirection.Horizontal,
				buttonHeight = var2.Size.Size_1200,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							isDisabled = false,
							onActivated = p0.onCancelButtonClick,
							text = p0.cancelButtonText
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = p0.onActionButtonClick,
							text = p0.actionButtonText
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
					PaddingTop = UDim.new(0, var2.Padding.XXLarge),
					PaddingBottom = UDim.new(0, var2.Padding.XXLarge)
				}),
				Text = reactModule.createElement(styledTextLabel, {
					fluidSizing = false,
					fontStyle = var2.Typography.BodyLarge,
					colorStyle = var2.Color.Content.Emphasis,
					size = UDim2.new(1, 0, 0, 0),
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y,
					text = p0.bodyText
				})
			})
		})
	})
end

return UpsellModal