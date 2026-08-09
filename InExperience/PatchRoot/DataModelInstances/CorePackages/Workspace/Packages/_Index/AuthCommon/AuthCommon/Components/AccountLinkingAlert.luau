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
local retryLogInAlertSkipEngagement = game:DefineFastFlag("RetryLogInAlertSkipEngagement", false)
local accountLinkingAlertTypeModule = require(authCommon.Enums.AccountLinkingAlertType)

local function AccountLinkingAlert(p0) --[[ line: 52 ]]
	-- upvalues: buttonType (ref), useScreenSize (ref), reactModule (ref), text (ref), withStyle (ref), interactiveAlert (ref)
	local t = {}
	
	if p0.secondaryButtonText and p0.secondaryButtonCallback then
		table.insert(t, {
			buttonType = buttonType.Secondary,
			props = {
				text = p0.secondaryButtonText,
				onActivated = function() --[[ line: 60 ]]
					-- upvalues: p0 (ref)
					p0.secondaryButtonCallback()
				end
			}
		})
	end
	if p0.primaryButtonText and p0.primaryButtonCallback then
		table.insert(t, {
			buttonType = buttonType.PrimarySystem,
			props = {
				text = p0.primaryButtonText,
				onActivated = function() --[[ line: 72 ]]
					-- upvalues: p0 (ref)
					p0.primaryButtonCallback()
				end
			}
		})
	end
	local var14 = useScreenSize()
	local var15 = reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: p0 (ref), reactModule (copy), text (copy)
		return if p0.footerText and p0.footerCallback then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Text = reactModule.createElement(text, {
				Text = p0.footerText,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				onActivated = p0.footerCallback
			})
		}) else nil
	end, { p0.footerText, p0.footerCallback })
	
	return withStyle(function(_) --[[ line: 100 ]]
		-- upvalues: reactModule (copy), interactiveAlert (copy), p0 (ref), t (ref), var15 (ref), var14 (ref)
		return reactModule.createElement(interactiveAlert, {
			isRoactGamepadEnabled = false,
			title = p0.titleText,
			bodyText = p0.bodyText,
			buttonStackInfo = { buttons = t },
			footerContent = var15,
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = var14
		})
	end)
end

