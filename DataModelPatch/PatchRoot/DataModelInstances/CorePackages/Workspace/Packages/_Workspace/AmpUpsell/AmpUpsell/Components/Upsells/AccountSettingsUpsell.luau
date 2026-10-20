local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local UIBloxModule = require(Parent.UIBlox)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AnalyticsServiceModule = require(AmpUpsell.Analytics.AnalyticsService)
local SendButtonClickEventModule = require(AmpUpsell.Analytics.sendButtonClickEvent)
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

function AccountSettingsUpsell(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), AnalyticsServiceModule (copy), ReactModule (copy), PartialPageModal (copy), SendButtonClickEventModule (copy), AppScreensModule (copy), ButtonType (copy), StyledTextLabel (copy)
	local OnCloseModalFunction = p1.onCloseModal
	local OnCloseModalFunction1 = p1.onCloseModal
	local FeatureName = p1.featureName
	local UseLocalizationResult = UseLocalizationFunction(p1.localizationStrings)
	local UseStyleResult = UseStyleFunction()
	local AnalyticsService = if p1.analyticsService then p1.analyticsService else AnalyticsServiceModule.EventStream
	
	return ReactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0, 0, 0)
	}, {
		Overlay = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Content = ReactModule.createElement(PartialPageModal, {
				title = UseLocalizationResult.title,
				screenSize = p1.screenSize,
				onCloseClicked = function()
					-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OnCloseModalFunction (copy)
					SendButtonClickEventModule(AnalyticsService, AppScreensModule.AccountSettingsUpsell, FeatureName, "CloseModal")
					OnCloseModalFunction()
				end,
				buttonStackProps = {
					buttonHeight = 48,
					forcedFillDirection = Enum.FillDirection.Horizontal,
					buttons = {
						{
							buttonType = ButtonType.Secondary,
							props = {
								isDisabled = false,
								onActivated = function()
									-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OnCloseModalFunction1 (copy)
									SendButtonClickEventModule(AnalyticsService, AppScreensModule.AccountSettingsUpsell, FeatureName, "Cancelled")
									OnCloseModalFunction1()
								end,
								text = UseLocalizationResult.buttonCancel
							}
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								isDisabled = false,
								onActivated = function()
									-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), p1 (copy), UseLocalizationResult (copy)
									SendButtonClickEventModule(AnalyticsService, AppScreensModule.AccountSettingsUpsell, FeatureName, "OpenAccountSettings")
									p1.openAccountSettings(UseLocalizationResult.buttonSettings)
								end,
								text = UseLocalizationResult.buttonSettings
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
					Text = ReactModule.createElement(StyledTextLabel, {
						fluidSizing = false,
						fontStyle = UseStyleResult.Font.Body,
						colorStyle = UseStyleResult.Theme.TextEmphasis,
						size = UDim2.new(1, 0, 0, 0),
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center,
						automaticSize = Enum.AutomaticSize.Y,
						text = UseLocalizationResult.message
					})
				})
			})
		})
	})
end

AccountSettingsUpsell = RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end)(AccountSettingsUpsell)

return AccountSettingsUpsell