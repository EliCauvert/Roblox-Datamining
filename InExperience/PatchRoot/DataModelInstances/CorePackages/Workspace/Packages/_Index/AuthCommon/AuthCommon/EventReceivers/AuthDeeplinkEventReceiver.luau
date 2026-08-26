local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactNetworking = roactServiceTagsModule.RoactNetworking
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local appLinking = roactServiceTagsModule.AppLinking
local appOmniRecommendationsRequest = roactServiceTagsModule.AppOmniRecommendationsRequest
local deepLinkModule = require(parent.DeepLink)
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback
local useState = reactModule.useState
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableDeepLinkHistoryWithModalAPI = sharedFlagsModule.FFlagEnableDeepLinkHistoryWithModalAPI
local fFlagUseSignalsForAuthenticationStatus = sharedFlagsModule.FFlagUseSignalsForAuthenticationStatus
local var1 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local fFlagUseSignalsForStartup = sharedFlagsModule.FFlagUseSignalsForStartup
local var2 = if fFlagUseSignalsForStartup then require(parent.StartupStore).GetStartupStore else nil
local postAuthDeepLinkAvailableSignalModule = require(script.Parent.PostAuthDeepLinkAvailableSignal)
local postAuthPendingLuaUrlAvailableSignalModule = require(script.Parent.PostAuthPendingLuaUrlAvailableSignal)
local preAuthDeepLinkHandlerModule = require(script.Parent.PreAuthDeepLinkHandler)
local preAuthDeepLinkUrlStore = require(authCommon.Stores).PreAuthDeepLinkUrlStore
local fFlagEnablePreAuthDeepLinkHandlerModule = require(authCommon.Flags.FFlagEnablePreAuthDeepLinkHandler)

return function(p1)
	-- upvalues: useRoactService (ref), appLinking (ref), roactNetworking (ref), useDispatch (ref), appOmniRecommendationsRequest (ref), roactAnalytics (ref), useAppPolicy (ref), useState (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var1 (ref), loginStatus (ref), useSelector (ref), fFlagUseSignalsForStartup (ref), var2 (ref), retrievalStatus (ref), fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), useCallback (ref), preAuthDeepLinkUrlStore (ref), postAuthDeepLinkAvailableSignalModule (ref), postAuthPendingLuaUrlAvailableSignalModule (ref), fFlagEnablePreAuthDeepLinkHandlerModule (ref), preAuthDeepLinkHandlerModule (ref), useEffect (ref)
	local var3
	local var4 = useRoactService(appLinking)
	local monoDeps = p1.monoDeps
	local t = {
		networking = useRoactService(roactNetworking),
		launchApp = monoDeps.LaunchApp,
		dispatch = useDispatch(),
		omniRecommendationsRequest = useRoactService(appOmniRecommendationsRequest),
		analytics = useRoactService(roactAnalytics),
		appPolicy = useAppPolicy(function(p2)
			return p2
		end),
		resetAppState = monoDeps.ResetAppState
	}
	local var5, var6 = useState({ url = nil, attributionUrl = nil })
	local var7, var8 = useState({ hasPendingUrl = false, attributionUrl = nil, url = nil })
	
	if fFlagUseSignalsForAuthenticationStatus then
		var3 = useSignalState(var1(false).getStatus) == loginStatus.LOGGED_OUT
		var3 = nil
	else
		var3 = useSelector(function(p2)
			-- upvalues: loginStatus (copy)
			return p2.AuthenticationStatus.status == loginStatus.LOGGED_OUT
		end)
	end
	local var9 = if fFlagUseSignalsForStartup then useSignalState(var2(false).getAppLoadingStarted) else useSelector(function(p2)
		-- upvalues: retrievalStatus (copy)
		return p2.Startup.AppDataStatus ~= retrievalStatus.NotStarted
	end)
	local var10 = if fFlagEnableDeepLinkHistoryWithModalAPI then deepLinkModule.DeepLinkLuaReceiverStatusStore(false) else nil
	local var11 = useCallback(function()
		-- upvalues: var4 (ref), var3 (ref), var9 (ref), preAuthDeepLinkUrlStore (copy), fFlagEnableDeepLinkHistoryWithModalAPI (copy), var10 (write), deepLinkModule (copy), var5 (ref), postAuthDeepLinkAvailableSignalModule (copy), var6 (ref), var7 (ref), postAuthPendingLuaUrlAvailableSignalModule (copy), var8 (ref), fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (ref)
		if not var4 then return end
		local var12 = not var3 and var9
		
		if var12 then
			preAuthDeepLinkUrlStore.setUrl(nil)
			
			if fFlagEnableDeepLinkHistoryWithModalAPI then
				var10.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready, var5 and var5.url)
			end
			if var5 and var5.url then
				postAuthDeepLinkAvailableSignalModule:fire(var5)
				var6({ url = nil, attributionUrl = nil })
			end
			if var7 and var7.hasPendingUrl then
				postAuthPendingLuaUrlAvailableSignalModule:fire(var7)
				var8({ hasPendingUrl = false, attributionUrl = nil, url = nil })
			end
		elseif fFlagEnableDeepLinkHistoryWithModalAPI then
			var10.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil)
		end
		var4:getAndClearLastPendingURL():andThen(function(p2)
			-- upvalues: var12 (ref), preAuthDeepLinkUrlStore (copy), var8 (copy), postAuthPendingLuaUrlAvailableSignalModule (copy)
			if not p2 or not p2.hasPendingUrl then return end
			if var12 then
				postAuthPendingLuaUrlAvailableSignalModule:fire(p2)
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p2.url)
			var8(p2)
		end)
		var4:listenForLuaURLs(function(p2, p3)
			-- upvalues: fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (copy), var12 (ref), preAuthDeepLinkUrlStore (copy), var6 (copy), postAuthDeepLinkAvailableSignalModule (copy)
			if fFlagEnablePreAuthDeepLinkHandlerModule and preAuthDeepLinkHandlerModule.isPreauthDeeplink(p2) then
				preAuthDeepLinkHandlerModule.firePreauthDeeplink(p2, t)
				
				return
			elseif var12 then
				postAuthDeepLinkAvailableSignalModule:fire({ url = p2, attributionUrl = p3 })
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p2)
			var6({ url = p2, attributionUrl = p3 })
		end)
	end, {
		var4, var3, var9, postAuthDeepLinkAvailableSignalModule, var5, var7
	})
	useEffect(function()
		-- upvalues: var11 (ref), var4 (ref)
		var11()
		
		return function()
			-- upvalues: var4 (copy)
			if var4 then
				var4:stopListeningForLuaURLs()
			end
		end
	end, { var11 })
	
	return nil
end