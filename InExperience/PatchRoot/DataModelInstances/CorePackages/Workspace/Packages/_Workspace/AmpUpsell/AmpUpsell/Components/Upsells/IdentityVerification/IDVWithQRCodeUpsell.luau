local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local analyticsServiceModule = require(ampUpsell.Analytics.AnalyticsService)
local sendButtonClickEventModule = require(ampUpsell.Analytics.sendButtonClickEvent)
local appScreensModule = require(ampUpsell.Common.AppScreens)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local useStyle = UIBloxModule.Core.Style.useStyle
local linkButton = UIBloxModule.App.Button.LinkButton
local directionsTileModule = require(script.Parent.DirectionsTile)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local QRCodeDisplayModule = require(parent.QRCodeDisplay)
local displayQRCode = QRCodeDisplayModule.DisplayQRCode
local ECLevels = QRCodeDisplayModule.ECLevels
local progressChecklistModule = require(script.Parent.ProgressChecklist)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local idvWithQRCodeUpsellStrings = require(ampUpsell.Common.LocalizationStrings).idvWithQRCodeUpsellStrings

return function(p0) --[[ line: 43 | named "IDVWithQRCodeUpsell" ]]
	-- upvalues: useLocalization (ref), idvWithQRCodeUpsellStrings (ref), useStyle (ref), analyticsServiceModule (ref), useSelector (ref), reactModule (ref), partialPageModal (ref), sendButtonClickEventModule (ref), appScreensModule (ref), styledTextLabel (ref), directionsTileModule (ref), progressChecklistModule (ref), displayQRCode (ref), ECLevels (ref), loading (ref), iconSize (ref), linkButton (ref)
	local featureName = p0.featureName
	local qrCodeLink = p0.qrCodeLink
	local var10 = useLocalization(idvWithQRCodeUpsellStrings)
	local var11 = useStyle()
	local onClose = p0.onClose
	local openPrivacyPolicyLink = p0.openPrivacyPolicyLink
	local font = var11.Font.Body.Font
	local transparency = var11.Theme.TextEmphasis.Transparency
	local var12 = var11.Font.BaseSize * var11.Font.CaptionBody.RelativeSize
	local var13 = if p0.analyticsService then p0.analyticsService else analyticsServiceModule.EventStream
	local uDim2 = UDim2.fromOffset(153, 153)
	local latestStepCompleted = p0.latestStepCompleted
	local var15 = latestStepCompleted > 0
	
	return reactModule.createElement(partialPageModal, {
		bottomPadding = 0,
		title = var10.title,
		screenSize = useSelector(function(p1) --[[ line: 58 ]]
			return p1.ScreenSize
		end),
		onCloseClicked = function() --[[ line: 65 ]]
			-- upvalues: sendButtonClickEventModule (copy), var13 (ref), appScreensModule (copy), featureName (ref), onClose (ref)
			sendButtonClickEventModule(var13, appScreensModule.IDVWithQRCodeUpsell, featureName, "CloseModal")
			onClose()
		end
	}, {
		QRCodeViewFrame = reactModule.createElement("Frame", {
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
				Padding = UDim.new(0, 24)
			}),
			HeaderText = reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				layoutOrder = 0,
				text = if var15 then var10.verifyInBrowser else var10.ageVerifyPrompt,
				fontStyle = var11.Font.Header2,
				colorStyle = var11.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.XY
			}),
			DirectionsFrame = if not var15 then reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 144),
				BackgroundColor3 = var11.Theme.BackgroundContrast.Color
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 24)
				}),
				IDDirection = reactModule.createElement(directionsTileModule, {
					imagePath = "icons/menu/document",
					frameHeight = 48,
					layoutOrder = 1,
					headerText = var10.idDirectionsHeader,
					descriptionText = var10.idDirectionsBody
				}),
				PhoneDirection = reactModule.createElement(directionsTileModule, {
					imagePath = "icons/menu/mobile",
					frameHeight = 48,
					layoutOrder = 2,
					headerText = var10.phoneDirectionsHeader,
					descriptionText = var10.phoneDirectionsBody
				})
			}) else nil,
			Checklist = if var15 then reactModule.createElement(progressChecklistModule, {
				entryHeight = 18,
				layoutOrder = 1,
				latestStepCompleted = latestStepCompleted
			}) else nil,
			BeginText = if not var15 then reactModule.createElement(styledTextLabel, {
				lineHeight = 1,
				layoutOrder = 2,
				text = var10.beginText,
				fontStyle = var11.Font.Header1,
				colorStyle = var11.Theme.TextEmphasis,
				size = UDim2.new(1, 0, 0, 0),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Center,
				automaticSize = Enum.AutomaticSize.XY
			}) else nil,
			QRCodeWrapper = reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				LayoutOrder = 3,
				Size = uDim2,
				BackgroundColor3 = Color3.fromHex("#FFFFFF")
			}, {
				QrCode = if qrCodeLink ~= nil then reactModule.createElement(loading, { size = iconSize.Medium }) else reactModule.createElement(displayQRCode, {
					sideLength = 150,
					backgroundTransparency = 1,
					ecLevel = ECLevels.EC_LEVEL_1,
					toEncode = qrCodeLink
				}),
				UIListLayout = reactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 4),
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingTop = UDim.new(0, 4)
				})
			}),
			DisclaimerFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 100)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Disclaimer = if not var15 then reactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Text = var10.disclaimer,
					Font = font,
					TextSize = var12,
					TextColor3 = var11.Theme.TextDefault.Color,
					TextTransparency = transparency,
					TextXAlignment = Enum.TextXAlignment.Center,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(1, 0, 0, 24)
				}) else nil,
				PrivacyPolicy = if not var15 then reactModule.createElement(linkButton, {
					layoutOrder = 2,
					fontStyle = "CaptionBody",
					underlineAlwaysEnabled = true,
					text = var10.privacyLinkText,
					onActivated = function() --[[ line: 227 ]]
						-- upvalues: sendButtonClickEventModule (copy), var13 (ref), appScreensModule (copy), featureName (ref), openPrivacyPolicyLink (ref)
						sendButtonClickEventModule(var13, appScreensModule.IDVWithQRCodeUpsell, featureName, "OpenPrivacyPolicy")
						openPrivacyPolicyLink()
					end
				}) else nil,
				HavingTroubleInfoText = if var15 then reactModule.createElement(styledTextLabel, {
					lineHeight = 1,
					layoutOrder = 1,
					text = var10.havingTroubleInfoText,
					size = UDim2.new(1, 0, 0.5, 0),
					fontStyle = var11.Font.CaptionBody,
					colorStyle = var11.Theme.TextEmphasis,
					textTruncate = Enum.TextTruncate.AtEnd,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center
				}) else nil,
				DontCloseWindowDisclaimer = if var15 then reactModule.createElement(styledTextLabel, {
					lineHeight = 1,
					layoutOrder = 2,
					text = var10.dontCloseWindowDisclaimer,
					fontStyle = var11.Font.CaptionBody,
					size = UDim2.new(1, 0, 0.5, 0),
					colorStyle = var11.Theme.TextEmphasis,
					textTruncate = Enum.TextTruncate.AtEnd,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Center
				}) else nil
			})
		})
	})
end