local function useIncompatibleAccountsAlertProps(p1) --[[ line: 115 ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useAppPolicy (ref), useLocalization (ref), reactModule (ref), guiService (ref), notificationType (ref), authButtonClick (ref), eventStreamConstants (ref), appPage (ref), default (ref), incompatibleAccountsSupportLink (ref)
	local var16 = useDispatch()
	local var17 = useNavigation()
	local var18 = useAppPolicy(function(p2) --[[ line: 119 ]]
		return p2.getPlatformAccountName()
	end)
	local var19 = useLocalization({
		titleText = "Authentication.Login.Heading.IncompatibleAccounts",
		secondaryButtonText = "Authentication.Login.Button.UseDifferentRobloxAccount",
		footerText = "Authentication.Login.Label.LearnMore",
		bodyText = {
			"Authentication.Login.Response.AlreadyLinked",
			platform = var18
		},
		primaryButtonText = {
			"Authentication.Login.Button.CloseAndSwitchPlatformAccount",
			platformAccountName = var18
		}
	})
	
	return {
		titleText = var19.titleText,
		bodyText = if p1.userFacingMessage then p1.userFacingMessage else var19.bodyText,
		primaryButtonText = var19.primaryButtonText,
		secondaryButtonText = var19.secondaryButtonText,
		primaryButtonCallback = reactModule.useCallback(function() --[[ line: 134 ]]
			-- upvalues: guiService (copy), notificationType (copy), p1 (ref), var16 (ref), authButtonClick (copy), eventStreamConstants (copy)
			guiService:BroadcastNotification("", notificationType.NATIVE_EXIT)
			
			if p1.closeCentralOverlayThunk then
				var16(p1.closeCentralOverlayThunk())
			end
			authButtonClick(eventStreamConstants.Context.AccountLinking, eventStreamConstants.Button.PrimaryButton)
		end, { p1.closeCentralOverlayThunk }),
		secondaryButtonCallback = reactModule.useCallback(function() --[[ line: 142 ]]
			-- upvalues: var17 (ref), appPage (copy), p1 (ref), var16 (ref), authButtonClick (copy), eventStreamConstants (copy)
			var17.navigate(appPage.Landing)
			
			if p1.closeCentralOverlayThunk then
				var16(p1.closeCentralOverlayThunk())
			end
			authButtonClick(eventStreamConstants.Context.AccountLinking, eventStreamConstants.Button.SecondaryButton)
		end, { var17, p1.closeCentralOverlayThunk }),
		footerText = var19.footerText,
		footerCallback = reactModule.useCallback(function() --[[ line: 150 ]]
			-- upvalues: default (copy), incompatibleAccountsSupportLink (copy), authButtonClick (copy), eventStreamConstants (copy)
			default:openURL(incompatibleAccountsSupportLink)
			authButtonClick(eventStreamConstants.Context.AccountLinking, eventStreamConstants.Button.Support)
		end, {}),
		closeCentralOverlayThunk = p1.closeCentralOverlayThunk
	}
end

local function IncompatibleAccountsAlert(p3) --[[ line: 168 ]]
	-- upvalues: useIncompatibleAccountsAlertProps (ref), reactModule (ref), AccountLinkingAlert (ref)
	return reactModule.createElement(AccountLinkingAlert, useIncompatibleAccountsAlertProps(p3))
end

local function useRetryLogInAlertProps(p4) --[[ line: 173 ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useAppPolicy (ref), accountLinkingAlertTypeModule (ref), useLocalization (ref), reactModule (ref), retryLogInAlertSkipEngagement (ref), appPage (ref)
	local var20 = useDispatch()
	local var21 = useNavigation()
	local var22 = useLocalization({
		titleText = "Authentication.SignUp.Heading.RetryLogIn",
		primaryButtonText = "Authentication.SignUp.Button.RetryLogIn",
		bodyText = if p4.alertType == accountLinkingAlertTypeModule.RetryLogInAlreadyLinked then {
			"Authentication.SignUp.Description.AccountAlreadyLinked",
			platformAccountName = useAppPolicy(function(p5) --[[ line: 177 ]]
				return p5.getPlatformAccountName()
			end)
		} elseif p4.alertType == accountLinkingAlertTypeModule.RetryLogInConnectionFailure then "Authentication.Login.Error.PlatformAccountConnectionFailure" else "Authentication.SignUp.Response.ErrorTryAgain"
	})
	
	return {
		titleText = var22.titleText,
		bodyText = var22.bodyText,
		primaryButtonText = var22.primaryButtonText,
		primaryButtonCallback = reactModule.useCallback(function() --[[ line: 197 ]]
			-- upvalues: retryLogInAlertSkipEngagement (copy), var21 (ref), appPage (copy), p4 (ref), var20 (ref)
			if retryLogInAlertSkipEngagement then
				var21.navigate(appPage.PlatformAccountRouter)
			else
				var21.navigate(appPage.EngagementScreenContainer)
			end
			if p4.closeCentralOverlayThunk then
				var20(p4.closeCentralOverlayThunk())
			end
		end, { var21, p4.closeCentralOverlayThunk }),
		closeCentralOverlayThunk = p4.closeCentralOverlayThunk
	}
end

local function RetryLogInAlert(p6) --[[ line: 217 ]]
	-- upvalues: useRetryLogInAlertProps (ref), reactModule (ref), AccountLinkingAlert (ref)
	return reactModule.createElement(AccountLinkingAlert, useRetryLogInAlertProps(p6))
end

return function(p7) --[[ line: 222 | named "AccountLinkingAlertContainer" ]]
	-- upvalues: reactModule (ref), authModalShown (ref), eventStreamConstants (ref), accountLinkingAlertTypeModule (ref), IncompatibleAccountsAlert (ref), RetryLogInAlert (ref)
	reactModule.useEffect(function() --[[ line: 223 ]]
		-- upvalues: authModalShown (copy), eventStreamConstants (copy), p7 (ref)
		authModalShown(eventStreamConstants.Context.AccountLinking, nil, p7.alertType)
	end, { p7.alertType })
	
	if p7.alertType == accountLinkingAlertTypeModule.IncompatibleAccounts then
		return reactModule.createElement(IncompatibleAccountsAlert, p7)
	elseif p7.alertType == accountLinkingAlertTypeModule.RetryLogInAlreadyLinked or p7.alertType == accountLinkingAlertTypeModule.RetryLogInConnectionFailure or p7.alertType == accountLinkingAlertTypeModule.RetryLogInGenericError then
		return reactModule.createElement(RetryLogInAlert, p7)
	end
	warn("AccountLinkingAlert: Unknown alert type: " .. tostring(p7.alertType))
	
	return nil
end