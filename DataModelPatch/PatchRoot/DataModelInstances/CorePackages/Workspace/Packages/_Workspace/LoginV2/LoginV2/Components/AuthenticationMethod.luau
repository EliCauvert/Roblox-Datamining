local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local TextInput = require(Parent.Foundation).TextInput
local LoginActionTypeModule = require(LoginV2.Enums.LoginActionType)
local LoginContextModule = require(LoginV2.Context.LoginContext)
local LoginPageStateModule = require(LoginV2.Enums.LoginPageState)
local AuthenticationMethodTypeModule = require(LoginV2.Enums.AuthenticationMethodType)
local ConstantsModule = require(LoginV2.Components.Constants)
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local UIConstants = require(Parent.AuthCommon).Common.UIConstants

function AuthenticationMethod(p1)
	-- upvalues: ReactModule (copy), LoginContextModule (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), LoginActionTypeModule (copy), LoginPageStateModule (copy), UseLocalizationFunction (copy), AuthenticationMethodTypeModule (copy), StyledTextLabel (copy), TextInput (copy), AuthFormInteractionFunction (copy), EventStreamConstants (copy), UIConstants (copy), Button (copy), ConstantsModule (copy), StandardButtonSize (copy), ButtonType (copy), Images (copy)
	local UseContextResult = ReactModule.useContext(LoginContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local State = UseContextResult.state
	
	local function v22(Payload)
		-- upvalues: UseContextResult (copy), LoginActionTypeModule (upval), LoginPageStateModule (upval)
		UseContextResult.dispatch({
			type = LoginActionTypeModule.SetComponentState,
			data = {
				component = LoginPageStateModule.AuthenticationScreen,
				payload = Payload
			}
		})
	end
	
	local Password = State and State.componentState[LoginPageStateModule.AuthenticationScreen].password or ""
	
	local function _(Password)
		-- upvalues: v22 (copy)
		v22({ password = Password })
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local ErrorKey = State and State.componentState[LoginPageStateModule.AuthenticationScreen].errorKey or ""
	
	local _ = function(ErrorKey)
		-- upvalues: v22 (copy)
		v22({ errorKey = ErrorKey })
	end
	
	local ErrorType = State and State.componentState[LoginPageStateModule.AuthenticationScreen].errorType or ""
	local UseLocalizationResult = UseLocalizationFunction({
		passwordLabelText = "Authentication.Login.Label.Password",
		nextActionText = "Authentication.Login.Action.Next",
		usePasskeyActionText = "Authentication.Login.Action.UsePasskey",
		emailOneTimeCodeActionText = "Authentication.Login.Action.EmailACode",
		passwordErrorText = if ErrorKey == "" or ErrorType ~= AuthenticationMethodTypeModule.Password then nil else ErrorKey or nil
	})
	local Size200 = UseDesignTokensResult.Size.Size_200
	
	if p1.authMethod == AuthenticationMethodTypeModule.Password then
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, Size200) }),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
			}),
			PasswordLabel = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				richText = true,
				text = UseLocalizationResult.passwordLabelText,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextEmphasis
			}),
			PasswordField = ReactModule.createElement(TextInput, {
				LayoutOrder = 2,
				text = "",
				label = "",
				textInputType = if UseStateResult then Enum.TextInputType.PasswordShown else Enum.TextInputType.Password,
				width = UDim.new(1, 0),
				onChanged = function(Password)
					-- upvalues: ErrorKey (copy), ErrorType (copy), AuthenticationMethodTypeModule (upval), v22 (copy)
					if ErrorKey ~= "" and ErrorType == AuthenticationMethodTypeModule.Password then
						v22({ errorKey = "" })
					end
					v22({ password = Password })
				end,
				onFocusGained = function()
					-- upvalues: AuthFormInteractionFunction (upval), EventStreamConstants (upval)
					AuthFormInteractionFunction(EventStreamConstants.Context.LoginFormV2Auth, EventStreamConstants.Field.Password, nil, nil, nil)
				end,
				iconTrailing = {
					name = if UseStateResult then UIConstants.SHOW_PASSWORD_ICON else UIConstants.HIDE_PASSWORD_ICON,
					onActivated = function()
						-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
						UseStateResult2(not UseStateResult)
					end
				},
				isDisabled = p1.isLoginInProgress,
				textBoxRef = p1.textBoxRef
			}),
			ErrorTextSpacing = UseLocalizationResult.passwordErrorText and ReactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_100)
			}),
			ErrorTextLabel = UseLocalizationResult.passwordErrorText and ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 4,
				textWrapped = true,
				text = UseLocalizationResult.passwordErrorText,
				fontStyle = UseStyleResult.Font.BodySmall,
				colorStyle = UseStyleResult.Theme.Alert,
				automaticSize = Enum.AutomaticSize.XY
			}),
			SubmitButtonSpacing = ReactModule.createElement("Frame", {
				LayoutOrder = 5,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_400)
			}),
			SubmitButton = ReactModule.createElement(Button, {
				layoutOrder = 6,
				text = UseLocalizationResult.nextActionText,
				buttonTextOverride = ConstantsModule.getButtonTextOverrideConfig(),
				onActivated = function()
					-- upvalues: p1 (copy), Password (copy)
					p1.onSubmit(Password)
				end,
				standardSize = StandardButtonSize.Regular,
				buttonType = ButtonType.PrimaryContextual,
				isLoading = p1.isLoginInProgress,
				isDisabled = Password == ""
			})
		})
	elseif p1.authMethod == AuthenticationMethodTypeModule.Passkey then
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, Size200) }),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
			}),
			PasskeyButton = ReactModule.createElement(Button, {
				layoutOrder = 1,
				text = UseLocalizationResult.usePasskeyActionText,
				buttonTextOverride = ConstantsModule.getButtonTextOverrideConfig(),
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.onSubmit(nil)
				end,
				standardSize = StandardButtonSize.Regular,
				buttonType = if p1.isFirstItemInList then ButtonType.PrimaryContextual else ButtonType.Secondary,
				isLoading = p1.isLoginInProgress,
				icon = Images["icons/menu/passkey"]
			})
		})
	elseif p1.authMethod == AuthenticationMethodTypeModule.EmailOtp then
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, Size200) }),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
			}),
			EmailOtpButton = ReactModule.createElement(Button, {
				layoutOrder = 1,
				text = UseLocalizationResult.emailOneTimeCodeActionText,
				buttonTextOverride = ConstantsModule.getButtonTextOverrideConfig(),
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.onSubmit(nil)
				end,
				standardSize = StandardButtonSize.Regular,
				buttonType = if p1.isFirstItemInList then ButtonType.PrimaryContextual else ButtonType.Secondary,
				isLoading = p1.isLoginInProgress,
				icon = Images["icons/menu/email"]
			})
		})
	else
		error("Invalid auth method")
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	end
end

return AuthenticationMethod