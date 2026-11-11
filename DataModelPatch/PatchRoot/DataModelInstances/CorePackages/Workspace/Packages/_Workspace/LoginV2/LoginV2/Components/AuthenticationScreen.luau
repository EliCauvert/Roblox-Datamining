local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local FitFrameModule = require(Parent.FitFrame)
local FFlagFixLoginV2LandscapeLayout = require(Parent.SharedFlags).FFlagFixLoginV2LandscapeLayout
local CryoModule = require(Parent.Cryo)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local AuthenticationMethodTypeModule = require(LoginV2.Enums.AuthenticationMethodType)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local Toast = UIBloxModule.App.Dialog.Toast
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local AuthenticationMethodModule = require(LoginV2.Components.AuthenticationMethod)
local NeedHelpButtonModule = require(LoginV2.Components.NeedHelpButton)
local UserIdentifierHeadingModule = require(LoginV2.Components.UserIdentifierHeading)
local UserIdentifierTypeModule = require(LoginV2.Enums.UserIdentifierType)
local LoginPageStateModule = require(LoginV2.Enums.LoginPageState)
local LoginContextModule = require(LoginV2.Context.LoginContext)
local LoginActionTypeModule = require(LoginV2.Enums.LoginActionType)
local ConstantsModule = require(LoginV2.Components.Constants)
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local GetUserByUsernameFunction = require(Parent.AuthCommon).Thunks.GetUserByUsername
local FixAuthScreenOrDividerOrder = game:DefineFastFlag("FixAuthScreenOrDividerOrder", false)

