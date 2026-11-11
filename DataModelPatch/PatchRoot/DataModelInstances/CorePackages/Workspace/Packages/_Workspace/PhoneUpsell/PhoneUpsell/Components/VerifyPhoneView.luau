local PhoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local Parent = PhoneUpsell.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local TextInputBoxWithBorder = require(Parent.AuthCommon).Components.TextInputBoxWithBorder
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local LinkButton = UIBloxModule.App.Button.LinkButton
local GetFFlagDisableVerifyPhoneViewOnSuccessModule = require(PhoneUpsell.Flags.GetFFlagDisableVerifyPhoneViewOnSuccess)
local FFlagPhoneUpsellEnforceCodeInputLimit = require(Parent.SharedFlags).FFlagPhoneUpsellEnforceCodeInputLimit

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ButtonType (copy), GetFFlagDisableVerifyPhoneViewOnSuccessModule (copy), GetPartialPageModalMiddleContentWidthFunction (copy), PartialPageModal (copy), TextInputBoxWithBorder (copy), FFlagPhoneUpsellEnforceCodeInputLimit (copy), LinkButton (copy)
	local UseStyleResult = UseStyleFunction()
	local config = {
		titleKey = "Feature.VerificationUpsell.Heading.VerifyYourPhone",
		verificationCodeKey = "Feature.VerificationUpsell.Heading.VerificationCode",
		placeholderKey = "Feature.VerificationUpsell.Label.SixDigitCode",
		descriptionKey = "Feature.VerificationUpsell.Label.EnterCode",
		buttonKey = "Feature.VerificationUpsell.Action.ResendCode",
		buttonDisabledKey = "Feature.VerificationUpsell.Action.CodeResent",
		changePhoneNumberKey = "Feature.VerificationUpsell.Action.ChangePhoneNumber"
	}
	
	if p1.extraButtonKey and p1.extraButtonKey ~= "" then
		config.extraButtonKey = p1.extraButtonKey
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	
	local function _(Text: string): string
		-- upvalues: p1 (copy)
		return Text:gsub("{phoneNumber}", "+" .. p1.prefix .. p1.phoneNumber)
	end
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.titleKey,
		screenSize = p1.screenSize,
		buttonStackProps = (function(p2, Text, p3, Callback, Text1, OnActivated)
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult (copy), UseStateResult1 (copy), ButtonType (upval), GetFFlagDisableVerifyPhoneViewOnSuccessModule (upval), p1 (copy)
			local function _()
				-- upvalues: UseStateResult (upval), Text (copy), UseStateResult1 (upval), p2 (copy)
				return if UseStateResult then Text .. " (" .. UseStateResult1 .. ")" else p2
			end
			
			local Buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = function()
							-- upvalues: Callback (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), p3 (copy)
							Callback()
							UseStateResult2(true)
							UseStateResult2_1(p3)
							local CurrentTime = tick()
							
							local function countDown()
								-- upvalues: CurrentTime (copy), p3 (upval), UseStateResult2_1 (upval), countDown (copy), UseStateResult2 (upval)
								local Value = p3 - (tick() - CurrentTime)
								
								if Value > 0 then
									UseStateResult2_1((math.round(Value)))
									task.delay(1, countDown)
									
									return
								else
									UseStateResult2_1(0)
									UseStateResult2(false)
								end
							end
							
							countDown()
						end,
						text = if UseStateResult then Text .. " (" .. UseStateResult1 .. ")" else p2,
						isDisabled = UseStateResult or GetFFlagDisableVerifyPhoneViewOnSuccessModule() and p1.isDisabled
					}
				}
			}
			
			if OnActivated and Text1 and Text1 ~= "" then
				table.insert(Buttons, 1, {
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = OnActivated,
						text = Text1,
						isDisabled = GetFFlagDisableVerifyPhoneViewOnSuccessModule() and p1.isDisabled
					}
				})
			end
			return {
				buttonHeight = 48,
				forcedFillDirection = Enum.FillDirection.Vertical,
				buttons = Buttons
			}
		end)(UseLocalizationResult.buttonKey, UseLocalizationResult.buttonDisabledKey, 10, p1.onResendPhoneCode, UseLocalizationResult.extraButtonKey, p1.onExtraButtonClick),
		onCloseClicked = p1.onClose,
		position = p1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p1.keyboardHeight) or nil,
		anchorPoint = p1.isKeyboardShowing and Vector2.new(0.5, 1) or nil
	}, {
		Middle = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ContentPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 12)
			}),
			BodyText = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = UseLocalizationResult.descriptionKey:gsub("{phoneNumber}", "+" .. p1.prefix .. p1.phoneNumber),
				TextSize = UseStyleResult.Font.BaseSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = UseStyleResult.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, GetPartialPageModalMiddleContentWidthFunction(p1.screenSize.X), 0, 0)
			}),
			TextBox = ReactModule.createElement(TextInputBoxWithBorder, {
				textInputHeight = 36,
				layoutOrder = 2,
				text = p1.code,
				textInputType = p1.useOTPInputType and Enum.TextInputType.OneTimePassword or Enum.TextInputType.Number,
				placeholderText = UseLocalizationResult.placeholderKey,
				errorText = p1.errorMessage,
				onChangeTextCallback = p1.onCodeTextChange,
				Size = UDim2.new(1, 0, 0, 0),
				onFocused = p1.onCodeInputFocus,
				maxLength = if FFlagPhoneUpsellEnforceCodeInputLimit then 6 else nil
			}),
			ChangePhoneButton = ReactModule.createElement(LinkButton, {
				layoutOrder = 3,
				fontStyle = "CaptionBody",
				minPaddingX = 0,
				minPaddingY = 0,
				text = UseLocalizationResult.changePhoneNumberKey,
				onActivated = p1.returnToAddPhone
			})
		})
	})
end