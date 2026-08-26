local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local analyticsServiceModule = require(ampUpsell.Analytics.AnalyticsService)
local sendButtonClickEventModule = require(ampUpsell.Analytics.sendButtonClickEvent)
local appScreensModule = require(ampUpsell.Common.AppScreens)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useStyle = UIBloxModule.Core.Style.useStyle

function AccountSettingsUpsell(value)
	-- upvalues: useLocalization (ref), useStyle (ref), analyticsServiceModule (ref), reactModule (ref), partialPageModal (ref), sendButtonClickEventModule (ref), appScreensModule (ref), buttonType (ref), styledTextLabel (ref)
	local onCloseModal = value.onCloseModal
	local onCloseModal_1 = value.onCloseModal
	local featureName = value.featureName
	local var1 = useLocalization(value.localizationStrings)
	local var2 = useStyle()
	local var3 = if value.analyticsService then value.analyticsService else analyticsServiceModule.EventStream
	
	return reactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 0)
	}, {
		Overlay = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Content = reactModule.createElement(partialPageModal, {
				title = var1.title,
				screenSize = value.screenSize,
				onCloseClicked = function()
					-- upvalues: sendButtonClickEventModule (copy), var3 (ref), appScreensModule (copy), featureName (ref), onCloseModal (ref)
					sendButtonClickEventModule(var3, appScreensModule.AccountSettingsUpsell, featureName, "CloseModal")
					onCloseModal()
				end,
				buttonStackProps = {
					buttonHeight = 48,
					forcedFillDirection = Enum.FillDirection.Horizontal,
					buttons = {
						{
							buttonType = buttonType.Secondary,
							props = {
								isDisabled = false,
								onActivated = function()
									-- upvalues: sendButtonClickEventModule (copy), var3 (ref), appScreensModule (copy), featureName (ref), onCloseModal_1 (ref)
									sendButtonClickEventModule(var3, appScreensModule.AccountSettingsUpsell, featureName, "Cancelled")
									onCloseModal_1()
								end,
								text = var1.buttonCancel
							}
						},
						{
							buttonType = buttonType.PrimarySystem,
							props = {
								isDisabled = false,
								onActivated = function()
									-- upvalues: sendButtonClickEventModule (copy), var3 (ref), appScreensModule (copy), featureName (ref), value (ref), var1 (ref)
									sendButtonClickEventModule(var3, appScreensModule.AccountSettingsUpsell, featureName, "OpenAccountSettings")
									value.openAccountSettings(var1.buttonSettings)
								end,
								text = var1.buttonSettings
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
					Text = reactModule.createElement(styledTextLabel, {
						fluidSizing = false,
						fontStyle = var2.Font.Body,
						colorStyle = var2.Theme.TextEmphasis,
						size = UDim2.new(1, 0, 0, 0),
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center,
						automaticSize = Enum.AutomaticSize.Y,
						text = var1.message
					})
				})
			})
		})
	})
end

AccountSettingsUpsell = roactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end)(AccountSettingsUpsell)

return AccountSettingsUpsell