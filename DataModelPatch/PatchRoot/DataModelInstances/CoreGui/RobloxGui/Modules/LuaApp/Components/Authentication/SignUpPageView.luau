local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local UseTextSizeOffsetFunction = require(CorePackages.Packages.Foundation).Hooks.useTextSizeOffset
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseAnimatedScrollToSelectionFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useAnimatedScrollToSelection
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local UsernameValidationContextModule = require(Modules.LuaApp.Enum.UsernameValidationContext)
local _ = require(Modules.LuaApp.Components.Authentication.Enum.InputValidity)
local AuthBirthdayBarModule = require(Modules.LuaApp.Components.Authentication.AuthBirthdayBar)
local GenderDropdownSelectorModule = require(Modules.LuaApp.Components.Authentication.GenderDropdownSelector)
local BirthdateDropdownSelectorModule = require(Modules.LuaApp.Components.Authentication.BirthdateDropdownSelector)
local CollapsingTextInputValidatorModule = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
local SuggestionsFrameModule = require(Modules.LuaApp.Components.Authentication.SuggestionsFrame)
local UsernameSuggestorModule = require(Modules.LuaApp.Thunks.Authentication.UsernameSuggestor)
local SignUpGenderSelectorModule = require(Modules.LuaApp.Components.Authentication.SignUpGenderSelector)
local TitleAndParagraphModule = require(Modules.LuaApp.Components.Authentication.TitleAndParagraph)
local DisclaimerLinksModule = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
local ContactInfoFieldModule = require(Modules.LuaApp.Components.Authentication.ContactInfoField)
local BackgroundFill = AuthCommonModule.Components.BackgroundFill
local AuthBackgroundContainer = AuthCommonModule.Components.AuthBackgroundContainer
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseSignUpPageNavigationBindingsFunction = AuthCommonModule.Hooks.useSignUpPageNavigationBindings
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local GetFFlagEnableTextFieldContentTypeFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType
local GetFFlagRefactorAuthPageForTenFootModule = require(Modules.LuaApp.Flags.GetFFlagRefactorAuthPageForTenFoot)
local GetFFlagLuaAppEnable10ftSignUpViewFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnable10ftSignUpView
local GetFFlagEnableAuditForSsoFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSso
local GetFIntLuaLoginGenderSelectorModule = require(Modules.LuaApp.Flags.GetFIntLuaLoginGenderSelector)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local UseAuthBackgroundContainerVariantFunction = AuthCommonModule.Hooks.useAuthBackgroundContainerVariant
local _UDim2 = UDim2.new(0, 36, 0, 36)
local _Vector2 = Vector2.new(540, 1080)
local _Vector2_1 = Vector2.new(850, 1080)
local EnableUsernameNextSelectionDown = game:DefineFastFlag("EnableUsernameNextSelectionDown", false)
local AuthRefactorConsoleDisclaimerText = game:DefineFastFlag("AuthRefactorConsoleDisclaimerText", false)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseUiModeInfoFunction (copy), GetFFlagRefactorAuthPageForTenFootModule (copy), UiMode (copy), GetFFlagLuaAppEnable10ftSignUpViewFunction (copy), UseDesignTokensFunction (copy), UseAppPolicyModule (copy), UseLocalizationModule (copy), UseSelectorFunction (copy), FormFactor (copy), ReactModule (copy), ReactFocusNavigationModule (copy), UseSignUpPageNavigationBindingsFunction (copy), UseAuthBackgroundContainerVariantFunction (copy), AuthBackgroundContainer (copy), BackgroundFill (copy), GetFFlagEnableTextFieldContentTypeFunction (copy), AuthRefactorConsoleDisclaimerText (copy), UseTextSizeOffsetFunction (copy), UseAnimatedScrollToSelectionFunction (copy), FullscreenPageWithSafeAreaModule (copy), FFlagEnableLeftNavOnConsole (copy), ImageSetLabel (copy), GetImageDataFunction (copy), _Vector2_1 (copy), _Vector2 (copy), ImageSetButton (copy), _UDim2 (copy), Images (copy), FitTextLabelModule (copy), FitChildrenModule (copy), AuthBirthdayBarModule (copy), GetFFlagEnableAuditForSsoFunction (copy), BirthdateDropdownSelectorModule (copy), GenderDropdownSelectorModule (copy), ContactInfoFieldModule (copy), DateHelper (copy), CollapsingTextInputValidatorModule (copy), UsernameValidationContextModule (copy), EnableUsernameNextSelectionDown (copy), SuggestionsFrameModule (copy), UsernameSuggestorModule (copy), GetFIntLuaLoginGenderSelectorModule (copy), SignUpGenderSelectorModule (copy), Button (copy), ButtonType (copy), TitleAndParagraphModule (copy), DisclaimerLinksModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local IsUiModeMatch: boolean = GetFFlagRefactorAuthPageForTenFootModule() and UseUiModeInfoResult.uiMode == UiMode.TenFoot or UseUiModeInfoResult.uiMode == UiMode.VR
	local FFlagLuaAppEnable10ftSignUpView = GetFFlagLuaAppEnable10ftSignUpViewFunction() or UseUiModeInfoResult.uiMode == UiMode.VR
	local UseDesignTokensResult = if FFlagLuaAppEnable10ftSignUpView then UseDesignTokensFunction() else nil
	local SignUpView = if FFlagLuaAppEnable10ftSignUpView and UseDesignTokensResult then UseDesignTokensResult.LuaApps.SignUpView else nil
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getPlatformAccountName()
	end)
	local UseLocalizationModuleResult = UseLocalizationModule({
		signUpText = "Authentication.SignUp.Action.CreateAccount",
		usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse",
		passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder",
		unknownError = "Feature.Reauthentication.Message.Error.Default"
	})
	local IsUseSelectorResultMatch = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end) == FormFactor.WIDE
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusedGuiObjectResult = ReactFocusNavigationModule.useFocusedGuiObject()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseSignUpPageNavigationBindingsResult = UseSignUpPageNavigationBindingsFunction()
	local UseDefaultFocusBehaviorResult = nil
	local UseDefaultFocusBehaviorResult2 = nil
	
	if IsUiModeMatch then
		UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior()
	else
		UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior(UseSignUpPageNavigationBindingsResult)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end)
	local UseAuthBackgroundContainerVariantResult = UseAuthBackgroundContainerVariantFunction()
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseAuthBackgroundContainerVariantResult (copy), ReactModule (upval), AuthBackgroundContainer (upval), IsUseSelectorResultMatch (copy), UseStyleResult (copy), BackgroundFill (upval)
		return if UseAuthBackgroundContainerVariantResult then ReactModule.createElement(AuthBackgroundContainer, {
			showImage = IsUseSelectorResultMatch,
			fallbackBackgroundColor = UseStyleResult.Theme.BackgroundUIDefault.Color
		}) else ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = if IsUseSelectorResultMatch then 1 else 0,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color
		}, {
			Background = IsUseSelectorResultMatch and ReactModule.createElement(BackgroundFill, {
				Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
			}),
			Mask = IsUseSelectorResultMatch and ReactModule.createElement("ImageLabel", {
				ZIndex = 2,
				BackgroundTransparency = 0.5,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.new(0, 0, 0)
			})
		})
	end, {
		IsUseSelectorResultMatch,
		UseStyleResult,
		UseAuthBackgroundContainerVariantResult
	})
	local UseUsernameSuggestionsResult = p1.useUsernameSuggestions()
	local Birthday = p1.birthday
	local NewOnScreenKeyboardHeight = 0
	local YOffset = 0
	local IsOnScreenKeyboardHeightAbove = p1.onScreenKeyboardHeight > 0
	local UseVerifiedSignupResult = p1.useVerifiedSignup()
	local v1: number = if IsUseSelectorResultMatch and UseVerifiedSignupResult then 12 else 0
	local ShowDetailedError = true
	local ShowDetailedError1 = true
	local Inverted = not p1.validUsernameEntered()
	local SummaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithUsername"
	local SummaryErrorTextKey1 = "Authentication.SignUp.Label.ErrorsWithPassword"
	
	if Birthday then
		if Inverted then
			SummaryErrorTextKey1 = "Authentication.SignUp.Response.UsernameMustBeSetFirst"
			ShowDetailedError1 = false
		end
	else
		SummaryErrorTextKey = "Authentication.SignUp.Response.BirthdayMustBeSetFirst"
		SummaryErrorTextKey1 = SummaryErrorTextKey
		Inverted = true
		ShowDetailedError = false
	end
	if IsUseSelectorResultMatch then
		if IsOnScreenKeyboardHeightAbove then
			NewOnScreenKeyboardHeight = p1.onScreenKeyboardHeight + 10
		else
			NewOnScreenKeyboardHeight = 48
			YOffset = 24
		end
	end
	local PrerequisiteMet: boolean = if Birthday then true else false
	local Username = GetFFlagEnableTextFieldContentTypeFunction() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions
	local YOffset1 = 36
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header1.RelativeSize
	local ScaledBaseSize1 = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local Offset = 5
	local Offset1 = 1
	local ButtonTextOverride = nil
	local ParagraphTextKeys = { "Authentication.SignUp.Description.VerificationPage" }
	local ParagraphTextArgs = { {} }
	
	if IsUiModeMatch and UseAppPolicyModuleResult then
		if AuthRefactorConsoleDisclaimerText then
			ParagraphTextKeys = {
				{
					"Authentication.SignUp.Description.VerificationLinkingText",
					platform = UseAppPolicyModuleResult
				}
			}
		else
			ParagraphTextKeys = {
				"Authentication.SignUp.Description.VerificationLinkingText"
			}
			ParagraphTextArgs = { { platform = UseAppPolicyModuleResult } }
		end
	end
	if FFlagLuaAppEnable10ftSignUpView and SignUpView then
		YOffset = SignUpView.marginTop
		ScaledBaseSize1 = SignUpView.textCaptionHeaderSize
		ScaledBaseSize = SignUpView.textHeaderSize
		YOffset1 = SignUpView.buttonHeight
		Offset = SignUpView.contentPadding
		Offset1 = SignUpView.headerPadding
		ButtonTextOverride = {
			Size = UDim2.fromScale(1, 1),
			TextSize = SignUpView.buttonTextSize
		}
	end
	ReactModule.useEffect(function()
		-- upvalues: UseFocusedGuiObjectResult (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if UseFocusedGuiObjectResult and UseRefResult.current then
			UseFocusGuiObjectResult(UseRefResult.current)
		end
	end, {})
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseAnimatedScrollToSelectionResult, UseAnimatedScrollToSelectionResult2 = UseAnimatedScrollToSelectionFunction(Enum.ScrollingDirection.Y, NewOnScreenKeyboardHeight + 49 + UseTextSizeOffsetResult)
	
	return ReactModule.createElement(FullscreenPageWithSafeAreaModule, {
		includeStatusBar = true,
		BackgroundColor3 = if FFlagEnableLeftNavOnConsole and UseUiModeInfoResult.uiMode == UiMode.TenFoot then UseStyleResult.Theme.BackgroundDefault.Color else nil,
		BackgroundTransparency = if FFlagEnableLeftNavOnConsole and UseUiModeInfoResult.uiMode == UiMode.TenFoot then UseStyleResult.Theme.BackgroundDefault.Transparency else 1,
		buttonRef = UseDefaultFocusBehaviorResult2,
		renderFullscreenBackground = if IsUiModeMatch then nil else UseResult2
	}, {
		UserInputSink = p1.isSignUpInProgress and ReactModule.createElement("ImageButton", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Image = "",
			Size = UDim2.new(1, 0, 1, 0)
		}),
		Container = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, -NewOnScreenKeyboardHeight),
			Position = UDim2.new(0.5, 0, 0, YOffset),
			AnchorPoint = Vector2.new(0.5, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(9, 9, 9, 9),
			Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
			ImageColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
			ImageTransparency = if IsUiModeMatch then 1 else 0
		}, {
			ContainerListLayout = if FFlagLuaAppEnable10ftSignUpView then ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, Offset1)
			}) else nil,
			SizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = if IsUiModeMatch then _Vector2_1 else _Vector2 }),
			HeaderFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 48),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = if FFlagLuaAppEnable10ftSignUpView then Enum.AutomaticSize.Y else nil
			}, {
				BackButton = if UseUiModeInfoResult.uiMode == UiMode.VR or not FFlagLuaAppEnable10ftSignUpView then ReactModule.createElement(ImageSetButton, {
					Size = _UDim2,
					AutoButtonColor = false,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 12, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					ScaleType = Enum.ScaleType.Fit,
					Image = Images["icons/navigation/close"],
					ImageColor3 = UseStyleResult.Theme.UIEmphasis.Color,
					ImageTransparency = 0,
					[ReactModule.Event.Activated] = p1.navigateBack,
					ref = UseRefResult
				}) else nil,
				Title = UseLocalizationModuleResult.signUpText and ReactModule.createElement(FitTextLabelModule, {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 0, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					fitAxis = FitChildrenModule.FitAxis.Height,
					Text = UseLocalizationModuleResult.signUpText or "",
					Font = UseStyleResult.Font.CaptionHeader.Font,
					TextSize = ScaledBaseSize,
					TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Center
				})
			}),
			Divider = if FFlagLuaAppEnable10ftSignUpView then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0.5, 0, 0, 48),
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = UseStyleResult.Theme.UIEmphasis.Color
			}),
			SignUpContentFrame = ReactModule.createElement("ScrollingFrame", {
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasPosition = UseAnimatedScrollToSelectionResult,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollBarImageTransparency = 1,
				Position = UDim2.new(0.5, 0, 0, 49),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.new(1, 0, 1, -(49 + v1 + YOffset + UseTextSizeOffsetResult)),
				[ReactModule.Change.CanvasSize] = p1.onSignUpContentFrameCanvasSizeChange,
				[ReactModule.Event.SelectionChanged] = UseAnimatedScrollToSelectionResult2,
				ref = p1.signUpContentFrameRef,
				LayoutOrder = 3,
				Selectable = false,
				BackgroundTransparency = 1
			}, {
				ContentPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingTop = UDim.new(0, if IsUseSelectorResultMatch then 25 else 48)
				}),
				ListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, Offset)
				}),
				BirthdayBar = if IsUiModeMatch then nil else ReactModule.createElement(AuthBirthdayBarModule, {
					layoutOrder = 1,
					onBirthdaySelected = p1.onBirthdaySelected,
					onBirthdayFocused = p1.onBirthdayFocused,
					autoFocusOnMount = UseVerifiedSignupResult,
					buttonRef = UseDefaultFocusBehaviorResult,
					enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
				}),
				BirthdayGenderPicker = if IsUiModeMatch then ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 0, 140),
					ref = UseDefaultFocusBehaviorResult
				}, {
					BirthdayPicker = ReactModule.createElement(BirthdateDropdownSelectorModule, {
						layoutOrder = 1,
						onBirthdaySelected = p1.onBirthdaySelected,
						alignment = Enum.HorizontalAlignment.Left,
						enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
					}),
					GenderSelector = ReactModule.createElement(GenderDropdownSelectorModule, {
						layoutOrder = 2,
						onGenderChanged = p1.onGenderChanged,
						alignment = Enum.HorizontalAlignment.Right,
						enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
					})
				}) else nil,
				ContactInfoField = UseVerifiedSignupResult and ReactModule.createElement(ContactInfoFieldModule, {
					layoutOrder = 2,
					Under13 = Birthday and DateHelper:isRecentOrFutureDate(Birthday.Month, Birthday.Day, Birthday.Year + 13),
					SetContactMethod = p1.SetContactMethod,
					SetPhoneNumber = p1.SetPhoneNumber,
					SetEmail = p1.SetEmail,
					contactMethod = p1.contactMethod,
					phoneCountryCodeSelectorCallback = p1.phoneCountryCodeSelectorCallback
				}),
				BackgroundPanel = UseVerifiedSignupResult and ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 6)
				}, {
					LightPanel = ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(0, 100000, 0, 100000),
						Position = UDim2.new(0, 0, 1, 0),
						BackgroundColor3 = UseStyleResult.Theme.UIDefault.Color,
						AnchorPoint = Vector2.new(0.5, 0)
					})
				}),
				UsernameValidator = ReactModule.createElement(CollapsingTextInputValidatorModule, {
					layoutOrder = 4,
					titleTextKey = "Authentication.Login.Label.Username",
					summaryErrorTextKey = SummaryErrorTextKey,
					prerequisiteMet = PrerequisiteMet,
					textInputType = Username,
					onInputTextChanged = p1.onUsernameTextChanged,
					onInputTextValidated = UseUsernameSuggestionsResult and p1.onUsernameTextValidated or p1.onUsernameTextChanged,
					validator = p1.UsernameValidator,
					placeholderText = UseLocalizationModuleResult.usernamePlaceholder,
					validatorAdditionalProps = {
						birthday = Birthday and Birthday:FormatForEndpoint() or "",
						context = UsernameValidationContextModule.Signup
					},
					textBoxFocusedCallback = p1.onUsernameTextBoxFocused,
					textBoxFocusLostCallback = p1.onTextBoxFocusLost,
					focusedTextBoxPositionChangedCallback = p1.onFocusedTextBoxPositionChanged,
					returnKeyType = Enum.ReturnKeyType.Next,
					onReturnPressedFromOnScreenKeyboard = p1.onUsernameTextChangeCompletedFromKeyboard,
					onAnimationStateChangeCallback = p1.onAnimationStateChangeCallback,
					textBoxRef = p1.usernameTextFieldRef,
					pillClicked = UseStateResult,
					updatePillClicked = UseResult,
					resetPillClicked = UseResult1,
					issueCondition = p1.issueCondition,
					updateIssueCondition = p1.updateIssueCondition,
					loadingSuggestions = p1.loadingSuggestions,
					tokens = SignUpView,
					showDetailedError = ShowDetailedError,
					NextSelectionDown = if EnableUsernameNextSelectionDown and not UseUsernameSuggestionsResult then p1.passwordTextFieldRef else nil,
					enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
				}),
				SuggestionsFrame = UseUsernameSuggestionsResult and ReactModule.createElement(SuggestionsFrameModule, {
					layoutOrder = 4,
					textBoxRef = p1.usernameTextFieldRef,
					usernameValid = p1.usernameValid,
					birthday = Birthday and Birthday:FormatForEndpoint() or "",
					suggest = UsernameSuggestorModule,
					context = UsernameValidationContextModule.Signup,
					pillClicked = UseStateResult,
					updatePillClicked = UseResult,
					resetPillClicked = UseResult1,
					issueCondition = p1.issueCondition,
					usernameSuggestionClicked = p1.usernameSuggestionClicked,
					usernameSuggestionsShown = p1.usernameSuggestionsShown,
					shouldSuggest = p1.shouldSuggest,
					updateSuggestionControlState = p1.updateSuggestionControlState,
					useRefreshButton = p1.useRefreshButton,
					logRefreshButtonClicked = p1.logRefreshButtonClicked,
					loadSuggestions = p1.loadSuggestions,
					finishSuggestions = p1.finishSuggestions,
					loadingSuggestions = p1.loadingSuggestions
				}),
				PasswordValidator = ReactModule.createElement(CollapsingTextInputValidatorModule, {
					layoutOrder = 5,
					titleTextKey = "CommonUI.Messages.Label.Password",
					disabled = p1.birthdayFocused,
					summaryErrorTextKey = SummaryErrorTextKey1,
					prerequisiteMet = not Inverted,
					textInputType = Enum.TextInputType.Password,
					onInputTextChanged = p1.onPasswordTextChanged,
					onInputTextValidated = p1.onPasswordTextChanged,
					validator = p1.PasswordValidator,
					placeholderText = UseLocalizationModuleResult.passwordPlaceholder,
					validatorAdditionalProps = { username = p1.username },
					returnKeyType = Enum.ReturnKeyType.Next,
					textBoxFocusedCallback = p1.onPasswordTextBoxFocused,
					textBoxFocusLostCallback = p1.onTextBoxFocusLost,
					focusedTextBoxPositionChangedCallback = p1.onFocusedTextBoxPositionChanged,
					onReturnPressedFromOnScreenKeyboard = p1.onPasswordTextChangeCompletedFromKeyboard,
					onAnimationStateChangeCallback = p1.onAnimationStateChangeCallback,
					textBoxRef = p1.passwordTextFieldRef,
					centralOverlayBlocksInput = UseVerifiedSignupResult,
					captureFocusOnTapStart = not p1.isCountryCodeSearchVisible,
					tokens = SignUpView,
					showDetailedError = ShowDetailedError1,
					IsKeyboardOverlayUsed = not (UseUiModeInfoResult.uiMode == UiMode.VR),
					enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
				}),
				GenderSelector = if IsUiModeMatch then nil else GetFIntLuaLoginGenderSelectorModule() ~= 2 and ReactModule.createElement(SignUpGenderSelectorModule, {
					layoutOrder = 7,
					onGenderChanged = p1.onGenderChanged,
					enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
				}),
				Spacing = if IsUiModeMatch then nil else ReactModule.createElement("Frame", {
					LayoutOrder = 8,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 38)
				}),
				ErrorLabel = if p1.signUpError then ReactModule.createElement(FitTextLabelModule, {
					LayoutOrder = 9,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					Text = UseLocalizationModuleResult.unknownError,
					Font = UseStyleResult.Font.CaptionBody.Font,
					TextSize = ScaledBaseSize1,
					TextColor3 = UseStyleResult.Theme.Alert.Color,
					TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}) else nil,
				SignUpPageButton = ReactModule.createElement(Button, {
					layoutOrder = 10,
					buttonType = ButtonType.PrimaryContextual,
					size = UDim2.new(1, 0, 0, YOffset1),
					text = UseLocalizationModuleResult.signUpText,
					isDisabled = not p1.isSignUpButtonEnabled,
					isLoading = p1.isSignUpInProgress,
					onActivated = p1.onSignUpClick,
					buttonTextOverride = ButtonTextOverride
				}),
				DisclaimerText = ReactModule.createElement(TitleAndParagraphModule, {
					layoutOrder = 11,
					textXAlignment = Enum.TextXAlignment.Center,
					paragraphTextKeys = ParagraphTextKeys,
					paragraphTextArgs = ParagraphTextArgs,
					enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
				}),
				DisclaimerLinks = ReactModule.createElement(DisclaimerLinksModule, {
					LayoutOrder = 12,
					isDualLayout = FFlagLuaAppEnable10ftSignUpView,
					fillDirection = Enum.FillDirection.Horizontal,
					enableAuditContentCapture = GetFFlagEnableAuditForSsoFunction()
				}),
				ScrollPadding = IsOnScreenKeyboardHeightAbove and ReactModule.createElement("Frame", {
					LayoutOrder = 13,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, p1.onScreenKeyboardHeight * 2)
				})
			}),
			Footer = UseVerifiedSignupResult and (IsUseSelectorResultMatch and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 0, 12),
				Position = UDim2.new(0, 0, 1, -12)
			}, {
				Rounding = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 2, 0),
					Position = UDim2.new(0, 0, -1, 0),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = UseStyleResult.Theme.UIDefault.Color
				})
			}))
		})
	})
end