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

return function(p1)
	-- upvalues: useSelector (ref), useDispatch (ref), fFlagPlayWithRewardClearOnExperienceLeave (ref), reactModule (ref), fetchPlayWithRewardStateModule (ref), adService (ref), experienceService (ref), setPlayWithRewardState (ref), shouldRenderPlayWithRewardBannerModule (ref)
	local universeId = p1.universeId
	local shouldFetch = p1.shouldFetch
	local var1 = useSelector(function(p2)
		-- upvalues: universeId (ref)
		return if p2.PlayWithRewardState and p2.PlayWithRewardState.universeId == universeId then p2.PlayWithRewardState else nil
	end)
	local var2 = useSelector(function(p2)
		return p2.LocalUserId
	end)
	local var3 = useDispatch()
	local var4 = if fFlagPlayWithRewardClearOnExperienceLeave then reactModule.useRef(false) else nil
	local onFetchDispatched = p1.onFetchDispatched
	reactModule.useEffect(function()
		-- upvalues: fFlagPlayWithRewardClearOnExperienceLeave (copy), shouldFetch (ref), var4 (write), var2 (ref), var1 (ref), universeId (ref), onFetchDispatched (ref), var3 (ref), fetchPlayWithRewardStateModule (copy), adService (copy)
		if fFlagPlayWithRewardClearOnExperienceLeave then
			if not shouldFetch and not var4.current then return end
			if var4.current then
				var4.current = false
			end
		elseif not shouldFetch then return end
		local var5 = tonumber(var2)
		
		if not var5 then return end
		if var1 and var1.universeId == universeId then return end
		if onFetchDispatched then
			onFetchDispatched()
		end
		var3(fetchPlayWithRewardStateModule(adService, universeId, var5)):catch(function() end)
	end, {
		shouldFetch, universeId, var2, var1, var3, onFetchDispatched
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagPlayWithRewardClearOnExperienceLeave (copy), experienceService (copy), var4 (write), var3 (ref), setPlayWithRewardState (copy)
		local var5 = if fFlagPlayWithRewardClearOnExperienceLeave then experienceService:RegisterForExperienceLeave(function()
			-- upvalues: var4 (copy), var3 (copy), setPlayWithRewardState (copy)
			var4.current = true
			var3(setPlayWithRewardState("", "", false, nil))
		end) else nil
		
		return function()
			-- upvalues: var3 (copy), setPlayWithRewardState (copy), var5 (write)
			var3(setPlayWithRewardState("", "", false, nil))
			
			if var5 then
				var5:Disconnect()
			end
		end
	end, { var3 })
	local var5 = false
	
	if var1 then
		local flowId = var1.flowId
		local var6 = flowId ~= "" and var1.isAdDataExpected
		var5 = var6 or shouldRenderPlayWithRewardBannerModule(universeId, flowId, var1.universeId, var1.adData)
	end
	return { playWithRewardData = var1, showPlayWithReward = var5 }
end