local parent = script:FindFirstAncestor("PhoneUpsell").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textField = UIBloxModule.App.Input.TextField
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local getFFlagAddMorePhoneUpsellEvents = require(parent.SharedFlags).GetFFlagAddMorePhoneUpsellEvents

local function getButtonStackProps(p0, p1, p2, p3, p4)
	-- upvalues: buttonType (ref)
	local list = {
		{
			buttonType = buttonType.Secondary,
			props = { onActivated = p1, text = p0, isDisabled = p2 }
		}
	}
	
	if p4 and p3 and p3 ~= "" then
		table.insert(list, 1, {
			buttonType = buttonType.Secondary,
			props = { isDisabled = false, onActivated = p4, text = p3 }
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Horizontal,
		buttons = list
	}
end

return function(p5)
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), interactiveAlert (ref), getButtonStackProps (ref), textField (ref), getFFlagAddMorePhoneUpsellEvents (ref)
	local var4 = useStyle()
	local tokens = var4.Tokens
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
	
	if p5.extraButtonKey and p5.extraButtonKey ~= "" then
		t.extraButtonKey = p5.extraButtonKey
	end
	local var6 = useLocalization(t)
	local var7, var8 = reactModule.useState(0)
	local var9 = var7 ~= 0
	
	local function _(p6)
		-- upvalues: p5 (ref)
		return p6:gsub("{phoneNumber}", "+" .. p5.prefix .. p5.phoneNumber)
	end
	
	local var10 = p5.errorMessage and p5.errorMessage ~= ""
	
	return reactModule.createElement(interactiveAlert, {
		title = var6.titleKey,
		screenSize = p5.screenSize,
		buttonStackInfo = getButtonStackProps(if var9 then var6.buttonDisabledKey .. " (" .. var7 .. ")" else var6.buttonKey, function()
			-- upvalues: p5 (ref), var8 (ref)
			p5.onResendPhoneCode()
			var8(10)
			local currentTime = tick()
			
			local function countDown()
				-- upvalues: currentTime (ref), var8 (copy), countDown (ref)
				local var14 = 10 - (tick() - currentTime)
				
				if var14 > 0 then
					var8(math.ceil(var14))
					task.delay(1, countDown)
					
					return
				end
				var8(0)
			end
			
			local var13 = 10 - (tick() - currentTime)
			
			if var13 > 0 then
				var8(math.ceil(var13))
				task.delay(1, countDown)
				
				return
			end
			var8(0)
		end, var9, var6.editPhoneDescriptionKey, p5.onExtraButtonClick),
		onCloseClicked = p5.onClose,
		position = p5.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p5.keyboardHeight) or nil,
		anchorPoint = p5.isKeyboardShowing and Vector2.new(0.5, 1) or nil,
		middleContent = function()
			-- upvalues: reactModule (copy), tokens (ref), textField (copy), p5 (ref), var10 (ref), getFFlagAddMorePhoneUpsellEvents (copy), var4 (ref), var6 (ref)
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
						text = p5.code,
						onChange = function(p7)
							-- upvalues: p5 (copy)
							p5.onCodeTextChange({ Text = p7 })
						end,
						width = UDim.new(1, 0),
						error = var10,
						textInputType = if p5.useOTPInputType then Enum.TextInputType.OneTimePassword else Enum.TextInputType.Number,
						onFocusGained = if getFFlagAddMorePhoneUpsellEvents() then p5.onCodeInputFocus else nil
					}),
					ErrorText = var10 and reactModule.createElement("TextLabel", {
						TextTransparency = 0,
						TextWrapped = true,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = p5.errorMessage,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextColor3 = tokens.Color.System.Alert.Color3,
						Font = var4.Font.Body.Font,
						TextSize = var4.Font.BaseSize * var4.Font.CaptionSmall.RelativeSize,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				}),
				BodyText = reactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = var6.descriptionKey:gsub("{phoneNumber}", "+" .. p5.prefix .. p5.phoneNumber),
					TextSize = var4.Font.BaseSize * var4.Font.CaptionHeader.RelativeSize,
					TextColor3 = var4.Theme.TextDefault.Color,
					TextTransparency = var4.Theme.TextDefault.Transparency,
					Font = var4.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		end
	})
end