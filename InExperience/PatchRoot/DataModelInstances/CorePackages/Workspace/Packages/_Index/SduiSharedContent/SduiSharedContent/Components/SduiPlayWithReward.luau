local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local playWithRewardComponentModule = require(parent.PlayWithRewardComponent)
local gamePlayButtonModule = require(parent.GamePlayButton)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local playWithRewardComponent = playWithRewardComponentModule.PlayWithRewardComponent
local usePlayWithRewardData = playWithRewardComponentModule.usePlayWithRewardData
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local playButtonStates = gamePlayButtonModule.PlayButtonStates
local useNavigationFocus = navigationModule.useNavigationFocus
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope
local fFlagSduiPlayWithRewardGapFix = require(parent.SharedFlags).FFlagSduiPlayWithRewardGapFix

return reactModule.memo(function(p0)
	-- upvalues: useNavigationFocus (ref), reactModule (ref), usePlayButtonState (ref), playButtonStates (ref), usePlayWithRewardData (ref), fFlagSduiPlayWithRewardGapFix (ref), getSduiClientPageScope (ref), playWithRewardComponent (ref)
	local var5 = useNavigationFocus()
	local var6, var7 = reactModule.useState(false)
	local var8 = usePlayButtonState(p0.sduiContext and (p0.sduiContext.dependencies and p0.sduiContext.dependencies.networking), p0.universeId)
	local var9 = var8.playButtonState == playButtonStates.Playable
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref)
		if var5 then
			var7(true)
		end
	end, { var5 })
	local var10 = usePlayWithRewardData({
		universeId = p0.universeId,
		shouldFetch = var6,
		onFetchDispatched = function()
			-- upvalues: var7 (ref)
			var7(false)
		end
	})
	local playWithRewardData = var10.playWithRewardData
	local showPlayWithReward = var10.showPlayWithReward
	local playWithRewardData_1 = nil
	
	if fFlagSduiPlayWithRewardGapFix then
		playWithRewardData_1 = var9 and (showPlayWithReward and playWithRewardData)
		local var12 = var8.playButtonState ~= playButtonStates.Loading and (playWithRewardData and not playWithRewardData_1)
		local configKey = p0.sduiContext and p0.sduiContext.configKey
		reactModule.useEffect(function()
			-- upvalues: configKey (ref), var12 (ref), getSduiClientPageScope (copy)
			if configKey and var12 then
				getSduiClientPageScope(configKey).set("filterPlayWithReward", true)
				
				return
			end
		end, { configKey, var12 })
	end
	return if fFlagSduiPlayWithRewardGapFix and not playWithRewardData_1 or (not var9 or not showPlayWithReward) or not playWithRewardData then nil else reactModule.createElement(playWithRewardComponent, {
		universeId = p0.universeId,
		placeId = p0.placeId,
		placeIdOverride = p0.placeIdOverride,
		experienceJoinData = p0.experienceJoinData,
		flowId = playWithRewardData.flowId,
		fetchedUniverseId = playWithRewardData.universeId,
		isAdDataExpected = playWithRewardData.isAdDataExpected,
		playWithRewardAdData = playWithRewardData.adData,
		useLargerStyles = p0.useLargerStyles,
		layoutOrder = p0.layoutOrder
	})
end)