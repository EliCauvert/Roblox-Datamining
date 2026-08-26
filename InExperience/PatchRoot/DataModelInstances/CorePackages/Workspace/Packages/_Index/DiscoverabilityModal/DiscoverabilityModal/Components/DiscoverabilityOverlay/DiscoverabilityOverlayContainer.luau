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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent_1.RobloxAppNavigation).NavigationCommands else nil
local toastRoduxModule = require(parent_1.ToastRodux)
local t = {
	checkOrRequestPermissions = function(p1)
		-- upvalues: permissionsProtocol (ref)
		return permissionsProtocol.default:checkOrRequestPermissions(p1)
	end
}

return function(p1)
	-- upvalues: dash (ref), t (ref), getDeepValue (ref), constantsModule (ref), useDispatch (ref), useAnalyticsModule (ref), useSelector (ref), react (ref), eventNamesModule (ref), toastRoduxModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), textKeysModule (ref), updateContactImporterModalLogic (ref), updateIsDiscoverabilityUnset (ref), networkingUserSettings (ref), permissionsProtocol (ref), updateOptedInUsers (ref), appStorageService (ref), enumScreens (ref), promise (ref), discoverabilityOverlayModule (ref)
	local var2 = dash.join(t, p1 or {})
	
	local _ = function(p2)
		-- upvalues: var2 (ref), getDeepValue (copy)
		return if var2.navigation then var2.navigation.getParam(p2) else getDeepValue(var2, p2)
	end
	
	local iSSTANDALONEDISCOVERABILITYMODAL = constantsModule.IS_STANDALONE_DISCOVERABILITY_MODAL
	local var3 = if var2.navigation then var2.navigation.getParam(iSSTANDALONEDISCOVERABILITYMODAL) else getDeepValue(var2, iSSTANDALONEDISCOVERABILITYMODAL)
	local var4 = useDispatch()
	local var5 = useAnalyticsModule()
	local var6 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	local var7 = useSelector(function(p2)
		return p2.LocalUserId
	end)
	local var8 = react.useCallback(function()
		-- upvalues: var2 (ref)
		if var2.navigation then
			var2.navigation.pop()
			
			return
		elseif var2.onClose then
			var2.onClose()
		end
	end, { var2 })
	local var9 = useSelector(function(p2)
		-- upvalues: getDeepValue (copy)
		return getDeepValue(p2, "DiscoverabilityModal.UserPermissions.userSettingsMetadata")
	end)
	react.useEffect(function()
		-- upvalues: var9 (ref), constantsModule (copy), var5 (ref), eventNamesModule (copy)
		var5.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalLoad, {
			version = if var9.prefillDiscoverabilitySetting then constantsModule.NON_GDPR_VERSION_CHECKBOX else constantsModule.GDPR_VERSION,
			wordingVersion = constantsModule.WORDING_VERSION_1
		})
	end, {})
	local var10 = react.useCallback(function(p2)
		-- upvalues: var4 (ref), toastRoduxModule (copy)
		var4(toastRoduxModule.Actions.SetCurrentToastMessage({ toastMessage = p2 }))
	end, { var4 })
	
	local var11 = function(p2)
		-- upvalues: var5 (ref), eventNamesModule (copy), var8 (ref)
		var5.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalClose, { selected = p2 })
		var8()
	end
	
	local var12 = function()
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateDown (copy)
		local t = {
			detail = "https://en.help.roblox.com/hc/articles/7416652004884",
			name = appPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var4(navigateDown(t, nil))
	end
	
	local var13 = function(_)
		-- upvalues: var10 (ref), textKeysModule (copy)
		var10(textKeysModule.CI_FAILED)
	end
	
	local _ = function()
		-- upvalues: var4 (ref), updateContactImporterModalLogic (copy)
		return var4(updateContactImporterModalLogic({
			hasOSPermissions = true,
			shouldShowContactImporterUpsellModal = false
		}))
	end
	
	local _ = function()
		-- upvalues: var4 (ref), updateIsDiscoverabilityUnset (copy)
		return var4(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
	end
	
	local _ = function(p2)
		-- upvalues: var4 (ref), networkingUserSettings (copy)
		return var4(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p2 }))
	end
	
	return react.createElement(discoverabilityOverlayModule, {
		screenSize = var6,
		onCloseClicked = var11,
		onLearnMoreClick = var12,
		onActivated = function(p2)
			-- upvalues: var5 (ref), eventNamesModule (copy), var3 (ref), var4 (ref), networkingUserSettings (copy), updateIsDiscoverabilityUnset (copy), constantsModule (copy), var2 (ref), getDeepValue (copy), var8 (ref), var10 (ref), textKeysModule (copy), permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), var7 (ref), updateContactImporterModalLogic (copy), enumScreens (copy), var6 (ref), promise (copy), var13 (ref)
			var5.fireAnalyticsEvent(eventNamesModule.DiscoverabilityModalContinue, { selected = p2 })
			
			if var3 then
				var4(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p2 })):andThen(function()
					-- upvalues: var4 (copy), updateIsDiscoverabilityUnset (copy), constantsModule (copy), var2 (copy), getDeepValue (copy), var8 (copy), var10 (copy), textKeysModule (copy)
					local _ = var4(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
					local NAVIGATE_ON_ACTIVATED = constantsModule.NAVIGATE_ON_ACTIVATED
					local var14 = if var2.navigation then var2.navigation.getParam(NAVIGATE_ON_ACTIVATED) else getDeepValue(var2, NAVIGATE_ON_ACTIVATED)
					var8()
					var14()
					var10(textKeysModule.SETTING_SAVED)
				end)
				
				return
			end
			var2.checkOrRequestPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(p3)
				-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), appStorageService (copy), var7 (copy), var4 (copy), updateContactImporterModalLogic (copy), p2 (ref), networkingUserSettings (copy), updateIsDiscoverabilityUnset (copy), var2 (copy), enumScreens (copy), constantsModule (copy), var6 (copy), promise (copy)
				if p3 == permissionsProtocol.Status.AUTHORIZED then
					updateOptedInUsers:addUserToLocalStorage(appStorageService, var7)
					local _ = var4(updateContactImporterModalLogic({
						hasOSPermissions = true,
						shouldShowContactImporterUpsellModal = false
					}))
					var4(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p2 })):andThen(function()
						-- upvalues: var4 (copy), updateIsDiscoverabilityUnset (copy), var2 (copy), enumScreens (copy), constantsModule (copy)
						local _ = var4(updateIsDiscoverabilityUnset({ isDiscoverabilityUnset = false }))
						var2.navigation.replace(enumScreens.ContactsList, {
							[constantsModule.IS_PHONE_VERIFIED] = true,
							entryPoint = var2.navigation.getParam("entryPoint")
						})
					end)
					
					return
				elseif p3 == permissionsProtocol.Status.DENIED then
					var4(networkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = p2 })):andThen(function()
						-- upvalues: var2 (copy), enumScreens (copy), var6 (copy)
						var2.navigation.replace(enumScreens.ContactsRevokedAccessDialog, {
							screenSize = var6,
							closeModal = function()
								-- upvalues: var2 (copy)
								var2.navigation.pop()
							end
						})
					end)
					
					return
				end
				return promise.reject()
			end):catch(var13)
		end,
		prefillDiscoverabilitySetting = var9.prefillDiscoverabilitySetting,
		analytics = var5
	})
end