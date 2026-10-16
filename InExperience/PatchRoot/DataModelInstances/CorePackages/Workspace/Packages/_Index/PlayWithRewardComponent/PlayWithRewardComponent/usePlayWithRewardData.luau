local AdService = game:GetService("AdService")
local ExperienceService = game:GetService("ExperienceService")
local PlayWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local FetchPlayWithRewardStateModule = require(PlayWithRewardComponent.FetchPlayWithRewardState)
local ShouldRenderPlayWithRewardBannerModule = require(PlayWithRewardComponent.shouldRenderPlayWithRewardBanner)
local Parent = PlayWithRewardComponent.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local FFlagPlayWithRewardClearOnExperienceLeave = require(Parent.SharedFlags).FFlagPlayWithRewardClearOnExperienceLeave
local SetPlayWithRewardStateFunction = require(Parent.PlayWithRewardState).SetPlayWithRewardState
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch

return function(p1) --[[ Line: 30 | Named "usePlayWithRewardData" ]]
	-- upvalues: UseSelectorFunction (copy), UseDispatchFunction (copy), FFlagPlayWithRewardClearOnExperienceLeave (copy), ReactModule (copy), FetchPlayWithRewardStateModule (copy), AdService (copy), ExperienceService (copy), SetPlayWithRewardStateFunction (copy), ShouldRenderPlayWithRewardBannerModule (copy)
	local UniverseId = p1.universeId
	local ShouldFetch = p1.shouldFetch
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 34 ]]
		-- upvalues: UniverseId (copy)
		return if p2.PlayWithRewardState and p2.PlayWithRewardState.universeId == UniverseId then p2.PlayWithRewardState else nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 40 ]]
		return p2.LocalUserId
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = if FFlagPlayWithRewardClearOnExperienceLeave then ReactModule.useRef(false) else nil
	local OnFetchDispatchedFunction = p1.onFetchDispatched
	ReactModule.useEffect(function() --[[ Line: 51 ]]
		-- upvalues: FFlagPlayWithRewardClearOnExperienceLeave (upval), ShouldFetch (copy), UseRefResult (ref), UseSelectorResult1 (copy), UseSelectorResult (copy), UniverseId (copy), OnFetchDispatchedFunction (copy), UseDispatchResult (copy), FetchPlayWithRewardStateModule (upval), AdService (upval)
		if FFlagPlayWithRewardClearOnExperienceLeave then
			if not ShouldFetch and not UseRefResult.current then return end
			if UseRefResult.current then
				UseRefResult.current = false
			end
		elseif not ShouldFetch then return end
		local Number: number? = tonumber(UseSelectorResult1)
		
		if not Number then return end
		if UseSelectorResult and UseSelectorResult.universeId == UniverseId then return end
		if OnFetchDispatchedFunction then
			OnFetchDispatchedFunction()
		end
		UseDispatchResult(FetchPlayWithRewardStateModule(AdService, UniverseId, Number)):catch(function() --[[ Line: 74 ]] end)
	end, {
		ShouldFetch, UniverseId, UseSelectorResult1, UseSelectorResult,
		UseDispatchResult, OnFetchDispatchedFunction
	})
	ReactModule.useEffect(function() --[[ Line: 77 ]]
		-- upvalues: FFlagPlayWithRewardClearOnExperienceLeave (upval), ExperienceService (upval), UseRefResult (ref), UseDispatchResult (copy), SetPlayWithRewardStateFunction (upval)
		local RegisterForExperienceLeaveResult = if FFlagPlayWithRewardClearOnExperienceLeave then ExperienceService:RegisterForExperienceLeave(function() --[[ Line: 80 ]]
			-- upvalues: UseRefResult (upval), UseDispatchResult (upval), SetPlayWithRewardStateFunction (upval)
			UseRefResult.current = true
			UseDispatchResult(SetPlayWithRewardStateFunction("", "", false, nil))
		end) else nil
		
		return function() --[[ Line: 85 ]]
			-- upvalues: UseDispatchResult (upval), SetPlayWithRewardStateFunction (upval), RegisterForExperienceLeaveResult (ref)
			UseDispatchResult(SetPlayWithRewardStateFunction("", "", false, nil))
			
			if RegisterForExperienceLeaveResult then
				RegisterForExperienceLeaveResult:Disconnect()
			end
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