local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getAdsCampaignDeepLinkStoreModule = require(buildExperience.Stores.GetAdsCampaignDeepLinkStore)
local adCampaignEligibilityModule = require(parent.DataHydration.AdCampaignEligibility)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1)
	-- upvalues: getAdsCampaignDeepLinkStoreModule (ref), adCampaignEligibilityModule (ref), sendBuildExperienceEventModule (ref), reactModule (ref), signalsReactModule (ref)
	local requestStore = p1.requestStore or getAdsCampaignDeepLinkStoreModule(false)
	local eligibilityStore = p1.eligibilityStore or adCampaignEligibilityModule.getAdCampaignEligibilityStore(false)
	local sendEvent = p1.sendEvent or sendBuildExperienceEventModule
	local var1 = reactModule.useMemo(function()
		-- upvalues: requestStore (ref)
		return requestStore.createChat()
	end, { requestStore })
	local var2 = signalsReactModule.useSignalState(var1.getScopeRevision)
	local var3 = reactModule.useRef(p1.onOpen)
	var3.current = p1.onOpen
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.updateScope(p1.universeId, p1.sessionId, p1.isPageVisible)
	end, { var1, p1.universeId, p1.sessionId, p1.isPageVisible })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), eligibilityStore (ref), sendEvent (ref), var3 (ref)
		return var1.connect(eligibilityStore, sendEvent, function(p2)
			-- upvalues: var3 (copy)
			return var3.current(p2)
		end)
	end, { var1, eligibilityStore, sendEvent })
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), var1 (ref)
		return {
			scopeRevision = var2,
			clearPresentedRequest = var1.clearPresentedRequest,
			getPresentedRequestId = var1.getPresentedRequestId,
			startCreate = var1.startCreate,
			finishCreate = var1.finishCreate
		}
	end, { var1, var2 })
end