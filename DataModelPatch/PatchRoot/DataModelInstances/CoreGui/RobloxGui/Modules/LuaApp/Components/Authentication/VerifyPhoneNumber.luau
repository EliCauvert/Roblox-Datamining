local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInputService = game:GetService("UserInputService")
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local BackDisableStoreModule = require(CorePackages.Workspace.Packages.BackDisableStore)
local Common = Modules.Common
local RoactModule = require(Common.Roact)
local RoactRoduxModule = require(Common.RoactRodux)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local AdjacentTextAndLinkModule = require(Modules.LuaApp.Components.AdjacentTextAndLink)
local FloodcheckTextAndLinkModule = require(Modules.LuaApp.Components.Authentication.FloodcheckTextAndLink)
local CodeBoxModule = require(Modules.LuaApp.Components.Authentication.CodeBox)
local SetBackNavigationDisabledModule = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local LinkButton = UIBloxModule.App.Button.LinkButton
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local GetVerifiedSignupChallengeModule = require(Modules.LuaApp.Thunks.Authentication.GetVerifiedSignupChallenge)
local VerifyPhoneNumberCodeModule = require(Modules.LuaApp.Thunks.Authentication.VerifyPhoneNumberCode)
local FFlagUseBackDisableSignalStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBackDisableSignalStore
local VerifyPhoneNumber = RoactModule.PureComponent:extend("VerifyPhoneNumber")
local OnScreenKeyboardWindowModule = require(Modules.LuaApp.Components.OnScreenKeyboardWindow)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local _UDim2 = UDim2.new(0, 36, 0, 36)
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
VerifyPhoneNumber.defaultProps = { phoneNumber = "" }

function VerifyPhoneNumber.init(p1)
	-- upvalues: GetVerifiedSignupChallengeModule (copy), EventStreamConstantsModule (copy), UserInputService (copy)
	p1:setState({
		errorText = "",
		hasMadeTooManyResendCodeAttempts = false,
		codeBoxesValue = "",
		isContinuingInProgress = false,
		challenge = p1.props.challenge
	})
	
	function p1.updateIsContinuingInProgress(IsContinuingInProgress)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), IsContinuingInProgress (copy)
			local IsContinuingInProgress1 = p1.state.isContinuingInProgress
			
			if p1.isMounted and IsContinuingInProgress1 ~= IsContinuingInProgress then
				p1:setState({ isContinuingInProgress = IsContinuingInProgress })
			end
		end)
	end
	
	function p1.onResendButtonActivated()
		-- upvalues: p1 (copy), GetVerifiedSignupChallengeModule (upval), EventStreamConstantsModule (upval)
		if not p1.state.isContinuingInProgress then
			GetVerifiedSignupChallengeModule(p1.props.networking, p1.props.deliveryTarget):andThen(function(Result)
				-- upvalues: p1 (upval)
				p1:setState({ challenge = Result.challenge })
			end, function(p2)
				-- upvalues: p1 (upval)
				if p2 == "Authentication.TwoStepVerification.Response.TooManyAttempts" then
					p1.props.showTooManyAttemptsErrorToast(p2)
					p1:setState({ hasMadeTooManyResendCodeAttempts = true })
					
					return
				else
					p1.props.showErrorToast()
				end
			end)
			p1.props.authAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.PhoneVerification, EventStreamConstantsModule.Field.ResendCode, EventStreamConstantsModule.ActionType.Click, "", "")
			
			return
		end
	end
	
	function p1.handlePhoneNumberVerificationSequence(CodeBoxesValue)
		-- upvalues: p1 (copy), UserInputService (upval), EventStreamConstantsModule (upval)
		local Networking = p1.props.networking
		local VerifyCodeFunction = p1.props.verifyCode
		local SetBackNavigationDisabledFunction: (any) -> () = p1.props.setBackNavigationDisabled
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if FocusedTextBox ~= nil then
			FocusedTextBox:ReleaseFocus()
		end
		SetBackNavigationDisabledFunction(true)
		VerifyCodeFunction(Networking, CodeBoxesValue, p1.state.challenge):andThen(function(Result)
			-- upvalues: SetBackNavigationDisabledFunction (copy), p1 (upval)
			SetBackNavigationDisabledFunction(false)
			p1.props.verifyPhoneNumberCallback(Result.voucher)
			p1.props.closeAlert()
		end, function(ErrorText)
			-- upvalues: SetBackNavigationDisabledFunction (copy), p1 (upval), EventStreamConstantsModule (upval)
			SetBackNavigationDisabledFunction(false)
			
			if p1.isMounted then
				p1:setState({ codeBoxesValue = "", errorText = ErrorText })
			end
			if ErrorText == "Authentication.TwoStepVerification.Label.InvalidCode" then
				p1.props.authAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.PhoneVerification, EventStreamConstantsModule.Field.InvalidCode, EventStreamConstantsModule.ActionType.Shown, "", "")
			end
			p1.updateIsContinuingInProgress(false)
		end)
	end
	
	function p1.onContinueButtonActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if #p1.state.codeBoxesValue < 6 then return end
		if not p1.state.isContinuingInProgress then
			p1.updateIsContinuingInProgress(true)
			p1.handlePhoneNumberVerificationSequence(p1.state.codeBoxesValue)
			p1.props.authAnalytics.reportButtonClicked(EventStreamConstantsModule.Context.PhoneVerification, EventStreamConstantsModule.Button.Continue)
			
			return
		end
	end
	
	function p1.onUseEmailClicked()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.props.closeAlert()
		p1.props.useEmailOptionClickedCallback()
		p1.props.authAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.PhoneVerification, EventStreamConstantsModule.Field.UseEmail, EventStreamConstantsModule.ActionType.Click, "", "")
	end
	
	function p1:onFocusLost(p2, Input)
		-- upvalues: p1 (copy)
		if p2 or Input and Input.KeyCode == Enum.KeyCode.Return then
			p1.onContinueButtonActivated()
		end
	end
	
	function p1.onValueChanged(CodeBoxesValue)
		-- upvalues: p1 (copy)
		if p1.state.codeBoxesValue ~= CodeBoxesValue and p1.isMounted then
			p1:setState({ errorText = "", codeBoxesValue = CodeBoxesValue })
			
			return
		end
	end
	
	p1.invisibleTextBoxDidGainFocus = false
	
	function p1.onInvisibleTextBoxFocused(TextBox)
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if p1.state.isContinuingInProgress then
			TextBox:ReleaseFocus()
		end
		if not p1.invisibleTextBoxDidGainFocus then
			p1.invisibleTextBoxDidGainFocus = true
		end
		p1.props.authAnalytics.reportInteractWithAction(EventStreamConstantsModule.Context.PhoneVerification, EventStreamConstantsModule.Field.VerificationCode, EventStreamConstantsModule.ActionType.Focus, "", "")
	end
