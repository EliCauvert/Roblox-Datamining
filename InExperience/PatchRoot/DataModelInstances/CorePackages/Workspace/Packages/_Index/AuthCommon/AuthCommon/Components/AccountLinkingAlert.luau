local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local GuiService = game:GetService("GuiService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local WithStyleFunction = UIBloxModule.Style.withStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local Text = require(Parent.Foundation).Text
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local IncompatibleAccountsSupportLink = game:DefineFastString("IncompatibleAccountsSupportLink", "https://help.roblox.com/hc/articles/360000334523-Xbox-One-App-Trouble-logging-into-Roblox-account")
local AccountLinkingAlertTypeModule = require(AuthCommon.Enums.AccountLinkingAlertType)

local function AccountLinkingAlert(p1) --[[ Line: 51 ]]
	-- upvalues: ButtonType (copy), UseScreenSizeFunction (copy), ReactModule (copy), Text (copy), WithStyleFunction (copy), InteractiveAlert (copy)
	local List = {}
	
	if p1.secondaryButtonText and p1.secondaryButtonCallback then
		table.insert(List, {
			buttonType = ButtonType.Secondary,
			props = {
				text = p1.secondaryButtonText,
				onActivated = function() --[[ Line: 59 ]]
					-- upvalues: p1 (copy)
					p1.secondaryButtonCallback()
				end
			}
		})
	end
	if p1.primaryButtonText and p1.primaryButtonCallback then
		table.insert(List, {
			buttonType = ButtonType.PrimarySystem,
			props = {
				text = p1.primaryButtonText,
				onActivated = function() --[[ Line: 71 ]]
					-- upvalues: p1 (copy)
					p1.primaryButtonCallback()
				end
			}
		})
	end
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 80 ]]
		-- upvalues: p1 (copy), ReactModule (upval), Text (upval)
		return if p1.footerText and p1.footerCallback then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Text = ReactModule.createElement(Text, {
				Text = p1.footerText,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				onActivated = p1.footerCallback
			})
		}) else nil
	end, { p1.footerText, p1.footerCallback })
	
	return WithStyleFunction(function(_) --[[ Line: 99 ]]
		-- upvalues: ReactModule (upval), InteractiveAlert (upval), p1 (copy), List (copy), UseResult (copy), UseScreenSizeResult (copy)
		return ReactModule.createElement(InteractiveAlert, {
			isRoactGamepadEnabled = false,
			title = p1.titleText,
			bodyText = p1.bodyText,
			buttonStackInfo = { buttons = List },
			footerContent = UseResult,
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = UseScreenSizeResult
		})
	end)
end

local function useIncompatibleAccountsAlertProps(p1) --[[ Line: 114 ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GuiService (copy), NotificationType (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), AppPage (copy), Default (copy), IncompatibleAccountsSupportLink (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 118 ]]
		return p2.getPlatformAccountName()
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Authentication.Login.Heading.IncompatibleAccounts",
		secondaryButtonText = "Authentication.Login.Button.UseDifferentRobloxAccount",
		footerText = "Authentication.Login.Label.LearnMore",
		bodyText = {
			"Authentication.Login.Response.AlreadyLinked",
			platform = UseAppPolicyResult
		},
		primaryButtonText = {
			"Authentication.Login.Button.CloseAndSwitchPlatformAccount",
			platformAccountName = UseAppPolicyResult
		}
	})
	
	return {
		titleText = UseLocalizationResult.titleText,
		bodyText = if p1.userFacingMessage then p1.userFacingMessage else UseLocalizationResult.bodyText,
		primaryButtonText = UseLocalizationResult.primaryButtonText,
		secondaryButtonText = UseLocalizationResult.secondaryButtonText,
		primaryButtonCallback = ReactModule.useCallback(function() --[[ Line: 133 ]]
			-- upvalues: GuiService (upval), NotificationType (upval), p1 (copy), UseDispatchResult (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval)
			GuiService:BroadcastNotification("", NotificationType.NATIVE_EXIT)
			
			if p1.closeCentralOverlayThunk then
				UseDispatchResult(p1.closeCentralOverlayThunk())
			end
			AuthButtonClickFunction(EventStreamConstants.Context.AccountLinking, EventStreamConstants.Button.PrimaryButton)
		end, { p1.closeCentralOverlayThunk }),
		secondaryButtonCallback = ReactModule.useCallback(function() --[[ Line: 141 ]]
			-- upvalues: UseNavigationResult (copy), AppPage (upval), p1 (copy), UseDispatchResult (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval)
			UseNavigationResult.navigate(AppPage.Landing)
			
			if p1.closeCentralOverlayThunk then
				UseDispatchResult(p1.closeCentralOverlayThunk())
			end
			AuthButtonClickFunction(EventStreamConstants.Context.AccountLinking, EventStreamConstants.Button.SecondaryButton)
		end, { UseNavigationResult, p1.closeCentralOverlayThunk }),
		footerText = UseLocalizationResult.footerText,
		footerCallback = ReactModule.useCallback(function() --[[ Line: 149 ]]
			-- upvalues: Default (upval), IncompatibleAccountsSupportLink (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval)
			Default:openURL(IncompatibleAccountsSupportLink)
			AuthButtonClickFunction(EventStreamConstants.Context.AccountLinking, EventStreamConstants.Button.Support)
		end, {}),
		closeCentralOverlayThunk = p1.closeCentralOverlayThunk
	}
