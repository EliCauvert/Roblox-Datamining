local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AppPageModule = require(Modules.LuaApp.AppPage)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local EmailVerificationUpsellStateModule = require(script.Parent.EmailVerificationUpsellState)
local UpdateUserEmailModule = require(Modules.LuaApp.Thunks.Authentication.EmailVerification.UpdateUserEmail)
local SendVerificationEmailToUserModule = require(Modules.LuaApp.Thunks.Authentication.EmailVerification.SendVerificationEmailToUser)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local IsStringEmailModule = require(Modules.LuaApp.Util.isStringEmail)
local EmailVerificationUpsellStepModule = require(script.Parent.EmailVerificationUpsellStep)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local GetFStringPrivacyPolicyUrlModule = require(Modules.LuaApp.Flags.GetFStringPrivacyPolicyUrl)
local GetFFlagEnablePrivacyPolicyForLogoutUpsellModule = require(Modules.LuaApp.Flags.GetFFlagEnablePrivacyPolicyForLogoutUpsell)
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

local function _(p1)
	local EmailUpsellLockedIsLocalUserUnder13 = p1.emailUpsellLockedIsLocalUserUnder13
	
	return if EmailUpsellLockedIsLocalUserUnder13 == nil then p1.IsLocalUserUnder13 else EmailUpsellLockedIsLocalUserUnder13
end

ExtendResult.defaultProps = {
	addEmailOver13TextKey = "Feature.VerificationUpsell.Description.AddEmailTextOver13",
	addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.AddEmailTextUnder13",
	addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail",
	checkExistingEmailTitleKey = "Feature.VerificationUpsell.Heading.VerifyEmail",
	emailPlaceholderOver13Key = "Feature.VerificationUpsell.Label.EmailInputPlaceholderOver13",
	textLabelOver13Key = "Authentication.SignUp.Label.EmailAddress",
	emailPlaceholderUnder13Key = "Feature.VerificationUpsell.Label.EmailInputPlaceholderUnder13",
	emailPlaceholderUnder13KeyV2 = "Feature.VerificationUpsell.Label.EmailInputPlaceholderUnder13V2",
	useUpdatedModalDesign = false,
	eventContext = EventStreamConstantsModule.Context.VerificationUpsell
}

