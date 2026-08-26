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
local var1 = if require(parent.SharedFlags).FFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
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

return function(value)
	-- upvalues: useScreenSize (ref), useDispatch (ref), useStyle (ref), reactModule (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), fFlagQRInSearchScanner (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), fIntLinkingProtocolFetchTimeoutMS (ref), appStorageService (ref), var1 (ref), messageBusService (ref), realtimeMessageId (ref), permissionsProtocol (ref), t_1 (ref), useAppPolicy (ref), fFlagPermissionAlertContentUpgradeModule (ref), useLocalization (ref), settingsRoute (ref), images (ref), buttonType (ref), styledTextLabel (ref), text (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref), text_1 (ref), orientation (ref), interactiveAlert (ref)
	local var2 = useScreenSize()
	local var3 = useDispatch()
	local var4 = useStyle()
	local settingsRoute_1 = value.settingsRoute or value.navigation and value.navigation.getParam("settingsRoute")
	local source = value.source or value.navigation and value.navigation.getParam("source")
	local var5 = reactModule.useCallback(function()
		-- upvalues: value (ref), var3 (ref)
		return if value.closeCentralOverlayThunk then var3(value.closeCentralOverlayThunk()) else value.navigation and value.navigation.pop()
	end, { var3, value.closeCentralOverlayThunk, value.navigation })
	local var6 = reactModule.useMemo(function()
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy), fFlagQRInSearchScanner (copy), source (ref)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream },
			staticInfoForAllEvents = if fFlagQRInSearchScanner then { source = source } else nil
		})()
	end)
	local var7 = false
	local var8 = nil
	local var9 = nil
	
	if var9 == nil then
		if fFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, fIntLinkingProtocolFetchRetries do
				local thread = task.spawn(function()
					-- upvalues: var7 (write), var8 (write), default (copy), settingsRoute_1 (ref)
					local var10, var11 = default:supportsSwitchToSettingsApp(settingsRoute_1):await()
					var7 = var10
					var8 = var11
				end)
				task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(thread)
				
				if var8 == nil then
					continue
				end
			end
		else
			local var10, var11 = default:supportsSwitchToSettingsApp(settingsRoute_1):await()
			var7 = var10
			var8 = var11
		end
		var9 = var7 and var8
	end
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), settingsRoute_1 (ref), var9 (write), appStorageService (copy), var1 (copy), messageBusService (copy), realtimeMessageId (copy), permissionsProtocol (copy), t_1 (copy), var5 (ref)
		var6.fireAnalyticsEvent("SettingsPermissionInteractiveAlertImpression", {
			settingsRoute = settingsRoute_1,
			settingsAppAvailable = var9
		})
		appStorageService:SetItem(var1, "true")
		appStorageService:Flush()
		local var12 = messageBusService:Subscribe(realtimeMessageId, function()
			-- upvalues: permissionsProtocol (copy), t_1 (copy), settingsRoute_1 (copy), var5 (copy)
			permissionsProtocol.default:hasPermissions({ t_1[settingsRoute_1] }):andThen(function(p1)
				-- upvalues: permissionsProtocol (copy), var5 (copy)
				if p1 and p1.status == permissionsProtocol.Status.AUTHORIZED then
					var5()
				end
			end)
		end, false, true)
		
		return function()
			-- upvalues: var12 (ref)
			var12:Disconnect()
		end
	end, {})
	local var12 = useAppPolicy(function(p1)
		return p1.getShouldShowSettingsPermissionsAdditionalInstructions()
	end)
	local var22_1_1 = fFlagPermissionAlertContentUpgradeModule and var9
	local var13 = useLocalization({
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
		[settingsRoute.Camera] = var13.titleCamera,
		[settingsRoute.Contacts] = var13.titleContacts
	}
	local t_4 = {
		[settingsRoute.Camera] = var13.bodyTextCamera,
		[settingsRoute.Contacts] = var13.bodyTextContacts
	}
	local t_5 = {
		[settingsRoute.Contacts] = {
			deepLinkSupported = var13.additionalInstructionsContactsDeeplinkSupported,
			deepLinkNotSupported = var13.additionalInstructionsContactsDeeplinkNotSupported
		},
		[settingsRoute.Camera] = {
			deepLinkSupported = var13.additionalInstructionsCameraDeeplinkSupported,
			deepLinkNotSupported = var13.additionalInstructionsCameraDeeplinkNotSupported
		}
	}
	local text_2 = "<b>" .. t_5[settingsRoute_1][if var9 then "deepLinkSupported" else "deepLinkNotSupported"] .. "</b>"
	local var14 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), settingsRoute_1 (ref), var5 (ref)
		var6.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "notNow", settingsRoute = settingsRoute_1 })
		
		return var5()
	end, { value.navigation })
	local t_6 = {
		buttonType = buttonType.Secondary,
		props = { onActivated = var14, text = var13.notNow }
	}
	local var15 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), settingsRoute_1 (ref), var5 (ref)
		var6.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "ok", settingsRoute = settingsRoute_1 })
		
		return var5()
	end, { value.navigation })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), settingsRoute_1 (ref), default (copy)
		var6.fireAnalyticsEvent("SettingsPermissionInteractiveAlertButtonClick", { btn = "openSettings", settingsRoute = settingsRoute_1 })
		
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
				AdditionalInstructions = if var12 then reactModule.createElement(text_1, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = t_5[settingsRoute_1][if var9 then "deepLinkSupported" else "deepLinkNotSupported"]
				}) else nil
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = if var9 then {
				{
					text = var13.openSettings,
					variant = buttonVariant.Emphasis,
					onActivated = var16
				},
				{
					text = var13.notNow,
					variant = buttonVariant.Standard,
					onActivated = var14
				}
			} else {
				{
					text = var13.ok,
					variant = buttonVariant.Emphasis,
					onActivated = var15
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		richText = true,
		screenSize = var2,
		title = t_3[settingsRoute_1],
		titleIcon = t_2[settingsRoute_1],
		middleContent = reactModule.useCallback(function()
			-- upvalues: reactModule (copy), styledTextLabel (copy), var4 (ref), t_4 (ref), settingsRoute_1 (ref), var12 (ref), text (copy), text_2 (ref)
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
					fontStyle = var4.Font.Body,
					colorStyle = var4.Theme.TextDefault,
					size = UDim2.fromScale(1, 0),
					text = t_4[settingsRoute_1]
				}),
				additionalInstructionsFrame = if var12 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIPadding = reactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, text.GetTextHeight("", var4.Font.Body.Font, var4.Font.BaseSize * var4.Font.Body.RelativeSize)),
						PaddingLeft = UDim.new(0, 5)
					}),
					AdditionalInstructions = reactModule.createElement(styledTextLabel, {
						fluidSizing = false,
						lineHeight = 1,
						automaticSize = Enum.AutomaticSize.Y,
						fontStyle = var4.Font.Body,
						colorStyle = var4.Theme.TextDefault,
						size = UDim2.fromScale(1, 0),
						text = text_2
					})
				}) else nil
			})
		end, { value.navigation }),
		buttonStackInfo = {
			buttons = if var9 then {
				t_6,
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var16, text = var13.openSettings }
				}
			} else {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var15, text = var13.ok }
				}
			}
		}
	})
end