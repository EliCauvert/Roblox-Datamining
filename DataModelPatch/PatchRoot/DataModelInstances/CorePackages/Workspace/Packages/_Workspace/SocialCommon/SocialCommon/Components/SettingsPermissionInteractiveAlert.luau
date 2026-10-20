local Parent = script:FindFirstAncestor("SocialCommon").Parent
local MessageBusService = game:GetService("MessageBusService")
local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local Text = require(Parent.AppCommonLib).Text
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local DashModule = require(Parent.Dash)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol
local Default = LinkingProtocolModule.LinkingProtocol.default
local SettingsRoute = LinkingProtocolModule.Enums.SettingsRoute
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
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
	-- upvalues: UseScreenSizeFunction (copy), UseDispatchFunction (copy), UseStyleFunction (copy), ReactModule (copy), AnalyticsFactory (copy), EventStream (copy), DefaultAnalyticsService (copy), FFlagQRInSearchScanner (copy), FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), Default (copy), FIntLinkingProtocolFetchTimeoutMS (copy), AppStorageService (copy), ProfileQrCodeCameraSettingsModalSeen (copy), MessageBusService (copy), RealtimeMessageId (copy), PermissionsProtocol (copy), config (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), SettingsRoute (copy), Images (copy), ButtonType (copy), StyledTextLabel (copy), Text (copy), InteractiveAlert (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
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
					v1, v35 = Default:supportsSwitchToSettingsApp(SettingsRoute1):await()
				end)
				task.wait(FIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(SpawnedThread)
				
				if v2 ~= nil then break end
			end
		else
			v1, v35 = Default:supportsSwitchToSettingsApp(SettingsRoute1):await()
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
	local UseLocalizationResult = UseLocalizationFunction({
		notNow = "Feature.SettingsHub.Action.NotNow",
		ok = "Feature.SettingsHub.Action.Ok",
		openSettings = "Feature.SettingsHub.Action.OpenSettings",
		titleCamera = "Feature.SettingsHub.Prompt.NeedCameraAccess",
		titleContacts = "Feature.SettingsHub.Prompt.NeedContactsAccess",
		bodyTextCamera = "Feature.SettingsHub.Description.QRCodeCameraPermissionIOS",
		bodyTextContacts = "Feature.SettingsHub.Description.ContactsPermissionIOS",
		additionalInstructionsContactsDeeplinkSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroid",
		additionalInstructionsContactsDeeplinkNotSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroidDeeplinkNotSupported",
		additionalInstructionsCameraDeeplinkSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroid",
		additionalInstructionsCameraDeeplinkNotSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroidDeeplinkNotSupported"
	})
	local config1 = {
		[SettingsRoute.Camera] = UseLocalizationResult.bodyTextCamera,
		[SettingsRoute.Contacts] = UseLocalizationResult.bodyTextContacts
	}
	local Text1 = "<b>" .. ({
		[SettingsRoute.Contacts] = {
			deepLinkSupported = UseLocalizationResult.additionalInstructionsContactsDeeplinkSupported,
			deepLinkNotSupported = UseLocalizationResult.additionalInstructionsContactsDeeplinkNotSupported
		},
		[SettingsRoute.Camera] = {
			deepLinkSupported = UseLocalizationResult.additionalInstructionsCameraDeeplinkSupported,
			deepLinkNotSupported = UseLocalizationResult.additionalInstructionsCameraDeeplinkNotSupported
		}
	})[SettingsRoute1][if SettingsAppAvailable then "deepLinkSupported" else "deepLinkNotSupported"] .. "</b>"
	local config2 = {
		buttonType = ButtonType.Secondary,
		props = {
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), UseResult (copy)
				UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "notNow", settingsRoute = SettingsRoute1 })
				
				return UseResult()
			end, { p1.navigation }),
			text = UseLocalizationResult.notNow
		}
	}
	local config3 = {
		buttonType = ButtonType.PrimarySystem,
		props = {
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), UseResult (copy)
				UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "ok", settingsRoute = SettingsRoute1 })
				
				return UseResult()
			end, { p1.navigation }),
			text = UseLocalizationResult.ok
		}
	}
	local config4 = {
		buttonType = ButtonType.PrimarySystem,
		props = {
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), Default (upval)
				UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "openSettings", settingsRoute = SettingsRoute1 })
				
				return Default:switchToSettingsApp(SettingsRoute1)
			end, { p1.navigation }),
			text = UseLocalizationResult.openSettings
		}
	}
	
	return ReactModule.createElement(InteractiveAlert, {
		richText = true,
		screenSize = UseScreenSizeResult,
		title = ({
			[SettingsRoute.Camera] = UseLocalizationResult.titleCamera,
			[SettingsRoute.Contacts] = UseLocalizationResult.titleContacts
		})[SettingsRoute1],
		titleIcon = ({
			[SettingsRoute.Camera] = Images["icons/controls/cameraOff"],
			[SettingsRoute.Contacts] = Images["icons/menu/contacts_large"]
		})[SettingsRoute1],
		middleContent = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), StyledTextLabel (upval), UseStyleResult (copy), config1 (copy), SettingsRoute1 (copy), UseAppPolicyResult (copy), Text (upval), Text1 (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				DeepLinkInstructions = ReactModule.createElement(StyledTextLabel, {
					lineHeight = 1,
					fluidSizing = false,
					layoutOrder = 1,
					automaticSize = Enum.AutomaticSize.Y,
					fontStyle = UseStyleResult.Font.Body,
					colorStyle = UseStyleResult.Theme.TextDefault,
					size = UDim2.fromScale(1, 0),
					text = config1[SettingsRoute1]
				}),
				additionalInstructionsFrame = if UseAppPolicyResult then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, Text.GetTextHeight("", UseStyleResult.Font.Body.Font, UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize)),
						PaddingLeft = UDim.new(0, 5)
					}),
					AdditionalInstructions = ReactModule.createElement(StyledTextLabel, {
						fluidSizing = false,
						lineHeight = 1,
						automaticSize = Enum.AutomaticSize.Y,
						fontStyle = UseStyleResult.Font.Body,
						colorStyle = UseStyleResult.Theme.TextDefault,
						size = UDim2.fromScale(1, 0),
						text = Text1
					})
				}) else nil
			})
		end, { p1.navigation }),
		buttonStackInfo = {
			buttons = if SettingsAppAvailable then { config2, config4 } else { config3 }
		}
	})
end