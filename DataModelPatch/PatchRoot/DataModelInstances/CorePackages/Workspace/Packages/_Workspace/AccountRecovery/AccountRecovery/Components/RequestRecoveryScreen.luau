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
local Divider = FoundationModule.Divider
local DividerVariant = FoundationModule.Enums.DividerVariant
local Orientation = FoundationModule.Enums.Orientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local Logger = require(Parent.Loggers).Logger
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local GetUserByUsernameFunction = require(Parent.AuthCommon).Thunks.GetUserByUsername
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local RequestRecoveryModule = require(AccountRecovery.Thunks.RequestRecovery)
local SendCodeModule = require(AccountRecovery.Thunks.SendCode)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local AccountRecoveryActionTypeModule = require(AccountRecovery.Enums.AccountRecoveryActionType)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local ConstantsModule = require(AccountRecovery.Components.Constants)
local PhoneDropdownModule = require(AccountRecovery.Components.PhoneDropdown)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local RecoveryStateModule = require(AccountRecovery.Enums.RecoveryState)
local _ = require(AccountRecovery.Enums.ContactMethodType)
local IdentifierUtilsModule = require(AccountRecovery.Utils.IdentifierUtils)
local IdentifierTypeModule = require(AccountRecovery.Enums.IdentifierType)
local _ = require(AccountRecovery.Components.Types)
local EventServiceModule = require(AccountRecovery.Analytics.EventService)
local GetFFlagEnable2SVRecoveryModule = require(AccountRecovery.Flags.GetFFlagEnable2SVRecovery)
local GetFFlagEnableOverrideRecoveryIntentModule = require(AccountRecovery.Flags.GetFFlagEnableOverrideRecoveryIntent)
local DisableRecoveryForConsole = game:DefineFastFlag("DisableRecoveryForConsole", false)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseClearFocusOnUnmountFunction (copy), IdentifierUtilsModule (copy), RequestRecoveryModule (copy), SendCodeModule (copy), Logger (copy), HttpService (copy), ConstantsModule (copy), AccountRecoveryActionTypeModule (copy), GetFFlagEnableOverrideRecoveryIntentModule (copy), RecoveryStateModule (copy), IdentifierTypeModule (copy), EventServiceModule (copy), GetFFlagEnable2SVRecoveryModule (copy), AccountRecoveryPageStateModule (copy), DisableRecoveryForConsole (copy), UserInputService (copy), GetUserByUsernameFunction (copy), UseLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), Loading (copy), IconSize (copy), ScrollView (copy), Visibility (copy), PhoneDropdownModule (copy), StyledTextLabel (copy), TextInput (copy), InputSize (copy), Text (copy), Button (copy), ButtonVariant (copy), Divider (copy), DividerVariant (copy), Orientation (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState("")
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(true)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(Vector2.new(0, 0))
	UseClearFocusOnUnmountFunction()
	
	local function v61(RecoverySessionId, p2)
		-- upvalues: IdentifierUtilsModule (upval), UseStateResult (copy), UseContextResult (copy), UseDispatchResult (copy), RequestRecoveryModule (upval), UseRoactServiceResult (copy), UseStateResult3 (copy)
		local IdentifierType = IdentifierUtilsModule.getIdentifierType(p2, UseStateResult)
		local List = {}
		
		if UseContextResult.state.recover2sv then
			table.insert(List, "twostepverification")
		end
		if UseContextResult.state.recoverPassword then
			table.insert(List, "password")
		end
		return UseDispatchResult(RequestRecoveryModule(UseRoactServiceResult, {
			identifier = IdentifierUtilsModule.formatIdentifier(p2, IdentifierType, UseContextResult.state.phonePrefixList[UseStateResult3]),
			identifierType = IdentifierType,
			recoverySessionId = RecoverySessionId,
			requestedRecoveryTypes = List
		}))
	end
	
	local function _(RecoverySessionId, ContactMethod, ContactMethodType, p2)
		-- upvalues: UseDispatchResult (copy), SendCodeModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(SendCodeModule(UseRoactServiceResult, {
			recoverySessionId = RecoverySessionId,
			contactMethod = ContactMethod,
			contactMethodType = ContactMethodType,
			contactMethodNumber = p2 or 0
		}))
	end
	
	local function v63(AutofillIdentifier, Callback1, Callback, p2)
		-- upvalues: UseStateResult2_3 (copy), UseStateResult2_4 (copy), v61 (copy), UseContextResult (copy), Logger (upval), HttpService (upval), ConstantsModule (upval)
		UseStateResult2_3(true)
		UseStateResult2_4("")
		v61(UseContextResult.state.recoverySessionId, AutofillIdentifier):andThen(function(Result)
			-- upvalues: Logger (upval), HttpService (upval), Callback (copy), ConstantsModule (upval), UseStateResult2_3 (upval), Callback1 (copy), p2 (copy)
			if Result.isError then
				Logger:warning("Error initializing recovery: {}", HttpService:JSONEncode(Result))
				Callback(Result.errorKey or ConstantsModule.UnknownErrorKey)
				UseStateResult2_3(false)
				
				return
			else
				Callback1(Result.data, Callback, p2)
			end
		end):await()
	end
	
	local function v64(p2, Callback: (any) -> (), p3)
		-- upvalues: ConstantsModule (upval), UseStateResult2_3 (copy), UseContextResult (copy), AccountRecoveryActionTypeModule (upval), GetFFlagEnableOverrideRecoveryIntentModule (upval), RecoveryStateModule (upval), IdentifierUtilsModule (upval), UseStateResult1 (copy), UseStateResult (copy), IdentifierTypeModule (upval), EventServiceModule (upval), GetFFlagEnable2SVRecoveryModule (upval), p1 (copy), AccountRecoveryPageStateModule (upval), UseStateResult3 (copy), UseDispatchResult (copy), SendCodeModule (upval), UseRoactServiceResult (copy), Logger (upval), HttpService (upval)
		if p2 == nil then
			Callback(ConstantsModule.UnknownErrorKey)
			UseStateResult2_3(false)
			
			return
		end
		UseContextResult.dispatch({
			type = AccountRecoveryActionTypeModule.SET_RECOVERY_SESSION_ID,
			data = { recoverySessionId = p2.recoverySessionId }
		})
		local RequestRecoveryMetadata = p2.requestRecoveryMetadata
		local Recover2sv = UseContextResult.state.recover2sv
		local RecoverPassword = UseContextResult.state.recoverPassword
		
		if GetFFlagEnableOverrideRecoveryIntentModule() then
			if RequestRecoveryMetadata ~= nil then
				if RequestRecoveryMetadata.shouldRecover2sv ~= nil then
					Recover2sv = RequestRecoveryMetadata.shouldRecover2sv
				end
				if RequestRecoveryMetadata.shouldResetPassword ~= nil then
					RecoverPassword = RequestRecoveryMetadata.shouldResetPassword
				end
			end
			UseContextResult.dispatch({
				type = AccountRecoveryActionTypeModule.SET_RECOVERY_INTENT,
				data = {
					recover2sv = Recover2sv,
					recoverPassword = RecoverPassword
				}
			})
		end
		local UserID = RequestRecoveryMetadata and RequestRecoveryMetadata.userID or 0
		
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
			local IdentifierType = IdentifierUtilsModule.getIdentifierType(UseStateResult1, UseStateResult)
			
			if IdentifierType ~= IdentifierTypeModule.Username then
				local IdentifierTypeToContactMethodTypeResult = IdentifierUtilsModule.identifierTypeToContactMethodType(IdentifierType)
				local FormatIdentifierResult = IdentifierUtilsModule.formatIdentifier(UseStateResult1, IdentifierType, UseContextResult.state.phonePrefixList[UseStateResult3])
				UseDispatchResult(SendCodeModule(UseRoactServiceResult, {
					contactMethodNumber = 0,
					recoverySessionId = p2.recoverySessionId,
					contactMethod = FormatIdentifierResult,
					contactMethodType = IdentifierTypeToContactMethodTypeResult
				})):andThen(function(Result)
					-- upvalues: Logger (upval), HttpService (upval), Callback (copy), ConstantsModule (upval), UseStateResult2_3 (upval), EventServiceModule (upval), p2 (copy), IdentifierType (copy), p1 (upval), AccountRecoveryPageStateModule (upval), IdentifierTypeToContactMethodTypeResult (copy), FormatIdentifierResult (copy)
					if Result.isError then
						Logger:warning("Error sending code: {}", HttpService:JSONEncode(Result))
						Callback(Result.errorKey or ConstantsModule.UnknownErrorKey)
						UseStateResult2_3(false)
						
						return
					else
						EventServiceModule.sendIdentifierSentEvent(p2.recoverySessionId, IdentifierType, "resendOrVerifyCode")
						p1.navigation.navigate(AccountRecoveryPageStateModule.VerifyCodeScreen, {
							contactMethodNumber = 0,
							identifierInfo = {
								identifierType = IdentifierType,
								contactMethodType = IdentifierTypeToContactMethodTypeResult,
								contactMethod = FormatIdentifierResult
							}
						})
						UseStateResult2_3(false)
					end
				end)
				
				return
			end
			if p3 then
				EventServiceModule.sendRecoveryInitializedFromAutofillEvent(p2.recoverySessionId, IdentifierType, "sendCode")
			else
				EventServiceModule.sendIdentifierSentEvent(p2.recoverySessionId, IdentifierType, "sendCode")
			end
			if GetFFlagEnable2SVRecoveryModule() and Recover2sv and not RecoverPassword then
				p1.navigation.replace(AccountRecoveryPageStateModule.SendCodeScreen, { closeRecoveryOnBack = true, userID = UserID })
			else
				p1.navigation.navigate(AccountRecoveryPageStateModule.SendCodeScreen, { userID = UserID })
			end
			UseStateResult2_3(false)
			
			return
		else
			if p2.recoveryState ~= RecoveryStateModule.RECOVERY_STATE_ACCOUNT_VERIFIED then
				Callback(ConstantsModule.UnknownErrorKey)
				UseStateResult2_3(false)
				
				return
			end
			p1.navigation.navigate(AccountRecoveryPageStateModule.AccountVerifiedConfirmationScreen, { userID = UserID })
			
			if p3 then
				EventServiceModule.sendRecoveryInitializedFromAutofillEvent(p2.recoverySessionId, "username", "accountVerifiedConfirmation")
			else
				EventServiceModule.sendIdentifierSentEvent(p2.recoverySessionId, "username", "accountVerifiedConfirmation")
			end
			UseStateResult2_3(false)
		end
	end
	
	local function v65(UserID, p2, Callback: (any) -> ())
		-- upvalues: ConstantsModule (upval), RecoveryStateModule (upval), p1 (copy), AccountRecoveryPageStateModule (upval)
		if p2 == nil then
			Callback(ConstantsModule.UnknownErrorKey)
			
			return
		end
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
			p1.navigation.replace(AccountRecoveryPageStateModule.SendCodeScreen, {
				isSecondContactMethodVerification = true,
				closeRecoveryOnBack = true,
				userID = UserID,
				previousRecoveryMethod = p2.previousRecoveryMethod,
				previousRecoveryMethodTypes = p2.previousRecoveryMethodTypes,
				nextRecoveryMethodTypes = p2.nextRecoveryMethodTypes
			})
			
			return
		end
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_ACCOUNT_VERIFIED then
			p1.navigation.replace(AccountRecoveryPageStateModule.AccountVerifiedConfirmationScreen, { closeRecoveryOnBack = true, userID = UserID })
			
			return
		end
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_AWAITING_REEVALUATION then
			p1.navigation.navigate(AccountRecoveryPageStateModule.CannotRecoverAccountScreen, { userID = UserID })
			
			return
		else
			Callback(ConstantsModule.UnknownErrorKey)
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_5 (copy), EventServiceModule (upval), DisableRecoveryForConsole (upval), UserInputService (upval), p1 (copy), AccountRecoveryPageStateModule (upval), GetFFlagEnable2SVRecoveryModule (upval), UseContextResult (copy), AccountRecoveryActionTypeModule (upval), UseStateResult2_4 (copy), ConstantsModule (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (copy), v65 (copy), Logger (upval), IdentifierUtilsModule (upval), IdentifierTypeModule (upval), UseStateResult2_1 (copy), UseStateResult2 (copy), v63 (copy), v64 (copy)
		UseStateResult2_5(true)
		EventServiceModule.sendPageLoadEvent()
		
		if DisableRecoveryForConsole then
			local Success, Result = pcall(function()
				-- upvalues: UserInputService (upval)
				return UserInputService:GetPlatform()
			end)
			
			if Success then
				local IsResultMatch: boolean = Result == Enum.Platform.XBoxOne or Result == Enum.Platform.XBox360
				
				if Result == Enum.Platform.PS3 or (Result == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and Result == Enum.Platform.PS5) or IsResultMatch then
					UseStateResult2_5(false)
					p1.navigation.replace(AccountRecoveryPageStateModule.CannotRecoverAccountScreen, { isConsole = true })
					
					return
				end
			end
		end
		if GetFFlagEnable2SVRecoveryModule() and UseContextResult.state.continuingRecovery then
			local function v81(UnknownErrorKey)
				-- upvalues: UseContextResult (upval), AccountRecoveryActionTypeModule (upval), UseStateResult2_4 (upval), ConstantsModule (upval), UseStateResult2_5 (upval)
				UseContextResult.dispatch({
					type = AccountRecoveryActionTypeModule.RESET_RECOVERY_FLOW,
					data = {
						continuingRecovery = false,
						recover2sv = false,
						recoverPassword = true,
						recoverySessionId = "",
						autofillIdentifier = "",
						deeplinkUuid = ""
					}
				})
				UseStateResult2_4(UnknownErrorKey or ConstantsModule.UnknownErrorKey)
				UseStateResult2_5(false)
			end
			
			local AutofillIdentifier1 = UseContextResult.state.autofillIdentifier
			
			if AutofillIdentifier1 == nil or AutofillIdentifier1 == "" then
				v81(ConstantsModule.UnknownErrorKey)
				
				return
			else
				GetUserByUsernameFunction(UseRoactServiceResult, UseContextResult.state.autofillIdentifier)():andThen(function(Result)
					-- upvalues: UseContextResult (upval), v65 (upval), v81 (copy), UseStateResult2_5 (upval), Logger (upval), ConstantsModule (upval)
					local Id = Result.id
					UseContextResult.utils.handleContinueRecovery(UseContextResult.state.recoverySessionId, Id, function(p2)
						-- upvalues: v65 (upval), Id (copy), v81 (upval), UseStateResult2_5 (upval)
						v65(Id, p2, v81)
						UseStateResult2_5(false)
					end, function(p2)
						-- upvalues: v81 (upval)
						v81(p2)
					end, function()
						-- upvalues: Logger (upval), v81 (upval), ConstantsModule (upval)
						Logger:warning("2SV recovery abandoned when continuing 2SV recovery")
						v81(ConstantsModule.UnknownErrorKey)
					end, UseContextResult.state.recover2sv)
				end):catch(function(Err)
					-- upvalues: Logger (upval), v81 (copy), ConstantsModule (upval)
					Logger:warning("Error getting user info: {}", Err)
					v81(ConstantsModule.UnknownErrorKey)
				end)
				
				return
			end
		else
			local AutofillIdentifier = UseContextResult.state.autofillIdentifier
			
			if AutofillIdentifier == nil or AutofillIdentifier == "" then
				UseStateResult2_5(false)
				
				return
			end
			local IdentifierType = IdentifierUtilsModule.getIdentifierType(AutofillIdentifier, false)
			
			if IdentifierType == IdentifierTypeModule.Phone then
				UseStateResult2_1(AutofillIdentifier)
				UseStateResult2(true)
				EventServiceModule.sendRecoveryInitializedFromAutofillEvent("", IdentifierType, "identifierInput")
			elseif IdentifierType == IdentifierTypeModule.Email then
				UseStateResult2_1(AutofillIdentifier)
				EventServiceModule.sendRecoveryInitializedFromAutofillEvent("", IdentifierType, "identifierInput")
			elseif IdentifierType == IdentifierTypeModule.Username then
				v63(AutofillIdentifier, v64, function(_)
					-- upvalues: UseContextResult (upval), AccountRecoveryActionTypeModule (upval), EventServiceModule (upval), IdentifierType (copy)
					UseContextResult.dispatch({
						type = AccountRecoveryActionTypeModule.RESET_RECOVERY_FLOW,
						data = {
							continuingRecovery = false,
							recover2sv = false,
							recoverPassword = true,
							recoverySessionId = "",
							autofillIdentifier = "",
							deeplinkUuid = ""
						}
					})
					EventServiceModule.sendRecoveryInitializedFromAutofillEvent("", IdentifierType, "identifierInput")
				end, true)
			end
			UseStateResult2_5(false)
		end
	end, GetFFlagEnable2SVRecoveryModule() and { UseContextResult.state.deeplinkUuid } or {})
	
	local function v66(Frame: Frame)
		-- upvalues: UseStateResult7 (copy), UseStateResult2_6 (copy)
		if UseStateResult7 ~= Frame.AbsoluteSize then
			UseStateResult2_6(Frame.AbsoluteSize)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery",
		usernameEmailText = "Authentication.AccountRecovery.Label.UsernameEmail",
		phoneText = "Authentication.AccountRecovery.LabelPhone",
		usePhoneInsteadText = "Authentication.AccountRecovery.Action.UsePhoneInstead",
		useUsernameEmailInsteadText = "Authentication.AccountRecovery.Action.UseUsernameEmailInstead",
		nextButtonText = "Authentication.AccountRecovery.Action.Next",
		orText = "Authentication.AccountRecovery.Label.Or",
		errorText = if UseStateResult5 == "" then nil else UseStateResult5
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
				currentComponent = "identifierInput",
				onBackActivated = function()
					-- upvalues: UseContextResult (copy)
					UseContextResult.parentNavigation.goBack()
				end,
				backButtonDisabled = UseStateResult4,
				recoveryHeadingText = UseLocalizationResult.recoveryHeadingText,
				recoverySessionId = UseContextResult.state.recoverySessionId
			}),
			Loading = UseStateResult6 and ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				LoadingIcon = ReactModule.createElement(Loading, { size = IconSize.Medium })
			}),
			Content = not UseStateResult6 and ReactModule.createElement("Frame", {
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
					[ReactModule.Change.AbsoluteSize] = v66
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
					Size = UDim2.new(1, 0, 1, -UseStateResult7.Y)
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
					PhoneDropdown = UseStateResult and ReactModule.createElement(PhoneDropdownModule, {
						LayoutOrder = 2,
						value = UseStateResult3,
						onChange = function(p2)
							-- upvalues: UseStateResult2_2 (copy)
							UseStateResult2_2(p2)
						end,
						phonePrefixList = UseContextResult.state.phonePrefixList,
						topOffset = UseDesignTokensResult.Size.Size_1600 * 3
					}),
					PhoneDropdownSpacing = UseStateResult and ReactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_500)
					}),
					IdentifierLabel = ReactModule.createElement(StyledTextLabel, {
						layoutOrder = 4,
						text = UseStateResult and UseLocalizationResult.phoneText or UseLocalizationResult.usernameEmailText,
						fontStyle = UseTokensResult.Typography.TitleMedium,
						colorStyle = UseStyleResult.Theme.TextEmphasis,
						automaticSize = Enum.AutomaticSize.XY
					}),
					IdentifierLabelSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 5,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
					}),
					UserIdentifierTextField = ReactModule.createElement(TextInput, {
						LayoutOrder = 6,
						label = "",
						text = UseStateResult1,
						width = UDim.new(1, 0),
						textInputType = UseStateResult and Enum.TextInputType.Phone or Enum.TextInputType.Username,
						onChanged = function(p2)
							-- upvalues: UseStateResult5 (copy), UseStateResult2_4 (copy), UseStateResult2_1 (copy)
							if UseStateResult5 ~= "" then
								UseStateResult2_4("")
							end
							UseStateResult2_1(p2)
						end,
						isDisabled = UseStateResult4,
						size = InputSize.Medium
					}),
					ErrorTextSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 7,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_200)
					}),
					ErrorTextLabel = ReactModule.createElement(Text, {
						LayoutOrder = 8,
						Text = UseLocalizationResult.errorText or "",
						fontStyle = UseTokensResult.Typography.CaptionSmall,
						textStyle = UseTokensResult.Color.System.Alert,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					NextButtonSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 9,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_300)
					}),
					NextButton = ReactModule.createElement(Button, {
						LayoutOrder = 10,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium,
						text = UseLocalizationResult.nextButtonText,
						width = UDim.new(1, 0),
						onActivated = function()
							-- upvalues: v63 (copy), UseStateResult1 (copy), v64 (copy), UseStateResult2_4 (copy)
							v63(UseStateResult1, v64, function(p2)
								-- upvalues: UseStateResult2_4 (upval)
								UseStateResult2_4(p2)
							end, false)
						end,
						isDisabled = #UseStateResult1 < 3,
						isLoading = UseStateResult4
					}),
					DividerSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 11,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_900)
					}),
					SwitchInputDivider = ReactModule.createElement("Frame", {
						LayoutOrder = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						LabelContainer = ReactModule.createElement("Frame", {
							BackgroundTransparency = 0,
							BorderSizePixel = 0,
							ZIndex = 2,
							BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
							Position = UDim2.new(0.5, 0, 0, 0),
							AnchorPoint = Vector2.new(0.5, 0.5),
							AutomaticSize = Enum.AutomaticSize.XY
						}, {
							UIPadding = ReactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
								PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200),
								PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_50),
								PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_50)
							}),
							Label = ReactModule.createElement(Text, {
								Text = UseLocalizationResult.orText,
								fontStyle = UseTokensResult.Typography.LabelMedium,
								textStyle = UseTokensResult.Color.ActionStandard.Foreground,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Center,
								TextYAlignment = Enum.TextYAlignment.Center
							})
						}),
						Divider = ReactModule.createElement(Divider, {
							ZIndex = 1,
							variant = DividerVariant.Default,
							orientation = Orientation.Horizontal
						})
					}),
					SwitchInputButtonSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 13,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_700)
					}),
					SwitchInputButton = ReactModule.createElement(Button, {
						LayoutOrder = 14,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium,
						text = UseStateResult and UseLocalizationResult.useUsernameEmailInsteadText or UseLocalizationResult.usePhoneInsteadText,
						width = UDim.new(1, 0),
						onActivated = function()
							-- upvalues: EventServiceModule (upval), UseStateResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
							EventServiceModule.sendSwitchedInputEvent("", not UseStateResult, "identifierInput")
							UseStateResult2(not UseStateResult)
							UseStateResult2_1("")
						end,
						isDisabled = UseStateResult4
					})
				})
			})
		})
	})
end