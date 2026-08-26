local phoneUpsell = script:FindFirstAncestor("PhoneUpsell")
local parent = phoneUpsell.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local textInputBoxWithBorder = require(parent.AuthCommon).Components.TextInputBoxWithBorder
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local getPartialPageModalMiddleContentWidth = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local linkButton = UIBloxModule.App.Button.LinkButton
local getFFlagDisableVerifyPhoneViewOnSuccessModule = require(phoneUpsell.Flags.GetFFlagDisableVerifyPhoneViewOnSuccess)

return function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), buttonType (ref), getFFlagDisableVerifyPhoneViewOnSuccessModule (ref), getPartialPageModalMiddleContentWidth (ref), partialPageModal (ref), textInputBoxWithBorder (ref), linkButton (ref)
	local var1 = useStyle()
	local t = {
		titleKey = "Feature.VerificationUpsell.Heading.VerifyYourPhone",
		verificationCodeKey = "Feature.VerificationUpsell.Heading.VerificationCode",
		placeholderKey = "Feature.VerificationUpsell.Label.SixDigitCode",
		descriptionKey = "Feature.VerificationUpsell.Label.EnterCode",
		buttonKey = "Feature.VerificationUpsell.Action.ResendCode",
		buttonDisabledKey = "Feature.VerificationUpsell.Action.CodeResent",
		changePhoneNumberKey = "Feature.VerificationUpsell.Action.ChangePhoneNumber"
	}
	
	if p1.extraButtonKey and p1.extraButtonKey ~= "" then
		t.extraButtonKey = p1.extraButtonKey
	end
	local var2 = useLocalization(t)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(0)
	
	local function _(p2)
		-- upvalues: p1 (ref)
		return p2:gsub("{phoneNumber}", "+" .. p0.prefix .. p0.phoneNumber)
	end
	
	return reactModule.createElement(partialPageModal, {
		title = var2.titleKey,
		screenSize = p1.screenSize,
		buttonStackProps = (function(p2, p3, p4, p5, p6, p7)
			-- upvalues: var4 (ref), var6 (ref), var3 (ref), var5 (ref), buttonType (copy), getFFlagDisableVerifyPhoneViewOnSuccessModule (copy), p1 (ref)
			local function _()
				-- upvalues: var3 (copy), p3 (ref), var5 (copy), p2 (ref)
				return if var3 then p3 .. " (" .. var9 .. ")" else p2
			end
			
			local list = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = function()
							-- upvalues: p5 (ref), var4 (copy), var6 (copy), p4 (ref)
							p5()
							var4(true)
							var6(p4)
							local currentTime = tick()
							
							local function countDown()
								-- upvalues: currentTime (ref), p4 (copy), var6 (copy), countDown (ref), var4 (copy)
								local var7 = p4 - (tick() - currentTime)
								
								if var7 > 0 then
									var6(math.round(var7))
									task.delay(1, countDown)
									
									return
								end
								var6(0)
								var4(false)
							end
							
							countDown()
						end,
						text = if var3 then p3 .. " (" .. var9 .. ")" else p2,
						isDisabled = var3 or getFFlagDisableVerifyPhoneViewOnSuccessModule() and p1.isDisabled
					}
				}
			}
			
			if p7 and p6 and p6 ~= "" then
				table.insert(list, 1, {
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p7,
						text = p6,
						isDisabled = getFFlagDisableVerifyPhoneViewOnSuccessModule() and p1.isDisabled
					}
				})
			end
			return {
				buttonHeight = 48,
				forcedFillDirection = Enum.FillDirection.Vertical,
				buttons = list
			}
		end)(var2.buttonKey, var2.buttonDisabledKey, 10, p1.onResendPhoneCode, var2.extraButtonKey, p1.onExtraButtonClick),
		onCloseClicked = p1.onClose,
		position = p1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p1.keyboardHeight) or nil,
		anchorPoint = p1.isKeyboardShowing and Vector2.new(0.5, 1) or nil
	}, {
		Middle = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ContentPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			ListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 12)
			}),
			BodyText = reactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = var2.descriptionKey:gsub("{phoneNumber}", "+" .. p0.prefix .. p0.phoneNumber),
				TextSize = var1.Font.BaseSize,
				TextColor3 = var1.Theme.TextDefault.Color,
				TextTransparency = var1.Theme.TextDefault.Transparency,
				Font = var1.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, getPartialPageModalMiddleContentWidth(p1.screenSize.X), 0, 0)
			}),
			TextBox = reactModule.createElement(textInputBoxWithBorder, {
				textInputHeight = 36,
				layoutOrder = 2,
				maxLength = 6,
				text = p1.code,
				textInputType = if p1.useOTPInputType then Enum.TextInputType.OneTimePassword else Enum.TextInputType.Number,
				placeholderText = var2.placeholderKey,
				errorText = p1.errorMessage,
				onChangeTextCallback = p1.onCodeTextChange,
				Size = UDim2.new(1, 0, 0, 0),
				onFocused = p1.onCodeInputFocus
			}),
			ChangePhoneButton = reactModule.createElement(linkButton, {
				layoutOrder = 3,
				fontStyle = "CaptionBody",
				minPaddingX = 0,
				minPaddingY = 0,
				text = var2.changePhoneNumberKey,
				onActivated = p1.returnToAddPhone
			})
		})
	})
end