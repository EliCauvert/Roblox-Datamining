local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local withStyle = UIBloxModule.Style.withStyle
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local text = require(parent.Foundation).Text
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local notificationType = require(parent.RobloxAppEnums).NotificationType
local authAnalyticsModule = require(parent.AuthAnalytics)
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local authModalShown = authAnalyticsModule.Events.authModalShown
local authButtonClick = authAnalyticsModule.Events.authButtonClick
local incompatibleAccountsSupportLink = game:DefineFastString("IncompatibleAccountsSupportLink", "https://help.roblox.com/hc/articles/360000334523-Xbox-One-App-Trouble-logging-into-Roblox-account")
local accountLinkingAlertTypeModule = require(authCommon.Enums.AccountLinkingAlertType)

local function AccountLinkingAlert(p1)
	-- upvalues: buttonType (ref), useScreenSize (ref), reactModule (ref), text (ref), withStyle (ref), interactiveAlert (ref)
	local t = {}
	
	if p1.secondaryButtonText and p1.secondaryButtonCallback then
		table.insert(t, {
			buttonType = buttonType.Secondary,
			props = {
				text = p1.secondaryButtonText,
				onActivated = function()
					-- upvalues: p1 (ref)
					p1.secondaryButtonCallback()
				end
			}
		})
	end
	if p1.primaryButtonText and p1.primaryButtonCallback then
		table.insert(t, {
			buttonType = buttonType.PrimarySystem,
			props = {
				text = p1.primaryButtonText,
				onActivated = function()
					-- upvalues: p1 (ref)
					p1.primaryButtonCallback()
				end
			}
		})
	end
	local var1 = useScreenSize()
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), reactModule (copy), text (copy)
		return if p1.footerText and p1.footerCallback then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Text = reactModule.createElement(text, {
				Text = p1.footerText,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				onActivated = p1.footerCallback
			})
		}) else nil
	end, { p1.footerText, p1.footerCallback })
	
	return withStyle(function(_)
		-- upvalues: reactModule (copy), interactiveAlert (copy), p1 (ref), t (ref), var2 (ref), var1 (ref)
		return reactModule.createElement(interactiveAlert, {
			isRoactGamepadEnabled = false,
			title = p1.titleText,
			bodyText = p1.bodyText,
			buttonStackInfo = { buttons = t },
			footerContent = var2,
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = var1
		})
	end)
end

