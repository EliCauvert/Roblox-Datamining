local AdService = game:GetService("AdService")
local PlayWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local FetchPlayWithRewardStateModule = require(PlayWithRewardComponent.FetchPlayWithRewardState)
local ShouldRenderPlayWithRewardBannerModule = require(PlayWithRewardComponent.shouldRenderPlayWithRewardBanner)
local Parent = PlayWithRewardComponent.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SetPlayWithRewardStateFunction = require(Parent.PlayWithRewardState).SetPlayWithRewardState
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch

return function(p1)
	-- upvalues: UseSelectorFunction (copy), UseDispatchFunction (copy), ReactModule (copy), FetchPlayWithRewardStateModule (copy), AdService (copy), SetPlayWithRewardStateFunction (copy), ShouldRenderPlayWithRewardBannerModule (copy)
	local UniverseId = p1.universeId
	local ShouldFetch = p1.shouldFetch
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: UniverseId (copy)
		return if p2.PlayWithRewardState and p2.PlayWithRewardState.universeId == UniverseId then p2.PlayWithRewardState else nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	local UseDispatchResult = UseDispatchFunction()
	local OnFetchDispatchedFunction = p1.onFetchDispatched
	ReactModule.useEffect(function()
		-- upvalues: ShouldFetch (copy), UseSelectorResult1 (copy), UseSelectorResult (copy), UniverseId (copy), OnFetchDispatchedFunction (copy), UseDispatchResult (copy), FetchPlayWithRewardStateModule (upval), AdService (upval)
		if not ShouldFetch then return end
		local Number: number? = tonumber(UseSelectorResult1)
		
		if not Number then return end
		if UseSelectorResult and UseSelectorResult.universeId == UniverseId then return end
		if OnFetchDispatchedFunction then
			OnFetchDispatchedFunction()
		end
		UseDispatchResult(FetchPlayWithRewardStateModule(AdService, UniverseId, Number)):catch(function() end)
	end, {
		ShouldFetch, UniverseId, UseSelectorResult1, UseSelectorResult,
		UseDispatchResult, OnFetchDispatchedFunction
	})
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), SetPlayWithRewardStateFunction (upval)
		return function()
			-- upvalues: UseDispatchResult (upval), SetPlayWithRewardStateFunction (upval)
			UseDispatchResult(SetPlayWithRewardStateFunction("", "", false, nil))
		end
	end, { UseDispatchResult })
	local IsAdDataExpected = false
	
	if UseSelectorResult then
		local FlowId = UseSelectorResult.flowId
		local UniverseId1 = UseSelectorResult.universeId
		local AdData = UseSelectorResult.adData
		IsAdDataExpected = FlowId ~= "" and UseSelectorResult.isAdDataExpected or ShouldRenderPlayWithRewardBannerModule(UniverseId, FlowId, UniverseId1, AdData)
	end
	return {
		playWithRewardData = UseSelectorResult,
		showPlayWithReward = IsAdDataExpected
	}
end