end

function VerifyPhoneNumber.didMount(p1)
	p1.isMounted = true
end

function VerifyPhoneNumber.willUnmount(p1)
	p1.isMounted = false
	
	if p1.keyboardVisibleChanged then
		p1.keyboardVisibleChanged:disconnect()
		p1.keyboardVisibleChanged = nil
	end
end

function VerifyPhoneNumber.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), FormFactor (copy), RoactModule (copy), OnScreenKeyboardWindowModule (copy), FitChildrenModule (copy), ImageSetButton (copy), _UDim2 (copy), IconsNavigationClose (copy), AppFonts (copy), LinkButton (copy), AdjacentTextAndLinkModule (copy), FloodcheckTextAndLinkModule (copy), CodeBoxModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	local ErrorText = if p1.state.errorText == "" then nil else p1.state.errorText or nil
	local HasMadeTooManyResendCodeAttempts = p1.state.hasMadeTooManyResendCodeAttempts
	local Number = Enum.TextInputType.Number
	pcall(function()
		-- upvalues: Number (ref)
		Number = Enum.TextInputType.OneTimePassword
	end)
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), ErrorText (copy), p1 (copy), FormFactor (upval), RoactModule (upval), OnScreenKeyboardWindowModule (upval), FitChildrenModule (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), AppFonts (upval), LinkButton (upval), AdjacentTextAndLinkModule (upval), HasMadeTooManyResendCodeAttempts (copy), FloodcheckTextAndLinkModule (upval), CodeBoxModule (upval), Number (ref), Button (upval), ButtonVariant (upval), ButtonSize (upval)
		return WithLocalizationModule({
			verifyPhoneNumber = "Feature.VerificationUpsell.Label.VerifyPhoneNumber",
			enterCode = "Feature.VerificationUpsell.Label.EnterCode",
			changePhoneNumber = "Feature.VerificationUpsell.Action.ChangeNumber",
			didNotReceive = "Authentication.TwoStepVerification.Label.DidNotReceive",
			resend = "Authentication.TwoStepVerification.Label.Resend",
			continueText = "Authentication.SignUp.Label.Continue",
			codeBoxPlaceholder = "Authentication.TwoStepVerification.Label.CodeInputPlaceholderText",
			useEmail = "Feature.VerificationUpsell.Action.UserEmail",
			localizedError = ErrorText
		})(function(p3)
			-- upvalues: p1 (upval), FormFactor (upval), p2 (copy), RoactModule (upval), OnScreenKeyboardWindowModule (upval), FitChildrenModule (upval), ImageSetButton (upval), _UDim2 (upval), IconsNavigationClose (upval), AppFonts (upval), LinkButton (upval), AdjacentTextAndLinkModule (upval), HasMadeTooManyResendCodeAttempts (upval), FloodcheckTextAndLinkModule (upval), CodeBoxModule (upval), Number (upval), ErrorText (upval), Button (upval), ButtonVariant (upval), ButtonSize (upval)
			local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
			local v1 = #p1.state.codeBoxesValue == 6
			local Transparency = 1
			local _UDim2_1 = UDim2.new(0, 0, 0.5, 0)
			local _Vector2 = Vector2.new(0, 0.5)
			
			if not IsFormFactorMatch then
				Transparency = p2.Theme.BackgroundDefault.Transparency
				_UDim2_1 = UDim2.new(0, 0, 1, 0)
				_Vector2 = Vector2.new(0, 1)
			end
			return RoactModule.createElement(OnScreenKeyboardWindowModule, {
				Contents = {
					UISizeConstraint = IsFormFactorMatch and RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }) or nil,
					VerifyPhoneNumberContents = RoactModule.createElement(FitChildrenModule.FitImageLabel, {
						Image = "LuaApp/buttons/buttonFill",
						BorderSizePixel = 0,
						Visible = true,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height,
						Position = _UDim2_1,
						BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
						BackgroundTransparency = Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(9, 9, 9, 9),
						ImageColor3 = p2.Theme.BackgroundDefault.Color,
						ImageTransparency = p2.Theme.BackgroundDefault.Transparency,
						AnchorPoint = _Vector2
					}, {
						UIListLayout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center
						}),
						HeaderFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0) }, {
							BackButton = RoactModule.createElement(ImageSetButton, {
								Size = _UDim2,
								AutoButtonColor = false,
								BorderSizePixel = 0,
								BackgroundTransparency = 1,
								Position = UDim2.new(0, 10, 0, -35),
								AnchorPoint = Vector2.new(0, 0),
								ScaleType = Enum.ScaleType.Fit,
								Image = IconsNavigationClose,
								ImageColor3 = p2.Theme.UIEmphasis.Color,
								[RoactModule.Event.Activated] = p1.props.closeAlert
							})
						}),
						Header = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 48)
						}, {
							TextLabel = RoactModule.createElement("TextLabel", {
								TextSize = 20,
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -40, 0, 28),
								Position = UDim2.new(0, 20, 0.5, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								TextColor3 = Color3.new(1, 1, 1),
								TextXAlignment = Enum.TextXAlignment.Left,
								Font = AppFonts.default:getBold(),
								Text = p3.verifyPhoneNumber
							}),
							LinkButton = RoactModule.createElement(LinkButton, {
								fontStyle = "Footer",
								colorStyleDefault = "TextEmphasis",
								colorStyleHover = "TextEmphasis",
								size = UDim2.fromScale(0, 1),
								text = p3.useEmail,
								onActivated = p1.onUseEmailClicked,
								position = UDim2.new(0.7, 0, 0.05, 0)
							})
						}),
						Messages = RoactModule.createElement(FitChildrenModule.FitFrame, {
							BorderSizePixel = 0,
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 81),
							fitAxis = FitChildrenModule.FitAxis.Height,
							AnchorPoint = Vector2.new(0.5, 0),
							BackgroundColor3 = p2.Theme.BackgroundMuted.Color or Color3.new(0.09411764705882353, 0.09803921568627451, 0.10588235294117647)
						}, {
							UIListLayout = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								SortOrder = Enum.SortOrder.LayoutOrder,
								Padding = UDim.new(0, 10)
							}),
							UIPadding = RoactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 10),
								PaddingBottom = UDim.new(0, 10),
								PaddingLeft = UDim.new(0, 20),
								PaddingRight = UDim.new(0, 20)
							}),
							Help = RoactModule.createElement(AdjacentTextAndLinkModule, {
								LayoutOrder = 2,
								fontStyle = "Footer",
								linkColorStyle = "TextEmphasis",
								Width = UDim.new(1, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								textLabelColor = p2.Theme.TextDefault.Color,
								textLabelText = string.gsub(p3.enterCode, "{phoneNumber}", p1.props.phoneNumber),
								linkText = p3.changePhoneNumber,
								onActivated = p1.props.closeAlert
							}),
							Resend = not HasMadeTooManyResendCodeAttempts and RoactModule.createElement(FloodcheckTextAndLinkModule, {
								LayoutOrder = 3,
								fontStyle = "Footer",
								linkColorStyle = "TextEmphasis",
								Width = UDim.new(1, 0),
								textLabelColor = p2.Theme.TextDefault.Color,
								textLabelText = p3.didNotReceive,
								linkText = p3.resend,
								textButtonEnabled = not p1.state.isContinuingInProgress,
								onActivated = p1.onResendButtonActivated
							}),
							TryEmail = HasMadeTooManyResendCodeAttempts and RoactModule.createElement(FloodcheckTextAndLinkModule, {
								LayoutOrder = 3,
								fontStyle = "Footer",
								linkColorStyle = "TextEmphasis",
								Width = UDim.new(1, 0),
								textLabelColor = p2.Theme.TextDefault.Color,
								textLabelText = p3.didNotReceive,
								linkText = p3.useEmail,
								textButtonEnabled = not p1.state.isContinuingInProgress,
								onActivated = p1.onUseEmailClicked
							})
						}),
						Form = RoactModule.createElement(FitChildrenModule.FitFrame, {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 0),
							fitAxis = FitChildrenModule.FitAxis.Height
						}, {
							UIListLayout = RoactModule.createElement("UIListLayout", {
								FillDirection = Enum.FillDirection.Vertical,
								SortOrder = Enum.SortOrder.LayoutOrder,
								Padding = UDim.new(0, 10)
							}),
							UIPadding = RoactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 15),
								PaddingBottom = UDim.new(0, 15),
								PaddingLeft = UDim.new(0, 20),
								PaddingRight = UDim.new(0, 20)
							}),
							CodeBoxesAndErrorContainer = RoactModule.createElement(FitChildrenModule.FitFrame, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, 0),
								fitAxis = FitChildrenModule.FitAxis.Height
							}, {
								UIListLayout = RoactModule.createElement("UIListLayout", {
									FillDirection = Enum.FillDirection.Vertical,
									SortOrder = Enum.SortOrder.LayoutOrder,
									Padding = UDim.new(0, 5)
								}),
								CodeBoxes = RoactModule.createElement(CodeBoxModule, {
									characterCount = 6,
									LayoutOrder = 1,
									textFilter = "%D",
									ManualFocusRelease = true,
									PlaceholderText = string.gsub(p3.codeBoxPlaceholder, "{.-}", 6),
									TextInputType = Number,
									errorState = ErrorText ~= nil,
									shouldFocus = not p1.state.isContinuingInProgress,
									onFocused = p1.onInvisibleTextBoxFocused,
									onFocusLost = p1.onFocusLost,
									onValueChanged = p1.onValueChanged
								}),
								ErrorText = ErrorText and RoactModule.createElement("TextLabel", {
									TextSize = 12,
									BackgroundTransparency = 1,
									LayoutOrder = 2,
									Size = UDim2.new(1, 0, 0, 17),
									Text = p3.localizedError or "",
									Font = AppFonts.default:getDefault(),
									TextXAlignment = Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									TextColor3 = Color3.new(0.9686274509803922, 0.29411764705882354, 0.3215686274509804)
								})
							}),
							ContinueButton = RoactModule.createElement(Button, {
								LayoutOrder = 3,
								variant = ButtonVariant.SubEmphasis,
								size = ButtonSize.Large,
								text = p3.continueText,
								isDisabled = not v1,
								isLoading = p1.state.isContinuingInProgress,
								onActivated = p1.onContinueButtonActivated,
								width = UDim.new(1, 0)
							})
						})
					})
				}
			})
		end)
	end)
