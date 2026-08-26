local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local centralOverlayModule = require(parent.CentralOverlay)
local deepLinkModule = require(parent.DeepLink)
local useSignalState = require(parent.SignalsReact).useSignalState
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local roactServiceTagsModule = require(parent.RoactServiceTags)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local notificationsUpsellModule = require(parent.NotificationsUpsell)
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local useModalSignalStoreModule = require(serverTriggeredModals.SignalStores.useModalSignalStore)
local loggerModule = require(serverTriggeredModals.Logger)
local entryPointModule = require(serverTriggeredModals.EntryPoint)
local fetchModalMetadataModule = require(serverTriggeredModals.fetchModalMetadata)
local useHandleCustomModalCallbackModule = require(serverTriggeredModals.useHandleCustomModalCallback)
local fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals = sharedFlagsModule.FFlagLuaAppSupportNonSduiTypeForServerTriggeredModals
local fFlagEnableDeepLinkHistoryWithModalAPI = sharedFlagsModule.FFlagEnableDeepLinkHistoryWithModalAPI
local serverTriggeredModalTrafficPercent = game:DefineFastInt("ServerTriggeredModalTrafficPercent", 0)
local luaAppAvoidPushUpsellConflicts = game:DefineFastFlag("LuaAppAvoidPushUpsellConflicts", false)

return reactModule.memo(roactNavigationModule.withNavigationFocus(function(p1)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useDispatch (ref), useModalSignalStoreModule (ref), useSignalState (ref), entryPointModule (ref), fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), luaAppAvoidPushUpsellConflicts (ref), reactModule (ref), fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (ref), useHandleCustomModalCallbackModule (ref), notificationsUpsellModule (ref), loggerModule (ref), serverTriggeredModalTrafficPercent (ref), fetchModalMetadataModule (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var1 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var2 = useDispatch()
	local var3 = useModalSignalStoreModule()
	local var4 = useSignalState(var3.getMetadataGetter(entryPointModule.HomepageLaunch))
	local var5 = useSignalState(var3.getHasShownGetter(entryPointModule.HomepageLaunch))
	local _ = nil
	local var6 = if fFlagEnableDeepLinkHistoryWithModalAPI then useSignalState(deepLinkModule.DeepLinkLuaReceiverStatusStore(false).getDeepLinkLuaPostAuthReceiverStatus) else nil
	local var7 = nil
	local var8 = nil
	
	if luaAppAvoidPushUpsellConflicts then
		local var9, var10 = reactModule.useState(false)
		var7 = var9
		var8 = var10
	end
	local var11 = nil
	local var12 = nil
	
	if luaAppAvoidPushUpsellConflicts then
		local var13, var14 = reactModule.useState(false)
		var11 = var13
		var12 = var14
	end
	local isFocused = p1.isFocused
	local var15 = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then useHandleCustomModalCallbackModule(entryPointModule.HomepageLaunch, var1) else nil
	
	if luaAppAvoidPushUpsellConflicts then
		reactModule.useEffect(function()
			-- upvalues: var12 (write), notificationsUpsellModule (copy), var8 (write), loggerModule (copy)
			var12(true)
			notificationsUpsellModule.setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellModule.NotificationsUpsellConstants.ModalKey.PushUpsellHome, false):andThen(function(p2)
				-- upvalues: var8 (copy)
				if p2 then
					var8(true)
					
					return
				end
			end):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:error(`Failed to evaluate push upsell: {p2}`)
			end):finally(function()
				-- upvalues: var12 (copy)
				var12(false)
			end)
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: serverTriggeredModalTrafficPercent (copy), fFlagEnableDeepLinkHistoryWithModalAPI (copy), var6 (write), deepLinkModule (copy), fetchModalMetadataModule (copy), var1 (ref), entryPointModule (copy), loggerModule (copy)
		if serverTriggeredModalTrafficPercent <= math.random(0, 99) then return end
		if fFlagEnableDeepLinkHistoryWithModalAPI and var6 ~= deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready then
			return
		end
		local var16 = fetchModalMetadataModule(var1, entryPointModule.HomepageLaunch):catch(function(p2)
			-- upvalues: loggerModule (copy)
			loggerModule:error(`Failed to fetch modal metadata for home page launch: {p2}`)
		end)
		
		return function()
			-- upvalues: var16 (ref)
			var16:cancel()
		end
	end, {
		var1,
		if fFlagEnableDeepLinkHistoryWithModalAPI then var6 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), isFocused (ref), luaAppAvoidPushUpsellConflicts (copy), var11 (write), var7 (write), var3 (ref), entryPointModule (copy), fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (copy), var15 (ref), var2 (ref), setCentralOverlay (copy), centralOverlayType (copy)
		if var5 then return end
		if not var4 then return end
		if not isFocused then return end
		if luaAppAvoidPushUpsellConflicts and (var11 or var7) then return end
		var3.setHasShown(entryPointModule.HomepageLaunch, true)
		
		if not fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then
			var2(setCentralOverlay(centralOverlayType.SduiModal, {
				sduiComponentConfig = var4.sduiConfig,
				modalId = var4.modalId,
				modalType = var4.modalType
			}))
			
			return
		elseif var4.isCustomHandler then
			var15(var4)
			
			return
		end
		var2(setCentralOverlay(centralOverlayType.SduiModal, {
			sduiComponentConfig = var4.sduiConfig,
			modalId = var4.modalId,
			modalType = var4.modalType
		}))
	end, {
		var5, var4, isFocused, var2,
		if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then var15 else nil,
		if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then var3 else nil,
		if luaAppAvoidPushUpsellConflicts then var11 else nil,
		if luaAppAvoidPushUpsellConflicts then var7 else nil
	})
	
	return nil
end))