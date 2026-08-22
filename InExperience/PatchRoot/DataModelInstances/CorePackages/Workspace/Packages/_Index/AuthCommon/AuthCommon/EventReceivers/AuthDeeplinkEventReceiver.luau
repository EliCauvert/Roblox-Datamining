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
local var5 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local fFlagUseSignalsForStartup = sharedFlagsModule.FFlagUseSignalsForStartup
local var6 = if fFlagUseSignalsForStartup then require(parent.StartupStore).GetStartupStore else nil
local postAuthDeepLinkAvailableSignalModule = require(script.Parent.PostAuthDeepLinkAvailableSignal)
local postAuthPendingLuaUrlAvailableSignalModule = require(script.Parent.PostAuthPendingLuaUrlAvailableSignal)
local preAuthDeepLinkHandlerModule = require(script.Parent.PreAuthDeepLinkHandler)
local preAuthDeepLinkUrlStore = require(authCommon.Stores).PreAuthDeepLinkUrlStore
local fFlagEnablePreAuthDeepLinkHandlerModule = require(authCommon.Flags.FFlagEnablePreAuthDeepLinkHandler)

return function(p0) --[[ line: 47 ]]
	-- upvalues: useRoactService (ref), appLinking (ref), roactNetworking (ref), useDispatch (ref), appOmniRecommendationsRequest (ref), roactAnalytics (ref), useAppPolicy (ref), useState (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var5 (ref), loginStatus (ref), useSelector (ref), fFlagUseSignalsForStartup (ref), var6 (ref), retrievalStatus (ref), fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), useCallback (ref), preAuthDeepLinkUrlStore (ref), postAuthDeepLinkAvailableSignalModule (ref), postAuthPendingLuaUrlAvailableSignalModule (ref), fFlagEnablePreAuthDeepLinkHandlerModule (ref), preAuthDeepLinkHandlerModule (ref), useEffect (ref)
	local var17
	local var11 = useRoactService(appLinking)
	local monoDeps = p0.monoDeps
	local t = {
		networking = useRoactService(roactNetworking),
		launchApp = monoDeps.LaunchApp,
		dispatch = useDispatch(),
		omniRecommendationsRequest = useRoactService(appOmniRecommendationsRequest),
		analytics = useRoactService(roactAnalytics),
		appPolicy = useAppPolicy(function(p1) --[[ line: 59 ]]
			return p1
		end),
		resetAppState = monoDeps.ResetAppState
	}
	local var13, var14 = useState({ url = nil, attributionUrl = nil })
	local var15, var16 = useState({ hasPendingUrl = false, attributionUrl = nil, url = nil })
	
	if fFlagUseSignalsForAuthenticationStatus then
		var17 = useSignalState(var5(false).getStatus) == loginStatus.LOGGED_OUT
		var17 = nil
	else
		var17 = useSelector(function(p2) --[[ line: 95 ]]
			-- upvalues: loginStatus (copy)
			return p2.AuthenticationStatus.status == loginStatus.LOGGED_OUT
		end)
	end
	local var18 = if fFlagUseSignalsForStartup then useSignalState(var6(false).getAppLoadingStarted) else useSelector(function(p3) --[[ line: 101 ]]
		-- upvalues: retrievalStatus (copy)
		return p3.Startup.AppDataStatus ~= retrievalStatus.NotStarted
	end)
	local var19 = if fFlagEnableDeepLinkHistoryWithModalAPI then deepLinkModule.DeepLinkLuaReceiverStatusStore(false) else nil
	local var20 = useCallback(function() --[[ line: 110 ]]
		-- upvalues: var11 (ref), var17 (ref), var18 (ref), preAuthDeepLinkUrlStore (copy), fFlagEnableDeepLinkHistoryWithModalAPI (copy), var19 (write), deepLinkModule (copy), var13 (ref), postAuthDeepLinkAvailableSignalModule (copy), var14 (ref), var15 (ref), postAuthPendingLuaUrlAvailableSignalModule (copy), var16 (ref), fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (ref)
		if not var11 then return end
		local var18_1 = not var17 and var18
		
		if var18_1 then
			preAuthDeepLinkUrlStore.setUrl(nil)
			
			if fFlagEnableDeepLinkHistoryWithModalAPI then
				var19.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready, var13 and var13.url)
			end
			if var13 and var13.url then
				postAuthDeepLinkAvailableSignalModule:fire(var13)
				var14({ url = nil, attributionUrl = nil })
			end
			if var15 and var15.hasPendingUrl then
				postAuthPendingLuaUrlAvailableSignalModule:fire(var15)
				var16({ hasPendingUrl = false, attributionUrl = nil, url = nil })
			end
		elseif fFlagEnableDeepLinkHistoryWithModalAPI then
			var19.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil)
		end
		var11:getAndClearLastPendingURL():andThen(function(p4) --[[ line: 152 ]]
			-- upvalues: var18_1 (ref), preAuthDeepLinkUrlStore (copy), var16 (copy), postAuthPendingLuaUrlAvailableSignalModule (copy)
			if not p4 or not p4.hasPendingUrl then return end
			if var18_1 then
				postAuthPendingLuaUrlAvailableSignalModule:fire(p4)
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p4.url)
			var16(p4)
		end)
		var11:listenForLuaURLs(function(p5, p6) --[[ line: 169 ]]
			-- upvalues: fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (copy), var18_1 (ref), preAuthDeepLinkUrlStore (copy), var14 (copy), postAuthDeepLinkAvailableSignalModule (copy)
			if fFlagEnablePreAuthDeepLinkHandlerModule and preAuthDeepLinkHandlerModule.isPreauthDeeplink(p5) then
				preAuthDeepLinkHandlerModule.firePreauthDeeplink(p5, t)
				
				return
			elseif var18_1 then
				postAuthDeepLinkAvailableSignalModule:fire({ url = p5, attributionUrl = p6 })
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p5)
			var14({ url = p5, attributionUrl = p6 })
		end)
	end, {
		var11, var17, var18, postAuthDeepLinkAvailableSignalModule, var13, var15
	})
	useEffect(function() --[[ line: 202 ]]
		-- upvalues: var20 (ref), var11 (ref)
		var20()
		
		return function() --[[ line: 206 ]]
			-- upvalues: var11 (copy)
			if var11 then
				var11:stopListeningForLuaURLs()
			end
		end
	end, { var20 })
	
	return nil
end