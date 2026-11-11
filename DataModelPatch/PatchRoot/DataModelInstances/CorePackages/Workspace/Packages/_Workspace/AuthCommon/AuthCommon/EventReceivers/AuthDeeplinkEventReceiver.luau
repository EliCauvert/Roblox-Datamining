local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AppLinking = RoactServiceTagsModule.AppLinking
local AppOmniRecommendationsRequest = RoactServiceTagsModule.AppOmniRecommendationsRequest
local DeepLinkModule = require(Parent.DeepLink)
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback
local UseStateFunction = ReactModule.useState
local FFlagEnableDeepLinkHistoryWithModalAPI = require(Parent.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI
local PostAuthDeepLinkAvailableSignalModule = require(script.Parent.PostAuthDeepLinkAvailableSignal)
local PostAuthPendingLuaUrlAvailableSignalModule = require(script.Parent.PostAuthPendingLuaUrlAvailableSignal)
local PreAuthDeepLinkHandlerModule = require(script.Parent.PreAuthDeepLinkHandler)
local PreAuthDeepLinkUrlStore = require(AuthCommon.Stores).PreAuthDeepLinkUrlStore
local FFlagEnablePreAuthDeepLinkHandlerModule = require(AuthCommon.Flags.FFlagEnablePreAuthDeepLinkHandler)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppLinking (copy), RoactNetworking (copy), UseDispatchFunction (copy), AppOmniRecommendationsRequest (copy), RoactAnalytics (copy), UseAppPolicyFunction (copy), UseStateFunction (copy), UseSelectorFunction (copy), LoginStatus (copy), RetrievalStatus (copy), FFlagEnableDeepLinkHistoryWithModalAPI (copy), DeepLinkModule (copy), UseCallbackFunction (copy), PreAuthDeepLinkUrlStore (copy), PostAuthDeepLinkAvailableSignalModule (copy), PostAuthPendingLuaUrlAvailableSignalModule (copy), FFlagEnablePreAuthDeepLinkHandlerModule (copy), PreAuthDeepLinkHandlerModule (copy), UseEffectFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local MonoDeps = p1.monoDeps
	local config = {
		networking = UseRoactServiceFunction(RoactNetworking),
		launchApp = MonoDeps.LaunchApp,
		dispatch = UseDispatchFunction(),
		omniRecommendationsRequest = UseRoactServiceFunction(AppOmniRecommendationsRequest),
		analytics = UseRoactServiceFunction(RoactAnalytics),
		appPolicy = UseAppPolicyFunction(function(p2)
			return p2
		end),
		resetAppState = MonoDeps.ResetAppState
	}
	local UseStateResult, UseStateResult2 = UseStateFunction({ url = nil, attributionUrl = nil })
	local UseStateResult1, UseStateResult2_1 = UseStateFunction({ hasPendingUrl = false, attributionUrl = nil, url = nil })
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		-- upvalues: LoginStatus (upval)
		return p2.AuthenticationStatus.status == LoginStatus.LOGGED_OUT
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2): boolean
		-- upvalues: RetrievalStatus (upval)
		return p2.Startup.AppDataStatus ~= RetrievalStatus.NotStarted
	end)
	local DeepLinkLuaReceiverStatusStoreResult = if FFlagEnableDeepLinkHistoryWithModalAPI then DeepLinkModule.DeepLinkLuaReceiverStatusStore(false) else nil
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRoactServiceResult (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), PreAuthDeepLinkUrlStore (upval), FFlagEnableDeepLinkHistoryWithModalAPI (upval), DeepLinkLuaReceiverStatusStoreResult (ref), DeepLinkModule (upval), UseStateResult (copy), PostAuthDeepLinkAvailableSignalModule (upval), UseStateResult2 (copy), UseStateResult1 (copy), PostAuthPendingLuaUrlAvailableSignalModule (upval), UseStateResult2_1 (copy), FFlagEnablePreAuthDeepLinkHandlerModule (upval), PreAuthDeepLinkHandlerModule (upval), config (copy)
		if not UseRoactServiceResult then return end
		local UseSelectorResult1_1 = not UseSelectorResult and UseSelectorResult1
		
		if UseSelectorResult1_1 then
			PreAuthDeepLinkUrlStore.setUrl(nil)
			
			if FFlagEnableDeepLinkHistoryWithModalAPI then
				DeepLinkLuaReceiverStatusStoreResult.setDeepLinkLuaPostAuthReceiverStatus(DeepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Ready, UseStateResult and UseStateResult.url)
			end
			if UseStateResult and UseStateResult.url then
				PostAuthDeepLinkAvailableSignalModule:fire(UseStateResult)
				UseStateResult2({ url = nil, attributionUrl = nil })
			end
			if UseStateResult1 and UseStateResult1.hasPendingUrl then
				PostAuthPendingLuaUrlAvailableSignalModule:fire(UseStateResult1)
				UseStateResult2_1({ hasPendingUrl = false, attributionUrl = nil, url = nil })
			end
		elseif FFlagEnableDeepLinkHistoryWithModalAPI then
			DeepLinkLuaReceiverStatusStoreResult.setDeepLinkLuaPostAuthReceiverStatus(DeepLinkModule.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil)
		end
		UseRoactServiceResult:getAndClearLastPendingURL():andThen(function(Result)
			-- upvalues: UseSelectorResult1_1 (copy), PreAuthDeepLinkUrlStore (upval), UseStateResult2_1 (upval), PostAuthPendingLuaUrlAvailableSignalModule (upval)
			if not Result or not Result.hasPendingUrl then return end
			if UseSelectorResult1_1 then
				PostAuthPendingLuaUrlAvailableSignalModule:fire(Result)
				
				return
			else
				PreAuthDeepLinkUrlStore.setUrl(Result.url)
				UseStateResult2_1(Result)
			end
		end)
		UseRoactServiceResult:listenForLuaURLs(function(Url, AttributionUrl)
			-- upvalues: FFlagEnablePreAuthDeepLinkHandlerModule (upval), PreAuthDeepLinkHandlerModule (upval), config (upval), UseSelectorResult1_1 (copy), PreAuthDeepLinkUrlStore (upval), UseStateResult2 (upval), PostAuthDeepLinkAvailableSignalModule (upval)
			if FFlagEnablePreAuthDeepLinkHandlerModule and PreAuthDeepLinkHandlerModule.isPreauthDeeplink(Url) then
				PreAuthDeepLinkHandlerModule.firePreauthDeeplink(Url, config)
				
				return
			end
			if UseSelectorResult1_1 then
				PostAuthDeepLinkAvailableSignalModule:fire({ url = Url, attributionUrl = AttributionUrl })
				
				return
			else
				PreAuthDeepLinkUrlStore.setUrl(Url)
				UseStateResult2({ url = Url, attributionUrl = AttributionUrl })
			end
		end)
	end, {
		UseRoactServiceResult, UseSelectorResult, UseSelectorResult1,
		PostAuthDeepLinkAvailableSignalModule, UseStateResult, UseStateResult1
	})
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy), UseRoactServiceResult (copy)
		UseCallbackResult()
		
		return function()
			-- upvalues: UseRoactServiceResult (upval)
			if UseRoactServiceResult then
				UseRoactServiceResult:stopListeningForLuaURLs()
			end
		end
	end, { UseCallbackResult })
	
	return nil
end