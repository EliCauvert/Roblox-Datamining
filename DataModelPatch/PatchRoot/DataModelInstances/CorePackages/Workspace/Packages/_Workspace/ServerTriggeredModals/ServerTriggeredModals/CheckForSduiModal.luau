local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local DeepLinkModule = require(Parent.DeepLink)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local SharedFlagsModule = require(Parent.SharedFlags)
local NotificationsUpsellModule = require(Parent.NotificationsUpsell)
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local UseModalSignalStoreModule = require(ServerTriggeredModals.SignalStores.useModalSignalStore)
local LoggerModule = require(ServerTriggeredModals.Logger)
local EntryPointModule = require(ServerTriggeredModals.EntryPoint)
local FetchModalMetadataModule = require(ServerTriggeredModals.fetchModalMetadata)
local UseHandleCustomModalCallbackModule = require(ServerTriggeredModals.useHandleCustomModalCallback)
local FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals = SharedFlagsModule.FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals
local FFlagEnableDeepLinkHistoryWithModalAPI = SharedFlagsModule.FFlagEnableDeepLinkHistoryWithModalAPI
local ServerTriggeredModalTrafficPercent = game:DefineFastInt("ServerTriggeredModalTrafficPercent", 0)
local LuaAppAvoidPushUpsellConflicts = game:DefineFastFlag("LuaAppAvoidPushUpsellConflicts", false)

return ReactModule.memo((require(Parent.RoactNavigation).withNavigationFocus(function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), UseDispatchFunction (copy), UseModalSignalStoreModule (copy), UseSignalStateFunction (copy), EntryPointModule (copy), FFlagEnableDeepLinkHistoryWithModalAPI (copy), DeepLinkModule (copy), LuaAppAvoidPushUpsellConflicts (copy), ReactModule (copy), FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (copy), UseHandleCustomModalCallbackModule (copy), NotificationsUpsellModule (copy), LoggerModule (copy), ServerTriggeredModalTrafficPercent (copy), FetchModalMetadataModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local UseModalSignalStoreModuleResult = UseModalSignalStoreModule()
	local UseSignalStateResult = UseSignalStateFunction(UseModalSignalStoreModuleResult.getMetadataGetter(EntryPointModule.HomepageLaunch))
	local UseSignalStateResult1 = UseSignalStateFunction(UseModalSignalStoreModuleResult.getHasShownGetter(EntryPointModule.HomepageLaunch))
	local UseSignalStateResult2 = if FFlagEnableDeepLinkHistoryWithModalAPI then UseSignalStateFunction(DeepLinkModule.DeepLinkLuaReceiverStatusStore(false).getDeepLinkLuaPostAuthReceiverStatus) else nil
	local v1 = nil
	local Callback1 = nil
	
	if LuaAppAvoidPushUpsellConflicts then
		v1, Callback1 = ReactModule.useState(false)
	end
	local v2 = nil
	local Callback = nil
	
	if LuaAppAvoidPushUpsellConflicts then
		v2, Callback = ReactModule.useState(false)
	end
	local IsFocused = p1.isFocused
	local UseHandleCustomModalCallbackModuleResult = if FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then UseHandleCustomModalCallbackModule(EntryPointModule.HomepageLaunch, UseRoactServiceResult) else nil
	
	if LuaAppAvoidPushUpsellConflicts then
		ReactModule.useEffect(function()
			-- upvalues: Callback (ref), NotificationsUpsellModule (upval), Callback1 (ref), LoggerModule (upval)
			Callback(true)
			NotificationsUpsellModule.setupPushNotificationsUpsell.ShouldShowUpsell(NotificationsUpsellModule.NotificationsUpsellConstants.ModalKey.PushUpsellHome, false):andThen(function(Result)
				-- upvalues: Callback1 (upval)
				if Result then
					Callback1(true)
					
					return
				end
			end):catch(function(Err)
				-- upvalues: LoggerModule (upval)
				LoggerModule:error(`Failed to evaluate push upsell: {Err}`)
			end):finally(function()
				-- upvalues: Callback (upval)
				Callback(false)
			end)
		end, {})
	end
	ReactModule.useEffect(function()
		-- upvalues: ServerTriggeredModalTrafficPercent (upval), FFlagEnableDeepLinkHistoryWithModalAPI (upval), UseSignalStateResult2 (ref), DeepLinkModule (upval), FetchModalMetadataModule (upval), UseRoactServiceResult (copy), EntryPointModule (upval), LoggerModule (upval)
		if ServerTriggeredModalTrafficPercent <= math.random(0, 99) then return end
		if FFlagEnableDeepLinkHistoryWithModalAPI and UseSignalStateResult2 ~= DeepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready then return end
		local v3 = FetchModalMetadataModule(UseRoactServiceResult, EntryPointModule.HomepageLaunch):catch(function(Err)
			-- upvalues: LoggerModule (upval)
			LoggerModule:error(`Failed to fetch modal metadata for home page launch: {Err}`)
		end)
		
		return function()
			-- upvalues: v3 (copy)
			v3:cancel()
		end
	end, {
		UseRoactServiceResult,
		if FFlagEnableDeepLinkHistoryWithModalAPI then UseSignalStateResult2 else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult1 (copy), UseSignalStateResult (copy), IsFocused (copy), LuaAppAvoidPushUpsellConflicts (upval), v2 (ref), v1 (ref), UseModalSignalStoreModuleResult (copy), EntryPointModule (upval), FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (upval), UseHandleCustomModalCallbackModuleResult (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		if UseSignalStateResult1 then return end
		if not UseSignalStateResult then return end
		if not IsFocused then return end
		if LuaAppAvoidPushUpsellConflicts and (v2 or v1) then return end
		UseModalSignalStoreModuleResult.setHasShown(EntryPointModule.HomepageLaunch, true)
		
		if not FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.SduiModal, {
				sduiComponentConfig = UseSignalStateResult.sduiConfig,
				modalId = UseSignalStateResult.modalId,
				modalType = UseSignalStateResult.modalType
			}))
			
			return
		end
		if UseSignalStateResult.isCustomHandler then
			UseHandleCustomModalCallbackModuleResult(UseSignalStateResult)
			
			return
		else
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.SduiModal, {
				sduiComponentConfig = UseSignalStateResult.sduiConfig,
				modalId = UseSignalStateResult.modalId,
				modalType = UseSignalStateResult.modalType
			}))
		end
	end, {
		UseSignalStateResult1, UseSignalStateResult, IsFocused, UseDispatchResult,
		if FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then UseHandleCustomModalCallbackModuleResult else nil,
		if FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then UseModalSignalStoreModuleResult else nil,
		if LuaAppAvoidPushUpsellConflicts then v2 else nil,
		if LuaAppAvoidPushUpsellConflicts then v1 else nil
	})
	
	return nil
end)))