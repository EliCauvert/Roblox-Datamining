local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AnalyticsServiceModule = require(AmpUpsell.Analytics.AnalyticsService)
local SendButtonClickEventModule = require(AmpUpsell.Analytics.sendButtonClickEvent)
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local LinkButton = UIBloxModule.App.Button.LinkButton
local DirectionsTileModule = require(script.Parent.DirectionsTile)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local QRCodeDisplayModule = require(Parent.QRCodeDisplay)
local DisplayQRCode = QRCodeDisplayModule.DisplayQRCode
local ECLevels = QRCodeDisplayModule.ECLevels
local ProgressChecklistModule = require(script.Parent.ProgressChecklist)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local IdvWithQRCodeUpsellStrings = require(AmpUpsell.Common.LocalizationStrings).idvWithQRCodeUpsellStrings

return function(p1) --[[ Line: 45 | Named "IDVWithQRCodeUpsell" ]]
	-- upvalues: UseLocalizationFunction (copy), IdvWithQRCodeUpsellStrings (copy), UseStyleFunction (copy), AnalyticsServiceModule (copy), UseSelectorFunction (copy), ReactModule (copy), PartialPageModal (copy), SendButtonClickEventModule (copy), AppScreensModule (copy), StyledTextLabel (copy), DirectionsTileModule (copy), ProgressChecklistModule (copy), DisplayQRCode (copy), ECLevels (copy), Loading (copy), IconSize (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), LinkButton (copy)
	local FeatureName = p1.featureName
	local QrCodeLink = p1.qrCodeLink
	local UseLocalizationResult = UseLocalizationFunction(IdvWithQRCodeUpsellStrings)
	local UseStyleResult = UseStyleFunction()
	local OnCloseFunction = p1.onClose
	local OpenPrivacyPolicyLinkFunction = p1.openPrivacyPolicyLink
	local BodyFont = UseStyleResult.Font.Body.Font
	local Transparency = UseStyleResult.Theme.TextEmphasis.Transparency
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local AnalyticsService = if p1.analyticsService then p1.analyticsService else AnalyticsServiceModule.EventStream
	local LatestStepCompleted: number = p1.latestStepCompleted
	local IsLatestStepCompletedAbove = LatestStepCompleted > 0
	
	return ReactModule.createElement(PartialPageModal, {
		bottomPadding = 0,
		title = UseLocalizationResult.title,
		screenSize = UseSelectorFunction(function(p2) --[[ Line: 60 ]]
			return p2.ScreenSize
		end),
		onCloseClicked = function() --[[ Line: 67 ]]
			-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OnCloseFunction (copy)
			SendButtonClickEventModule(AnalyticsService, AppScreensModule.IDVWithQRCodeUpsell, FeatureName, "CloseModal")
			OnCloseFunction()
		end
	}, {
		QRCodeViewFrame = ReactModule.createElement("Frame", {
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
			HeaderText = ReactModule.createElement(StyledTextLabel, {
				lineHeight = 1,
				layoutOrder = 0,
				text = if IsLatestStepCompletedAbove then UseLocalizationResult.verifyInBrowser else UseLocalizationResult.ageVerifyPrompt,
				fontStyle = UseStyleResult.Font.Header2,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.XY
			}),
			DirectionsFrame = if IsLatestStepCompletedAbove then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 144),
				BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 24)
				}),
				IDDirection = ReactModule.createElement(DirectionsTileModule, {
					imagePath = "icons/menu/document",
					frameHeight = 48,
					layoutOrder = 1,
					headerText = UseLocalizationResult.idDirectionsHeader,
					descriptionText = UseLocalizationResult.idDirectionsBody
				}),
				PhoneDirection = ReactModule.createElement(DirectionsTileModule, {
					imagePath = "icons/menu/mobile",
					frameHeight = 48,
					layoutOrder = 2,
					headerText = UseLocalizationResult.phoneDirectionsHeader,
					descriptionText = UseLocalizationResult.phoneDirectionsBody
				})
			}),
			Checklist = if IsLatestStepCompletedAbove then ReactModule.createElement(ProgressChecklistModule, {
				entryHeight = 18,
				layoutOrder = 1,
				latestStepCompleted = LatestStepCompleted
			}) else nil,
			BeginText = if IsLatestStepCompletedAbove then nil else ReactModule.createElement(StyledTextLabel, {
				lineHeight = 1,
				layoutOrder = 2,
				text = UseLocalizationResult.beginText,
				fontStyle = UseStyleResult.Font.Header1,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.XY
			}),
			QRCodeWrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(153, 153),
				BackgroundColor3 = Color3.fromHex("#FFFFFF")
			}, {
				QrCode = if QrCodeLink == nil then ReactModule.createElement(Loading, { size = IconSize.Medium }) else ReactModule.createElement(DisplayQRCode, {
					sideLength = 150,
					backgroundTransparency = 1,
					ecLevel = ECLevels.EC_LEVEL_1,
					toEncode = QrCodeLink
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 4),
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingTop = UDim.new(0, 4)
				})
			}),
			DisclaimerFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 100)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Disclaimer = if IsLatestStepCompletedAbove then nil else ReactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Text = UseLocalizationResult.disclaimer,
					Font = if FoundationFontFaceMigration then nil else BodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
					TextSize = ScaledBaseSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = Transparency,
					TextXAlignment = Enum.TextXAlignment.Center,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(1, 0, 0, 24)
				}),
				PrivacyPolicy = if IsLatestStepCompletedAbove then nil else ReactModule.createElement(LinkButton, {
					layoutOrder = 2,
					fontStyle = "CaptionBody",
					underlineAlwaysEnabled = true,
					text = UseLocalizationResult.privacyLinkText,
					onActivated = function() --[[ Line: 232 ]]
						-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), AppScreensModule (upval), FeatureName (copy), OpenPrivacyPolicyLinkFunction (copy)
						SendButtonClickEventModule(AnalyticsService, AppScreensModule.IDVWithQRCodeUpsell, FeatureName, "OpenPrivacyPolicy")
						OpenPrivacyPolicyLinkFunction()
					end
				}),
				HavingTroubleInfoText = if IsLatestStepCompletedAbove then ReactModule.createElement(StyledTextLabel, {
					lineHeight = 1,
					layoutOrder = 1,
					text = UseLocalizationResult.havingTroubleInfoText,
					size = UDim2.new(1, 0, 0.5, 0),
					fontStyle = UseStyleResult.Font.CaptionBody,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					textTruncate = Enum.TextTruncate.AtEnd,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center
				}) else nil,
				DontCloseWindowDisclaimer = if IsLatestStepCompletedAbove then ReactModule.createElement(StyledTextLabel, {
					lineHeight = 1,
					layoutOrder = 2,
					text = UseLocalizationResult.dontCloseWindowDisclaimer,
					fontStyle = UseStyleResult.Font.CaptionBody,
					size = UDim2.new(1, 0, 0.5, 0),
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					textTruncate = Enum.TextTruncate.AtEnd,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center
				}) else nil
			})
		})
	})
end