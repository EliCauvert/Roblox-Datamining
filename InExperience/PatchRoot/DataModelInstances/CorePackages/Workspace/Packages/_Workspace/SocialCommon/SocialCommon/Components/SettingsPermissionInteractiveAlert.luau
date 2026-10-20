local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local MessageBusService = game:GetService("MessageBusService")
local AppStorageService = game:GetService("AppStorageService")
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
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
local Dialog = FoundationModule.Dialog
local Text1 = FoundationModule.Text
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
local FFlagPermissionAlertContentUpgradeModule = require(SocialCommon.Flags.FFlagPermissionAlertContentUpgrade)
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
	-- upvalues: UseScreenSizeFunction (copy), UseDispatchFunction (copy), UseStyleFunction (copy), ReactModule (copy), AnalyticsFactory (copy), EventStream (copy), DefaultAnalyticsService (copy), FFlagQRInSearchScanner (copy), FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), Default (copy), FIntLinkingProtocolFetchTimeoutMS (copy), AppStorageService (copy), ProfileQrCodeCameraSettingsModalSeen (copy), MessageBusService (copy), RealtimeMessageId (copy), PermissionsProtocol (copy), config (copy), UseAppPolicyFunction (copy), FFlagPermissionAlertContentUpgradeModule (copy), UseLocalizationFunction (copy), SettingsRoute (copy), Images (copy), ButtonType (copy), StyledTextLabel (copy), Text (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy), View (copy), Text1 (copy), Orientation (copy), InteractiveAlert (copy)
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
					v1, v44 = Default:supportsSwitchToSettingsApp(SettingsRoute1):await()
				end)
				task.wait(FIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(SpawnedThread)
				
				if v2 ~= nil then break end
			end
		else
			v1, v44 = Default:supportsSwitchToSettingsApp(SettingsRoute1):await()
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
	local SettingsAppAvailable1 = FFlagPermissionAlertContentUpgradeModule and SettingsAppAvailable
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
		[SettingsRoute.Camera] = Images["icons/controls/cameraOff"],
		[SettingsRoute.Contacts] = Images["icons/menu/contacts_large"]
	}
	local config2 = {
		[SettingsRoute.Camera] = UseLocalizationResult.titleCamera,
		[SettingsRoute.Contacts] = UseLocalizationResult.titleContacts
	}
	local config3 = {
		[SettingsRoute.Camera] = UseLocalizationResult.bodyTextCamera,
		[SettingsRoute.Contacts] = UseLocalizationResult.bodyTextContacts
	}
	local config4 = {
		[SettingsRoute.Contacts] = {
			deepLinkSupported = UseLocalizationResult.additionalInstructionsContactsDeeplinkSupported,
			deepLinkNotSupported = UseLocalizationResult.additionalInstructionsContactsDeeplinkNotSupported
		},
		[SettingsRoute.Camera] = {
			deepLinkSupported = UseLocalizationResult.additionalInstructionsCameraDeeplinkSupported,
			deepLinkNotSupported = UseLocalizationResult.additionalInstructionsCameraDeeplinkNotSupported
		}
	}
	local Text2 = "<b>" .. config4[SettingsRoute1][if SettingsAppAvailable then "deepLinkSupported" else "deepLinkNotSupported"] .. "</b>"
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), UseResult (copy)
		UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "notNow", settingsRoute = SettingsRoute1 })
		
		return UseResult()
	end, { p1.navigation })
	local config5 = {
		buttonType = ButtonType.Secondary,
		props = {
			onActivated = UseResult1,
			text = UseLocalizationResult.notNow
		}
	}
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), UseResult (copy)
		UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "ok", settingsRoute = SettingsRoute1 })
		
		return UseResult()
	end, { p1.navigation })
	local config6 = {
		buttonType = ButtonType.PrimarySystem,
		props = {
			onActivated = UseResult2,
			text = UseLocalizationResult.ok
		}
	}
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), SettingsRoute1 (copy), Default (upval)
		UseMemoResult.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "openSettings", settingsRoute = SettingsRoute1 })
		
		return Default:switchToSettingsApp(SettingsRoute1)
	end, { p1.navigation })
	local config7 = {
		buttonType = ButtonType.PrimarySystem,
		props = {
			onActivated = UseResult3,
			text = UseLocalizationResult.openSettings
		}
	}
	local ButtonStackInfo = {
		buttons = if SettingsAppAvailable then { config5, config7 } else { config6 }
	}
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), StyledTextLabel (upval), UseStyleResult (copy), config3 (copy), SettingsRoute1 (copy), UseAppPolicyResult (copy), Text (upval), Text2 (copy)
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
				text = config3[SettingsRoute1]
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
					text = Text2
				})
			}) else nil
		})
	end, { p1.navigation })
	
	return if FFlagPermissionAlertContentUpgradeModule then ReactModule.createElement(Dialog.Root, {
		hasBackdrop = false,
		disablePortal = true,
		size = DialogSize.Small
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = config2[SettingsRoute1] }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
				BodyText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = config3[SettingsRoute1] }),
				AdditionalInstructions = if UseAppPolicyResult then ReactModule.createElement(Text1, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = config4[SettingsRoute1][if SettingsAppAvailable then "deepLinkSupported" else "deepLinkNotSupported"]
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
	}) else ReactModule.createElement(InteractiveAlert, {
		richText = true,
		screenSize = UseScreenSizeResult,
		title = config2[SettingsRoute1],
		titleIcon = config1[SettingsRoute1],
		middleContent = UseResult4,
		buttonStackInfo = ButtonStackInfo
	})
end