end

local function IncompatibleAccountsAlert(p1) --[[ Line: 167 ]]
	-- upvalues: useIncompatibleAccountsAlertProps (copy), ReactModule (copy), AccountLinkingAlert (copy)
	return ReactModule.createElement(AccountLinkingAlert, (useIncompatibleAccountsAlertProps(p1)))
end

local function useRetryLogInAlertProps(p1) --[[ Line: 172 ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAppPolicyFunction (copy), AccountLinkingAlertTypeModule (copy), UseLocalizationFunction (copy), ReactModule (copy), AppPage (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 176 ]]
		return p2.getPlatformAccountName()
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Authentication.SignUp.Heading.RetryLogIn",
		primaryButtonText = "Authentication.SignUp.Button.RetryLogIn",
		bodyText = if p1.alertType == AccountLinkingAlertTypeModule.RetryLogInAlreadyLinked then {
			"Authentication.SignUp.Description.AccountAlreadyLinked",
			platformAccountName = UseAppPolicyResult
		} elseif p1.alertType == AccountLinkingAlertTypeModule.RetryLogInConnectionFailure then "Authentication.Login.Error.PlatformAccountConnectionFailure" else "Authentication.SignUp.Response.ErrorTryAgain"
	})
	
	return {
		titleText = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText,
		primaryButtonText = UseLocalizationResult.primaryButtonText,
		primaryButtonCallback = ReactModule.useCallback(function() --[[ Line: 196 ]]
			-- upvalues: UseNavigationResult (copy), AppPage (upval), p1 (copy), UseDispatchResult (copy)
			UseNavigationResult.navigate(AppPage.PlatformAccountRouter)
			
			if p1.closeCentralOverlayThunk then
				UseDispatchResult(p1.closeCentralOverlayThunk())
			end
		end, { UseNavigationResult, p1.closeCentralOverlayThunk }),
		closeCentralOverlayThunk = p1.closeCentralOverlayThunk
	}
end

local function RetryLogInAlert(p1) --[[ Line: 212 ]]
	-- upvalues: useRetryLogInAlertProps (copy), ReactModule (copy), AccountLinkingAlert (copy)
	return ReactModule.createElement(AccountLinkingAlert, (useRetryLogInAlertProps(p1)))
end

return function(p1) --[[ Line: 217 | Named "AccountLinkingAlertContainer" ]]
	-- upvalues: ReactModule (copy), AuthModalShownFunction (copy), EventStreamConstants (copy), AccountLinkingAlertTypeModule (copy), IncompatibleAccountsAlert (copy), RetryLogInAlert (copy)
	ReactModule.useEffect(function() --[[ Line: 218 ]]
		-- upvalues: AuthModalShownFunction (upval), EventStreamConstants (upval), p1 (copy)
		AuthModalShownFunction(EventStreamConstants.Context.AccountLinking, nil, p1.alertType)
	end, { p1.alertType })
	
	if p1.alertType == AccountLinkingAlertTypeModule.IncompatibleAccounts then
		return ReactModule.createElement(IncompatibleAccountsAlert, p1)
	elseif p1.alertType == AccountLinkingAlertTypeModule.RetryLogInAlreadyLinked or p1.alertType == AccountLinkingAlertTypeModule.RetryLogInConnectionFailure or p1.alertType == AccountLinkingAlertTypeModule.RetryLogInGenericError then
		return ReactModule.createElement(RetryLogInAlert, p1)
	else
		warn("AccountLinkingAlert: Unknown alert type: " .. tostring(p1.alertType))
		
		return nil
	end
end