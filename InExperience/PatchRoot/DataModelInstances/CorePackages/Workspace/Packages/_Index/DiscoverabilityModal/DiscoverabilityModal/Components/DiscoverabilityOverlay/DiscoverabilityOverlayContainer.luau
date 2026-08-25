local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local enumScreens = dependenciesModule.SocialModalsCommon.EnumScreens
local textKeysModule = require(parent.Common.TextKeys)
local constantsModule = require(parent.Common.Constants)
local analytics = parent.Analytics
local useAnalyticsModule = require(analytics.useAnalytics)
local eventNamesModule = require(analytics.Enums.EventNames)
local updateOptedInUsers = dependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local updateContactImporterModalLogic = dependenciesModule.SocialModalsCommon.Actions.UpdateContactImporterModalLogic
local updateIsDiscoverabilityUnset = dependenciesModule.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset
local networkingUserSettings = dependenciesModule.NetworkingUserSettings
local permissionsProtocol = dependenciesModule.PermissionsProtocol
local promise = dependenciesModule.Promise
local dash = dependenciesModule.Dash
local appStorageService = dependenciesModule.AppStorageService
local socialLibraries = dependenciesModule.SocialLibraries
local react = dependenciesModule.React
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local getDeepValue = socialLibraries.Dictionary.getDeepValue
local discoverabilityOverlayModule = require(script.Parent.DiscoverabilityOverlay)
local appPage = require(parent_1.RobloxAppEnums).AppPage
local navigateDown = require(parent_1.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent_1.SharedFlags).FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then require(parent_1.RobloxAppNavigation).NavigationCommands else nil
local toastRoduxModule = require(parent_1.ToastRodux)
local t = {
	checkOrRequestPermissions = function(p0)
		-- upvalues: permissionsProtocol (ref)
		return permissionsProtocol.default:checkOrRequestPermissions(p0)
	end
}