function AuthenticationScreen(p1)
	-- upvalues: ReactModule (copy), LoginContextModule (copy), UseDesignTokensFunction (copy), UseStyleFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), LoginActionTypeModule (copy), LoginPageStateModule (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), HttpService (copy), UserIdentifierTypeModule (copy), GetUserByUsernameFunction (copy), CryoModule (copy), AuthenticationMethodTypeModule (copy), AuthFormInteractionFunction (copy), AuthButtonClickFunction (copy), UseLocalizationFunction (copy), AuthenticationMethodModule (copy), FixAuthScreenOrDividerOrder (copy), StyledTextLabel (copy), Images (copy), FullscreenPageWithSafeArea (copy), Toast (copy), FFlagFixLoginV2LandscapeLayout (copy), FitFrameModule (copy), IconButton (copy), ConstantsModule (copy), UserIdentifierHeadingModule (copy), NeedHelpButtonModule (copy)
	local UseContextResult = ReactModule.useContext(LoginContextModule)
	local State = UseContextResult.state
	local Utils = UseContextResult.utils
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseBrowserTrackerExperimentResult = RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.LoginLayer }, function(p2)
		-- upvalues: AppBtidLayers (upval)
		return {
			shouldFilterCredentialsForPrefill = (p2[AppBtidLayers.LoginLayer] or {}).shouldFilterCredentialsForPrefill or false
		}
	end)
	
	local function v40(Payload)
		-- upvalues: UseContextResult (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval)
		UseContextResult.dispatch({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.AuthenticationScreen,
				payload = Payload
			}
		})
	end
	
	local function v41(Payload)
		-- upvalues: UseContextResult (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval)
		UseContextResult.dispatch({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.LoginScreenV2,
				payload = Payload
			}
		})
	end
	
	local ErrorType = State and State.componentState[LoginPageStateModule.AuthenticationScreen].errorType or nil
	local ErrorKey = State and State.componentState[LoginPageStateModule.AuthenticationScreen].errorKey or ""
	
	local function SetErrorKey(ErrorKey)
		-- upvalues: v40 (copy)
		v40({ errorKey = ErrorKey })
	end
	
	local function _(ErrorType)
		-- upvalues: v40 (copy)
		v40({ errorType = ErrorType })
	end
	
	local _ = function(Password)
		-- upvalues: v40 (copy)
		v40({ password = Password })
	end
	
	local function v47(SessionToken)
		-- upvalues: UseContextResult (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval)
		UseContextResult.dispatch({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.EmailOtpScreen,
				payload = { sessionToken = SessionToken }
			}
		})
	end
	
	local _ = function(SessionToken)
		-- upvalues: v47 (copy), p1 (copy), LoginPageStateModule (upval)
		v47(SessionToken)
		p1.navigation.navigate(LoginPageStateModule.EmailOtpScreen)
	end
	
	local _ = function()
		-- upvalues: v41 (copy)
		v41({
			userIdentifier = "",
			shouldAttemptCredentialPrefill = false
		})
	end
	
	local UserIdentifier = State and State.userIdentifier or ""
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: Utils (copy), State (copy), AuthPageloadFunction (upval), EventStreamConstants (upval), HttpService (upval)
		AuthPageloadFunction(EventStreamConstants.Context.LoginFormV2Auth, HttpService:JSONEncode({
			isAuthenticated = Utils.isUserAuthenticated(),
			userIdentifierType = State.userIdentifierType,
			authenticationMethods = table.concat(State.availableLoginMethods, ",")
		}))
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: State (copy), UserIdentifierTypeModule (upval), GetUserByUsernameFunction (upval), UseRoactServiceResult (copy), UserIdentifier (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if State.userIdentifierType == UserIdentifierTypeModule.Username then
			GetUserByUsernameFunction(UseRoactServiceResult, UserIdentifier)():andThen(function(Result)
				-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
				UseStateResult2(Result.id)
				UseStateResult2_1(Result.displayName)
			end):catch(function(_) end)
		end
	end, {})
	local config = {
		isLoginByOtp = false,
		setInProgress = UseStateResult2_2,
		setErrorKey = SetErrorKey,
		navigation = p1.navigation,
		eventContext = EventStreamConstants.Context.LoginFormV2Auth
	}
	local JoinResult = CryoModule.Dictionary.join(config, {
		onCredentialsPopupAbandoned = function()
			-- upvalues: UseRefResult (copy)
			spawn(function()
				-- upvalues: UseRefResult (upval)
				wait(0.1)
				
				if UseRefResult.current then
					UseRefResult.current.focus()
				end
			end)
		end
	})
	local ShouldShowAuthScreenCredentialsPopup = State and State.credentialsProtocolStatus.shouldShowAuthScreenCredentialsPopup
	local ShouldShowAuthScreenUserSpecificPasskeyPopup = State and State.credentialsProtocolStatus.shouldShowAuthScreenUserSpecificPasskeyPopup
	ReactModule.useEffect(function()
		-- upvalues: ShouldShowAuthScreenCredentialsPopup (copy), State (copy), Utils (copy), UseBrowserTrackerExperimentResult (copy), JoinResult (copy), UseContextResult (copy), LoginActionTypeModule (upval), ShouldShowAuthScreenUserSpecificPasskeyPopup (copy), CryoModule (upval), AuthenticationMethodTypeModule (upval), UseRefResult (copy)
		if ShouldShowAuthScreenCredentialsPopup then
			local Fido2Supported = State and State.credentialsProtocolStatus.fido2Supported
			local PasswordsSupported = State and State.credentialsProtocolStatus.passwordsSupported
			
			if State and State.credentialsProtocolStatus.v2InterfaceSupported then
				Utils.showGenericCredentialLoginPopup(Fido2Supported, PasswordsSupported, UseBrowserTrackerExperimentResult.shouldFilterCredentialsForPrefill, JoinResult)
			elseif Fido2Supported then
				Utils.showPasskeyLoginPopup(JoinResult, UseBrowserTrackerExperimentResult.shouldFilterCredentialsForPrefill, true)
			end
			UseContextResult.dispatch({
				type = LoginActionTypeModule.UpdateCredentialsProtocolStatus,
				data = {
					shouldShowAuthScreenCredentialsPopup = false,
					shouldShowAuthScreenUserSpecificPasskeyPopup = false
				}
			})
			
			return
		else
			if ShouldShowAuthScreenUserSpecificPasskeyPopup and CryoModule.List.find(State.availableLoginMethods, AuthenticationMethodTypeModule.Passkey) ~= nil then
				if State.credentialsProtocolStatus.fido2Supported then
					Utils.showPasskeyLoginPopup(JoinResult, true, true)
				end
				UseContextResult.dispatch({
					type = LoginActionTypeModule.UpdateCredentialsProtocolStatus,
					data = { shouldShowAuthScreenUserSpecificPasskeyPopup = false }
				})
				
				return
			elseif UseRefResult.current then
				UseRefResult.current.focus()
			end
		end
	end, {})
	local config1 = {
		[AuthenticationMethodTypeModule.Password] = function(p2)
			-- upvalues: UseStateResult2_2 (copy), AuthenticationMethodTypeModule (upval), v40 (copy), AuthFormInteractionFunction (upval), EventStreamConstants (upval), AuthButtonClickFunction (upval), Utils (copy), config (copy)
			if p2 ~= "" then
				UseStateResult2_2(true)
				v40({ errorType = AuthenticationMethodTypeModule.Password })
				v40({ errorKey = "" })
				AuthFormInteractionFunction(EventStreamConstants.Context.LoginFormV2Auth, EventStreamConstants.Field.Password, nil, nil, nil)
				AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Auth, EventStreamConstants.Button.Password, nil, nil)
				Utils.handleLoginWithFormData(nil, p2, nil, nil, nil, false, config)
			end
		end,
		[AuthenticationMethodTypeModule.Passkey] = function(_)
			-- upvalues: AuthenticationMethodTypeModule (upval), v40 (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval), Utils (copy), config (copy)
			v40({ errorType = AuthenticationMethodTypeModule.Passkey })
			v40({ errorKey = "" })
			AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Auth, EventStreamConstants.Button.Passkey, nil, nil)
			Utils.showPasskeyLoginPopup(config, true, false)
		end,
		[AuthenticationMethodTypeModule.EmailOtp] = function(_)
			-- upvalues: UseStateResult2_2 (copy), AuthenticationMethodTypeModule (upval), v40 (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval), v47 (copy), p1 (copy), LoginPageStateModule (upval), Utils (copy), config (copy)
			UseStateResult2_2(true)
			v40({ errorType = AuthenticationMethodTypeModule.EmailOtp })
			v40({ errorKey = "" })
			AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Auth, EventStreamConstants.Button.EmailOtp, nil, nil)
			Utils.handleSendEmailOtp(function(SessionToken)
				-- upvalues: UseStateResult2_2 (upval), v47 (upval), p1 (upval), LoginPageStateModule (upval)
				UseStateResult2_2(false)
				v47(SessionToken)
				p1.navigation.navigate(LoginPageStateModule.EmailOtpScreen)
			end, config)
		end
	}
	local UseLocalizationResult = UseLocalizationFunction({
		signInHeadingText = "Authentication.Login.Heading.SignIn",
		passkeyDescriptionText = "Authentication.Login.Description.PasskeyDescription",
		passkeyLoginIncompatibleText = "Authentication.Login.Description.PasskeyLoginIncompatibleDevice",
		orText = "Authentication.SignUp.Description.Or",
		toastErrorText = if ErrorKey == "" or ErrorType == AuthenticationMethodTypeModule.Password then nil else ErrorKey or nil
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), Images (upval), UseDesignTokensResult (copy)
		return {
			toastTitle = UseLocalizationResult.toastErrorText,
			iconImage = Images["icons/status/error_large"],
			iconSize = Vector2.new(UseDesignTokensResult.Size.Size_600, UseDesignTokensResult.Size.Size_600),
			iconColorStyle = {
				Transparency = 0,
				Color = UseDesignTokensResult.Color.System.Alert.Color3
			}
		}
	end, { UseLocalizationResult.toastErrorText })
	local IsAvailableLoginMethodMatch: boolean = #State.availableLoginMethods == 1 and State.availableLoginMethods[1] == AuthenticationMethodTypeModule.Password
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		ErrorToastFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.new(1, 0, 0.5, 0)
		}, {
			ErrorToast = UseLocalizationResult.toastErrorText and ReactModule.createElement(Toast, { duration = 3, toastContent = UseMemoResult })
		}),
		Wrapper = ReactModule.createElement(if FFlagFixLoginV2LandscapeLayout then "ScrollingFrame" else FitFrameModule.FitFrameVertical, if FFlagFixLoginV2LandscapeLayout then {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y
		} else {
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = if FFlagFixLoginV2LandscapeLayout then Enum.HorizontalAlignment.Center else nil
			}),
			Header = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				BackButton = ReactModule.createElement(IconButton, {
					layoutOrder = 1,
					icon = Images["icons/actions/cycleLeft"],
					onActivated = function()
						-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), v40 (copy), v41 (copy), p1 (copy), LoginPageStateModule (upval)
						AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2Auth, EventStreamConstants.Button.Back)
						v40({ errorKey = "" })
						v40({ errorType = nil })
						v40({ password = "" })
						v41({
							userIdentifier = "",
							shouldAttemptCredentialPrefill = false
						})
						p1.navigation.navigate(LoginPageStateModule.LoginScreenV2)
					end,
					size = UDim2.new(0, 36, 0, 36),
					isDisabled = UseStateResult3
				}),
				SignInHeadingFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AutomaticSize = Enum.AutomaticSize.X
				}, {
					SignInHeadingText = ReactModule.createElement(StyledTextLabel, {
						text = UseLocalizationResult.signInHeadingText,
						fontStyle = UseStyleResult.Font.Header1,
						colorStyle = UseStyleResult.Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Center
					})
				})
			}),
			ButtonSpacing = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_200)
			}),
			Content = ReactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UISizeConstraint = FFlagFixLoginV2LandscapeLayout and ReactModule.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(ConstantsModule.CONTENT_MAX_WIDTH, 1e999)
				}),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
					PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200),
					PaddingBottom = UDim.new(0, if FFlagFixLoginV2LandscapeLayout then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Size.Size_400),
					PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_400)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
				}),
				Heading = ReactModule.createElement(UserIdentifierHeadingModule, {
					layoutOrder = 1,
					userIdentifier = UserIdentifier,
					userId = UseStateResult,
					displayName = UseStateResult1
				}),
				AuthenticationComponents = ReactModule.createElement(FitFrameModule.FitFrameVertical, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					width = UDim.new(1, 0)
				}, ((function(Entry)
					-- upvalues: State (copy), CryoModule (upval), AuthenticationMethodTypeModule (upval), ReactModule (upval), AuthenticationMethodModule (upval), FixAuthScreenOrDividerOrder (upval), config1 (copy), UseStateResult3 (copy), UseStateResult2_2 (copy), UseRefResult (copy), UseDesignTokensResult (copy), StyledTextLabel (upval), UseLocalizationResult (copy), UseStyleResult (copy)
					if not State.credentialsProtocolStatus.fido2Supported and #Entry > 1 and CryoModule.List.find(Entry, AuthenticationMethodTypeModule.Passkey) ~= nil then
						Entry = CryoModule.List.filter(Entry, function(Passkey): boolean
							-- upvalues: AuthenticationMethodTypeModule (upval)
							return Passkey ~= AuthenticationMethodTypeModule.Passkey
						end)
					end
					local IsEntryMatch: boolean = #Entry > 1 and Entry[1] == AuthenticationMethodTypeModule.Password
					local MapResult = CryoModule.List.map(Entry, function(AuthMethod, p2: number)
						-- upvalues: ReactModule (upval), AuthenticationMethodModule (upval), FixAuthScreenOrDividerOrder (upval), IsEntryMatch (copy), config1 (upval), UseStateResult3 (upval), UseStateResult2_2 (upval), UseRefResult (upval)
						return ReactModule.createElement(AuthenticationMethodModule, {
							layoutOrder = if FixAuthScreenOrDividerOrder and IsEntryMatch and p2 > 1 then p2 + 1 else p2,
							isFirstItemInList = p2 == 1,
							authMethod = AuthMethod,
							onSubmit = config1[AuthMethod],
							isLoginInProgress = UseStateResult3,
							setIsLoginInProgress = UseStateResult2_2,
							textBoxRef = UseRefResult
						})
					end)
					
					if FixAuthScreenOrDividerOrder and IsEntryMatch or not FixAuthScreenOrDividerOrder and #Entry > 1 and Entry[1] == AuthenticationMethodTypeModule.Password then
						table.insert(MapResult, ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = if FixAuthScreenOrDividerOrder then 2 else 1.5,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UIPadding = ReactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
								PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_400)
							}),
							ListLayout = ReactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Center
							}),
							DividerText = ReactModule.createElement(StyledTextLabel, {
								layoutOrder = 1,
								text = UseLocalizationResult.orText,
								fontStyle = UseStyleResult.Font.Header2,
								colorStyle = UseStyleResult.Theme.TextDefault,
								textXAlignment = Enum.TextXAlignment.Center
							})
						}))
						
						return MapResult
					end
					if #Entry == 1 and Entry[1] == AuthenticationMethodTypeModule.Passkey then
						table.insert(MapResult, ReactModule.createElement("Frame", {
							LayoutOrder = 0,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UIPadding = ReactModule.createElement("UIPadding", {
								PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_400)
							}),
							TextLabel = ReactModule.createElement(StyledTextLabel, {
								layoutOrder = 0,
								fluidSizing = true,
								lineHeight = 1,
								text = if State.credentialsProtocolStatus.fido2Supported then UseLocalizationResult.passkeyDescriptionText else UseLocalizationResult.passkeyLoginIncompatibleText,
								fontStyle = UseStyleResult.Font.Body,
								colorStyle = UseStyleResult.Theme.TextDefault,
								automaticSize = Enum.AutomaticSize.XY
							})
						}))
					end
					return MapResult
				end)(State.availableLoginMethods))),
				HelpButtonFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					ListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					HelpButton = ReactModule.createElement(NeedHelpButtonModule, {
						layoutOrder = 1,
						isDisabled = UseStateResult3,
						originPage = EventStreamConstants.Context.LoginFormV2Auth,
						textKey = if IsAvailableLoginMethodMatch then "Authentication.Login.Label.ForgotYourPassword" else "Authentication.Login.Label.TroubleSigningIn",
						identifierAutofill = UserIdentifier
					})
				})
			})
		})
	})
end

return AuthenticationScreen