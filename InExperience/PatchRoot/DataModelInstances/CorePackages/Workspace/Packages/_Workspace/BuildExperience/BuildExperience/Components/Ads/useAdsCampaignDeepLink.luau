local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FFlagBuildAdsNotificationRouting = require(Parent.SharedFlags).FFlagBuildAdsNotificationRouting
local SignalsReactModule = require(Parent.SignalsReact)
local GetAdsCampaignDeepLinkStoreModule = require(BuildExperience.Stores.GetAdsCampaignDeepLinkStore)
local AdCampaignEligibilityModule = require(Parent.DataHydration.AdCampaignEligibility)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1)
	-- upvalues: GetAdsCampaignDeepLinkStoreModule (copy), AdCampaignEligibilityModule (copy), SendBuildExperienceEventModule (copy), ReactModule (copy), SignalsReactModule (copy), FFlagBuildAdsNotificationRouting (copy)
	local RequestStore = p1.requestStore or GetAdsCampaignDeepLinkStoreModule(false)
	local EligibilityStore = p1.eligibilityStore or AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false)
	local SendEvent = p1.sendEvent or SendBuildExperienceEventModule
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RequestStore (copy)
		return RequestStore.createChat()
	end, { RequestStore })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.getScopeRevision)
	local UseRefResult = ReactModule.useRef(p1.onOpen)
	UseRefResult.current = p1.onOpen
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildAdsNotificationRouting (upval), UseMemoResult (copy), p1 (copy)
		if FFlagBuildAdsNotificationRouting then
			UseMemoResult.updateScope(p1.universeId, p1.sessionId, p1.isPageVisible, p1.canPresent)
			
			return
		else
			UseMemoResult.updateScope(p1.universeId, p1.sessionId, p1.isPageVisible)
		end
	end, {
		UseMemoResult,
		p1.universeId,
		p1.sessionId,
		p1.isPageVisible,
		p1.canPresent
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), EligibilityStore (copy), SendEvent (copy), UseRefResult (copy)
		return UseMemoResult.connect(EligibilityStore, SendEvent, function(p2)
			-- upvalues: UseRefResult (upval)
			return UseRefResult.current(p2)
		end)
	end, { UseMemoResult, EligibilityStore, SendEvent })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), UseMemoResult (copy)
		return {
			scopeRevision = UseSignalStateResult,
			clearPresentedRequest = UseMemoResult.clearPresentedRequest,
			getPresentedRequestId = UseMemoResult.getPresentedRequestId,
			startCreate = UseMemoResult.startCreate,
			finishCreate = UseMemoResult.finishCreate
		}
	end, { UseMemoResult, UseSignalStateResult })
end