function ExtendResult.init(p1)
	-- upvalues: EmailVerificationUpsellStateModule (copy), EventStreamConstantsModule (copy), IsStringEmailModule (copy), GetFFlagEnablePrivacyPolicyForLogoutUpsellModule (copy), AppPageModule (copy), GetFStringPrivacyPolicyUrlModule (copy), TransitionAnimationModule (copy), UrlBuilder (copy), ButtonType (copy)
	p1.potentialEmailAddress = nil
	p1.password = nil
	p1.emailWasUpdated = false
	p1.state = {
		upsellState = if p1.props.emailAddress then EmailVerificationUpsellStateModule.PromptCheckEmail else EmailVerificationUpsellStateModule.PromptUpdateEmail,
		emailAddress = p1.props.emailAddress or ""
	}
	
	function p1.closeOverlay()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.closeCentralOverlay()
			p1.props.authEventAnalytics.reportModalDismissedWithSection(p1.props.eventContext, p1.props.origin, p1.props.section)
		end
	end
	
	function p1.onUpdateEmailSecondaryButtonPressed()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if p1.isMounted and p1.props.onUpdateEmailSecondaryButtonPressed then
			p1.props.onUpdateEmailSecondaryButtonPressed()
			p1.props.authEventAnalytics.reportInteractWithAction(p1.props.eventContext, "", EventStreamConstantsModule.ActionType.Click, p1.props.origin, p1.props.onUpdateEmailSecondaryButtonPressedEvent)
		end
	end
	
	function p1.onPasswordChangedCallback(p2)
		-- upvalues: p1 (copy)
		p1.password = p2.Text
	end
	
	function p1.onEmailChangedCallback(p2)
		-- upvalues: p1 (copy)
		p1.potentialEmailAddress = p2.Text
	end
	
	function p1.onResendEmailPressed()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if p1.isMounted then
			p1:setState({ isInResendEmailCooldown = true })
			p1.props.sendVerificationEmailToUser(p1.props.networking):andThen(function()
				-- upvalues: p1 (upval)
				spawn(function()
					-- upvalues: p1 (upval)
					wait(20)
					p1.resetResendEmailState(true)
				end)
			end):catch(function()
				-- upvalues: p1 (upval)
				p1.resetResendEmailState(false)
			end)
			p1.props.authEventAnalytics.reportInteractWithActionAndSection(p1.props.eventContext, "", EventStreamConstantsModule.ActionType.Click, p1.props.origin, EventStreamConstantsModule.Button.ResendEmailConfirmation, "verifyEmail")
		end
	end
	
	function p1.resetResendEmailState(p2)
		-- upvalues: p1 (copy)
		local FeatureVerificationUpsellMessageConfirmationEmailNotSent: string = if p2 then "" else "Feature.VerificationUpsell.Message.ConfirmationEmailNotSent"
		
		if p1.isMounted then
			if FeatureVerificationUpsellMessageConfirmationEmailNotSent ~= "" then
				p1.props.authEventAnalytics.reportErrorMessageShown(p1.props.eventContext, "", p1.props.origin)
			end
			p1:setState({
				isInResendEmailCooldown = false,
				errorMessageKey = FeatureVerificationUpsellMessageConfirmationEmailNotSent
			})
		end
	end
	
	function p1.onUpdateEmailSelected()
		-- upvalues: p1 (copy), EmailVerificationUpsellStateModule (upval), EventStreamConstantsModule (upval)
		if p1.isMounted then
			p1:setState({
				errorMessageKey = "",
				upsellState = EmailVerificationUpsellStateModule.PromptUpdateEmail
			})
			p1.props.authEventAnalytics.reportInteractWithActionAndSection(p1.props.eventContext, "", EventStreamConstantsModule.ActionType.Click, p1.props.origin, EventStreamConstantsModule.Button.ChangeEmail, "verifyEmail")
		end
	end
	
	function p1.onEmailFocused()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.props.authEventAnalytics.reportInteractWithActionAndSection(p1.props.eventContext, EventStreamConstantsModule.Field.Email, EventStreamConstantsModule.ActionType.Focus, p1.props.origin, "", p1.props.section)
	end
	
	function p1.onEmailUpdated()
		-- upvalues: p1 (copy), IsStringEmailModule (upval), EventStreamConstantsModule (upval), EmailVerificationUpsellStateModule (upval)
		if p1.isMounted then
			local IsStringEmailModule1 = IsStringEmailModule(p1.potentialEmailAddress)
			p1.props.authEventAnalytics.reportInteractWithActionAndSection(p1.props.eventContext, "", "", p1.props.origin, EventStreamConstantsModule.Button.Continue, p1.props.section)
			
			if IsStringEmailModule1 then
				p1:setState({ errorMessageKey = "" })
				local PotentialEmailAddress = p1.potentialEmailAddress
				p1.props.updateUserEmail(p1.props.networking, PotentialEmailAddress, nil):andThen(function()
					-- upvalues: p1 (upval), PotentialEmailAddress (copy), EmailVerificationUpsellStateModule (upval)
					if p1.isMounted then
						p1.emailWasUpdated = true
						
						if p1.props.successCallback then
							p1.props.successCallback(PotentialEmailAddress)
						end
						if p1.props.closeOnEmailUpdate then
							p1.closeOverlay()
							
							return
						end
						p1:setState({
							errorMessage = "",
							errorMessageKey = "",
							isInResendEmailCooldown = false,
							upsellState = EmailVerificationUpsellStateModule.PromptCheckEmail,
							emailAddress = PotentialEmailAddress
						})
					end
				end):catch(function(Err)
					-- upvalues: p1 (upval)
					if p1.isMounted then
						p1:setState({
							errorMessageKey = "",
							isInResendEmailCooldown = false,
							errorMessage = Err and Err.Message
						})
						p1.props.authEventAnalytics.reportModalShownWithSectionAndError(p1.props.eventContext, "errorMessage", p1.props.origin, p1.props.section, Err.ErrorCode)
					end
				end)
				
				return
			else
				p1:setState({
					errorMessageKey = "Feature.VerificationUpsell.Message.InvalidEmailAddress"
				})
				p1.props.authEventAnalytics.reportErrorMessageShown(p1.props.eventContext, "", p1.props.origin)
			end
		end
	end
	
	function p1.onPasswordEntered()
		-- upvalues: p1 (copy), EmailVerificationUpsellStateModule (upval)
		if p1.isMounted then
			p1:setState({ isInResendEmailCooldown = true })
			local PotentialEmailAddress = p1.potentialEmailAddress
			p1.props.updateUserEmail(p1.props.networking, PotentialEmailAddress, p1.password):andThen(function()
				-- upvalues: p1 (upval), EmailVerificationUpsellStateModule (upval), PotentialEmailAddress (copy)
				p1:setState({
					errorMessage = "",
					errorMessageKey = "",
					isInResendEmailCooldown = false,
					upsellState = EmailVerificationUpsellStateModule.PromptCheckEmail,
					emailAddress = PotentialEmailAddress
				})
			end):catch(function(Err)
				-- upvalues: p1 (upval)
				p1:setState({
					isInResendEmailCooldown = false,
					errorMessageKey = if Err.PasswordIncorrect then "Feature.VerificationUpsell.Message.WrongPassword" else "",
					errorMessage = Err.Message
				})
			end)
		end
	end
	
	function p1.shouldShowPrivacyPolicyLink(): boolean
		-- upvalues: GetFFlagEnablePrivacyPolicyForLogoutUpsellModule (upval), p1 (copy), EmailVerificationUpsellStateModule (upval)
		return GetFFlagEnablePrivacyPolicyForLogoutUpsellModule() and p1.state.upsellState == EmailVerificationUpsellStateModule.PromptUpdateEmail or false
	end
	
	function p1.onPrivacyPolicyLinkActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), AppPageModule (upval), GetFStringPrivacyPolicyUrlModule (upval), TransitionAnimationModule (upval)
		if p1.isMounted then
			p1.props.authEventAnalytics.reportModalActionWithSection(p1.props.eventContext, EventStreamConstantsModule.Field.PrivacyPolicy, "", p1.props.origin, p1.props.section)
			p1.props.navigateToPage({
				name = AppPageModule.GenericWebPage,
				detail = GetFStringPrivacyPolicyUrlModule(),
				extraProps = {
					title = "",
					transitionAnimation = TransitionAnimationModule.SlideInFromBottom
				}
			})
		end
	end
	
	function p1.onTermsOfServiceLinkActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), AppPageModule (upval), UrlBuilder (upval), TransitionAnimationModule (upval)
		if p1.isMounted then
			p1.props.authEventAnalytics.reportModalActionWithSection(p1.props.eventContext, EventStreamConstantsModule.Field.TermsOfService, "", p1.props.origin, p1.props.section)
			p1.props.navigateToPage({
				name = AppPageModule.GenericWebPage,
				detail = UrlBuilder.static.about.terms(),
				extraProps = {
					title = "",
					transitionAnimation = TransitionAnimationModule.SlideInFromBottom
				}
			})
		end
	end
	
	function p1.getLinks()
		-- upvalues: p1 (copy), EmailVerificationUpsellStateModule (upval)
		if p1.state.upsellState == EmailVerificationUpsellStateModule.PromptCheckEmail then
			local OnResendEmailPressed = if p1.state.isInResendEmailCooldown then nil else p1.onResendEmailPressed
			
			return if p1.props.useUpdatedModalDesign then {
				{
					textKey = "Feature.VerificationUpsell.Action.ChangeEmail",
					isPrimaryLink = false,
					onClicked = p1.onUpdateEmailSelected
				}
			} else {
				{
					textKey = "Feature.VerificationUpsell.Action.ResendConfirmationEmail",
					isPrimaryLink = true,
					onClicked = OnResendEmailPressed
				},
				{
					textKey = "Feature.VerificationUpsell.Action.ChangeEmail",
					isPrimaryLink = false,
					onClicked = p1.onUpdateEmailSelected
				}
			}
		else
			return nil
		end
	end
	
	function p1.getTitleTextKey()
		-- upvalues: p1 (copy), EmailVerificationUpsellStateModule (upval)
		return if p1.state.upsellState == EmailVerificationUpsellStateModule.PromptCheckEmail then if p1.password and p1.password ~= "" then "Feature.VerificationUpsell.Heading.VerifyEmail" else p1.props.checkExistingEmailTitleKey elseif p1.state.upsellState == EmailVerificationUpsellStateModule.PromptUpdateEmail then p1.props.addEmailTitleKey elseif p1.state.upsellState == EmailVerificationUpsellStateModule.PromptEnterPassword then p1.props.addEmailTitleKey else nil
	end
	
	function p1.getBodyTextKey()
		-- upvalues: p1 (copy), EmailVerificationUpsellStateModule (upval)
		if p1.state.upsellState == EmailVerificationUpsellStateModule.PromptCheckEmail then
			return {
				"Feature.VerificationUpsell.Description.VerifyEmailBody",
				emailAddress = p1.state.emailAddress
			}
		elseif p1.state.upsellState == EmailVerificationUpsellStateModule.PromptUpdateEmail then
			local Props = p1.props
			local EmailUpsellLockedIsLocalUserUnder13 = Props.emailUpsellLockedIsLocalUserUnder13
			
			return if if EmailUpsellLockedIsLocalUserUnder13 == nil then Props.IsLocalUserUnder13 else EmailUpsellLockedIsLocalUserUnder13 then p1.props.addEmailUnder13TextKey else p1.props.addEmailOver13TextKey
		else
			return if p1.state.upsellState == EmailVerificationUpsellStateModule.PromptEnterPassword then "Feature.VerificationUpsell.Description.EnterPassword" else nil
		end
	end
	
	local EmailPlaceholderUnder13KeyV2 = p1.props.renameParentEmailForVerificationUpsell and p1.props.emailPlaceholderUnder13KeyV2 or p1.props.emailPlaceholderUnder13Key
	local Props = p1.props
	local EmailUpsellLockedIsLocalUserUnder13 = Props.emailUpsellLockedIsLocalUserUnder13
	local Inverted = not (if EmailUpsellLockedIsLocalUserUnder13 == nil then Props.IsLocalUserUnder13 else EmailUpsellLockedIsLocalUserUnder13)
	p1.stateDisplayInfo = {
		[EmailVerificationUpsellStateModule.PromptCheckEmail] = {},
		[EmailVerificationUpsellStateModule.PromptUpdateEmail] = {
			primaryButtonTextKey = "Feature.VerificationUpsell.Action.Continue",
			termsOfServiceKey = "CommonUI.Features.Label.Terms",
			secondaryButtonTextKey = p1.props.updateEmailSecondaryButtonText,
			privacyPolicyKey = if p1.props.useUpdatedModalDesign then "CommonUI.Features.Label.Privacy" else "Feature.VerificationUpsell.Action.PrivacyPolicy",
			textFieldPlaceholderTextKey = Inverted and p1.props.emailPlaceholderOver13Key or EmailPlaceholderUnder13KeyV2,
			textFieldLabelTextKey = Inverted and p1.props.textLabelOver13Key or EmailPlaceholderUnder13KeyV2,
			onPrimaryButtonActivated = p1.onEmailUpdated,
			onSecondaryButtonActivated = p1.onUpdateEmailSecondaryButtonPressed,
			onChangeTextCallback = p1.onEmailChangedCallback,
			textInputType = Enum.TextInputType.NoSuggestions
		},
		[EmailVerificationUpsellStateModule.PromptEnterPassword] = {
			primaryButtonTextKey = "Feature.VerificationUpsell.Action.SendConfirmationEmail",
			textFieldPlaceholderTextKey = "Feature.VerificationUpsell.Label.PasswordInputPlaceholder",
			onPrimaryButtonActivated = p1.onPasswordEntered,
			onChangeTextCallback = p1.onPasswordChangedCallback,
			textInputType = Enum.TextInputType.Password
		}
	}
	
	if p1.props.useUpdatedModalDesign then
		p1.stateDisplayInfo[EmailVerificationUpsellStateModule.PromptUpdateEmail].primaryButtonType = ButtonType.PrimaryContextual
		p1.stateDisplayInfo[EmailVerificationUpsellStateModule.PromptUpdateEmail].secondaryButtonType = ButtonType.Secondary
		p1.stateDisplayInfo[EmailVerificationUpsellStateModule.PromptCheckEmail] = {
			primaryButtonTextKey = "Feature.VerificationUpsell.Action.ResendConfirmationEmail",
			secondaryButtonTextKey = "Feature.VerificationUpsell.Action.ContinueLogOut",
			onPrimaryButtonActivated = p1.onResendEmailPressed,
			onSecondaryButtonActivated = p1.onUpdateEmailSecondaryButtonPressed,
			primaryButtonType = ButtonType.Secondary,
			secondaryButtonType = ButtonType.Secondary
		}
	end
