local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
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
local fFlagEnableDeepLinkHistoryWithModalAPI = require(parent.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI
local postAuthDeepLinkAvailableSignalModule = require(script.Parent.PostAuthDeepLinkAvailableSignal)
local postAuthPendingLuaUrlAvailableSignalModule = require(script.Parent.PostAuthPendingLuaUrlAvailableSignal)
local preAuthDeepLinkHandlerModule = require(script.Parent.PreAuthDeepLinkHandler)
local preAuthDeepLinkUrlStore = require(authCommon.Stores).PreAuthDeepLinkUrlStore
local fFlagEnablePreAuthDeepLinkHandlerModule = require(authCommon.Flags.FFlagEnablePreAuthDeepLinkHandler)

return function(p0) --[[ line: 35 ]]
	-- upvalues: useRoactService (ref), appLinking (ref), roactNetworking (ref), useDispatch (ref), appOmniRecommendationsRequest (ref), roactAnalytics (ref), useAppPolicy (ref), useState (ref), useSelector (ref), loginStatus (ref), retrievalStatus (ref), fFlagEnableDeepLinkHistoryWithModalAPI (ref), deepLinkModule (ref), useCallback (ref), preAuthDeepLinkUrlStore (ref), postAuthDeepLinkAvailableSignalModule (ref), postAuthPendingLuaUrlAvailableSignalModule (ref), fFlagEnablePreAuthDeepLinkHandlerModule (ref), preAuthDeepLinkHandlerModule (ref), useEffect (ref)
	local var8 = useRoactService(appLinking)
	local monoDeps = p0.monoDeps
	local t = {
		networking = useRoactService(roactNetworking),
		launchApp = monoDeps.LaunchApp,
		dispatch = useDispatch(),
		omniRecommendationsRequest = useRoactService(appOmniRecommendationsRequest),
		analytics = useRoactService(roactAnalytics),
		appPolicy = useAppPolicy(function(p1) --[[ line: 47 ]]
			return p1
		end),
		resetAppState = monoDeps.ResetAppState
	}
	local var10, var11 = useState({ url = nil, attributionUrl = nil })
	local var12, var13 = useState({ hasPendingUrl = false, attributionUrl = nil, url = nil })
	local var14 = useSelector(function(p2) --[[ line: 80 ]]
		-- upvalues: loginStatus (copy)
		return p2.AuthenticationStatus.status == loginStatus.LOGGED_OUT
	end)
	local var15 = useSelector(function(p3) --[[ line: 84 ]]
		-- upvalues: retrievalStatus (copy)
		return p3.Startup.AppDataStatus ~= retrievalStatus.NotStarted
	end)
	local var16 = if fFlagEnableDeepLinkHistoryWithModalAPI then deepLinkModule.DeepLinkLuaReceiverStatusStore(false) else nil
	local var17 = useCallback(function() --[[ line: 93 ]]
		-- upvalues: var8 (ref), var14 (ref), var15 (ref), preAuthDeepLinkUrlStore (copy), fFlagEnableDeepLinkHistoryWithModalAPI (copy), var16 (write), deepLinkModule (copy), var10 (ref), postAuthDeepLinkAvailableSignalModule (copy), var11 (ref), var12 (ref), postAuthPendingLuaUrlAvailableSignalModule (copy), var13 (ref), fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (ref)
		if not var8 then return end
		local var15_1 = not var14 and var15
		
		if var15_1 then
			preAuthDeepLinkUrlStore.setUrl(nil)
			
			if fFlagEnableDeepLinkHistoryWithModalAPI then
				var16.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready, var10 and var10.url)
			end
			if var10 and var10.url then
				postAuthDeepLinkAvailableSignalModule:fire(var10)
				var11({ url = nil, attributionUrl = nil })
			end
			if var12 and var12.hasPendingUrl then
				postAuthPendingLuaUrlAvailableSignalModule:fire(var12)
				var13({ hasPendingUrl = false, attributionUrl = nil, url = nil })
			end
		elseif fFlagEnableDeepLinkHistoryWithModalAPI then
			var16.setDeepLinkLuaPostAuthReceiverStatus(deepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil)
		end
		var8:getAndClearLastPendingURL():andThen(function(p4) --[[ line: 135 ]]
			-- upvalues: var15_1 (ref), preAuthDeepLinkUrlStore (copy), var13 (copy), postAuthPendingLuaUrlAvailableSignalModule (copy)
			if not p4 or not p4.hasPendingUrl then return end
			if var15_1 then
				postAuthPendingLuaUrlAvailableSignalModule:fire(p4)
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p4.url)
			var13(p4)
		end)
		var8:listenForLuaURLs(function(p5, p6) --[[ line: 152 ]]
			-- upvalues: fFlagEnablePreAuthDeepLinkHandlerModule (copy), preAuthDeepLinkHandlerModule (copy), t (copy), var15_1 (ref), preAuthDeepLinkUrlStore (copy), var11 (copy), postAuthDeepLinkAvailableSignalModule (copy)
			if fFlagEnablePreAuthDeepLinkHandlerModule and preAuthDeepLinkHandlerModule.isPreauthDeeplink(p5) then
				preAuthDeepLinkHandlerModule.firePreauthDeeplink(p5, t)
				
				return
			elseif var15_1 then
				postAuthDeepLinkAvailableSignalModule:fire({ url = p5, attributionUrl = p6 })
				
				return
			end
			preAuthDeepLinkUrlStore.setUrl(p5)
			var11({ url = p5, attributionUrl = p6 })
		end)
	end, {
		var8, var14, var15, postAuthDeepLinkAvailableSignalModule, var10, var12
	})
	useEffect(function() --[[ line: 185 ]]
		-- upvalues: var17 (ref), var8 (ref)
		var17()
		
		return function() --[[ line: 189 ]]
			-- upvalues: var8 (copy)
			if var8 then
				var8:stopListeningForLuaURLs()
			end
		end
	end, { var17 })
	
	return nil
end