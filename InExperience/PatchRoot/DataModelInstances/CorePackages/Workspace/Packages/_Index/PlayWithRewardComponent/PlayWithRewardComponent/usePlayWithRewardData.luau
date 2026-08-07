local adService = game:GetService("AdService")
local playWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local fetchPlayWithRewardStateModule = require(playWithRewardComponent.FetchPlayWithRewardState)
local shouldRenderPlayWithRewardBannerModule = require(playWithRewardComponent.shouldRenderPlayWithRewardBanner)
local parent = playWithRewardComponent.Parent
local playWithRewardStateModule = require(parent.PlayWithRewardState)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local setPlayWithRewardState = playWithRewardStateModule.SetPlayWithRewardState
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function(p0) --[[ line: 27 | named "usePlayWithRewardData" ]]
	-- upvalues: useSelector (ref), useDispatch (ref), reactModule (ref), fetchPlayWithRewardStateModule (ref), adService (ref), setPlayWithRewardState (ref), shouldRenderPlayWithRewardBannerModule (ref)
	local universeId = p0.universeId
	local shouldFetch = p0.shouldFetch
	local var7 = useSelector(function(p1) --[[ line: 31 ]]
		-- upvalues: universeId (ref)
		return if p1.PlayWithRewardState and p1.PlayWithRewardState.universeId == universeId then p1.PlayWithRewardState else nil
	end)
	local var8 = useSelector(function(p2) --[[ line: 37 ]]
		return p2.LocalUserId
	end)
	local var9 = useDispatch()
	local onFetchDispatched = p0.onFetchDispatched
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: shouldFetch (ref), var8 (ref), var7 (ref), universeId (ref), onFetchDispatched (ref), var9 (ref), fetchPlayWithRewardStateModule (copy), adService (copy)
		if not shouldFetch then return end
		local var12 = tonumber(var8)
		
		if not var12 then return end
		if var7 and var7.universeId == universeId then return end
		if onFetchDispatched then
			onFetchDispatched()
		end
		var9(fetchPlayWithRewardStateModule(adService, universeId, var12)):catch(function() --[[ line: 57 ]] end)
	end, {
		shouldFetch, universeId, var8, var7, var9, onFetchDispatched
	})
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: var9 (ref), setPlayWithRewardState (copy)
		return function() --[[ line: 61 ]]
			-- upvalues: var9 (copy), setPlayWithRewardState (copy)
			var9(setPlayWithRewardState("", "", false, nil))
		end
	end, { var9 })
	local var10 = false
	
	if var7 then
		local flowId = var7.flowId
		local var11 = flowId ~= "" and var7.isAdDataExpected
		var10 = var11 or shouldRenderPlayWithRewardBannerModule(universeId, flowId, var7.universeId, var7.adData)
	end
	return { playWithRewardData = var7, showPlayWithReward = var10 }
end