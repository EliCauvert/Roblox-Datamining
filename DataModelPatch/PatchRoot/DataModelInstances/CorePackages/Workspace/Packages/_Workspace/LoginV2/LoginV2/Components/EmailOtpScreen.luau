local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local TextInput = require(Parent.Foundation).TextInput
local LoginPageStateModule = require(LoginV2.Enums.LoginPageState)
local LoginContextModule = require(LoginV2.Context.LoginContext)
local LoginActionTypeModule = require(LoginV2.Enums.LoginActionType)
local UserIdentifierHeadingModule = require(LoginV2.Components.UserIdentifierHeading)
local ResendEmailOtpButtonModule = require(LoginV2.Components.ResendEmailOtpButton)
local NeedHelpButtonModule = require(LoginV2.Components.NeedHelpButton)
local ConstantsModule = require(LoginV2.Components.Constants)
local FFlagFixLoginV2LandscapeLayout = require(Parent.SharedFlags).FFlagFixLoginV2LandscapeLayout
local Constants = require(Parent.OtpLogin).Constants

function EmailOtpScreen(p1)
	-- upvalues: ReactModule (copy), LoginContextModule (copy), UseDesignTokensFunction (copy), UseStyleFunction (copy), LoginActionTypeModule (copy), LoginPageStateModule (copy), EventStreamConstants (copy), UseLocalizationFunction (copy), AuthButtonClickFunction (copy), UserInputService (copy), AuthPageloadFunction (copy), Constants (copy), FullscreenPageWithSafeArea (copy), FFlagFixLoginV2LandscapeLayout (copy), IconButton (copy), Images (copy), StyledTextLabel (copy), ConstantsModule (copy), UserIdentifierHeadingModule (copy), TextInput (copy), ResendEmailOtpButtonModule (copy), NeedHelpButtonModule (copy)
	local UseContextResult = ReactModule.useContext(LoginContextModule)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local State = UseContextResult.state
	local Utils = UseContextResult.utils
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UserIdentifier = State and State.userIdentifier or ""
	
	local function v29(Payload)
		-- upvalues: UseContextResult (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval)
		UseContextResult.dispatch({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.EmailOtpScreen,
				payload = Payload
			}
		})
	end
	
	local SessionToken = State and State.componentState[LoginPageStateModule.EmailOtpScreen].sessionToken or ""
	
	local function _(SessionToken)
		-- upvalues: v29 (copy)
		v29({ sessionToken = SessionToken })
	end
	
	local EmailOtp = State and State.componentState[LoginPageStateModule.EmailOtpScreen].emailOtp or ""
	
	local _ = function(EmailOtp)
		-- upvalues: v29 (copy)
		v29({ emailOtp = EmailOtp })
	end
	
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(EmailOtp)
	local ErrorKey = State and State.componentState[LoginPageStateModule.EmailOtpScreen].errorKey or ""
	
	local _ = function(p2)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2)
	end
	
	local config = {
		isLoginByOtp = true,
		setInProgress = UseStateResult2,
		setErrorKey = function(ErrorKey)
			-- upvalues: v29 (copy)
			v29({ errorKey = ErrorKey })
		end,
		navigation = p1.navigation,
		eventContext = EventStreamConstants.Context.LoginFormV2EmailOtp
	}
	local UseLocalizationResult = UseLocalizationFunction({
		emailOtpLabelText = "Authentication.Login.Label.EnterOneTimeCodeLoginHelp",
		signInHeadingText = "Authentication.Login.Heading.SignIn",
		errorText = if ErrorKey == "" then nil else ErrorKey
	})
	
	local function OnPress()
		-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), Utils (copy), SessionToken (copy), v29 (copy), config (copy)
		AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2EmailOtp, EventStreamConstants.Button.ResendCode, nil, nil)
		Utils.handleResendEmailOtp(SessionToken, function(SessionToken)
			-- upvalues: v29 (upval)
			v29({ sessionToken = SessionToken })
		end, config)
	end
	
	local _ = function()
		-- upvalues: UserInputService (upval)
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if FocusedTextBox then
			FocusedTextBox:ReleaseFocus()
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: AuthPageloadFunction (upval), EventStreamConstants (upval)
		AuthPageloadFunction(EventStreamConstants.Context.LoginFormV2EmailOtp)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), Constants (upval), UseStateResult2 (copy), UserInputService (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), v29 (copy), Utils (copy), SessionToken (copy), config (copy)
		if #UseStateResult1 == Constants.DEFAULT_CODE_LENGTH then
			UseStateResult2(true)
			local FocusedTextBox = UserInputService:GetFocusedTextBox()
			
			if FocusedTextBox then
				FocusedTextBox:ReleaseFocus()
			end
			AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2EmailOtp, EventStreamConstants.Button.OtpSubmit, nil, nil)
			v29({ emailOtp = UseStateResult1 })
			Utils.handleLoginWithOtp(SessionToken, UseStateResult1, nil, nil, config):finally(function()
				-- upvalues: v29 (upval)
				v29({ emailOtp = "" })
			end)
		end
	end, { UseStateResult1 })
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		Wrapper = ReactModule.createElement(if FFlagFixLoginV2LandscapeLayout then "ScrollingFrame" else "Frame", if FFlagFixLoginV2LandscapeLayout then {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y
		} else {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
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
						-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), v29 (copy), p1 (copy), LoginPageStateModule (upval)
						AuthButtonClickFunction(EventStreamConstants.Context.LoginFormV2EmailOtp, EventStreamConstants.Button.Back)
						v29({ errorKey = "" })
						v29({ emailOtp = "" })
						v29({ sessionToken = "" })
						p1.navigation.navigate(LoginPageStateModule.AuthenticationScreen)
					end,
					size = UDim2.new(0, 36, 0, 36),
					isDisabled = UseStateResult
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
					PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_400),
					PaddingBottom = if FFlagFixLoginV2LandscapeLayout then UDim.new(0, UseDesignTokensResult.Size.Size_800) else nil
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
				}),
				Heading = ReactModule.createElement(UserIdentifierHeadingModule, { layoutOrder = 1, userIdentifier = UserIdentifier }),
				OneTimeCodeLabel = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					text = UseLocalizationResult.emailOtpLabelText,
					fontStyle = UseStyleResult.Font.Body,
					colorStyle = UseStyleResult.Theme.TextEmphasis
				}),
				EmailOtpTextField = ReactModule.createElement(TextInput, {
					LayoutOrder = 3,
					label = "",
					text = EmailOtp,
					width = UDim.new(1, 0),
					onChanged = function(p2)
						-- upvalues: UseStateResult2_1 (copy)
						UseStateResult2_1(p2)
					end,
					isDisabled = UseStateResult,
					textInputType = Enum.TextInputType.OneTimePassword
				}),
				ErrorTextSpacing = UseLocalizationResult.errorText and ReactModule.createElement("Frame", {
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
				}),
				ErrorTextLabel = UseLocalizationResult.errorText and ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 5,
					textWrapped = true,
					text = UseLocalizationResult.errorText,
					fontStyle = UseStyleResult.Font.BodySmall,
					colorStyle = UseStyleResult.Theme.Alert,
					automaticSize = Enum.AutomaticSize.XY
				}),
				ButtonSpacing = ReactModule.createElement("Frame", {
					LayoutOrder = 6,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_400)
				}),
				ResendOtpButton = ReactModule.createElement(ResendEmailOtpButtonModule, {
					layoutOrder = 7,
					onPress = OnPress,
					isLoading = UseStateResult
				}),
				HelpButtonFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 8,
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
						textKey = "Authentication.Login.Action.NeedHelp",
						isDisabled = UseStateResult,
						originPage = EventStreamConstants.Context.LoginFormV2Auth,
						identifierAutofill = UserIdentifier
					})
				})
			})
		})
	})
end

return EmailOtpScreen