end

return (RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor }
end, function(Callback)
	-- upvalues: FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), SetBackNavigationDisabledModule (copy), VerifyPhoneNumberCodeModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), CloseCentralOverlayModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), SetNetworkingErrorToastModule (copy)
	return {
		setBackNavigationDisabled = function(p1)
			-- upvalues: FFlagUseBackDisableSignalStore (upval), BackDisableStoreModule (upval), Callback (copy), SetBackNavigationDisabledModule (upval)
			return if FFlagUseBackDisableSignalStore then BackDisableStoreModule.setDisabled(p1) else Callback(SetBackNavigationDisabledModule(p1))
		end,
		verifyCode = function(p1, p2, p3)
			-- upvalues: Callback (copy), VerifyPhoneNumberCodeModule (upval)
			return Callback(VerifyPhoneNumberCodeModule(p1, p2, p3))
		end,
		navigateToPage = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownModule(p1))
		end,
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		showTooManyAttemptsErrorToast = function(ToastMessage)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
			return Callback(SetCurrentToastMessageModule({
				toastType = ToastTypeModule.NetworkingError,
				toastMessage = ToastMessage
			}))
		end,
		showErrorToast = function()
			-- upvalues: Callback (copy), SetNetworkingErrorToastModule (upval)
			return Callback(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	authAnalytics = RoactAnalyticsAuthEventsModule
})(VerifyPhoneNumber))))