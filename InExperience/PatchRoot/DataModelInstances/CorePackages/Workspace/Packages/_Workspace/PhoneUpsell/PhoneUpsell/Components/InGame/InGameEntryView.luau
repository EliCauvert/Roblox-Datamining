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

local function getButtonStackProps(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.PrimarySystem,
			props = { onActivated = p3, text = p1, isDisabled = p4 }
		}
	}
	
	if p5 and p5 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { onActivated = p6, text = p5, isDisabled = p7 }
		})
	end
	return { buttonHeight = p2, buttons = list }
end

return function(p1)
	-- upvalues: mergePropsModule (ref), t (ref), reactModule (ref), useStyle (ref), useLocalization (ref), interactiveAlert (ref), getButtonStackProps (ref), getFFlagDisablePVUpsellDataConsent (ref), checkbox (ref), linkButton (ref)
	local var1 = mergePropsModule(t, p1)
	local var2, var3 = reactModule.useState(false)
	local t_1 = {
		phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber",
		phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic",
		termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse",
		privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy",
		titleKey = var1.titleKey,
		descriptionKey = var1.descriptionKey,
		buttonKey = var1.buttonKey,
		legalTextKey = var1.legalTextKey
	}
	
	if var1.extraButtonKey and var1.extraButtonKey ~= "" then
		t_1.extraButtonKey = var1.extraButtonKey
	end
	local var4 = useStyle()
	local baseSize = var4.Font.BaseSize
	local relativeSize = var4.Font.CaptionHeader.RelativeSize
	local size150 = var4.Tokens.Size.Size_150
	local var5 = useLocalization(t_1)
	var5.legalTextKey = var5.legalTextKey:gsub("{buttonText}", var5.buttonKey)
	
	return reactModule.createElement(interactiveAlert, {
		title = var5.titleKey,
		screenSize = var1.screenSize,
		buttonStackInfo = getButtonStackProps(var5.buttonKey, var4.Tokens.Size.Size_1200, var1.onButtonClick, var1.isButtonDisabled, var5.extraButtonKey, var1.onExtraButtonClick, var1.isExtraButtonDisabled),
		onCloseClicked = var1.onClose,
		middleContent = function()
			-- upvalues: reactModule (copy), var5 (ref), baseSize (ref), var4 (ref)
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
					Text = var5.descriptionKey,
					TextSize = baseSize,
					TextColor3 = var4.Theme.TextDefault.Color,
					TextTransparency = var4.Theme.TextDefault.Transparency,
					Font = var4.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		end,
		footerContent = if not getFFlagDisablePVUpsellDataConsent() then function()
			-- upvalues: reactModule (copy), var4 (ref), var1 (ref), size150 (ref), checkbox (copy), var3 (ref), var2 (ref), var5 (ref), baseSize (ref), relativeSize (ref), linkButton (copy)
			local frame
			local createElement = reactModule.createElement
			local var6 = "Frame"
			local t = {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}
			local t_1 = {
				ContentPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var4.Tokens.Size.Size_300) }),
				ListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, var4.Tokens.Size.Size_150)
				})
			}
			
			if var1.requireLegalTextCheckbox then
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
					LegalCheckbox = reactModule.createElement(checkbox, { label = "", onActivated = var3, isChecked = var2 }),
					LegalText = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = var5.legalTextKey,
						TextSize = baseSize * relativeSize,
						TextColor3 = var4.Theme.TextDefault.Color,
						TextTransparency = var4.Theme.TextDefault.Transparency,
						Font = var4.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -(26 + size150), 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				})
			elseif not var1.alwaysShowLegalText then
				frame = var1.countryCode.prefix == "1" and reactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = var5.legalTextKey,
					TextSize = baseSize * relativeSize,
					TextColor3 = var4.Theme.TextDefault.Color,
					TextTransparency = var4.Theme.TextDefault.Transparency,
					Font = var4.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			end
			t_1.LegalTextContainer = frame
			t_1.LegalButtonsContainer = var1.countryCode.prefix == "1" and reactModule.createElement("Frame", {
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
					text = var5.termsOfUseKey,
					onActivated = var1.onTermsOfUseClick,
					size = UDim2.fromScale(0.2, 0.2)
				}),
				TextButtonDivider = reactModule.createElement("TextLabel", {
					LayoutOrder = 6,
					BackgroundTransparency = 1,
					Text = "-",
					TextWrapped = true,
					TextSize = baseSize * relativeSize,
					TextColor3 = var4.Theme.TextDefault.Color,
					TextTransparency = var4.Theme.TextDefault.Transparency,
					Font = var4.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Center,
					AutomaticSize = Enum.AutomaticSize.XY
				}),
				PrivacyPolicyButton = reactModule.createElement(linkButton, {
					layoutOrder = 7,
					fontStyle = "CaptionBody",
					text = var5.privacyPolicyKey,
					onActivated = var1.onPrivacyPolicyClick
				})
			})
			
			return createElement(var6, t, t_1)
		end else function()
			return nil
		end
	})
end