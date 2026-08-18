local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local messageBusService = game:GetService("MessageBusService")
local appStorageService = game:GetService("AppStorageService")
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
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
local dialog = foundationModule.Dialog
local text_1 = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
local analyticsFactory = socialLuaAnalyticsModule.Analytics.AnalyticsFactory
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local fFlagEnableRetryForLinkingProtocolFetch = require(parent.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local fIntLinkingProtocolFetchRetries = require(parent.SharedFlags).FIntLinkingProtocolFetchRetries
local fIntLinkingProtocolFetchTimeoutMS = require(parent.SharedFlags).FIntLinkingProtocolFetchTimeoutMS
local fFlagQRInSearchScanner = require(parent.SharedFlags).FFlagQRInSearchScanner
local fFlagPermissionAlertContentUpgradeModule = require(socialCommon.Flags.FFlagPermissionAlertContentUpgrade)
local var10 = if require(parent.SharedFlags).FFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
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

return function(value) --[[ line: 95 | named "SettingsPermissionInteractiveAlert" ]]
	-- upvalues: useScreenSize (ref), useDispatch (ref), useStyle (ref), reactModule (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), fFlagQRInSearchScanner (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), fIntLinkingProtocolFetchTimeoutMS (ref), appStorageService (ref), var10 (ref), messageBusService (ref), realtimeMessageId (ref), permissionsProtocol (ref), t_1 (ref), useAppPolicy (ref), fFlagPermissionAlertContentUpgradeModule (ref), useLocalization (ref), settingsRoute (ref), images (ref), buttonType (ref), styledTextLabel (ref), text (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref), text_1 (ref), orientation (ref), interactiveAlert (ref)
	local var14 = useScreenSize()
	local var15 = useDispatch()
	local var16 = useStyle()
	local settingsRoute_1 = value.settingsRoute or value.navigation and value.navigation.getParam("settingsRoute")
	local source = value.source or value.navigation and value.navigation.getParam("source")
	local var19 = reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: value (ref), var15 (ref)
		return if value.closeCentralOverlayThunk then var15(value.closeCentralOverlayThunk()) else value.navigation and value.navigation.pop()
	end, { var15, value.closeCentralOverlayThunk, value.navigation })
	local var20 = reactModule.useMemo(function() --[[ line: 111 ]]
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy), fFlagQRInSearchScanner (copy), source (ref)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream },
			staticInfoForAllEvents = if fFlagQRInSearchScanner then { source = source } else nil
		})()
	end)
	local var21 = false
	local var22 = nil
	local var22_1 = nil
	
	if var22_1 == nil then
		if fFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, fIntLinkingProtocolFetchRetries do
				local thread = task.spawn(function() --[[ line: 141 ]]
					-- upvalues: var21 (write), var22 (write), default (copy), settingsRoute_1 (ref)
					local var39, var40 = default:supportsSwitchToSettingsApp(settingsRoute_1):await()
					var21 = var39
					var22 = var40
				end)
				task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(thread)
				
				if var22 == nil then
					continue
				end
			end
		else
			local var25, var26 = default:supportsSwitchToSettingsApp(settingsRoute_1):await()
			var21 = var25
			var22 = var26
		end
		var22_1 = var21 and var22
	end
	reactModule.useEffect(function() --[[ line: 158 ]]
		-- upvalues: var20 (ref), settingsRoute_1 (ref), var22_1 (write), appStorageService (copy), var10 (copy), messageBusService (copy), realtimeMessageId (copy), permissionsProtocol (copy), t_1 (copy), var19 (ref)
		var20.fireAnalyticsEvent("SettingsPermissionInteractiveAlertImpression", {
			settingsRoute = settingsRoute_1,
			settingsAppAvailable = var22_1
		})
		appStorageService:SetItem(var10, "true")
		appStorageService:Flush()
		local var41 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 167 ]]
			-- upvalues: permissionsProtocol (copy), t_1 (copy), settingsRoute_1 (copy), var19 (copy)
			permissionsProtocol.default:hasPermissions({ t_1[settingsRoute_1] }):andThen(function(p0) --[[ line: 172 ]]
				-- upvalues: permissionsProtocol (copy), var19 (copy)
				if p0 and p0.status == permissionsProtocol.Status.AUTHORIZED then
					var19()
				end
			end)
		end, false, true)
		
		return function() --[[ line: 179 ]]
			-- upvalues: var41 (ref)
			var41:Disconnect()
		end
	end, {})
	local var27 = useAppPolicy(function(p1) --[[ line: 184 ]]
		return p1.getShouldShowSettingsPermissionsAdditionalInstructions()
	end)
	local var22_1_1 = fFlagPermissionAlertContentUpgradeModule and var22_1
	local var29 = useLocalization({
		ok = "Feature.SettingsHub.Action.Ok",
		additionalInstructionsContactsDeeplinkSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroid",
		additionalInstructionsContactsDeeplinkNotSupported = "Feature.SettingsHub.Description.ContactsPermissionAndroidDeeplinkNotSupported",
		additionalInstructionsCameraDeeplinkSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroid",
		additionalInstructionsCameraDeeplinkNotSupported = "Feature.SettingsHub.Description.QRCodeCameraPermissionAndroidDeeplinkNotSupported",
		notNow = if var22_1_1 then "CommonUI.Controls.Action.Cancel" else "Feature.SettingsHub.Action.NotNow",
		openSettings = if var22_1_1 then "Feature.SettingsHub.Action.AllowInSettings" else "Feature.SettingsHub.Action.OpenSettings",
		titleCamera = if var22_1_1 then "Feature.SettingsHub.Prompt.AllowAccessToCamera" else "Feature.SettingsHub.Prompt.NeedCameraAccess",
		titleContacts = if var22_1_1 then "Feature.SettingsHub.Prompt.AllowAccessToContacts" else "Feature.SettingsHub.Prompt.NeedContactsAccess",
		bodyTextCamera = if var22_1_1 then "Feature.SettingsHub.Description.CameraPermissionRequestQRCode" else "Feature.SettingsHub.Description.QRCodeCameraPermissionIOS",
		bodyTextContacts = if var22_1_1 then "Feature.SettingsHub.Description.ContactsPermissionRequest" else "Feature.SettingsHub.Description.ContactsPermissionIOS"
	})
	local t_2 = {
		[settingsRoute.Camera] = images["icons/controls/cameraOff"],
		[settingsRoute.Contacts] = images["icons/menu/contacts_large"]
	}
	local t_3 = {
		[settingsRoute.Camera] = var29.titleCamera,
		[settingsRoute.Contacts] = var29.titleContacts
	}
	local t_4 = {
		[settingsRoute.Camera] = var29.bodyTextCamera,
		[settingsRoute.Contacts] = var29.bodyTextContacts
	}
	local t_5 = {
		[settingsRoute.Contacts] = {
			deepLinkSupported = var29.additionalInstructionsContactsDeeplinkSupported,
			deepLinkNotSupported = var29.additionalInstructionsContactsDeeplinkNotSupported
		},
		[settingsRoute.Camera] = {
			deepLinkSupported = var29.additionalInstructionsCameraDeeplinkSupported,
			deepLinkNotSupported = var29.additionalInstructionsCameraDeeplinkNotSupported
		}
	}
	local text_2 = "<b>" .. t_5[settingsRoute_1][if var22_1 then "deepLinkSupported" else "deepLinkNotSupported"] .. "</b>"
	local var35 = reactModule.useCallback(function() --[[ line: 248 ]]
		-- upvalues: var20 (ref), settingsRoute_1 (ref), var19 (ref)
		var20.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "notNow", settingsRoute = settingsRoute_1 })
		
		return var19()
	end, { value.navigation })
	local t_6 = {
		buttonType = buttonType.Secondary,
		props = { onActivated = var35, text = var29.notNow }
	}
	local var37 = reactModule.useCallback(function() --[[ line: 263 ]]
		-- upvalues: var20 (ref), settingsRoute_1 (ref), var19 (ref)
		var20.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "ok", settingsRoute = settingsRoute_1 })
		
		return var19()
	end, { value.navigation })
	local var38 = reactModule.useCallback(function() --[[ line: 278 ]]
		-- upvalues: var20 (ref), settingsRoute_1 (ref), default (copy)
		var20.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "openSettings", settingsRoute = settingsRoute_1 })
		
		return default:switchToSettingsApp(settingsRoute_1)
	end, { value.navigation })
	
	return if fFlagPermissionAlertContentUpgradeModule then reactModule.createElement(dialog.Root, {
		hasBackdrop = false,
		disablePortal = true,
		size = dialogSize.Small
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = t_3[settingsRoute_1] }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, { tag = "col gap-small size-full-0 auto-y" }, {
				BodyText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = t_4[settingsRoute_1] }),
				AdditionalInstructions = if var27 then reactModule.createElement(text_1, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = t_5[settingsRoute_1][if var22_1 then "deepLinkSupported" else "deepLinkNotSupported"]
				}) else nil
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = if var22_1 then {
				{
					text = var29.openSettings,
					variant = buttonVariant.Emphasis,
					onActivated = var38
				},
				{
					text = var29.notNow,
					variant = buttonVariant.Standard,
					onActivated = var35
				}
			} else {
				{
					text = var29.ok,
					variant = buttonVariant.Emphasis,
					onActivated = var37
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		richText = true,
		screenSize = var14,
		title = t_3[settingsRoute_1],
		titleIcon = t_2[settingsRoute_1],
		middleContent = reactModule.useCallback(function() --[[ line: 298 ]]
			-- upvalues: reactModule (copy), styledTextLabel (copy), var16 (ref), t_4 (ref), settingsRoute_1 (ref), var27 (ref), text (copy), text_2 (ref)
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
					fontStyle = var16.Font.Body,
					colorStyle = var16.Theme.TextDefault,
					size = UDim2.fromScale(1, 0),
					text = t_4[settingsRoute_1]
				}),
				additionalInstructionsFrame = if var27 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, text.GetTextHeight("", var16.Font.Body.Font, var16.Font.BaseSize * var16.Font.Body.RelativeSize)),
						PaddingLeft = UDim.new(0, 5)
					}),
					AdditionalInstructions = reactModule.createElement(styledTextLabel, {
						fluidSizing = false,
						lineHeight = 1,
						automaticSize = Enum.AutomaticSize.Y,
						fontStyle = var16.Font.Body,
						colorStyle = var16.Theme.TextDefault,
						size = UDim2.fromScale(1, 0),
						text = text_2
					})
				}) else nil
			})
		end, { value.navigation }),
		buttonStackInfo = {
			buttons = if var22_1 then {
				t_6,
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var38, text = var29.openSettings }
				}
			} else {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var37, text = var29.ok }
				}
			}
		}
	})
end