end

function ExtendResult.willUnmount(p1)
	p1.isMounted = false
	
	if not p1.emailWasUpdated and p1.props.failureCallback then
		p1.props.failureCallback()
	end
end

function ExtendResult.didMount(p1)
	p1.isMounted = true
	p1.props.authEventAnalytics.reportModalShownWithSection(p1.props.eventContext, p1.props.origin, p1.props.section)
end

function ExtendResult.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), EmailVerificationUpsellStepModule (copy)
	local StateDisplay = p1.stateDisplayInfo[p1.state.upsellState]
	local OnPrimaryButtonActivated = StateDisplay.onPrimaryButtonActivated
	local OnSecondaryButtonActivated = StateDisplay.onSecondaryButtonActivated
	local TermsOfServiceKey = StateDisplay.termsOfServiceKey
	local PrivacyPolicyKey = StateDisplay.privacyPolicyKey
	local TextInputType = StateDisplay.textInputType
	local OnChangeTextCallback = StateDisplay.onChangeTextCallback
	local PrimaryButtonType = StateDisplay.primaryButtonType
	local SecondaryButtonType = StateDisplay.secondaryButtonType
	local ErrorMessageKey = p1.state.errorMessageKey
	local Links = p1.getLinks()
	local config = {
		primaryButtonText = StateDisplay.primaryButtonTextKey,
		secondaryButtonText = StateDisplay.secondaryButtonTextKey,
		termsOfServiceLinkText = TermsOfServiceKey,
		privacyPolicyLinkText = PrivacyPolicyKey,
		placeholderText = StateDisplay.textFieldPlaceholderTextKey,
		title = p1.getTitleTextKey(),
		bodyText = p1.getBodyTextKey(),
		textFieldLabelText = StateDisplay.textFieldLabelTextKey
	}
	
	if ErrorMessageKey and ErrorMessageKey ~= "" then
		config.errorText = ErrorMessageKey
	end
	return WithStyleFunction(function(_)
		-- upvalues: WithLocalizationModule (upval), config (copy), RoactModule (upval), EmailVerificationUpsellStepModule (upval), PrimaryButtonType (copy), SecondaryButtonType (copy), TextInputType (copy), TermsOfServiceKey (copy), PrivacyPolicyKey (copy), p1 (copy), Links (copy), OnPrimaryButtonActivated (copy), OnSecondaryButtonActivated (copy), OnChangeTextCallback (copy)
		return WithLocalizationModule(config)(function(p2)
			-- upvalues: RoactModule (upval), EmailVerificationUpsellStepModule (upval), PrimaryButtonType (upval), SecondaryButtonType (upval), TextInputType (upval), TermsOfServiceKey (upval), PrivacyPolicyKey (upval), p1 (upval), Links (upval), OnPrimaryButtonActivated (upval), OnSecondaryButtonActivated (upval), OnChangeTextCallback (upval)
			return RoactModule.createElement(EmailVerificationUpsellStepModule, {
				title = p2.title,
				primaryButtonText = p2.primaryButtonText,
				secondaryButtonText = p2.secondaryButtonText,
				primaryButtonType = PrimaryButtonType,
				secondaryButtonType = SecondaryButtonType,
				bodyText = p2.bodyText,
				textInputType = TextInputType,
				textFieldPlaceholderText = p2.placeholderText,
				textFieldLabelText = p2.textFieldLabelText,
				termsOfServiceLinkKey = TermsOfServiceKey,
				privacyPolicyLinkKey = PrivacyPolicyKey,
				privacyPolicyLinkText = p2.privacyPolicyLinkText,
				errorMessage = p2.errorText or p1.state.errorMessage,
				links = Links,
				onPrimaryButtonActivated = OnPrimaryButtonActivated,
				onSecondaryButtonActivated = OnSecondaryButtonActivated,
				onPrivacyPolicyLinkActivated = p1.onPrivacyPolicyLinkActivated,
				onTermsOfServiceLinkActivated = p1.onTermsOfServiceLinkActivated,
				onChangeTextCallback = OnChangeTextCallback,
				onCloseClickedCallback = p1.closeOverlay,
				onEmailFocused = p1.onEmailFocused,
				isEmailModalCalledFromHomePage = p1.props.isEmailModalCalledFromHomePage,
				shouldShowPrivacyPolicyLink = p1.shouldShowPrivacyPolicyLink,
				useUpdatedModalDesign = p1.props.useUpdatedModalDesign
			})
		end)
	end)
end

return (RoactAppPolicy.connect(function(p1, _)
	return {
		renameParentEmailForVerificationUpsell = p1.getRenameParentEmailForVerificationUpsell()
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	authEventAnalytics = RoactAnalyticsAuthEventsModule
})((RoactRoduxModule.connect(function(p1, _)
	return {
		screenSize = p1.ScreenSize,
		IsLocalUserUnder13 = p1.IsLocalUserUnder13
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), UpdateUserEmailModule (copy), SendVerificationEmailToUserModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end,
		updateUserEmail = function(p1, p2, p3)
			-- upvalues: Callback (copy), UpdateUserEmailModule (upval)
			return Callback(UpdateUserEmailModule(p1, p2, p3))
		end,
		sendVerificationEmailToUser = function(p1)
			-- upvalues: Callback (copy), SendVerificationEmailToUserModule (upval)
			return Callback(SendVerificationEmailToUserModule(p1))
		end,
		navigateToPage = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownModule(p1))
		end
	}
end)(ExtendResult))))))