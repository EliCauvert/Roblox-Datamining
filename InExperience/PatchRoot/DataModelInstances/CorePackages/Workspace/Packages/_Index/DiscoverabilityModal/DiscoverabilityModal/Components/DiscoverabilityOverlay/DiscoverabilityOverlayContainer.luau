local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Parent1 = Parent.Parent
local EnumScreens = DependenciesModule.SocialModalsCommon.EnumScreens
local TextKeysModule = require(Parent.Common.TextKeys)
local ConstantsModule = require(Parent.Common.Constants)
local Analytics = Parent.Analytics
local UseAnalyticsModule = require(Analytics.useAnalytics)
local EventNamesModule = require(Analytics.Enums.EventNames)
local UpdateOptedInUsers = DependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local UpdateContactImporterModalLogicFunction = DependenciesModule.SocialModalsCommon.Actions.UpdateContactImporterModalLogic
local UpdateIsDiscoverabilityUnsetFunction = DependenciesModule.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset
local NetworkingUserSettings = DependenciesModule.NetworkingUserSettings
local PermissionsProtocol = DependenciesModule.PermissionsProtocol
local Promise = DependenciesModule.Promise
local Dash = DependenciesModule.Dash
local AppStorageService = DependenciesModule.AppStorageService
local React = DependenciesModule.React
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local DiscoverabilityOverlayModule = require(script.Parent.DiscoverabilityOverlay)
local AppPage = require(Parent1.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent1.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent1.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local ToastRoduxModule = require(Parent1.ToastRodux)
local config = {
	checkOrRequestPermissions = function(p1) --[[ Line: 66 ]]
		-- upvalues: PermissionsProtocol (copy)
		return PermissionsProtocol.default:checkOrRequestPermissions(p1)
	end
}

return function(p1) --[[ Line: 72 ]]
	-- upvalues: Dash (copy), config (copy), GetDeepValueFunction (copy), ConstantsModule (copy), UseDispatchFunction (copy), UseAnalyticsModule (copy), UseSelectorFunction (copy), React (copy), EventNamesModule (copy), ToastRoduxModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), TextKeysModule (copy), UpdateContactImporterModalLogicFunction (copy), UpdateIsDiscoverabilityUnsetFunction (copy), NetworkingUserSettings (copy), PermissionsProtocol (copy), UpdateOptedInUsers (copy), AppStorageService (copy), EnumScreens (copy), Promise (copy), DiscoverabilityOverlayModule (copy)
	local JoinResult = Dash.join(config, p1 or {})
	
	local function _(p2) --[[ Line: 74 ]]
		-- upvalues: JoinResult (copy), GetDeepValueFunction (upval)
		return if JoinResult.navigation then JoinResult.navigation.getParam(p2) else GetDeepValueFunction(JoinResult, p2)
	end
	
	local ISSTANDALONEDISCOVERABILITYMODAL = ConstantsModule.IS_STANDALONE_DISCOVERABILITY_MODAL
	local Param = if JoinResult.navigation then JoinResult.navigation.getParam(ISSTANDALONEDISCOVERABILITYMODAL) else GetDeepValueFunction(JoinResult, ISSTANDALONEDISCOVERABILITYMODAL)
	local UseDispatchResult = UseDispatchFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 84 ]]
		return p2.ScreenSize
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 87 ]]
		return p2.LocalUserId
	end)
	local UseResult = React.useCallback(function() --[[ Line: 91 ]]
		-- upvalues: JoinResult (copy)
		if JoinResult.navigation then
			JoinResult.navigation.pop()
			
			return
		end
		if JoinResult.onClose then
			JoinResult.onClose()
		end
	end, { JoinResult })
	local UseSelectorResult2 = UseSelectorFunction(function(p2) --[[ Line: 99 ]]
		-- upvalues: GetDeepValueFunction (upval)
		return GetDeepValueFunction(p2, "DiscoverabilityModal.UserPermissions.userSettingsMetadata")
	end)
	React.useEffect(function() --[[ Line: 103 ]]
		-- upvalues: UseSelectorResult2 (copy), ConstantsModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalLoad, {
			version = if UseSelectorResult2.prefillDiscoverabilitySetting then ConstantsModule.NON_GDPR_VERSION_CHECKBOX else ConstantsModule.GDPR_VERSION,
			wordingVersion = ConstantsModule.WORDING_VERSION_1
		})
	end, {})
	local UseResult1 = React.useCallback(function(ToastMessage) --[[ Line: 117 ]]
		-- upvalues: UseDispatchResult (copy), ToastRoduxModule (upval)
		UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({ toastMessage = ToastMessage }))
	end, { UseDispatchResult })
	
	local function v33(_) --[[ Line: 145 ]]
		-- upvalues: UseResult1 (copy), TextKeysModule (upval)
		UseResult1(TextKeysModule.CI_FAILED)
	end
	
	local _ = function() --[[ Line: 149 ]]
		-- upvalues: UseDispatchResult (copy), UpdateContactImporterModalLogicFunction (upval)
		return UseDispatchResult(UpdateContactImporterModalLogicFunction({
			hasOSPermissions = true,
			shouldShowContactImporterUpsellModal = false
		}))
	end
	
	local _ = function() --[[ Line: 156 ]]
		-- upvalues: UseDispatchResult (copy), UpdateIsDiscoverabilityUnsetFunction (upval)
		return UseDispatchResult(UpdateIsDiscoverabilityUnsetFunction({ isDiscoverabilityUnset = false }))
	end
	
	local _ = function(PhoneNumberDiscoverability) --[[ Line: 162 ]]
		-- upvalues: UseDispatchResult (copy), NetworkingUserSettings (upval)
		return UseDispatchResult(NetworkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = PhoneNumberDiscoverability }))
	end
	
	return React.createElement(DiscoverabilityOverlayModule, {
		screenSize = UseSelectorResult,
		onCloseClicked = function(Selected) --[[ Line: 123 ]]
			-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseResult (copy)
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalClose, { selected = Selected })
			UseResult()
		end,
		onLearnMoreClick = function() --[[ Line: 130 ]]
			-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
			local config = {
				detail = "https://en.help.roblox.com/hc/articles/7416652004884",
				name = AppPage.GenericWebPage,
				extraProps = { title = "" }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownFunction(config, nil))
			end
		end,
		onActivated = function(PhoneNumberDiscoverability) --[[ Line: 168 ]]
			-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), Param (copy), UseDispatchResult (copy), NetworkingUserSettings (upval), UpdateIsDiscoverabilityUnsetFunction (upval), ConstantsModule (upval), JoinResult (copy), GetDeepValueFunction (upval), UseResult (copy), UseResult1 (copy), TextKeysModule (upval), PermissionsProtocol (upval), UpdateOptedInUsers (upval), AppStorageService (upval), UseSelectorResult1 (copy), UpdateContactImporterModalLogicFunction (upval), EnumScreens (upval), UseSelectorResult (copy), Promise (upval), v33 (copy)
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.DiscoverabilityModalContinue, { selected = PhoneNumberDiscoverability })
			
			if Param then
				UseDispatchResult(NetworkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = PhoneNumberDiscoverability })):andThen(function() --[[ Line: 174 ]]
					-- upvalues: UseDispatchResult (upval), UpdateIsDiscoverabilityUnsetFunction (upval), ConstantsModule (upval), JoinResult (upval), GetDeepValueFunction (upval), UseResult (upval), UseResult1 (upval), TextKeysModule (upval)
					local _ = UseDispatchResult(UpdateIsDiscoverabilityUnsetFunction({ isDiscoverabilityUnset = false }))
					local NAVIGATEONACTIVATED = ConstantsModule.NAVIGATE_ON_ACTIVATED
					local Param: () -> () = if JoinResult.navigation then JoinResult.navigation.getParam(NAVIGATEONACTIVATED) else GetDeepValueFunction(JoinResult, NAVIGATEONACTIVATED)
					UseResult()
					Param()
					UseResult1(TextKeysModule.SETTING_SAVED)
				end)
				
				return
			else
				JoinResult.checkOrRequestPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(Result) --[[ Line: 186 ]]
					-- upvalues: PermissionsProtocol (upval), UpdateOptedInUsers (upval), AppStorageService (upval), UseSelectorResult1 (upval), UseDispatchResult (upval), UpdateContactImporterModalLogicFunction (upval), PhoneNumberDiscoverability (copy), NetworkingUserSettings (upval), UpdateIsDiscoverabilityUnsetFunction (upval), JoinResult (upval), EnumScreens (upval), ConstantsModule (upval), UseSelectorResult (upval), Promise (upval)
					if Result == PermissionsProtocol.Status.AUTHORIZED then
						UpdateOptedInUsers:addUserToLocalStorage(AppStorageService, UseSelectorResult1)
						local _ = UseDispatchResult(UpdateContactImporterModalLogicFunction({
							hasOSPermissions = true,
							shouldShowContactImporterUpsellModal = false
						}))
						UseDispatchResult(NetworkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = PhoneNumberDiscoverability })):andThen(function() --[[ Line: 190 ]]
							-- upvalues: UseDispatchResult (upval), UpdateIsDiscoverabilityUnsetFunction (upval), JoinResult (upval), EnumScreens (upval), ConstantsModule (upval)
							local _ = UseDispatchResult(UpdateIsDiscoverabilityUnsetFunction({ isDiscoverabilityUnset = false }))
							JoinResult.navigation.replace(EnumScreens.ContactsList, {
								[ConstantsModule.IS_PHONE_VERIFIED] = true,
								entryPoint = JoinResult.navigation.getParam("entryPoint")
							})
						end)
						
						return
					end
					if Result == PermissionsProtocol.Status.DENIED then
						UseDispatchResult(NetworkingUserSettings.UpdateUserSettings.API({ phoneNumberDiscoverability = PhoneNumberDiscoverability })):andThen(function() --[[ Line: 199 ]]
							-- upvalues: JoinResult (upval), EnumScreens (upval), UseSelectorResult (upval)
							JoinResult.navigation.replace(EnumScreens.ContactsRevokedAccessDialog, {
								screenSize = UseSelectorResult,
								closeModal = function() --[[ Line: 202 ]]
									-- upvalues: JoinResult (upval)
									JoinResult.navigation.pop()
								end
							})
						end)
						
						return
					else
						return Promise.reject()
					end
				end):catch(v33)
			end
		end,
		prefillDiscoverabilitySetting = UseSelectorResult2.prefillDiscoverabilitySetting,
		analytics = UseAnalyticsModuleResult
	})
end