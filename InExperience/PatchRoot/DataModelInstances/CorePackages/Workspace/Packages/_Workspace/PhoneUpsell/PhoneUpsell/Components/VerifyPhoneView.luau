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

return function(p0) --[[ line: 43 | named "VerifyPhoneView" ]]
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), buttonType (ref), getFFlagDisableVerifyPhoneViewOnSuccessModule (ref), getPartialPageModalMiddleContentWidth (ref), partialPageModal (ref), textInputBoxWithBorder (ref), linkButton (ref)
	local var4 = useStyle()
	local t = {
		titleKey = "Feature.VerificationUpsell.Heading.VerifyYourPhone",
		verificationCodeKey = "Feature.VerificationUpsell.Heading.VerificationCode",
		placeholderKey = "Feature.VerificationUpsell.Label.SixDigitCode",
		descriptionKey = "Feature.VerificationUpsell.Label.EnterCode",
		buttonKey = "Feature.VerificationUpsell.Action.ResendCode",
		buttonDisabledKey = "Feature.VerificationUpsell.Action.CodeResent",
		changePhoneNumberKey = "Feature.VerificationUpsell.Action.ChangePhoneNumber"
	}
	
	if p0.extraButtonKey and p0.extraButtonKey ~= "" then
		t.extraButtonKey = p0.extraButtonKey
	end
	local var6 = useLocalization(t)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(0)
	
	local function _(p1) --[[ line: 131 | named "getBodyText" ]]
		-- upvalues: p0 (ref)
		return p1:gsub("{phoneNumber}", "+" .. p0.prefix .. p0.phoneNumber)
	end
	
	return reactModule.createElement(partialPageModal, {
		title = var6.titleKey,
		screenSize = p0.screenSize,
		buttonStackProps = (function(p2, p3, p4, p5, p6, p7) --[[ line: 63 | named "getButtonStackProps" ]]
			-- upvalues: var8 (ref), var10 (ref), var7 (ref), var9 (ref), buttonType (copy), getFFlagDisableVerifyPhoneViewOnSuccessModule (copy), p0 (ref)
			local function _() --[[ line: 92 | named "getButtonText" ]]
				-- upvalues: var7 (copy), p3 (ref), var9 (copy), p2 (ref)
				return if var7 then p3 .. " (" .. var9 .. ")" else p2
			end
			
			local list = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = function() --[[ line: 71 ]]
							-- upvalues: p5 (ref), var8 (copy), var10 (copy), p4 (ref)
							p5()
							var8(true)
							var10(p4)
							local currentTime = tick()
							
							local function countDown() --[[ line: 77 ]]
								-- upvalues: currentTime (ref), p4 (copy), var10 (copy), countDown (ref), var8 (copy)
								local var14 = p4 - (tick() - currentTime)
								
								if var14 > 0 then
									var10(math.round(var14))
									task.delay(1, countDown)
									
									return
								end
								var10(0)
								var8(false)
							end
							
							countDown()
						end,
						text = if var7 then p3 .. " (" .. var9 .. ")" else p2,
						isDisabled = var7 or getFFlagDisableVerifyPhoneViewOnSuccessModule() and p0.isDisabled
					}
				}
			}
			
			if p7 and p6 and p6 ~= "" then
				table.insert(list, 1, {
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p7,
						text = p6,
						isDisabled = getFFlagDisableVerifyPhoneViewOnSuccessModule() and p0.isDisabled
					}
				})
			end
			return {
				buttonHeight = 48,
				forcedFillDirection = Enum.FillDirection.Vertical,
				buttons = list
			}
		end)(var6.buttonKey, var6.buttonDisabledKey, 10, p0.onResendPhoneCode, var6.extraButtonKey, p0.onExtraButtonClick),
		onCloseClicked = p0.onClose,
		position = p0.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p0.keyboardHeight) or nil,
		anchorPoint = p0.isKeyboardShowing and Vector2.new(0.5, 1) or nil
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
				Text = var6.descriptionKey:gsub("{phoneNumber}", "+" .. p0.prefix .. p0.phoneNumber),
				TextSize = var4.Font.BaseSize,
				TextColor3 = var4.Theme.TextDefault.Color,
				TextTransparency = var4.Theme.TextDefault.Transparency,
				Font = var4.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, getPartialPageModalMiddleContentWidth(p0.screenSize.X), 0, 0)
			}),
			TextBox = reactModule.createElement(textInputBoxWithBorder, {
				textInputHeight = 36,
				layoutOrder = 2,
				maxLength = 6,
				text = p0.code,
				textInputType = if p0.useOTPInputType then Enum.TextInputType.OneTimePassword else Enum.TextInputType.Number,
				placeholderText = var6.placeholderKey,
				errorText = p0.errorMessage,
				onChangeTextCallback = p0.onCodeTextChange,
				Size = UDim2.new(1, 0, 0, 0),
				onFocused = p0.onCodeInputFocus
			}),
			ChangePhoneButton = reactModule.createElement(linkButton, {
				layoutOrder = 3,
				fontStyle = "CaptionBody",
				minPaddingX = 0,
				minPaddingY = 0,
				text = var6.changePhoneNumberKey,
				onActivated = p0.returnToAddPhone
			})
		})
	})
end