return function(p1)
	-- upvalues: dash (ref), t (ref), getDeepValue (ref), constantsModule (ref), useDispatch (ref), useAnalyticsModule (ref), useSelector (ref), react (ref), eventNamesModule (ref), toastRoduxModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), textKeysModule (ref), updateContactImporterModalLogic (ref), updateIsDiscoverabilityUnset (ref), networkingUserSettings (ref), permissionsProtocol (ref), updateOptedInUsers (ref), appStorageService (ref), enumScreens (ref), promise (ref), discoverabilityOverlayModule (ref)
	local var9 = dash.join(t, p1 or {})
	
	local _ = function(p2)
		-- upvalues: var9 (ref), getDeepValue (copy)
		return if var9.navigation then var9.navigation.getParam(p2) else getDeepValue(var9, p2)
	end
	
	local iSSTANDALONEDISCOVERABILITYMODAL = constantsModule.IS_STANDALONE_DISCOVERABILITY_MODAL
	local var10 = if var9.navigation then var9.navigation.getParam(iSSTANDALONEDISCOVERABILITYMODAL) else getDeepValue(var9, iSSTANDALONEDISCOVERABILITYMODAL)
	local var11 = useDispatch()
	local var12 = useAnalyticsModule()
	local var13 = useSelector(function(p3)
		return p3.ScreenSize
	end)
	local var14 = useSelector(function(p4)
		return p4.LocalUserId
	end)
	local var15 = react.useCallback(function()
		-- upvalues: var9 (ref)
		if var9.navigation then
			var9.navigation.pop()
			
			return
		elseif var9.onClose then
			var9.onClose()
		end
	end, { var9 })
	local var16 = useSelector(function(p5)
		-- upvalues: getDeepValue (copy)
		return getDeepValue(p5, "DiscoverabilityModal.UserPermissions.userSettingsMetadata")
	end)
	react.useEffect(function()
		-- upvalues: var16 (ref), constantsModule (copy), var12 (ref), eventNamesModule (copy)
		var12.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalLoad, {
			version = if var16.prefillDiscoverabilitySetting then constantsModule.NON_GDPR_VERSION_CHECKBOX else constantsModule.GDPR_VERSION,
			wordingVersion = constantsModule.WORDING_VERSION_1
		})
	end, {})
	local var17 = react.useCallback(function(p6)
		-- upvalues: var11 (ref), toastRoduxModule (copy)
		var11(toastRoduxModule.Actions.SetCurrentToastMessage({ toastMessage = p6 }))
	end, { var11 })
	
	local var18 = function(p7)
		-- upvalues: var12 (ref), eventNamesModule (copy), var15 (ref)
		var12.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalClose, { selected = p7 })
		var15()
	end
	
	local var19 = function()
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var11 (ref), navigateDown (copy)
		local t = {
			detail = "https://en.help.roblox.com/hc/articles/7416652004884",
			name = appPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var6.down(var6.fromLegacyPage(t))
			
			return
		end
		var11(navigateDown(t, nil))
	end
	
	local var20 = function(_)
		-- upvalues: var17 (ref), textKeysModule (copy)
		var17(textKeysModule.CI_FAILED)
	end
	
	local _ = function()
		-- upvalues: var11 (ref), updateContactImporterModalLogic (copy)
		return var11(updateContactImporterModalLogic({
			hasOSPermissions = true,
			shouldShowContactImporterUpsellModal = false
		}))
	end
	
	local _ = function()
		-- upvalues: var11 (ref), updateIsDiscoverabilityUnset (copy)
		return var11(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
	end
	
	local _ = function(p8)
		-- upvalues: var11 (ref), networkingUserSettings (copy)
		return var11(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p8 }))
	end
	
	return react.createElement(discoverabilityOverlayModule, {
		screenSize = var13,
		onCloseClicked = var18,
		onLearnMoreClick = var19,
		onActivated = function(p9)
			-- upvalues: var12 (ref), eventNamesModule (copy), var10 (ref), var11 (ref), networkingUserSettings (copy), updateIsDiscoverabilityUnset (copy), constantsModule (copy), var9 (ref), getDeepValue (copy), var15 (ref), var17 (ref), textKeysModule (copy), permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), var14 (ref), updateContactImporterModalLogic (copy), enumScreens (copy), var13 (ref), promise (copy), var20 (ref)
			var12.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalContinue, { selected = p9 })
			
			if var10 then
				var11(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p9 })):andThen(function()
					-- upvalues: var11 (copy), updateIsDiscoverabilityUnset (copy), constantsModule (copy), var9 (copy), getDeepValue (copy), var15 (copy), var17 (copy), textKeysModule (copy)
					local _ = var11(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
					local NAVIGATE_ON_ACTIVATED = constantsModule.NAVIGATE_ON_ACTIVATED
					local var22 = if var9.navigation then var9.navigation.getParam(NAVIGATE_ON_ACTIVATED) else getDeepValue(var9, NAVIGATE_ON_ACTIVATED)
					var15()
					var22()
					var17(textKeysModule.SETTING_SAVED)
				end)
				
				return
			end
			var9.checkOrRequestPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(p10)
				-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), var14 (copy), var11 (copy), updateContactImporterModalLogic (copy), p9 (ref), networkingUserSettings (copy), updateIsDiscoverabilityUnset (copy), var9 (copy), enumScreens (copy), constantsModule (copy), var13 (copy), promise (copy)
				if p10 == permissionsProtocol.Status.AUTHORIZED then
					updateOptedInUsers:addUserToLocalStorage(appStorageService, var14)
					local _ = var11(updateContactImporterModalLogic({
						hasOSPermissions = true,
						shouldShowContactImporterUpsellModal = false
					}))
					var11(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p9 })):andThen(function()
						-- upvalues: var11 (copy), updateIsDiscoverabilityUnset (copy), var9 (copy), enumScreens (copy), constantsModule (copy)
						local _ = var11(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
						var9.navigation.replace(enumScreens.ContactsList, {
							[constantsModule.IS_PHONE_VERIFIED] = true,
							entryPoint = var9.navigation.getParam("entryPoint")
						})
					end)
					
					return
				elseif p10 == permissionsProtocol.Status.DENIED then
					var11(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p9 })):andThen(function()
						-- upvalues: var9 (copy), enumScreens (copy), var13 (copy)
						var9.navigation.replace(enumScreens.ContactsRevokedAccessDialog, {
							screenSize = var13,
							closeModal = function()
								-- upvalues: var9 (copy)
								var9.navigation.pop()
							end
						})
					end)
					
					return
				end
				return promise.reject()
			end):catch(var20)
		end,
		prefillDiscoverabilitySetting = var16.prefillDiscoverabilitySetting,
		analytics = var12
	})
end