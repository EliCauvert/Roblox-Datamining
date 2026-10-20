local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Checkbox = DependenciesModule.Foundation.Checkbox
local UseStyleFunction = UIBlox.Core.Style.useStyle
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBlox.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local LinkButton = UIBlox.App.Button.LinkButton
local DebounceModule = require(Parent.Utils.debounce)
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local UseDesignTokensFunction = DependenciesModule.Style.useDesignTokens
local UseStateFunction = React.useState
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)
local OtpLoginConstantsModule = require(Parent.Common.otpLoginConstants)
local InputFieldModule = require(script.Parent.InputField)
local EnableKoreaKISAComplianceModularized = game:DefineFastFlag("EnableKoreaKISAComplianceModularized", false)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), GetPartialPageModalMiddleContentWidthFunction (copy), React (copy), OtpLoginConstantsModule (copy), UseLocalizationFunction (copy), UseStateFunction (copy), ButtonType (copy), DebounceModule (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), LinkButton (copy), EnableKoreaKISAComplianceModularized (copy), PartialPageModal (copy), Checkbox (copy), InputFieldModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local PartialPageModalMiddleContentWidth: number = GetPartialPageModalMiddleContentWidthFunction(p1.screenSize.X)
	local UseStateResult, UseStateResult2 = React.useState(true)
	local UseStateResult1, UseStateResult2_1 = React.useState(OtpLoginConstantsModule.DEFAULT_TIMER_COOLDOWN)
	local UseLocalizationResult = UseLocalizationFunction({
		placeholderKey = "Authentication.OneTimePasscode.Label.SixDigitCode",
		buttonKey = "Authentication.OneTimePasscode.Action.Resend",
		buttonDisabledKey = "Authentication.OneTimePasscode.Label.CodeSent",
		footerDescriptionKey = "Authentication.OneTimePasscode.Description.DidntReceiveCode",
		changeEmailKey = "Authentication.OneTimePasscode.Action.ChangeEmailV2",
		helpButtonKey = "Authentication.OneTimePasscode.Action.GetHelp",
		complianceCheckboxMessageKey = p1.complianceCheckboxMessageKey
	})
	local UseStateResult3, UseStateResult2_2 = UseStateFunction("")
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(false)
	
	local function _(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(p2)
	end
	
	local function countDown(CurrentTime, DEFAULTTIMERCOOLDOWN)
		-- upvalues: UseStateResult2_1 (copy), countDown (copy), UseStateResult2 (copy)
		local Value = DEFAULTTIMERCOOLDOWN - (tick() - CurrentTime)
		
		if Value > 0 then
			UseStateResult2_1((math.round(Value)))
			task.delay(1, function()
				-- upvalues: countDown (upval), CurrentTime (copy), DEFAULTTIMERCOOLDOWN (copy)
				countDown(CurrentTime, DEFAULTTIMERCOOLDOWN)
			end)
			
			return
		else
			UseStateResult2_1(0)
			UseStateResult2(false)
		end
	end
	
	local function getButtonStackProps(ButtonKey, ButtonDisabledKey, DEFAULTTIMERCOOLDOWN, Callback)
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), countDown (copy), UseStateResult (copy), UseStateResult1 (copy), ButtonType (upval), p1 (copy), UseDesignTokensResult (copy)
		local function _()
			-- upvalues: UseStateResult (upval), ButtonDisabledKey (copy), UseStateResult1 (upval), ButtonKey (copy)
			return if UseStateResult then ButtonDisabledKey .. " (" .. UseStateResult1 .. ")" else ButtonKey
		end
		
		return {
			buttonHeight = UseDesignTokensResult.Size.Size_1200,
			forcedFillDirection = Enum.FillDirection.Vertical,
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = function()
							-- upvalues: Callback (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), DEFAULTTIMERCOOLDOWN (copy), countDown (upval)
							Callback()
							UseStateResult2(true)
							UseStateResult2_1(DEFAULTTIMERCOOLDOWN)
							countDown(tick(), DEFAULTTIMERCOOLDOWN)
						end,
						text = if UseStateResult then ButtonDisabledKey .. " (" .. UseStateResult1 .. ")" else ButtonKey,
						isDisabled = UseStateResult or p1.isDisabled
					}
				}
			}
		}
	end
	
	local UseResult = React.useCallback(function(Text: string): string
		-- upvalues: p1 (copy)
		return Text:gsub("{email}", p1.email)
	end, { p1.email })
	local UseResult1 = React.useCallback(DebounceModule(function(p2)
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy), OtpLoginConstantsModule (upval), UseStateResult2_2 (copy)
		AnalyticsEventsModule.sendFormInteractionEvent(EventConstantsModule.ctx.enterOtp, p1.origin, EventConstantsModule.field.code)
		
		if p2.Text then
			p2.Text = string.sub(p2.Text:gsub("%D", ""), 1, OtpLoginConstantsModule.DEFAULT_CODE_LENGTH)
			UseStateResult2_2(p2.Text)
			p1.clearErrorMessage()
		end
	end, 0.5), { UseStateResult2_2 })
	
	local function footer()
		-- upvalues: React (upval), UseDesignTokensResult (copy), UseLocalizationResult (copy), UseStyleResult (copy), LinkButton (upval), p1 (copy)
		return React.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Padding = React.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_400)
			}),
			ListLayout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_200)
			}),
			FooterText = React.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = UseLocalizationResult.footerDescriptionKey,
				TextSize = UseDesignTokensResult.FontSize.FontSize_400,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = UseStyleResult.Font.Body.Font
			}),
			LinkFrame = React.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				LinkListLayout = React.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal
				}),
				ChangeEmailButton = React.createElement(LinkButton, {
					layoutOrder = 6,
					text = UseLocalizationResult.changeEmailKey,
					onActivated = p1.returnToEnterEmail,
					position = UDim2.fromScale(0.25, 0)
				}),
				Hyphen = React.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = "-",
					LayoutOrder = 7,
					TextSize = UseDesignTokensResult.FontSize.FontSize_400,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = UseStyleResult.Font.Footer.Font
				}),
				HelpButton = React.createElement(LinkButton, {
					layoutOrder = 8,
					text = UseLocalizationResult.helpButtonKey,
					onActivated = p1.navigateToHelp,
					position = UDim2.fromScale(0.75, 0)
				})
			})
		})
	end
	
	local _ = function(): boolean
		-- upvalues: EnableKoreaKISAComplianceModularized (upval), p1 (copy)
		return EnableKoreaKISAComplianceModularized and (p1.complianceCheckboxMessageKey and p1.complianceCheckboxMessageKey ~= "")
	end
	
	React.useEffect(function()
		-- upvalues: countDown (copy), OtpLoginConstantsModule (upval), AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy)
		countDown(tick(), OtpLoginConstantsModule.DEFAULT_TIMER_COOLDOWN)
		AnalyticsEventsModule.sendPageLoadEvent(EventConstantsModule.ctx.enterOtp, p1.origin)
	end, {})
	React.useEffect(function()
		-- upvalues: UseStateResult3 (copy), OtpLoginConstantsModule (upval), p1 (copy), UseStateResult4 (copy)
		if string.len(UseStateResult3) == OtpLoginConstantsModule.DEFAULT_CODE_LENGTH then
			if not p1.complianceCheckboxMessageKey then
				p1.onSubmitCode(UseStateResult3)
			elseif UseStateResult4 then
				p1.onSubmitCode(UseStateResult3)
				
				return
			end
		end
	end, { UseStateResult3, (tostring(UseStateResult4)) })
	
	return React.createElement(PartialPageModal, {
		title = p1.enterCodeTitle,
		screenSize = p1.screenSize,
		buttonStackProps = getButtonStackProps(UseLocalizationResult.buttonKey, UseLocalizationResult.buttonDisabledKey, OtpLoginConstantsModule.DEFAULT_TIMER_COOLDOWN, p1.onResendCode),
		footerContent = footer,
		onCloseClicked = p1.onClose,
		position = p1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p1.keyboardHeight) or nil,
		anchorPoint = p1.isKeyboardShowing and Vector2.new(0.5, 1) or nil
	}, {
		Middle = React.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ContentPadding = React.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_600),
				PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_600)
			}),
			ListLayout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_300)
			}),
			BodyText = React.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = UseResult(p1.enterCodeDescription),
				TextSize = UseStyleResult.Font.BaseSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = UseStyleResult.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0)
			}),
			ComplianceCheckboxContainer = if EnableKoreaKISAComplianceModularized then p1.complianceCheckboxMessageKey and p1.complianceCheckboxMessageKey ~= "" and React.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0)
			}, {
				Layout = React.createElement("UIListLayout", {
					Padding = UDim.new(0, 8),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Checkbox = React.createElement(Checkbox, {
					label = "",
					LayoutOrder = 2,
					isChecked = UseStateResult4,
					onActivated = function()
						-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy)
						UseStateResult2_3(not UseStateResult4)
					end
				}),
				CheckboxBodyText = React.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = UseLocalizationResult.complianceCheckboxMessageKey,
					TextSize = UseStyleResult.Font.BaseSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = UseStyleResult.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					TextWrapped = true,
					Size = UDim2.new(0, PartialPageModalMiddleContentWidth * 0.9, 0, 0),
					LayoutOrder = 3,
					[React.Event.Activated] = function()
						-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy)
						UseStateResult2_3(not UseStateResult4)
					end
				})
			}) else EnableKoreaKISAComplianceModularized and React.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0)
			}, {
				Layout = React.createElement("UIListLayout", {
					Padding = UDim.new(0, 8),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Checkbox = React.createElement(Checkbox, {
					label = "",
					LayoutOrder = 2,
					isChecked = UseStateResult4,
					onActivated = function()
						-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy)
						UseStateResult2_3(not UseStateResult4)
					end
				}),
				CheckboxBodyText = React.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = UseLocalizationResult.complianceCheckboxMessageKey,
					TextSize = UseStyleResult.Font.BaseSize,
					TextColor3 = UseStyleResult.Theme.TextDefault.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					Font = UseStyleResult.Font.Body.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					TextWrapped = true,
					Size = UDim2.new(0, PartialPageModalMiddleContentWidth * 0.9, 0, 0),
					LayoutOrder = 3,
					[React.Event.Activated] = function()
						-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy)
						UseStateResult2_3(not UseStateResult4)
					end
				})
			}),
			CodeInput = React.createElement(InputFieldModule, {
				LayoutOrder = 3,
				text = UseStateResult3,
				textInputType = Enum.TextInputType.Number,
				disabled = p1.isDisabled,
				onChange = UseResult1,
				errorMessage = p1.errorMessage,
				placeholder = UseLocalizationResult.placeholderKey
			})
		})
	})
end