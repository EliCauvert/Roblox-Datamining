local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local PlayWithRewardComponentModule = require(Parent.PlayWithRewardComponent)
local GamePlayButtonModule = require(Parent.GamePlayButton)
local PlayWithRewardComponent = PlayWithRewardComponentModule.PlayWithRewardComponent
local UsePlayWithRewardDataFunction = PlayWithRewardComponentModule.usePlayWithRewardData
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local GetSduiClientPageScopeFunction = require(Parent.SduiCoreSystem).getSduiClientPageScope

return ReactModule.memo(function(p1) --[[ Line: 27 | Named "SduiPlayWithReward" ]]
	-- upvalues: UseNavigationFocusFunction (copy), ReactModule (copy), UsePlayButtonStateFunction (copy), PlayButtonStates (copy), UsePlayWithRewardDataFunction (copy), GetSduiClientPageScopeFunction (copy), PlayWithRewardComponent (copy)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(p1.sduiContext and (p1.sduiContext.dependencies and p1.sduiContext.dependencies.networking), p1.universeId)
	local IsPlayButtonStateMatch = UsePlayButtonStateResult.playButtonState == PlayButtonStates.Playable
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: UseNavigationFocusResult (copy), UseStateResult2 (copy)
		if UseNavigationFocusResult then
			UseStateResult2(true)
		end
	end, { UseNavigationFocusResult })
	local UsePlayWithRewardDataResult = UsePlayWithRewardDataFunction({
		universeId = p1.universeId,
		shouldFetch = UseStateResult,
		onFetchDispatched = function() --[[ Line: 46 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end
	})
	local PlayWithRewardData = UsePlayWithRewardDataResult.playWithRewardData
	local ShowPlayWithReward = UsePlayWithRewardDataResult.showPlayWithReward
	local PlayWithRewardData1 = IsPlayButtonStateMatch and (ShowPlayWithReward and PlayWithRewardData)
	local NoPlayWithRewardData1: boolean = UsePlayButtonStateResult.playButtonState ~= PlayButtonStates.Loading and (PlayWithRewardData and not PlayWithRewardData1)
	local ConfigKey = p1.sduiContext and p1.sduiContext.configKey
	ReactModule.useEffect(function() --[[ Line: 59 ]]
		-- upvalues: ConfigKey (copy), NoPlayWithRewardData1 (copy), GetSduiClientPageScopeFunction (upval)
		if ConfigKey and NoPlayWithRewardData1 then
			GetSduiClientPageScopeFunction(ConfigKey).set("filterPlayWithReward", true)
			
			return
		end
	end, { ConfigKey, NoPlayWithRewardData1 })
	
	return if PlayWithRewardData1 then ReactModule.createElement(PlayWithRewardComponent, {
		universeId = p1.universeId,
		placeId = p1.placeId,
		placeIdOverride = p1.placeIdOverride,
		experienceJoinData = p1.experienceJoinData,
		flowId = PlayWithRewardData.flowId,
		fetchedUniverseId = PlayWithRewardData.universeId,
		isAdDataExpected = PlayWithRewardData.isAdDataExpected,
		playWithRewardAdData = PlayWithRewardData.adData,
		useLargerStyles = p1.useLargerStyles,
		layoutOrder = p1.layoutOrder
	}) else nil
end)