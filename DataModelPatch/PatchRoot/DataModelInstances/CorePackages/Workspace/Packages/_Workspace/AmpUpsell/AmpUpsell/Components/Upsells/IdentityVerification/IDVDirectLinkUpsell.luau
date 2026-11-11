local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local UIBloxModule = require(Parent.UIBlox)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AnalyticsServiceModule = require(AmpUpsell.Analytics.AnalyticsService)
local SendButtonClickEventModule = require(AmpUpsell.Analytics.sendButtonClickEvent)
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local LinkButton = UIBloxModule.App.Button.LinkButton
local IdvWithQRCodeUpsellStrings = require(AmpUpsell.Common.LocalizationStrings).idvWithQRCodeUpsellStrings
local DirectionsTileModule = require(script.Parent.DirectionsTile)
local ProgressChecklistModule = require(script.Parent.ProgressChecklist)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), IdvWithQRCodeUpsellStrings (copy), UseStyleFunction (copy), AnalyticsServiceModule (copy), UseSelectorFunction (copy), ReactModule (copy), PartialPageModal (copy), SendButtonClickEventModule (copy), AppScreensModule (copy), ButtonType (copy), DirectionsTileModule (copy), ProgressChecklistModule (copy), RoactModule (copy), LinkButton (copy)
	local FeatureName = p1.featureName
	local UseLocalizationResult = UseLocalizationFunction(IdvWithQRCodeUpsellStrings)
	local UseStyleResult = UseStyleFunction()
	local OnCloseFunction = p1.onClose
	local OpenPrivacyPolicyLinkFunction = p1.openPrivacyPolicyLink
	local AnalyticsService = p1.analyticsService or AnalyticsServiceModule.EventStream
	local IdvLink = p1.idvLink
	local LatestStepCompleted: number = p1.latestStepCompleted
	local IsLatestStepCompletedAbove = LatestStepCompleted > 0
	local OpenIdvLinkFunction = p1.openIdvLink
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.title,
		screenSize = UseSelectorFunction(function(p2)
			return p2.ScreenSize
		end),
		onCloseClicked = ReactModule.useCallback(function()
			-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OnCloseFunction (copy)
			SendButtonClickEventModule(AnalyticsService, AppScreensModule.IDVDirectLinkUpsell, FeatureName, "CloseModal")
			OnCloseFunction()
		end, { AnalyticsService, FeatureName }),
		buttonStackProps = {
			buttonHeight = 36,
			forcedFillDirection = Enum.FillDirection.Vertical,
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						isDisabled = false,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OnCloseFunction (copy)
							SendButtonClickEventModule(AnalyticsService, AppScreensModule.IDVDirectLinkUpsell, FeatureName, "CloseModal")
							OnCloseFunction()
						end, { AnalyticsService, FeatureName }),
						text = UseLocalizationResult.cancel
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: IdvLink (copy), SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OpenIdvLinkFunction (copy)
							if IdvLink ~= nil then
								SendButtonClickEventModule(AnalyticsService, AppScreensModule.IDVDirectLinkUpsell, FeatureName, "OpenIdvLink")
								OpenIdvLinkFunction(IdvLink)
							end
						end, {
							OpenIdvLinkFunction,
							IdvLink,
							AnalyticsService,
							FeatureName
						}),
						text = UseLocalizationResult.startVerification
					}
				}
			}
		}
	}, {
		DirectLinkViewFrame = ReactModule.createElement("Frame", {
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
				Padding = UDim.new(0, 24)
			}),
			DirectionsFrameOrProgressChecklist = if IsLatestStepCompletedAbove then ReactModule.createElement(ProgressChecklistModule, {
				entryHeight = 18,
				layoutOrder = 1,
				latestStepCompleted = LatestStepCompleted
			}) else ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 72),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				IDDirection = ReactModule.createElement(DirectionsTileModule, {
					imagePath = "icons/menu/document",
					frameHeight = 48,
					headerText = UseLocalizationResult.idDirectionsHeader,
					descriptionText = UseLocalizationResult.idDirectionsBody
				})
			}),
			DisclaimerFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 100)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Disclaimer = ReactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Text = UseLocalizationResult.disclaimer,
					Font = UseStyleResult.Font.Body.Font,
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				PrivacyPolicy = RoactModule.createElement(LinkButton, {
					layoutOrder = 2,
					fontStyle = "CaptionBody",
					underlineAlwaysEnabled = true,
					text = UseLocalizationResult.privacyLinkText,
					onActivated = function()
						-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OpenPrivacyPolicyLinkFunction (copy)
						SendButtonClickEventModule(AnalyticsService, AppScreensModule.IDVDirectLinkUpsell, FeatureName, "OpenPrivacyPolicy")
						OpenPrivacyPolicyLinkFunction()
					end
				})
			})
		})
	})
end