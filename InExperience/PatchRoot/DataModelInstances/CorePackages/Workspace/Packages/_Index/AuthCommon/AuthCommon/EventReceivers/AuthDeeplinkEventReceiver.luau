local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSignalState = require(parent.SignalsReact).useSignalState
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
local postAuthDeepLinkAvailableSignalModule = require(script.Parent.PostAuthDeepLinkAvailableSignal)
local postAuthPendingLuaUrlAvailableSignalModule = require(script.Parent.PostAuthPendingLuaUrlAvailableSignal)
local preAuthDeepLinkHandlerModule = require(script.Parent.PreAuthDeepLinkHandler)
local preAuthDeepLinkUrlStore = require(authCommon.Stores).PreAuthDeepLinkUrlStore
local fFlagEnablePreAuthDeepLinkHandlerModule = require(authCommon.Flags.FFlagEnablePreAuthDeepLinkHandler)

return function(p0) --[[ line: 41 ]]
	-- upvalues: useRoactService (ref), appLinking (ref), roactNetworking (ref), useDispatch (ref), appOmniRecommendationsRequest (ref), roactAnalytics (ref), useAppPolicy (ref), useState (ref), fFlagUseSignalsForAuthenticationStatus (ref), useSignalState (ref), var5 (ref), loginStatus (ref), useSelector (ref), retrievalStatus (ref), fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), useCallback (ref), preAuthDeepLinkUrlStore (ref), postAuthDeepLinkAvailableSignalModule (ref), postAuthPendingLuaUrlAvailableSignalModule (ref), fFlagEnablePreAuthDeepLinkHandlerModule (ref), preAuthDeepLinkHandlerModule (ref), useEffect (ref)
	local var16
	local var10 = useRoactService(appLinking)
	local monoDeps = p0.monoDeps
	local t = {
		networking = useRoactService(roactNetworking),
		launchApp = monoDeps.LaunchApp,
		dispatch = useDispatch(),
		omniRecommendationsRequest = useRoactService(appOmniRecommendationsRequest),
		analytics = useRoactService(roactAnalytics),
		appPolicy = useAppPolicy(function(p1) --[[ line: 53 ]]
			return p1
		end),
		resetAppState = monoDeps.ResetAppState
	}
	local var12, var13 = useState({ url = nil, attributionUrl = nil })
	local var14, var15 = useState({ hasPendingUrl = false, attributionUrl = nil, url = nil })
	
	if fFlagUseSignalsForAuthenticationStatus then
		var16 = useSignalState(var5(false).getStatus) == loginStatus.LOGGED_OUT
		var16 = nil
	else
		var16 = useSelector(function(p2) --[[ line: 89 ]]
			-- upvalues: loginStatus (copy)
			return p2.AuthenticationStatus.status == loginStatus.LOGGED_OUT
		end)
	end
	local var17 = useSelector(function(p3) --[[ line: 93 ]]
		-- upvalues: retrievalStatus (copy)
		return p3.Startup.AppDataStatus ~= retrievalStatus.NotStarted
	end)
	local var18 = if fFlagEnableDeepLinkHistoryWithModalAPI then deepLinkModule.DeepLinkLuaReceiverStatusStore(false) else nil
	local var19 = useCallback(function() --[[ line: 102 ]]
		-- upvalues: var10 (ref), var16 (ref), var17 (ref), preAuthDeepLinkUrlStore (copy), fFlagEnableDeepLinkHistoryWithModalAPI (copy), var18 (write), deepLinkModule (copy), var12 (ref), postAuthDeepLinkAvailableSignalModule (copy), var13 (ref), var14 (ref), postAuthPendingLuaUrlAvailableSignalModule (copy), var15 (ref), fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (ref)
		if not var10 then return end
		local var17_1 = not var16 and var17
		
		if var17_1 then
			preAuthDeepLinkUrlStore.setUrl(nil)
			
			if fFlagEnableDeepLinkHistoryWithModalAPI then
				var18.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready, var12 and var12.url)
			end
			if var12 and var12.url then
				postAuthDeepLinkAvailableSignalModule:fire(var12)
				var13({ url = nil, attributionUrl = nil })
			end
			if var14 and var14.hasPendingUrl then
				postAuthPendingLuaUrlAvailableSignalModule:fire(var14)
				var15({ hasPendingUrl = false, attributionUrl = nil, url = nil })
			end
		elseif fFlagEnableDeepLinkHistoryWithModalAPI then
			var18.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil)
		end
		var10:getAndClearLastPendingURL():andThen(function(p4) --[[ line: 144 ]]
			-- upvalues: var17_1 (ref), preAuthDeepLinkUrlStore (copy), var15 (copy), postAuthPendingLuaUrlAvailableSignalModule (copy)
			if not p4 or not p4.hasPendingUrl then return end
			if var17_1 then
				postAuthPendingLuaUrlAvailableSignalModule:fire(p4)
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p4.url)
			var15(p4)
		end)
		var10:listenForLuaURLs(function(p5, p6) --[[ line: 161 ]]
			-- upvalues: fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (copy), var17_1 (ref), preAuthDeepLinkUrlStore (copy), var13 (copy), postAuthDeepLinkAvailableSignalModule (copy)
			if fFlagEnablePreAuthDeepLinkHandlerModule and preAuthDeepLinkHandlerModule.isPreauthDeeplink(p5) then
				preAuthDeepLinkHandlerModule.firePreauthDeeplink(p5, t)
				
				return
			elseif var17_1 then
				postAuthDeepLinkAvailableSignalModule:fire({ url = p5, attributionUrl = p6 })
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p5)
			var13({ url = p5, attributionUrl = p6 })
		end)
	end, {
		var10, var16, var17, postAuthDeepLinkAvailableSignalModule, var12, var14
	})
	useEffect(function() --[[ line: 194 ]]
		-- upvalues: var19 (ref), var10 (ref)
		var19()
		
		return function() --[[ line: 198 ]]
			-- upvalues: var10 (copy)
			if var10 then
				var10:stopListeningForLuaURLs()
			end
		end
	end, { var19 })
	
	return nil
end