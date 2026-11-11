local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AuthCommonModule = require(Parent.AuthCommon)
local RegisterPreauthPasskeyFunction = AuthCommonModule.Thunks.RegisterPreauthPasskey
local FinishARPreauthPasskeyRegistrationFunction = AuthCommonModule.Thunks.FinishARPreauthPasskeyRegistration
local Logger = require(Parent.Loggers).Logger
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local ModalStateModule = require(AccountRecovery.Enums.ModalState)
local AccountRecoveryActionTypeModule = require(AccountRecovery.Enums.AccountRecoveryActionType)
local ConstantsModule = require(AccountRecovery.Components.Constants)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseTokensFunction (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), Logger (copy), AccountRecoveryActionTypeModule (copy), ModalStateModule (copy), RegisterPreauthPasskeyFunction (copy), FinishARPreauthPasskeyRegistrationFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), Dialog (copy), DialogSize (copy), Text (copy), ButtonVariant (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), Logger (upval)
		Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
			-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
			UseStateResult2(Result.isAvailable or false)
			UseStateResult2_1(false)
		end):catch(function(Err)
			-- upvalues: Logger (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
			Logger:warning("Error checking for available credential types. Error: {}", Err)
			UseStateResult2(false)
			UseStateResult2_1(false)
		end)
	end, {})
	
	local function v28()
		-- upvalues: UseContextResult (copy), AccountRecoveryActionTypeModule (upval), ModalStateModule (upval), p1 (copy)
		UseContextResult.dispatch({
			type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
			data = {
				modalStateAndProps = {
					modalState = ModalStateModule.UPDATE_EMAIL,
					props = {
						email = p1.email,
						onPasswordResetSuccess = p1.onPasswordResetSuccess
					}
				}
			}
		})
	end
	
	local function v29()
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), RegisterPreauthPasskeyFunction (upval), UseRoactServiceResult (copy), p1 (copy), FinishARPreauthPasskeyRegistrationFunction (upval), UseContextResult (copy), v28 (copy), ConstantsModule (upval)
		if not UseStateResult3 then
			UseStateResult2_2(true)
			UseStateResult2_3("")
			RegisterPreauthPasskeyFunction(UseRoactServiceResult, p1.username):andThen(function(Result)
				-- upvalues: FinishARPreauthPasskeyRegistrationFunction (upval), UseRoactServiceResult (upval), UseContextResult (upval), p1 (upval)
				return FinishARPreauthPasskeyRegistrationFunction(UseRoactServiceResult, UseContextResult.state.recoverySessionId, Result.sessionId, p1.userId, Result.result, true)
			end):andThen(function()
				-- upvalues: UseStateResult2_2 (upval), p1 (upval), v28 (upval)
				UseStateResult2_2(false)
				
				if p1.shouldUpdateEmail then
					v28()
					
					return
				else
					p1.onPasswordResetSuccess()
				end
			end):catch(function(_)
				-- upvalues: UseStateResult2_2 (upval), UseStateResult2_3 (upval), ConstantsModule (upval)
				UseStateResult2_2(false)
				UseStateResult2_3(ConstantsModule.UnknownErrorKey)
			end)
			
			return
		end
	end
	
	local function _()
		-- upvalues: p1 (copy), v28 (copy)
		if p1.shouldUpdateEmail then
			v28()
			
			return
		else
			p1.onPasswordResetSuccess()
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		addPasskeyHeadingText = "Authentication.AccountRecovery.Heading.EnhancedProtectionPostRecoveryPasskey",
		passkeyNotSupportedHeadingText = "Authentication.AccountRecovery.Heading.EnhancedProtectionProgramPostRecoveryNoPasskey",
		passkeyNotSupportedBodyText = "Authentication.AccountRecovery.Description.DeviceDoesNotSupportPasskey",
		addPasskeyButtonText = "Authentication.AccountRecovery.Action.AddAPasskey",
		skipButtonText = "Authentication.AccountRecovery.Action.SkipAddingPasskey",
		okButtonText = "Authentication.AccountRecovery.Action.Ok",
		addPasskeyBodyText = {
			"Authentication.AccountRecovery.Description.EnhancedProtectionAddPasskey",
			lineBreak = "\n"
		},
		requestErrorText = if UseStateResult4 == "" then nil else UseStateResult4
	})
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = DialogSize.Small
	}, {
		DialogTitle = not UseStateResult1 and ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 2,
			text = UseStateResult and UseLocalizationResult.addPasskeyHeadingText or UseLocalizationResult.passkeyNotSupportedHeadingText
		}),
		DialogContent = not UseStateResult1 and ReactModule.createElement(Dialog.Content, { LayoutOrder = 3 }, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			DialogText = ReactModule.createElement(Dialog.Text, {
				LayoutOrder = 1,
				Text = UseStateResult and UseLocalizationResult.addPasskeyBodyText or UseLocalizationResult.passkeyNotSupportedBodyText
			}),
			ErrorText = if UseStateResult4 == "" then nil else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				TextWrapped = true,
				Text = UseLocalizationResult.requestErrorText or "",
				fontStyle = UseTokensResult.Typography.CaptionSmall,
				textStyle = UseTokensResult.Color.System.Alert,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		}),
		DialogActionsPasskeySupported = not UseStateResult1 and (UseStateResult and ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					text = UseLocalizationResult.addPasskeyButtonText,
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: v29 (copy)
						v29()
					end
				},
				{
					text = UseLocalizationResult.skipButtonText,
					variant = ButtonVariant.Standard,
					onActivated = function()
						-- upvalues: p1 (copy), v28 (copy)
						if p1.shouldUpdateEmail then
							v28()
							
							return
						else
							p1.onPasswordResetSuccess()
						end
					end
				}
			}
		})),
		DialogActionsPasskeyNotSupported = not UseStateResult1 and (not UseStateResult and ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 5,
			actions = {
				{
					text = UseLocalizationResult.okButtonText,
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: p1 (copy), v28 (copy)
						if p1.shouldUpdateEmail then
							v28()
							
							return
						else
							p1.onPasswordResetSuccess()
						end
					end
				}
			}
		}))
	})
end