local adService = game:GetService("AdService")
local experienceService = game:GetService("ExperienceService")
local playWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local fetchPlayWithRewardStateModule = require(playWithRewardComponent.FetchPlayWithRewardState)
local shouldRenderPlayWithRewardBannerModule = require(playWithRewardComponent.shouldRenderPlayWithRewardBanner)
local parent = playWithRewardComponent.Parent
local playWithRewardStateModule = require(parent.PlayWithRewardState)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local fFlagPlayWithRewardClearOnExperienceLeave = require(parent.SharedFlags).FFlagPlayWithRewardClearOnExperienceLeave
local setPlayWithRewardState = playWithRewardStateModule.SetPlayWithRewardState
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function(p0)
	-- upvalues: useSelector (ref), useDispatch (ref), fFlagPlayWithRewardClearOnExperienceLeave (ref), reactModule (ref), fetchPlayWithRewardStateModule (ref), adService (ref), experienceService (ref), setPlayWithRewardState (ref), shouldRenderPlayWithRewardBannerModule (ref)
	local universeId = p0.universeId
	local shouldFetch = p0.shouldFetch
	local var8 = useSelector(function(p1)
		-- upvalues: universeId (ref)
		return if p1.PlayWithRewardState and p1.PlayWithRewardState.universeId == universeId then p1.PlayWithRewardState else nil
	end)
	local var9 = useSelector(function(p2)
		return p2.LocalUserId
	end)
	local var10 = useDispatch()
	local var11 = if fFlagPlayWithRewardClearOnExperienceLeave then reactModule.useRef(false) else nil
	local onFetchDispatched = p0.onFetchDispatched
	reactModule.useEffect(function()
		-- upvalues: fFlagPlayWithRewardClearOnExperienceLeave (copy), shouldFetch (ref), var11 (write), var9 (ref), var8 (ref), universeId (ref), onFetchDispatched (ref), var10 (ref), fetchPlayWithRewardStateModule (copy), adService (copy)
		if fFlagPlayWithRewardClearOnExperienceLeave then
			if not shouldFetch and not var11.current then return end
			if var11.current then
				var11.current = false
			end
		elseif not shouldFetch then return end
		local var14 = tonumber(var9)
		
		if not var14 then return end
		if var8 and var8.universeId == universeId then return end
		if onFetchDispatched then
			onFetchDispatched()
		end
		var10(fetchPlayWithRewardStateModule(adService, universeId, var14)):catch(function() end)
	end, {
		shouldFetch, universeId, var9, var8, var10, onFetchDispatched
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagPlayWithRewardClearOnExperienceLeave (copy), experienceService (copy), var11 (write), var10 (ref), setPlayWithRewardState (copy)
		local var15 = if fFlagPlayWithRewardClearOnExperienceLeave then experienceService:RegisterForExperienceLeave(function()
			-- upvalues: var11 (copy), var10 (copy), setPlayWithRewardState (copy)
			var11.current = true
			var10(setPlayWithRewardState("", "", false, nil))
		end) else nil
		
		return function()
			-- upvalues: var10 (copy), setPlayWithRewardState (copy), var15 (write)
			var10(setPlayWithRewardState("", "", false, nil))
			
			if var15 then
				var15:Disconnect()
			end
		end
	end, { var10 })
	local var12 = false
	
	if var8 then
		local flowId = var8.flowId
		local var13 = flowId ~= "" and var8.isAdDataExpected
		var12 = var13 or shouldRenderPlayWithRewardBannerModule(universeId, flowId, var8.universeId, var8.adData)
	end
	return { playWithRewardData = var8, showPlayWithReward = var12 }
end