local function useIncompatibleAccountsAlertProps(p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useAppPolicy (ref), useLocalization (ref), reactModule (ref), guiService (ref), notificationType (ref), authButtonClick (ref), eventStreamConstants (ref), appPage (ref), default (ref), incompatibleAccountsSupportLink (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useAppPolicy(function(p2)
		return p2.getPlatformAccountName()
	end)
	local var4 = useLocalization({
		titleText = "Authentication.Login.Heading.IncompatibleAccounts",
		secondaryButtonText = "Authentication.Login.Button.UseDifferentRobloxAccount",
		footerText = "Authentication.Login.Label.LearnMore",
		bodyText = {
			"Authentication.Login.Response.AlreadyLinked",
			platform = var3
		},
		primaryButtonText = {
			"Authentication.Login.Button.CloseAndSwitchPlatformAccount",
			platformAccountName = var3
		}
	})
	
	return {
		titleText = var4.titleText,
		bodyText = if p1.userFacingMessage then p1.userFacingMessage else var4.bodyText,
		primaryButtonText = var4.primaryButtonText,
		secondaryButtonText = var4.secondaryButtonText,
		primaryButtonCallback = reactModule.useCallback(function()
			-- upvalues: guiService (copy), notificationType (copy), p1 (ref), var1 (ref), authButtonClick (copy), eventStreamConstants (copy)
			guiService:BroadcastNotification("", notificationType.NATIVE_EXIT)
			
			if p1.closeCentralOverlayThunk then
				var1(p1.closeCentralOverlayThunk())
			end
			authButtonClick(eventStreamConstants.Context.AccountLinking, eventStreamConstants.Button.PrimaryButton)
		end, { p1.closeCentralOverlayThunk }),
		secondaryButtonCallback = reactModule.useCallback(function()
			-- upvalues: var2 (ref), appPage (copy), p1 (ref), var1 (ref), authButtonClick (copy), eventStreamConstants (copy)
			var2.navigate(appPage.Landing)
			
			if p1.closeCentralOverlayThunk then
				var1(p1.closeCentralOverlayThunk())
			end
			authButtonClick(eventStreamConstants.Context.AccountLinking, eventStreamConstants.Button.SecondaryButton)
		end, { var2, p1.closeCentralOverlayThunk }),
		footerText = var4.footerText,
		footerCallback = reactModule.useCallback(function()
			-- upvalues: default (copy), incompatibleAccountsSupportLink (copy), authButtonClick (copy), eventStreamConstants (copy)
			default:openURL(incompatibleAccountsSupportLink)
			authButtonClick(eventStreamConstants.Context.AccountLinking, eventStreamConstants.Button.Support)
		end, {}),
		closeCentralOverlayThunk = p1.closeCentralOverlayThunk
	}
end

local function IncompatibleAccountsAlert(p1)
	-- upvalues: useIncompatibleAccountsAlertProps (ref), reactModule (ref), AccountLinkingAlert (ref)
	return reactModule.createElement(AccountLinkingAlert, useIncompatibleAccountsAlertProps(p1))
end

local function useRetryLogInAlertProps(p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useAppPolicy (ref), accountLinkingAlertTypeModule (ref), useLocalization (ref), reactModule (ref), appPage (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useLocalization({
		titleText = "Authentication.SignUp.Heading.RetryLogIn",
		primaryButtonText = "Authentication.SignUp.Button.RetryLogIn",
		bodyText = if p1.alertType == accountLinkingAlertTypeModule.RetryLogInAlreadyLinked then {
			"Authentication.SignUp.Description.AccountAlreadyLinked",
			platformAccountName = useAppPolicy(function(p2)
				return p2.getPlatformAccountName()
			end)
		} elseif p1.alertType == accountLinkingAlertTypeModule.RetryLogInConnectionFailure then "Authentication.Login.Error.PlatformAccountConnectionFailure" else "Authentication.SignUp.Response.ErrorTryAgain"
	})
	
	return {
		titleText = var3.titleText,
		bodyText = var3.bodyText,
		primaryButtonText = var3.primaryButtonText,
		primaryButtonCallback = reactModule.useCallback(function()
			-- upvalues: var2 (ref), appPage (copy), p1 (ref), var1 (ref)
			var2.navigate(appPage.PlatformAccountRouter)
			
			if p1.closeCentralOverlayThunk then
				var1(p1.closeCentralOverlayThunk())
			end
		end, { var2, p1.closeCentralOverlayThunk }),
		closeCentralOverlayThunk = p1.closeCentralOverlayThunk
	}
end

local function RetryLogInAlert(p1)
	-- upvalues: useRetryLogInAlertProps (ref), reactModule (ref), AccountLinkingAlert (ref)
	return reactModule.createElement(AccountLinkingAlert, useRetryLogInAlertProps(p1))
end

return function(p1)
	-- upvalues: reactModule (ref), authModalShown (ref), eventStreamConstants (ref), accountLinkingAlertTypeModule (ref), IncompatibleAccountsAlert (ref), RetryLogInAlert (ref)
	reactModule.useEffect(function()
		-- upvalues: authModalShown (copy), eventStreamConstants (copy), p1 (ref)
		authModalShown(eventStreamConstants.Context.AccountLinking, nil, p1.alertType)
	end, { p1.alertType })
	
	if p1.alertType == accountLinkingAlertTypeModule.IncompatibleAccounts then
		return reactModule.createElement(IncompatibleAccountsAlert, p1)
	elseif p1.alertType == accountLinkingAlertTypeModule.RetryLogInAlreadyLinked or p1.alertType == accountLinkingAlertTypeModule.RetryLogInConnectionFailure or p1.alertType == accountLinkingAlertTypeModule.RetryLogInGenericError then
		return reactModule.createElement(RetryLogInAlert, p1)
	end
	warn("AccountLinkingAlert: Unknown alert type: " .. tostring(p1.alertType))
	
	return nil
end