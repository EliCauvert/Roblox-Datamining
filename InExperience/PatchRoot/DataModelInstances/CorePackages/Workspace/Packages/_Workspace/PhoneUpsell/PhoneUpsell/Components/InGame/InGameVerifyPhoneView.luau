local parent = script:FindFirstAncestor("PhoneUpsell").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textField = UIBloxModule.App.Input.TextField
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local getFFlagAddMorePhoneUpsellEvents = require(parent.SharedFlags).GetFFlagAddMorePhoneUpsellEvents

local function getButtonStackProps(p1, p2, p3, p4, p5)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.Secondary,
			props = { onActivated = p2, text = p1, isDisabled = p3 }
		}
	}
	
	if p5 and p4 and p4 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { isDisabled = false, onActivated = p5, text = p4 }
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Horizontal,
		buttons = list
	}
end

return function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), interactiveAlert (ref), getButtonStackProps (ref), textField (ref), getFFlagAddMorePhoneUpsellEvents (ref)
	local var1 = useStyle()
	local tokens = var1.Tokens
	local t = {
		titleKey = "Feature.VerificationUpsell.Heading.VerifyYourPhone",
		verificationCodeKey = "Feature.VerificationUpsell.Heading.VerificationCode",
		placeholderKey = "Feature.VerificationUpsell.Label.SixDigitCode",
		descriptionKey = "Feature.VerificationUpsell.Label.EnterCode",
		buttonKey = "Feature.VerificationUpsell.Action.ResendCode",
		buttonDisabledKey = "Feature.VerificationUpsell.Action.CodeResent",
		changePhoneNumberKey = "Feature.VerificationUpsell.Action.ChangePhoneNumber",
		editPhoneDescriptionKey = "Feature.VerificationUpsell.Action.EditPhoneNumber"
	}
	
	if p1.extraButtonKey and p1.extraButtonKey ~= "" then
		t.extraButtonKey = p1.extraButtonKey
	end
	local var2 = useLocalization(t)
	local var3, var4 = reactModule.useState(0)
	local var5 = var3 ~= 0
	
	local function _(p2)
		-- upvalues: p1 (ref)
		return p2:gsub("{phoneNumber}", "+" .. p5.prefix .. p5.phoneNumber)
	end
	
	local var6 = p1.errorMessage and p1.errorMessage ~= ""
	
	return reactModule.createElement(interactiveAlert, {
		title = var2.titleKey,
		screenSize = p1.screenSize,
		buttonStackInfo = getButtonStackProps(if var5 then var2.buttonDisabledKey .. " (" .. var7 .. ")" else var2.buttonKey, function()
			-- upvalues: p1 (ref), var4 (ref)
			p1.onResendPhoneCode()
			var4(10)
			local currentTime = tick()
			
			local function countDown()
				-- upvalues: currentTime (ref), var4 (copy), countDown (ref)
				local var7 = 10 - (tick() - currentTime)
				
				if var7 > 0 then
					var4(math.ceil(var7))
					task.delay(1, countDown)
					
					return
				end
				var4(0)
			end
			
			local var7 = 10 - (tick() - currentTime)
			
			if var7 > 0 then
				var4(math.ceil(var7))
				task.delay(1, countDown)
				
				return
			end
			var4(0)
		end, var5, var2.editPhoneDescriptionKey, p1.onExtraButtonClick),
		onCloseClicked = p1.onClose,
		position = p1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p1.keyboardHeight) or nil,
		anchorPoint = p1.isKeyboardShowing and Vector2.new(0.5, 1) or nil,
		middleContent = function()
			-- upvalues: reactModule (copy), tokens (ref), textField (copy), p1 (ref), var6 (ref), getFFlagAddMorePhoneUpsellEvents (copy), var1 (ref), var2 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				ListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, tokens.Size.Size_200)
				}),
				reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, tokens.Size.Size_200)
					}),
					TextBox = reactModule.createElement(textField, {
						placeholder = "",
						required = true,
						LayoutOrder = 1,
						text = p1.code,
						onChange = function(p2)
							-- upvalues: p1 (copy)
							p1.onCodeTextChange({ Text = p2 })
						end,
						width = UDim.new(1, 0),
						error = var6,
						textInputType = if p1.useOTPInputType then Enum.TextInputType.OneTimePassword else Enum.TextInputType.Number,
						onFocusGained = if getFFlagAddMorePhoneUpsellEvents() then p1.onCodeInputFocus else nil
					}),
					ErrorText = var6 and reactModule.createElement("TextLabel", {
						TextTransparency = 0,
						TextWrapped = true,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = p1.errorMessage,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextColor3 = tokens.Color.System.Alert.Color3,
						Font = var1.Font.Body.Font,
						TextSize = var1.Font.BaseSize * var1.Font.CaptionSmall.RelativeSize,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				}),
				BodyText = reactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = var2.descriptionKey:gsub("{phoneNumber}", "+" .. p5.prefix .. p5.phoneNumber),
					TextSize = var1.Font.BaseSize * var1.Font.CaptionHeader.RelativeSize,
					TextColor3 = var1.Theme.TextDefault.Color,
					TextTransparency = var1.Theme.TextDefault.Transparency,
					Font = var1.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		end
	})
end