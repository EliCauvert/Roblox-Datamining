local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local TextBoxStateWrapper = AuthCommonModule.Components.TextBoxStateWrapper
local GenericTextBox = AuthCommonModule.Components.GenericTextBox
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local ColorsModule = require(Modules.LuaApp.Themes.Colors)
local PasswordBox = AuthCommonModule.Components.PasswordBox
local GenericTextButtonModule = require(Modules.LuaApp.Components.GenericTextButton)
local DisclaimerLinksModule = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
local LinkButton = UIBloxModule.App.Button.LinkButton
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local FFlagUseStandardFoundationButtonVariantModule = require(Modules.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), UseUiModeInfoFunction (copy), UseAppPolicyModule (copy), UseLocalizationModule (copy), RoactModule (copy), FitTextLabelModule (copy), FitChildrenModule (copy), ColorsModule (copy), TextBoxStateWrapper (copy), GenericTextBox (copy), AppFonts (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), PasswordBox (copy), UiMode (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), FFlagUseStandardFoundationButtonVariantModule (copy), GenericTextButtonModule (copy), LinkButton (copy), DisclaimerLinksModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local LoginView = UseDesignTokensResult.LuaApps.LoginView
	local Color = UseStyleResult.Theme.TextDefault.Color
	local Transparency = UseStyleResult.Theme.TextDefault.Transparency
	local Color1 = UseStyleResult.Theme.BackgroundUIContrast.Color
	local Transparency1 = UseStyleResult.Theme.BackgroundUIContrast.Transparency
	local Color2 = UseStyleResult.Theme.TextDefault.Color
	local UseLocalizationModuleResult = UseLocalizationModule({
		logInText = "Authentication.Login.Action.SignIn",
		passwordPlaceholder = "CommonUI.Messages.Label.Password",
		forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized",
		emailOtpButtonText = "Authentication.Login.Action.LogInEmailOneTimeCode",
		cvaluePlaceholder = if p1.forceLoginByUsername then "Authentication.Login.Label.Username" else "Authentication.Login.Label.UsernameEmailPhone",
		linkAccountText = {
			"Authentication.Login.Label.LinkAccountWarning",
			platform = UseAppPolicyModule(function(p2)
				return p2.getPlatformAccountName()
			end) or "Console"
		}
	})
	local ShowLinkAccountText = p1.showLinkAccountText
	local ShowDisclaimerLinks = p1.showDisclaimerLinks or p1.showDisclaimerButtons
	local NoShowCredentialHeader: boolean = p1.isDualLayout and not p1.showCredentialHeader
	local TextboxLabelHeight = nil
	local NewTextboxHeight = LoginView.textboxHeight * 2 + LoginView.loginContentsPadding
	
	if p1.isDualLayout then
		TextboxLabelHeight = LoginView.textboxLabelHeight
		NewTextboxHeight = if NoShowCredentialHeader then (LoginView.textboxHeight + TextboxLabelHeight + LoginView.textboxLabelPadding) * 2 + LoginView.loginContentsPadding else (LoginView.textboxHeight + TextboxLabelHeight) * 2 + LoginView.textboxLabelPadding + LoginView.loginContentsPadding
	end
	local TextboxLabelPadding = if p1.isDualLayout then LoginView.textboxLabelPadding else nil
	local TextboxTextSize = LoginView.textboxTextSize
	local Element = nil
	
	if p1.isDualLayout and p1.isTenFootUiMode then
		local LocalizedError = p1.localizedError or (p1.localizedErrorMessage or "")
		Element = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ErrorText = if p1.disableRegularLogin then nil else RoactModule.createElement(FitTextLabelModule, {
				TextWrapped = true,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height,
				AnchorPoint = Vector2.new(0, 0),
				Text = LocalizedError,
				Font = UseStyleResult.Font.Footer.Font,
				TextSize = if p1.isDualLayout then LoginView.errorTextSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextColor3 = ColorsModule.Red
			}, {
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, LoginView.loginContentsPadding) })
			}),
			ErrorPadding = if LocalizedError == "" then nil else RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, LoginView.errorTextPadding),
				PaddingBottom = UDim.new(0, LoginView.errorTextPadding)
			})
		})
	else
		Element = if p1.disableRegularLogin then nil else RoactModule.createElement(FitTextLabelModule, {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			fitAxis = FitChildrenModule.FitAxis.Height,
			AnchorPoint = Vector2.new(0, 0.5),
			Text = p1.localizedError or (p1.localizedErrorMessage or ""),
			Font = UseStyleResult.Font.Footer.Font,
			TextSize = if p1.isDualLayout then UseDesignTokensResult.FontSize.FontSize_250 else UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = ColorsModule.Red
		}, {
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, LoginView.loginContentsPadding) })
		})
	end
	return RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -LoginView.marginY, 0, 0),
		fitAxis = FitChildrenModule.FitAxis.Height,
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = if p1.showDisclaimerLinks then Enum.HorizontalAlignment.Center else nil
		}),
		UISizeConstraint = if p1.isDualLayout then nil else RoactModule.createElement("UISizeConstraint", {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(p1.maxSizeX, 1e999)
		}),
		UIPadding = if p1.isDualLayout then RoactModule.createElement("UIPadding", {
			PaddingLeft = nil,
			PaddingRight = if p1.isDualLayout then UDim.new(0, LoginView.credentialPaddingRight) else nil
		}) else nil,
		TextBoxes = if p1.disableRegularLogin then nil else RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, NewTextboxHeight)
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, LoginView.loginContentsPadding)
			}),
			CredentialHeader = if p1.showCredentialHeader then RoactModule.createElement("TextLabel", {
				RichText = true,
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Text = "<b>" .. UseLocalizationModuleResult.cvaluePlaceholder .. "</b>",
				Font = UseStyleResult.Font.Body.Font,
				TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize,
				TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				TextTransparency = Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(1, 0, 0, 0)
			}) else nil,
			CValue = RoactModule.createElement(TextBoxStateWrapper, {
				LayoutOrder = 2,
				LabelText = if NoShowCredentialHeader then UseLocalizationModuleResult.cvaluePlaceholder else nil,
				TextBoxLabelPadding = TextboxLabelPadding,
				TextBoxLabelTextSize = if NoShowCredentialHeader then TextboxLabelHeight else nil,
				ChildClass = GenericTextBox,
				Size = UDim2.new(1, 0, 0, LoginView.textboxHeight),
				buttonRef = p1.buttonRef,
				ChildProps = {
					ClearTextOnFocus = false,
					LayoutOrder = 1,
					ManualFocusRelease = true,
					Text = p1.cvalueText,
					PlaceholderText = UseLocalizationModuleResult.cvaluePlaceholder,
					Font = AppFonts.default:getDefault(),
					TextSize = TextboxTextSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					Color = Color1,
					Transparency = Transparency1,
					TextColor = Color,
					PlaceholderColor = Color2,
					TextTransparency = Transparency,
					PaddingX = LoginView.textboxPaddingX,
					PaddingY = LoginView.textboxPaddingY,
					TextBoxRef = p1.cvalueRef,
					TextInputType = p1.usernameTextInputType,
					openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil,
					ReturnKeyType = Enum.ReturnKeyType.Next,
					onChangeText = p1.onTextBoxesChanged,
					onReturnPressedFromOnScreenKeyboard = p1.onReturnPressedFromOnScreenKeyboardWhenFocusedOnCValue,
					onFocused = p1.cvalueTextBoxOnFocus,
					NextSelectionUp = p1.forgotLinkRef,
					NextSelectionDown = p1.passwordRef
				}
			}),
			PasswordTextBox = RoactModule.createElement(TextBoxStateWrapper, {
				LayoutOrder = 3,
				LabelText = if NoShowCredentialHeader then UseLocalizationModuleResult.passwordPlaceholder else nil,
				TextBoxLabelPadding = TextboxLabelPadding,
				TextBoxLabelTextSize = if NoShowCredentialHeader then TextboxLabelHeight else nil,
				ChildClass = PasswordBox,
				Size = UDim2.new(1, 0, 0, LoginView.textboxHeight),
				ChildProps = {
					ClearTextOnFocus = false,
					ManualFocusRelease = true,
					Text = p1.passwordText,
					PlaceholderText = UseLocalizationModuleResult.passwordPlaceholder,
					TextSize = TextboxTextSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					Color = Color1,
					Transparency = Transparency1,
					TextColor = Color,
					PlaceholderColor = Color2,
					TextTransparency = Transparency,
					PaddingX = LoginView.textboxPaddingX,
					PaddingY = LoginView.textboxPaddingY,
					IsKeyboardOverlayUsed = UseUiModeInfoResult.uiMode ~= UiMode.VR,
					ReturnKeyType = Enum.ReturnKeyType.Done,
					TextBoxRef = p1.passwordRef,
					onChangeText = p1.onTextBoxesChanged,
					onReturnPressedFromOnScreenKeyboard = p1.onReturnPressedFromOnScreenKeyboardWhenFocusedOnPassword,
					onFocused = p1.passwordTextBoxOnFocus,
					onToggleCallback = p1.passwordVisibilityToggleCallback,
					NextSelectionUp = p1.cvalueRef,
					NextSelectionDown = p1.loginButtonRef
				}
			})
		}),
		ErrorText = Element,
		ErrorPadding = if p1.isDualLayout and not ShowLinkAccountText and not p1.disableRegularLogin then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 10,
			Size = UDim2.new(1, 0, 0, LoginView.linkAccountPadding)
		}) else nil,
		LoginButton = if p1.disableRegularLogin then nil else RoactModule.createElement(Button, {
			LayoutOrder = 20,
			variant = ButtonVariant.SubEmphasis,
			size = ButtonSize.Large,
			text = UseLocalizationModuleResult.logInText,
			isDisabled = p1.loginButtonDisabled,
			isLoading = p1.isLoginInProgress,
			onActivated = p1.onLoginButtonActivated,
			NextSelectionUp = p1.passwordRef,
			NextSelectionDown = p1.emailOtpEnabled and p1.emailOtpRef or (p1.crossDeviceLoginEnabled and p1.crossDeviceButtonRef or p1.forgotLinkRef),
			width = UDim.new(1, 0),
			ref = p1.loginButtonRef
		}),
		ForgotPasswordPadding = if p1.isDualLayout then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 22,
			Size = UDim2.new(1, 0, 0, LoginView.loginContentsPadding)
		}) else nil,
		ForgotPasswordButton = if p1.isDualLayout then RoactModule.createElement(Button, {
			LayoutOrder = 24,
			variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
			size = ButtonSize.Large,
			text = UseLocalizationModuleResult.forgotText,
			onActivated = p1.onForgetButtonActivated,
			width = UDim.new(1, 0)
		}) else nil,
		EmailOtpPadding = p1.emailOtpEnabled and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 25,
			Size = UDim2.new(1, 0, 0, LoginView.loginContentsPadding)
		}),
		EmailOtpButton = p1.emailOtpEnabled and RoactModule.createElement(Button, {
			LayoutOrder = 26,
			variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
			size = ButtonSize.Large,
			text = UseLocalizationModuleResult.emailOtpButtonText,
			onActivated = p1.onEmailOtpActivated,
			width = UDim.new(1, 0),
			NextSelectionUp = p1.loginButtonRef or p1.crossDeviceButtonRef,
			NextSelectionDown = p1.crossDeviceLoginEnabled and p1.crossDeviceButtonRef or p1.forgotLinkRef,
			ref = p1.emailOtpRef
		}),
		Padding = if p1.crossDeviceLoginEnabled and not p1.disableRegularLogin then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 30,
			Size = UDim2.new(1, 0, 0, LoginView.loginContentsPadding)
		}) else nil,
		CrossDeviceLoginButton = p1.crossDeviceLoginEnabled and (if p1.loginWithExistingAccountVariantEnabled then RoactModule.createElement(GenericTextButtonModule, {
			Text = p1.quickLoginButtonText,
			Size = UDim2.new(1, 0, 0, LoginView.crossdeviceButtonHeight),
			onActivated = p1.onCrossDeviceLoginActivated,
			LayoutOrder = 40,
			Font = UseStyleResult.Font.Header2.Font,
			NextSelectionUp = p1.emailOtpEnabled and p1.emailOtpRef or p1.loginButtonRef,
			NextSelectionDown = p1.forgotLinkRef,
			TextSize = LoginView.loginTextSize,
			themeSettings = {
				Transparency = 0,
				OnPressTransparency = 0.3,
				Color = UseDesignTokensResult.Color.ActionEmphasis.Background.Color3,
				OnPressColor = UseDesignTokensResult.Color.ActionEmphasis.Background.Color3,
				Text = { Transparency = 0, Color = ColorsModule.White },
				Border = { Hidden = true, Transparency = 1 }
			},
			[RoactModule.Ref] = p1.crossDeviceButtonRef
		}) else RoactModule.createElement(Button, {
			LayoutOrder = 40,
			variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
			size = ButtonSize.Large,
			text = p1.quickLoginButtonText,
			onActivated = p1.onCrossDeviceLoginActivated,
			width = UDim.new(1, 0),
			NextSelectionUp = p1.emailOtpEnabled and p1.emailOtpRef or p1.loginButtonRef,
			NextSelectionDown = p1.forgotLinkRef,
			ref = p1.crossDeviceButtonRef
		})),
		LinkAccountPadding = if ShowLinkAccountText then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 43,
			Size = UDim2.new(1, 0, 0, LoginView.linkAccountPadding)
		}) else nil,
		LinkAccountLabel = if ShowLinkAccountText then RoactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 45,
			Text = UseLocalizationModuleResult.linkAccountText,
			TextSize = UseDesignTokensResult.FontSize.FontSize_250,
			Font = UseStyleResult.Font.Footer.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
			TextColor3 = UseStyleResult.Theme.TextMuted.Color,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, LoginView.loginContentsPadding) })
		}) else nil,
		Forgot = if p1.showForgotButton then RoactModule.createElement(LinkButton, {
			fontStyle = "CaptionSubHeader",
			colorStyleDefault = "TextDefault",
			colorStyleHover = "TextDefault",
			layoutOrder = 48,
			text = UseLocalizationModuleResult.forgotText,
			size = UDim2.new(0, 0, 0, LoginView.forgotLinkHeight),
			onActivated = p1.onForgetButtonActivated
		}) else nil,
		DisclaimerPadding = if ShowDisclaimerLinks then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 50,
			Size = UDim2.new(1, 0, 0, LoginView.disclaimerPadding)
		}) else nil,
		DisclaimerLinks = if ShowDisclaimerLinks then RoactModule.createElement(DisclaimerLinksModule, {
			LayoutOrder = 60,
			isDualLayout = p1.showDisclaimerButtons
		}) else nil
	})
end