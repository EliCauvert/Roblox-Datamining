local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local analyticsServiceModule = require(ampUpsell.Analytics.AnalyticsService)
local sendButtonClickEventModule = require(ampUpsell.Analytics.sendButtonClickEvent)
local appScreensModule = require(ampUpsell.Common.AppScreens)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local useStyle = UIBloxModule.Core.Style.useStyle
local linkButton = UIBloxModule.App.Button.LinkButton
local idvWithQRCodeUpsellStrings = require(ampUpsell.Common.LocalizationStrings).idvWithQRCodeUpsellStrings
local directionsTileModule = require(script.Parent.DirectionsTile)
local progressChecklistModule = require(script.Parent.ProgressChecklist)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useLocalization (ref), idvWithQRCodeUpsellStrings (ref), useStyle (ref), analyticsServiceModule (ref), useSelector (ref), reactModule (ref), partialPageModal (ref), sendButtonClickEventModule (ref), appScreensModule (ref), buttonType (ref), directionsTileModule (ref), progressChecklistModule (ref), roactModule (ref), linkButton (ref)
	local featureName = p1.featureName
	local var1 = useLocalization(idvWithQRCodeUpsellStrings)
	local var2 = useStyle()
	local onClose = p1.onClose
	local openPrivacyPolicyLink = p1.openPrivacyPolicyLink
	local font = var2.Font.Body.Font
	local transparency = var2.Theme.TextEmphasis.Transparency
	local var3 = var2.Font.BaseSize * var2.Font.CaptionBody.RelativeSize
	local analyticsService = p1.analyticsService or analyticsServiceModule.EventStream
	local idvLink = p1.idvLink
	local latestStepCompleted = p1.latestStepCompleted
	local openIdvLink = p1.openIdvLink
	
	return reactModule.createElement(partialPageModal, {
		title = var1.title,
		screenSize = useSelector(function(p2)
			return p2.ScreenSize
		end),
		onCloseClicked = reactModule.useCallback(function()
			-- upvalues: sendButtonClickEventModule (copy), analyticsService (ref), appScreensModule (copy), featureName (ref), onClose (ref)
			sendButtonClickEventModule(analyticsService, appScreensModule.IDVDirectLinkUpsell, featureName, "CloseModal")
			onClose()
		end, { analyticsService, featureName }),
		buttonStackProps = {
			buttonHeight = 36,
			forcedFillDirection = Enum.FillDirection.Vertical,
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						isDisabled = false,
						onActivated = reactModule.useCallback(function()
							-- upvalues: sendButtonClickEventModule (copy), analyticsService (ref), appScreensModule (copy), featureName (ref), onClose (ref)
							sendButtonClickEventModule(analyticsService, appScreensModule.IDVDirectLinkUpsell, featureName, "CloseModal")
							onClose()
						end, { analyticsService, featureName }),
						text = var1.cancel
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = reactModule.useCallback(function()
							-- upvalues: idvLink (ref), sendButtonClickEventModule (copy), analyticsService (ref), appScreensModule (copy), featureName (ref), openIdvLink (ref)
							if idvLink ~= nil then
								sendButtonClickEventModule(analyticsService, appScreensModule.IDVDirectLinkUpsell, featureName, "OpenIdvLink")
								openIdvLink(idvLink)
							end
						end, { openIdvLink, idvLink, analyticsService, featureName }),
						text = var1.startVerification
					}
				}
			}
		}
	}, {
		DirectLinkViewFrame = reactModule.createElement("Frame", {
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
			DirectionsFrameOrProgressChecklist = if not (latestStepCompleted > 0) then reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 72),
				BackgroundColor3 = var2.Theme.BackgroundContrast.Color
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
				IDDirection = reactModule.createElement(directionsTileModule, {
					imagePath = "icons/menu/document",
					frameHeight = 48,
					headerText = var1.idDirectionsHeader,
					descriptionText = var1.idDirectionsBody
				})
			}) else reactModule.createElement(progressChecklistModule, {
				entryHeight = 18,
				layoutOrder = 1,
				latestStepCompleted = latestStepCompleted
			}),
			DisclaimerFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 100)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				Disclaimer = reactModule.createElement("TextLabel", {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Text = var1.disclaimer,
					Font = font,
					TextSize = var3,
					TextColor3 = var2.Theme.TextDefault.Color,
					TextTransparency = transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				PrivacyPolicy = roactModule.createElement(linkButton, {
					layoutOrder = 2,
					fontStyle = "CaptionBody",
					underlineAlwaysEnabled = true,
					text = var1.privacyLinkText,
					onActivated = function()
						-- upvalues: sendButtonClickEventModule (copy), analyticsService (ref), appScreensModule (copy), featureName (ref), openPrivacyPolicyLink (ref)
						sendButtonClickEventModule(analyticsService, appScreensModule.IDVDirectLinkUpsell, featureName, "OpenPrivacyPolicy")
						openPrivacyPolicyLink()
					end
				})
			})
		})
	})
end