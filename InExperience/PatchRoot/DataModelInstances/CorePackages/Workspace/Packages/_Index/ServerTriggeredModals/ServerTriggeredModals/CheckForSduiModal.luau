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

return reactModule.memo(roactNavigationModule.withNavigationFocus(function(p0)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useDispatch (ref), useModalSignalStoreModule (ref), useSignalState (ref), entryPointModule (ref), fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), luaAppAvoidPushUpsellConflicts (ref), reactModule (ref), fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (ref), useHandleCustomModalCallbackModule (ref), notificationsUpsellModule (ref), loggerModule (ref), serverTriggeredModalTrafficPercent (ref), fetchModalMetadataModule (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var16 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var17 = useDispatch()
	local var18 = useModalSignalStoreModule()
	local var19 = useSignalState(var18.getMetadataGetter(entryPointModule.HomepageLaunch))
	local var20 = useSignalState(var18.getHasShownGetter(entryPointModule.HomepageLaunch))
	local _ = nil
	local var21 = if fFlagEnableDeepLinkHistoryWithModalAPI then useSignalState(deepLinkModule.DeepLinkLuaReceiverStatusStore(false).getDeepLinkLuaPostAuthReceiverStatus) else nil
	local var22 = nil
	local var23 = nil
	
	if luaAppAvoidPushUpsellConflicts then
		local var24, var25 = reactModule.useState(false)
		var22 = var24
		var23 = var25
	end
	local var26 = nil
	local var27 = nil
	
	if luaAppAvoidPushUpsellConflicts then
		local var28, var29 = reactModule.useState(false)
		var26 = var28
		var27 = var29
	end
	local isFocused = p0.isFocused
	local var30 = if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then useHandleCustomModalCallbackModule(entryPointModule.HomepageLaunch, var16) else nil
	
	if luaAppAvoidPushUpsellConflicts then
		reactModule.useEffect(function()
			-- upvalues: var27 (write), notificationsUpsellModule (copy), var23 (write), loggerModule (copy)
			var27(true)
			notificationsUpsellModule.setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellModule.NotificationsUpsellConstants.ModalKey.PushUpsellHome, false):andThen(function(p2)
				-- upvalues: var23 (copy)
				if p2 then
					var23(true)
					
					return
				end
			end):catch(function(p1)
				-- upvalues: loggerModule (copy)
				loggerModule:error(`Failed to evaluate push upsell: {p1}`)
			end):finally(function()
				-- upvalues: var27 (copy)
				var27(false)
			end)
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: serverTriggeredModalTrafficPercent (copy), fFlagEnableDeepLinkHistoryWithModalAPI (copy), var21 (write), deepLinkModule (copy), fetchModalMetadataModule (copy), var16 (ref), entryPointModule (copy), loggerModule (copy)
		if serverTriggeredModalTrafficPercent <= math.random(0, 99) then return end
		if fFlagEnableDeepLinkHistoryWithModalAPI and var21 ~= deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready then
			return
		end
		local var31 = fetchModalMetadataModule(var16, entryPointModule.HomepageLaunch):catch(function(p3)
			-- upvalues: loggerModule (copy)
			loggerModule:error(`Failed to fetch modal metadata for home page launch: {p3}`)
		end)
		
		return function()
			-- upvalues: var31 (ref)
			var31:cancel()
		end
	end, {
		var16,
		if fFlagEnableDeepLinkHistoryWithModalAPI then var21 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var19 (ref), isFocused (ref), luaAppAvoidPushUpsellConflicts (copy), var26 (write), var22 (write), var18 (ref), entryPointModule (copy), fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals (copy), var30 (ref), var17 (ref), setCentralOverlay (copy), centralOverlayType (copy)
		if var20 then return end
		if not var19 then return end
		if not isFocused then return end
		if luaAppAvoidPushUpsellConflicts and (var26 or var22) then return end
		var18.setHasShown(entryPointModule.HomepageLaunch, true)
		
		if not fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then
			var17(setCentralOverlay(centralOverlayType.SduiModal, {
				sduiComponentConfig = var19.sduiConfig,
				modalId = var19.modalId,
				modalType = var19.modalType
			}))
			
			return
		elseif var19.isCustomHandler then
			var30(var19)
			
			return
		end
		var17(setCentralOverlay(centralOverlayType.SduiModal, {
			sduiComponentConfig = var19.sduiConfig,
			modalId = var19.modalId,
			modalType = var19.modalType
		}))
	end, {
		var20, var19, isFocused, var17,
		if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then var30 else nil,
		if fFlagLuaAppSupportNonSduiTypeForServerTriggeredModals then var18 else nil,
		if luaAppAvoidPushUpsellConflicts then var26 else nil,
		if luaAppAvoidPushUpsellConflicts then var22 else nil
	})
	
	return nil
end))