local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local checkbox = require(parent.Foundation).Checkbox
local useStyle = UIBloxModule.Core.Style.useStyle
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local mergePropsModule = require(phoneUpsell.Utils.mergeProps)
local linkButton = UIBloxModule.App.Button.LinkButton
local getFFlagDisablePVUpsellDataConsent = require(parent.SharedFlags).GetFFlagDisablePVUpsellDataConsent

local function noOp() end

local t = {
	isButtonDisabled = false,
	isExtraButtonDisabled = false,
	alwaysShowLegalText = false,
	requireLegalTextCheckbox = false,
	legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA",
	prefix = "1",
	onClose = noOp,
	onExtraButtonClick = noOp
}

local function getButtonStackProps(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p2, text = p0, isDisabled = p3 }
		}
	}
	
	if p4 and p4 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { onActivated = p5, text = p4, isDisabled = p6 }
		})
	end
	return { buttonHeight = p1, buttons = list }
end

return function(p7)
	-- upvalues: mergePropsModule (ref), t (ref), reactModule (ref), useStyle (ref), useLocalization (ref), interactiveAlert (ref), getButtonStackProps (ref), getFFlagDisablePVUpsellDataConsent (ref), checkbox (ref), linkButton (ref)
	local var8 = mergePropsModule(t, p7)
	local var9, var10 = reactModule.useState(false)
	local t_1 = {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = var8.titleKey,
		descriptionKey = var8.descriptionKey,
		buttonKey = var8.buttonKey,
		legalTextKey = var8.legalTextKey
	}
	
	if var8.extraButtonKey and var8.extraButtonKey ~= "" then
		t_1.extraButtonKey = var8.extraButtonKey
	end
	local var12 = useStyle()
	local baseSize = var12.Font.BaseSize
	local relativeSize = var12.Font.CaptionHeader.RelativeSize
	local size150 = var12.Tokens.Size.Size_150
	local var13 = useLocalization(t_1)
	var13.legalTextKey = var13.legalTextKey:gsub("{buttonText}", var13.buttonKey)
	
	return reactModule.createElement(interactiveAlert, {
		title = var13.titleKey,
		screenSize = var8.screenSize,
		buttonStackInfo = getButtonStackProps(var13.buttonKey, var12.Tokens.Size.Size_1200, var8.onButtonClick, var8.isButtonDisabled, var13.extraButtonKey, var8.onExtraButtonClick, var8.isExtraButtonDisabled),
		onCloseClicked = var8.onClose,
		middleContent = function()
			-- upvalues: reactModule (copy), var13 (ref), baseSize (ref), var12 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				BodyText = reactModule.createElement("TextLabel", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					RichText = true,
					Text = var13.descriptionKey,
					TextSize = baseSize,
					TextColor3 = var12.Theme.TextDefault.Color,
					TextTransparency = var12.Theme.TextDefault.Transparency,
					Font = var12.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		end,
		footerContent = if not getFFlagDisablePVUpsellDataConsent() then function()
			-- upvalues: reactModule (copy), var12 (ref), var8 (ref), size150 (ref), checkbox (copy), var10 (ref), var9 (ref), var13 (ref), baseSize (ref), relativeSize (ref), linkButton (copy)
			local frame
			local createElement = reactModule.createElement
			local var14 = "Frame"
			local t = {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}
			local t_1 = {
				ContentPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var12.Tokens.Size.Size_300) }),
				ListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, var12.Tokens.Size.Size_150)
				})
			}
			
			if var8.requireLegalTextCheckbox then
				frame = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, size150)
					}),
					LegalCheckbox = reactModule.createElement(checkbox, { label = "", onActivated = var10, isChecked = var9 }),
					LegalText = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = var13.legalTextKey,
						TextSize = baseSize * relativeSize,
						TextColor3 = var12.Theme.TextDefault.Color,
						TextTransparency = var12.Theme.TextDefault.Transparency,
						Font = var12.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -(26 + size150), 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				})
			elseif not var8.alwaysShowLegalText then
				frame = var8.countryCode.prefix == "1" and reactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = var13.legalTextKey,
					TextSize = baseSize * relativeSize,
					TextColor3 = var12.Theme.TextDefault.Color,
					TextTransparency = var12.Theme.TextDefault.Transparency,
					Font = var12.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			end
			t_1.LegalTextContainer = frame
			t_1.LegalButtonsContainer = var8.countryCode.prefix == "1" and reactModule.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 5)
				}),
				TermsOfUseButton = reactModule.createElement(linkButton, {
					layoutOrder = 5,
					fontStyle = "CaptionBody",
					text = var13.termsOfUseKey,
					onActivated = var8.onTermsOfUseClick,
					size = UDim2.fromScale(0.2, 0.2)
				}),
				TextButtonDivider = reactModule.createElement("TextLabel", {
					LayoutOrder = 6,
					BackgroundTransparency = 1,
					Text = "-",
					TextWrapped = true,
					TextSize = baseSize * relativeSize,
					TextColor3 = var12.Theme.TextDefault.Color,
					TextTransparency = var12.Theme.TextDefault.Transparency,
					Font = var12.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Center,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				PrivacyPolicyButton = reactModule.createElement(linkButton, {
					layoutOrder = 7,
					fontStyle = "CaptionBody",
					text = var13.privacyPolicyKey,
					onActivated = var8.onPrivacyPolicyClick
				})
			})
			
			return createElement(var14, t, t_1)
		end else function()
			return nil
		end
	})
end