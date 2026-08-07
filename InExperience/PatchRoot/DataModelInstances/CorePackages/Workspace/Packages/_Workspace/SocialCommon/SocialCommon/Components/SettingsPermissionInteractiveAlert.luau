local parent = script:FindFirstAncestor("SocialCommon").Parent
local messageBusService = game:GetService("MessageBusService")
local appStorageService = game:GetService("AppStorageService")
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local linkingProtocolModule = require(parent.LinkingProtocol)
local text = require(parent.AppCommonLib).Text
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local dashModule = require(parent.Dash)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local default = linkingProtocolModule.LinkingProtocol.default
local settingsRoute = linkingProtocolModule.Enums.SettingsRoute
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local analyticsFactory = socialLuaAnalyticsModule.Analytics.AnalyticsFactory
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local fFlagEnableRetryForLinkingProtocolFetch = require(parent.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local fIntLinkingProtocolFetchRetries = require(parent.SharedFlags).FIntLinkingProtocolFetchRetries
local fIntLinkingProtocolFetchTimeoutMS = require(parent.SharedFlags).FIntLinkingProtocolFetchTimeoutMS
local fFlagQRInSearchScanner = require(parent.SharedFlags).FFlagQRInSearchScanner
local var7 = if require(parent.SharedFlags).FFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local t = {
	SettingsPermissionInteractiveAlertButtonClick = {
		context = "settingsPermissionInteractiveAlert",
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = {
			settingsRoute = dashModule.identity,
			btn = dashModule.identity
		}
	},
	SettingsPermissionInteractiveAlertImpression = {
		context = "settingsPermissionInteractiveAlert",
		eventType = eventTypes.SettingsPermissionInteractiveAlertImpression,
		formatRulesForAdditionalInfo = {
			settingsRoute = dashModule.identity,
			settingsAppAvailable = dashModule.identity
		}
	}
}
local t_1 = {
	[settingsRoute.Camera] = permissionsProtocol.Permissions.CAMERA_ACCESS,
	[settingsRoute.Contacts] = permissionsProtocol.Permissions.CONTACTS_ACCESS
}

return function(value) --[[ line: 86 | named "SettingsPermissionInteractiveAlert" ]]
	-- upvalues: useScreenSize (ref), useDispatch (ref), useStyle (ref), reactModule (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), fFlagQRInSearchScanner (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), fIntLinkingProtocolFetchTimeoutMS (ref), appStorageService (ref), var7 (ref), messageBusService (ref), realtimeMessageId (ref), permissionsProtocol (ref), t_1 (ref), useAppPolicy (ref), useLocalization (ref), settingsRoute (ref), images (ref), buttonType (ref), styledTextLabel (ref), text (ref), interactiveAlert (ref)
	local var11 = useScreenSize()
	local var12 = useDispatch()
	local var13 = useStyle()
	local settingsRoute_1 = value.settingsRoute or value.navigation and value.navigation.getParam("settingsRoute")
	local source = value.source or value.navigation and value.navigation.getParam("source")
	local var16 = reactModule.useCallback(function() --[[ line: 95 ]]
		-- upvalues: value (ref), var12 (ref)
		return if value.closeCentralOverlayThunk then var12(value.closeCentralOverlayThunk()) else value.navigation and value.navigation.pop()
	end, { var12, value.closeCentralOverlayThunk, value.navigation })
	local var17 = reactModule.useMemo(function() --[[ line: 102 ]]
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy), fFlagQRInSearchScanner (copy), source (ref)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream },
			staticInfoForAllEvents = if fFlagQRInSearchScanner then { source = source } else nil
		})()
	end)
	local var18 = false
	local var19 = nil
	local var19_1 = nil
	
	if var19_1 == nil then
		if fFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, fIntLinkingProtocolFetchRetries do
				local thread = task.spawn(function() --[[ line: 132 ]]
					-- upvalues: var18 (write), var19 (write), default (copy), settingsRoute_1 (ref)
					local var30, var31 = default:supportsSwitchToSettingsApp(settingsRoute_1):await()
					var18 = var30
					var19 = var31
				end)
				task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(thread)
				
				if var19 == nil then
					continue
				end
			end
		else
			local var22, var23 = default:supportsSwitchToSettingsApp(settingsRoute_1):await()
			var18 = var22
			var19 = var23
		end
		var19_1 = var18 and var19
	end
	reactModule.useEffect(function() --[[ line: 149 ]]
		-- upvalues: var17 (ref), settingsRoute_1 (ref), var19_1 (write), appStorageService (copy), var7 (copy), messageBusService (copy), realtimeMessageId (copy), permissionsProtocol (copy), t_1 (copy), var16 (ref)
		var17.fireAnalyticsEvent("SettingsPermissionInteractiveAlertImpression", {
			settingsRoute = settingsRoute_1,
			settingsAppAvailable = var19_1
		})
		appStorageService:SetItem(var7, "true")
		appStorageService:Flush()
		local var32 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 158 ]]
			-- upvalues: permissionsProtocol (copy), t_1 (copy), settingsRoute_1 (copy), var16 (copy)
			permissionsProtocol.default:hasPermissions({ t_1[settingsRoute_1] }):andThen(function(p0) --[[ line: 163 ]]
				-- upvalues: permissionsProtocol (copy), var16 (copy)
				if p0 and p0.status == permissionsProtocol.Status.AUTHORIZED then
					var16()
				end
			end)
		end, false, true)
		
		return function() --[[ line: 170 ]]
			-- upvalues: var32 (ref)
			var32:Disconnect()
		end
	end, {})
	local var24 = useAppPolicy(function(p1) --[[ line: 175 ]]
		return p1.getShouldShowSettingsPermissionsAdditionalInstructions()
	end)
	local var25 = useLocalization({
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
	local t_2 = {
		[settingsRoute.Camera] = images["icons/controls/cameraOff"],
		[settingsRoute.Contacts] = images["icons/menu/contacts_large"]
	}
	local t_3 = {
		[settingsRoute.Camera] = var25.titleCamera,
		[settingsRoute.Contacts] = var25.titleContacts
	}
	local t_4 = {
		[settingsRoute.Camera] = var25.bodyTextCamera,
		[settingsRoute.Contacts] = var25.bodyTextContacts
	}
	local text_1 = "<b>" .. ({
		[settingsRoute.Contacts] = {
			deepLinkSupported = var25.additionalInstructionsContactsDeeplinkSupported,
			deepLinkNotSupported = var25.additionalInstructionsContactsDeeplinkNotSupported
		},
		[settingsRoute.Camera] = {
			deepLinkSupported = var25.additionalInstructionsCameraDeeplinkSupported,
			deepLinkNotSupported = var25.additionalInstructionsCameraDeeplinkNotSupported
		}
	})[settingsRoute_1][if var19_1 then "deepLinkSupported" else "deepLinkNotSupported"] .. "</b>"
	
	return reactModule.createElement(interactiveAlert, {
		richText = true,
		screenSize = var11,
		title = t_3[settingsRoute_1],
		titleIcon = t_2[settingsRoute_1],
		middleContent = reactModule.useCallback(function() --[[ line: 275 ]]
			-- upvalues: reactModule (copy), styledTextLabel (copy), var13 (ref), t_4 (ref), settingsRoute_1 (ref), var24 (ref), text (copy), text_1 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				DeepLinkInstructions = reactModule.createElement(styledTextLabel, {
					lineHeight = 1,
					fluidSizing = false,
					layoutOrder = 1,
					automaticSize = Enum.AutomaticSize.Y,
					fontStyle = var13.Font.Body,
					colorStyle = var13.Theme.TextDefault,
					size = UDim2.fromScale(1, 0),
					text = t_4[settingsRoute_1]
				}),
				additionalInstructionsFrame = if var24 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, text.GetTextHeight("", var13.Font.Body.Font, var13.Font.BaseSize * var13.Font.Body.RelativeSize)),
						PaddingLeft = UDim.new(0, 5)
					}),
					AdditionalInstructions = reactModule.createElement(styledTextLabel, {
						fluidSizing = false,
						lineHeight = 1,
						automaticSize = Enum.AutomaticSize.Y,
						fontStyle = var13.Font.Body,
						colorStyle = var13.Theme.TextDefault,
						size = UDim2.fromScale(1, 0),
						text = text_1
					})
				}) else nil
			})
		end, { value.navigation }),
		buttonStackInfo = {
			buttons = if var19_1 then {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 225 ]]
							-- upvalues: var17 (ref), settingsRoute_1 (ref), var16 (ref)
							var17.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "notNow", settingsRoute = settingsRoute_1 })
							
							return var16()
						end, { value.navigation }),
						text = var25.notNow
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 255 ]]
							-- upvalues: var17 (ref), settingsRoute_1 (ref), default (copy)
							var17.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "openSettings", settingsRoute = settingsRoute_1 })
							
							return default:switchToSettingsApp(settingsRoute_1)
						end, { value.navigation }),
						text = var25.openSettings
					}
				}
			} else {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 240 ]]
							-- upvalues: var17 (ref), settingsRoute_1 (ref), var16 (ref)
							var17.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "ok", settingsRoute = settingsRoute_1 })
							
							return var16()
						end, { value.navigation }),
						text = var25.ok
					}
				}
			}
		}
	})
end