local Parent = script:FindFirstAncestor("SocialCommon").Parent
local MessageBusService = game:GetService("MessageBusService")
local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local DashModule = require(Parent.Dash)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol
local Default = LinkingProtocolModule.LinkingProtocol.default
local SettingsRoute = LinkingProtocolModule.Enums.SettingsRoute
local Dialog = FoundationModule.Dialog
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local AnalyticsFactory = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local FFlagEnableRetryForLinkingProtocolFetch = require(Parent.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local FIntLinkingProtocolFetchRetries = require(Parent.SharedFlags).FIntLinkingProtocolFetchRetries
local FIntLinkingProtocolFetchTimeoutMS = require(Parent.SharedFlags).FIntLinkingProtocolFetchTimeoutMS
local FFlagQRInSearchScanner = require(Parent.SharedFlags).FFlagQRInSearchScanner
local ProfileQrCodeCameraSettingsModalSeen: string = if require(Parent.SharedFlags).FFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local RealtimeMessageId = MessageBusService:GetMessageId("Realtime", "appResume")
local EventStream = {
	SettingsPermissionInteractiveAlertButtonClick = {
		context = "settingsPermissionInteractiveAlert",
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = {
			settingsRoute = DashModule.identity,
			btn = DashModule.identity
		}
	},
	SettingsPermissionInteractiveAlertImpression = {
		context = "settingsPermissionInteractiveAlert",
		eventType = EventTypes.SettingsPermissionInteractiveAlertImpression,
		formatRulesForAdditionalInfo = {
			settingsRoute = DashModule.identity,
			settingsAppAvailable = DashModule.identity
		}
	}
}
local config = {
	[SettingsRoute.Camera] = PermissionsProtocol.Permissions.CAMERA_ACCESS,
	[SettingsRoute.Contacts] = PermissionsProtocol.Permissions.CONTACTS_ACCESS
}

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), AnalyticsFactory (copy), EventStream (copy), DefaultAnalyticsService (copy), FFlagQRInSearchScanner (copy), FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), Default (copy), FIntLinkingProtocolFetchTimeoutMS (copy), AppStorageService (copy), ProfileQrCodeCameraSettingsModalSeen (copy), MessageBusService (copy), RealtimeMessageId (copy), PermissionsProtocol (copy), config (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), SettingsRoute (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), Orientation (copy)
	local UseDispatchResult = UseDispatchFunction()
	local SettingsRoute1 = p1.settingsRoute or p1.navigation and p1.navigation.getParam("settingsRoute")
	local Source = p1.source or p1.navigation and p1.navigation.getParam("source")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy)
		return if p1.closeCentralOverlayThunk then UseDispatchResult(p1.closeCentralOverlayThunk()) else p1.navigation and p1.navigation.pop()
	end, {
		UseDispatchResult,
		p1.closeCentralOverlayThunk,
		p1.navigation
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AnalyticsFactory (upval), EventStream (upval), DefaultAnalyticsService (upval), FFlagQRInSearchScanner (upval), Source (copy)
		return AnalyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = EventStream },
			analyticsImpl = { EventStream = DefaultAnalyticsService.EventStream },
			staticInfoForAllEvents = if FFlagQRInSearchScanner then { source = Source } else nil
		})()
	end)
	local v1 = false
	local v2 = nil
	local SettingsAppAvailable = nil
	
	if SettingsAppAvailable == nil then
		if FFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, FIntLinkingProtocolFetchRetries do
				local SpawnedThread = task.spawn(function()
					-- upvalues: v1 (ref), v2 (ref), Default (upval), SettingsRoute1 (copy)
					v1, v34 = Default:supportsSwitchToSettingsApp(SettingsRoute1):await()
				end)
				task.wait(FIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(SpawnedThread)
				
				if v2 ~= nil then break end
			end
		else
			v1, v34 = Default:supportsSwitchToSettingsApp(SettingsRoute1):await()
		end
		SettingsAppAvailable = v1 and v2
	end
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), SettingsAppAvailable (ref), AppStorageService (upval), ProfileQrCodeCameraSettingsModalSeen (upval), MessageBusService (upval), RealtimeMessageId (upval), PermissionsProtocol (upval), config (upval), UseResult (copy)
		UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertImpression", {
			settingsRoute = SettingsRoute1,
			settingsAppAvailable = SettingsAppAvailable
		})
		AppStorageService:SetItem(ProfileQrCodeCameraSettingsModalSeen, "true")
		AppStorageService:Flush()
		local SubscribeResult = MessageBusService:Subscribe(RealtimeMessageId, function()
			-- upvalues: PermissionsProtocol (upval), config (upval), SettingsRoute1 (upval), UseResult (upval)
			PermissionsProtocol.default:hasPermissions({ config[SettingsRoute1] }):andThen(function(Result)
				-- upvalues: PermissionsProtocol (upval), UseResult (upval)
				if Result and Result.status == PermissionsProtocol.Status.AUTHORIZED then
					UseResult()
				end
			end)
		end, false, true)
		
		return function()
			-- upvalues: SubscribeResult (copy)
			SubscribeResult:Disconnect()
		end
	end, {})
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getShouldShowSettingsPermissionsAdditionalInstructions()
	end)
	local SettingsAppAvailable1 = SettingsAppAvailable
	local UseLocalizationResult = UseLocalizationFunction({
		ok = "Feature.SettingsHub.Action.Ok",
		additionalInstructionsContactsDeeplinkSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroid",
		additionalInstructionsContactsDeeplinkNotSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroidDeeplinkNotSupported",
		additionalInstructionsCameraDeeplinkSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroid",
		additionalInstructionsCameraDeeplinkNotSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroidDeeplinkNotSupported",
		notNow = if SettingsAppAvailable1 then "CommonUI.Controls.Action.Cancel" else "Feature.SettingsHub.Action.NotNow",
		openSettings = if SettingsAppAvailable1 then "Feature.SettingsHub.Action.AllowInSettings" else "Feature.SettingsHub.Action.OpenSettings",
		titleCamera = if SettingsAppAvailable1 then "Feature.SettingsHub.Prompt.AllowAccessToCamera" else "Feature.SettingsHub.Prompt.NeedCameraAccess",
		titleContacts = if SettingsAppAvailable1 then "Feature.SettingsHub.Prompt.AllowAccessToContacts" else "Feature.SettingsHub.Prompt.NeedContactsAccess",
		bodyTextCamera = if SettingsAppAvailable1 then "Feature.SettingsHub.Description.CameraPermissionRequestQRCode" else "Feature.SettingsHub.Description.QRCodeCameraPermissionIOS",
		bodyTextContacts = if SettingsAppAvailable1 then "Feature.SettingsHub.Description.ContactsPermissionRequest" else "Feature.SettingsHub.Description.ContactsPermissionIOS"
	})
	local config1 = {
		[SettingsRoute.Contacts] = {
			deepLinkSupported = UseLocalizationResult.additionalInstructionsContactsDeeplinkSupported,
			deepLinkNotSupported = UseLocalizationResult.additionalInstructionsContactsDeeplinkNotSupported
		},
		[SettingsRoute.Camera] = {
			deepLinkSupported = UseLocalizationResult.additionalInstructionsCameraDeeplinkSupported,
			deepLinkNotSupported = UseLocalizationResult.additionalInstructionsCameraDeeplinkNotSupported
		}
	}
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), UseResult (copy)
		UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "notNow", settingsRoute = SettingsRoute1 })
		
		return UseResult()
	end, { p1.navigation })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), UseResult (copy)
		UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "ok", settingsRoute = SettingsRoute1 })
		
		return UseResult()
	end, { p1.navigation })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), Default (upval)
		UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "openSettings", settingsRoute = SettingsRoute1 })
		
		return Default:switchToSettingsApp(SettingsRoute1)
	end, { p1.navigation })
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = false,
		disablePortal = true,
		size = DialogSize.Small
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = ({
				[SettingsRoute.Camera] = UseLocalizationResult.titleCamera,
				[SettingsRoute.Contacts] = UseLocalizationResult.titleContacts
			})[SettingsRoute1]
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
				BodyText = ReactModule.createElement(Dialog.Text, {
					LayoutOrder = 1,
					Text = ({
						[SettingsRoute.Camera] = UseLocalizationResult.bodyTextCamera,
						[SettingsRoute.Contacts] = UseLocalizationResult.bodyTextContacts
					})[SettingsRoute1]
				}),
				AdditionalInstructions = if UseAppPolicyResult then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = config1[SettingsRoute1][if SettingsAppAvailable then "deepLinkSupported" else "deepLinkNotSupported"]
				}) else nil
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Vertical,
			actions = if SettingsAppAvailable then {
				{
					text = UseLocalizationResult.openSettings,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult3
				},
				{
					text = UseLocalizationResult.notNow,
					variant = ButtonVariant.Standard,
					onActivated = UseResult1
				}
			} else {
				{
					text = UseLocalizationResult.ok,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult2
				}
			}
		})
	})
end