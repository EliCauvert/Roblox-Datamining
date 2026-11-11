local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local Logger = require(Parent.Loggers).Logger
local GetFFlagEnableContinueRecoveryFunction = require(Parent.SharedFlags).GetFFlagEnableContinueRecovery
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local VerifyCodeModule = require(AccountRecovery.Thunks.VerifyCode)
local ResendCodeModule = require(AccountRecovery.Thunks.ResendCode)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ConstantsModule = require(AccountRecovery.Components.Constants)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local ContactMethodTypeModule = require(AccountRecovery.Enums.ContactMethodType)
local UserHeaderModule = require(AccountRecovery.Components.UserHeader)
local IdentifierTypeModule = require(AccountRecovery.Enums.IdentifierType)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local RecoveryStateModule = require(AccountRecovery.Enums.RecoveryState)
local GetModalModule = require(AccountRecovery.Components.getModal)
local GetFFlagEnableSkipPasswordResetModule = require(AccountRecovery.Flags.GetFFlagEnableSkipPasswordReset)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ConstantsModule (copy), UseClearFocusOnUnmountFunction (copy), IdentifierTypeModule (copy), VerifyCodeModule (copy), UserInputService (copy), RecoveryStateModule (copy), AccountRecoveryPageStateModule (copy), GetFFlagEnableSkipPasswordResetModule (copy), Logger (copy), HttpService (copy), GetFFlagEnableContinueRecoveryFunction (copy), ResendCodeModule (copy), UseLocalizationFunction (copy), ContactMethodTypeModule (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), ScrollView (copy), Visibility (copy), UserHeaderModule (copy), Text (copy), StyledTextLabel (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonVariant (copy), GetModalModule (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(ConstantsModule.SecondsBetweenResends)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState("")
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState("")
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(false)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(Vector2.new(0, 0))
	UseClearFocusOnUnmountFunction()
	local Flag = false
	local UserID = 0
	local Username = ""
	local DisplayName = ""
	local ContactMethod = ""
	local IdentifierInfoParam = p1.navigation.getParam("identifierInfo")
	
	if IdentifierInfoParam.identifierType == IdentifierTypeModule.Username then
		Flag = true
		UserID = IdentifierInfoParam.userId
		Username = IdentifierInfoParam.username
		DisplayName = IdentifierInfoParam.displayName
	else
		Flag = false
		ContactMethod = IdentifierInfoParam.contactMethod
	end
	local ContactMethodNumberParam = p1.navigation.getParam("contactMethodNumber") or 0
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult3 (copy), UseStateResult2_4 (copy), UseStateResult2_3 (copy), UseStateResult2_2 (copy), UseStateResult2_5 (copy), UseStateResult6 (copy)
		local function updateTimer()
			-- upvalues: UseStateResult3 (upval), UseStateResult2_4 (upval), UseStateResult2_3 (upval), UseStateResult2_2 (upval)
			while UseStateResult3 do
				task.wait(1)
				UseStateResult2_4(function(p2: number): number
					-- upvalues: UseStateResult2_3 (upval), UseStateResult2_2 (upval)
					local v1 = p2 - 1
					
					if v1 <= 0 then
						UseStateResult2_3(true)
						UseStateResult2_2(false)
						
						return 0
					else
						return v1
					end
				end)
			end
		end
		
		if UseStateResult3 then
			UseStateResult2_5((task.spawn(updateTimer)))
		end
		return function()
			-- upvalues: UseStateResult2_2 (upval), UseStateResult6 (upval)
			UseStateResult2_2(false)
			
			if UseStateResult6 then
				task.cancel(UseStateResult6)
			end
		end
	end, { UseStateResult3 })
	
	local function _()
		-- upvalues: UseStateResult2_3 (copy), UseStateResult2_4 (copy), ConstantsModule (upval), UseStateResult3 (copy), UseStateResult2_2 (copy), UseStateResult6 (copy)
		UseStateResult2_3(false)
		UseStateResult2_4(ConstantsModule.SecondsBetweenResends)
		
		if UseStateResult3 then
			UseStateResult2_2(false)
			
			if UseStateResult6 then
				task.cancel(UseStateResult6)
			end
		end
		UseStateResult2_2(true)
	end
	
	local _ = function(RecoverySessionId, Code)
		-- upvalues: UseDispatchResult (copy), VerifyCodeModule (upval), UseRoactServiceResult (copy), ContactMethodNumberParam (copy)
		return UseDispatchResult(VerifyCodeModule(UseRoactServiceResult, {
			recoverySessionId = RecoverySessionId,
			code = Code,
			contactMethodNumber = ContactMethodNumberParam
		}))
	end
	
	local _ = function()
		-- upvalues: UserInputService (upval)
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if FocusedTextBox then
			FocusedTextBox:ReleaseFocus()
		end
	end
	
	local function v68(UserID, p2, Callback: (any) -> ())
		-- upvalues: ConstantsModule (upval), RecoveryStateModule (upval), p1 (copy), AccountRecoveryPageStateModule (upval), ContactMethodNumberParam (copy), UseContextResult (copy), GetFFlagEnableSkipPasswordResetModule (upval), Username (ref)
		if p2 == nil then
			Callback(ConstantsModule.UnknownErrorKey)
			
			return
		end
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
			p1.navigation.navigate(AccountRecoveryPageStateModule.SendCodeScreen, {
				isSecondContactMethodVerification = true,
				userID = UserID,
				previousRecoveryMethod = p2.previousRecoveryMethod,
				previousRecoveryMethodTypes = p2.previousRecoveryMethodTypes,
				nextRecoveryMethodTypes = p2.nextRecoveryMethodTypes
			})
			
			return
		end
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_ACCOUNT_VERIFIED then
			if ContactMethodNumberParam == 0 and UseContextResult.state.recover2sv then
				p1.navigation.replace(AccountRecoveryPageStateModule.AccountVerifiedConfirmationScreen, { userID = UserID })
				
				return
			end
			if GetFFlagEnableSkipPasswordResetModule() and UseContextResult.state.recover2sv and not UseContextResult.state.recoverPassword then
				UseContextResult.utils.handleUpdatePassword(UseContextResult.state.recoverySessionId, UserID, Username, "", "", Callback, UseContextResult.utils.launchAppOrGoBack)
				
				return
			else
				p1.navigation.replace(AccountRecoveryPageStateModule.ChooseAccountScreen, { userID = UserID })
				
				return
			end
		elseif p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_AWAITING_REEVALUATION then
			p1.navigation.navigate(AccountRecoveryPageStateModule.CannotRecoverAccountScreen, { userID = UserID })
			
			return
		else
			Callback(ConstantsModule.UnknownErrorKey)
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ConstantsModule (upval), UseStateResult2_8 (copy), UserInputService (upval), UseStateResult2_1 (copy), UseContextResult (copy), UseDispatchResult (copy), VerifyCodeModule (upval), UseRoactServiceResult (copy), ContactMethodNumberParam (copy), Logger (upval), HttpService (upval), UseStateResult2_7 (copy), GetFFlagEnableContinueRecoveryFunction (upval), Flag (ref), p1 (copy), AccountRecoveryPageStateModule (upval), UserID (ref), DisplayName (ref), Username (ref), v68 (copy)
		if #UseStateResult == ConstantsModule.VerificationCodeLength then
			UseStateResult2_8(true)
			local FocusedTextBox = UserInputService:GetFocusedTextBox()
			
			if FocusedTextBox then
				FocusedTextBox:ReleaseFocus()
			end
			UseStateResult2_1(UseStateResult)
			UseDispatchResult(VerifyCodeModule(UseRoactServiceResult, {
				recoverySessionId = UseContextResult.state.recoverySessionId,
				code = UseStateResult,
				contactMethodNumber = ContactMethodNumberParam
			})):andThen(function(Result)
				-- upvalues: Logger (upval), HttpService (upval), UseStateResult2_7 (upval), ConstantsModule (upval), UseStateResult2_8 (upval), GetFFlagEnableContinueRecoveryFunction (upval), Flag (upval), p1 (upval), AccountRecoveryPageStateModule (upval), UserID (upval), DisplayName (upval), Username (upval), ContactMethodNumberParam (upval), UseContextResult (upval), v68 (upval)
				if Result.isError then
					Logger:warning("Error verifying code: {}", HttpService:JSONEncode(Result))
					UseStateResult2_7(Result.errorKey or ConstantsModule.UnknownErrorKey)
					UseStateResult2_8(false)
					
					return
				end
				if GetFFlagEnableContinueRecoveryFunction() and Flag then
					local function v77(_)
						-- upvalues: p1 (upval), AccountRecoveryPageStateModule (upval), UserID (upval), DisplayName (upval), Username (upval), ContactMethodNumberParam (upval)
						p1.navigation.replace(AccountRecoveryPageStateModule.ContinueFallbackScreen, {
							didAbandon2SV = false,
							userID = UserID,
							displayName = DisplayName,
							username = Username,
							contactMethodNumber = ContactMethodNumberParam
						})
					end
					
					UseContextResult.utils.handleContinueRecovery(UseContextResult.state.recoverySessionId, UserID, function(p2)
						-- upvalues: v68 (upval), UserID (upval), v77 (copy)
						v68(UserID, p2, v77)
					end, v77, function()
						-- upvalues: p1 (upval), AccountRecoveryPageStateModule (upval), UserID (upval), DisplayName (upval), Username (upval), ContactMethodNumberParam (upval)
						p1.navigation.replace(AccountRecoveryPageStateModule.ContinueFallbackScreen, {
							didAbandon2SV = true,
							userID = UserID,
							displayName = DisplayName,
							username = Username,
							contactMethodNumber = ContactMethodNumberParam
						})
					end)
					
					return
				else
					p1.navigation.replace(AccountRecoveryPageStateModule.ChooseAccountScreen, { userID = UserID })
					UseStateResult2_8(false)
				end
			end):finally(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1("")
			end)
		end
	end, { UseStateResult })
	
	local _ = function()
		-- upvalues: UseDispatchResult (copy), ResendCodeModule (upval), UseRoactServiceResult (copy), UseContextResult (copy), ContactMethodNumberParam (copy)
		return UseDispatchResult(ResendCodeModule(UseRoactServiceResult, {
			recoverySessionId = UseContextResult.state.recoverySessionId,
			contactMethodNumber = ContactMethodNumberParam
		}))
	end
	
	local _ = function()
		-- upvalues: UseDispatchResult (copy), ResendCodeModule (upval), UseRoactServiceResult (copy), UseContextResult (copy), ContactMethodNumberParam (copy), Logger (upval), HttpService (upval), UseStateResult2_6 (copy), ConstantsModule (upval)
		return UseDispatchResult(ResendCodeModule(UseRoactServiceResult, {
			recoverySessionId = UseContextResult.state.recoverySessionId,
			contactMethodNumber = ContactMethodNumberParam
		})):andThen(function(Result)
			-- upvalues: Logger (upval), HttpService (upval), UseStateResult2_6 (upval), ConstantsModule (upval)
			if Result.isError then
				Logger:warning("Error resending code: {}", HttpService:JSONEncode(Result))
				UseStateResult2_6(Result.errorKey or ConstantsModule.UnknownErrorKey)
				
				return
			end
		end)
	end
	
	local function v71(Frame: Frame)
		-- upvalues: UseStateResult10 (copy), UseStateResult2_9 (copy)
		if UseStateResult10 ~= Frame.AbsoluteSize then
			UseStateResult2_9(Frame.AbsoluteSize)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery",
		emailCodeSentText = "Authentication.AccountRecovery.Description.EmailCodeSent",
		emailCodeSentForUserText = "Authentication.AccountRecovery.Description.EmailCodeSentForUser",
		phoneCodeSentText = "Authentication.AccountRecovery.Description.PhoneCodeSent",
		phoneCodeSentForUserText = "Authentication.AccountRecovery.Description.PhoneCodeSentForUser",
		enterCodeText = "Authentication.AccountRecovery.Label.EnterCode",
		resendCodeText = "Authentication.AccountRecovery.Label.ResendCode",
		resendCodeTimerText = {
			"Authentication.AccountRecovery.Label.ResendCodeTimer",
			timeLeft = `{UseStateResult5}`
		},
		codeErrorText = if UseStateResult8 == "" then nil else UseStateResult8,
		resendErrorText = if UseStateResult7 == "" then nil else UseStateResult7
	})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			Header = ReactModule.createElement(RecoveryHeaderModule, {
				LayoutOrder = 1,
				currentComponent = "resendOrVerifyCode",
				onBackActivated = function()
					-- upvalues: p1 (copy)
					p1.navigation.goBack()
				end,
				backButtonDisabled = UseStateResult9,
				recoveryHeadingText = UseLocalizationResult.recoveryHeadingText,
				recoverySessionId = UseContextResult.state.recoverySessionId
			}),
			Content = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				PreScrollContent = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0),
					[ReactModule.Change.AbsoluteSize] = v71
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
						PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
					}),
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
					}),
					RecoveryHeadingSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_500)
					})
				}),
				InputsOverflowScrollView = ReactModule.createElement(ScrollView, {
					LayoutOrder = 2,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(1, 0, 0, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = Visibility.Always
					},
					Size = UDim2.new(1, 0, 1, -UseStateResult10.Y)
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
						PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
					}),
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
					}),
					UserHeader = Flag and ReactModule.createElement(UserHeaderModule, {
						LayoutOrder = 2,
						userId = `{UserID}`,
						displayName = DisplayName,
						username = Username
					}),
					ContactMethodHeader = not Flag and ReactModule.createElement(Text, {
						LayoutOrder = 3,
						Text = ContactMethod,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						fontStyle = UseTokensResult.Typography.HeadingSmall,
						textStyle = UseTokensResult.Color.Content.Emphasis,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					HeaderSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 4,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_400)
					}),
					BodyText = ReactModule.createElement(Text, {
						LayoutOrder = 5,
						TextWrapped = true,
						Text = if IdentifierInfoParam.contactMethodType == ContactMethodTypeModule.Email then Flag and UseLocalizationResult.emailCodeSentForUserText or UseLocalizationResult.emailCodeSentText elseif IdentifierInfoParam.contactMethodType == ContactMethodTypeModule.Phone then Flag and UseLocalizationResult.phoneCodeSentForUserText or UseLocalizationResult.phoneCodeSentText else "",
						fontStyle = UseTokensResult.Typography.BodyMedium,
						textStyle = UseTokensResult.Color.Content.Default,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					BodyTextSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 6,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_300)
					}),
					EnterCodeLabel = ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 7,
						text = UseLocalizationResult.enterCodeText,
						fontStyle = UseTokensResult.Typography.TitleMedium,
						colorStyle = UseStyleResult.Theme.TextEmphasis,
						automaticSize = Enum.AutomaticSize.XY
					}),
					EnterCodeLabelSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 8,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
					}),
					EnterCodeField = ReactModule.createElement(TextInput, {
						LayoutOrder = 9,
						label = "",
						text = UseStateResult1,
						width = UDim.new(1, 0),
						textInputType = Enum.TextInputType.OneTimePassword,
						onChanged = function(p2)
							-- upvalues: UseStateResult8 (copy), UseStateResult2_7 (copy), UseStateResult2 (copy)
							if UseStateResult8 ~= "" then
								UseStateResult2_7("")
							end
							UseStateResult2(p2)
						end,
						isDisabled = UseStateResult9,
						size = InputSize.Medium
					}),
					ErrorTextSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 10,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_200)
					}),
					ErrorTextLabel = ReactModule.createElement(Text, {
						LayoutOrder = 11,
						Text = UseLocalizationResult.codeErrorText or "",
						fontStyle = UseTokensResult.Typography.CaptionSmall,
						textStyle = UseTokensResult.Color.System.Alert,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					ResendCodeButtonSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_300)
					}),
					ResendCodeButton = ReactModule.createElement(Button, {
						LayoutOrder = 13,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium,
						text = UseStateResult4 and UseLocalizationResult.resendCodeText or UseLocalizationResult.resendCodeTimerText,
						width = UDim.new(1, 0),
						onActivated = function()
							-- upvalues: UseDispatchResult (copy), ResendCodeModule (upval), UseRoactServiceResult (copy), UseContextResult (copy), ContactMethodNumberParam (copy), Logger (upval), HttpService (upval), UseStateResult2_6 (copy), ConstantsModule (upval), UseStateResult2_3 (copy), UseStateResult2_4 (copy), UseStateResult3 (copy), UseStateResult2_2 (copy), UseStateResult6 (copy)
							local _ = UseDispatchResult(ResendCodeModule(UseRoactServiceResult, {
								recoverySessionId = UseContextResult.state.recoverySessionId,
								contactMethodNumber = ContactMethodNumberParam
							})):andThen(function(Result)
								-- upvalues: Logger (upval), HttpService (upval), UseStateResult2_6 (upval), ConstantsModule (upval)
								if Result.isError then
									Logger:warning("Error resending code: {}", HttpService:JSONEncode(Result))
									UseStateResult2_6(Result.errorKey or ConstantsModule.UnknownErrorKey)
									
									return
								end
							end)
							UseStateResult2_3(false)
							UseStateResult2_4(ConstantsModule.SecondsBetweenResends)
							
							if UseStateResult3 then
								UseStateResult2_2(false)
								
								if UseStateResult6 then
									task.cancel(UseStateResult6)
								end
							end
							UseStateResult2_2(true)
						end,
						isDisabled = not UseStateResult4 or UseStateResult9
					}),
					ResendErrorTextSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 14,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_200)
					}),
					ResendErrorTextLabel = ReactModule.createElement(Text, {
						LayoutOrder = 15,
						Text = UseLocalizationResult.resendErrorText or "",
						fontStyle = UseTokensResult.Typography.CaptionSmall,
						textStyle = UseTokensResult.Color.System.Alert,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					Modal = GetFFlagEnableSkipPasswordResetModule() and GetModalModule(UseContextResult.state.modalStateAndProps)
				})
			})
		})
	})
end