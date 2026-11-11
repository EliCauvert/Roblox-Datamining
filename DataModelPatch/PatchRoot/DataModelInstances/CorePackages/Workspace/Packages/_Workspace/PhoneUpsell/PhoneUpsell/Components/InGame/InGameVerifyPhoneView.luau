local Parent = script:FindFirstAncestor("PhoneUpsell").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextField = UIBloxModule.App.Input.TextField
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local GetFFlagAddMorePhoneUpsellEventsFunction = require(Parent.SharedFlags).GetFFlagAddMorePhoneUpsellEvents

local function getButtonStackProps(Text, OnActivated, IsDisabled, Text1, OnActivated1)
	-- upvalues: ButtonType (copy)
	local Buttons = {
		{
			buttonType = ButtonType.Secondary,
			props = {
				onActivated = OnActivated,
				text = Text,
				isDisabled = IsDisabled
			}
		}
	}
	
	if OnActivated1 and Text1 and Text1 ~= "" then
		table.insert(Buttons, 1, {
			buttonType = ButtonType.Secondary,
			props = {
				isDisabled = false,
				onActivated = OnActivated1,
				text = Text1
			}
		})
	end
	return {
		buttonHeight = 48,
		forcedFillDirection = Enum.FillDirection.Horizontal,
		buttons = Buttons
	}
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), InteractiveAlert (copy), getButtonStackProps (copy), TextField (copy), GetFFlagAddMorePhoneUpsellEventsFunction (copy)
	local UseStyleResult = UseStyleFunction()
	local Tokens = UseStyleResult.Tokens
	local config = {
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
		config.extraButtonKey = p1.extraButtonKey
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local IsNotUseStateResultMatch = UseStateResult ~= 0
	
	local function _(Text: string): string
		-- upvalues: p1 (copy)
		return Text:gsub("{phoneNumber}", "+" .. p1.prefix .. p1.phoneNumber)
	end
	
	local IsNotErrorMessageMatch: boolean = p1.errorMessage and p1.errorMessage ~= ""
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.titleKey,
		screenSize = p1.screenSize,
		buttonStackInfo = getButtonStackProps(if IsNotUseStateResultMatch then UseLocalizationResult.buttonDisabledKey .. " (" .. UseStateResult .. ")" else UseLocalizationResult.buttonKey, function()
			-- upvalues: p1 (copy), UseStateResult2 (copy)
			p1.onResendPhoneCode()
			UseStateResult2(10)
			local CurrentTime = tick()
			
			local function countDown()
				-- upvalues: CurrentTime (copy), UseStateResult2 (upval), countDown (copy)
				local Value = 10 - (tick() - CurrentTime)
				
				if Value > 0 then
					UseStateResult2((math.ceil(Value)))
					task.delay(1, countDown)
					
					return
				else
					UseStateResult2(0)
				end
			end
			
			local Value = 10 - (tick() - CurrentTime)
			
			if Value > 0 then
				UseStateResult2((math.ceil(Value)))
				task.delay(1, countDown)
				
				return
			else
				UseStateResult2(0)
			end
		end, IsNotUseStateResultMatch, UseLocalizationResult.editPhoneDescriptionKey, p1.onExtraButtonClick),
		onCloseClicked = p1.onClose,
		position = p1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p1.keyboardHeight) or nil,
		anchorPoint = p1.isKeyboardShowing and Vector2.new(0.5, 1) or nil,
		middleContent = function()
			-- upvalues: ReactModule (upval), Tokens (copy), TextField (upval), p1 (copy), IsNotErrorMessageMatch (copy), GetFFlagAddMorePhoneUpsellEventsFunction (upval), UseStyleResult (copy), UseLocalizationResult (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, Tokens.Size.Size_200)
				}),
				ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, Tokens.Size.Size_200)
					}),
					TextBox = ReactModule.createElement(TextField, {
						placeholder = "",
						required = true,
						LayoutOrder = 1,
						text = p1.code,
						onChange = function(Text)
							-- upvalues: p1 (upval)
							p1.onCodeTextChange({ Text = Text })
						end,
						width = UDim.new(1, 0),
						error = IsNotErrorMessageMatch,
						textInputType = if p1.useOTPInputType then Enum.TextInputType.OneTimePassword else Enum.TextInputType.Number,
						onFocusGained = if GetFFlagAddMorePhoneUpsellEventsFunction() then p1.onCodeInputFocus else nil
					}),
					ErrorText = IsNotErrorMessageMatch and ReactModule.createElement("TextLabel", {
						TextTransparency = 0,
						TextWrapped = true,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = p1.errorMessage,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextColor3 = Tokens.Color.System.Alert.Color3,
						Font = UseStyleResult.Font.Body.Font,
						TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionSmall.RelativeSize,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					})
				}),
				BodyText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Text = UseLocalizationResult.descriptionKey:gsub("{phoneNumber}", "+" .. p1.prefix .. p1.phoneNumber),
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = UseStyleResult.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		end
	})
end