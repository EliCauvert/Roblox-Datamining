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

return reactModule.memo(function(p1)
	-- upvalues: useNavigationFocus (ref), reactModule (ref), usePlayButtonState (ref), playButtonStates (ref), usePlayWithRewardData (ref), fFlagSduiPlayWithRewardGapFix (ref), getSduiClientPageScope (ref), playWithRewardComponent (ref)
	local var1 = useNavigationFocus()
	local var2, var3 = reactModule.useState(false)
	local var4 = usePlayButtonState(p1.sduiContext and (p1.sduiContext.dependencies and p1.sduiContext.dependencies.networking), p1.universeId)
	local var5 = var4.playButtonState == playButtonStates.Playable
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1 then
			var3(true)
		end
	end, { var1 })
	local var6 = usePlayWithRewardData({
		universeId = p1.universeId,
		shouldFetch = var2,
		onFetchDispatched = function()
			-- upvalues: var3 (ref)
			var3(false)
		end
	})
	local playWithRewardData = var6.playWithRewardData
	local showPlayWithReward = var6.showPlayWithReward
	local playWithRewardData_1 = nil
	
	if fFlagSduiPlayWithRewardGapFix then
		playWithRewardData_1 = var5 and (showPlayWithReward and playWithRewardData)
		local var7 = var4.playButtonState ~= playButtonStates.Loading and (playWithRewardData and not playWithRewardData_1)
		local configKey = p1.sduiContext and p1.sduiContext.configKey
		reactModule.useEffect(function()
			-- upvalues: configKey (ref), var7 (ref), getSduiClientPageScope (copy)
			if configKey and var7 then
				getSduiClientPageScope(configKey).set("filterPlayWithReward", true)
				
				return
			end
		end, { configKey, var7 })
	end
	return if fFlagSduiPlayWithRewardGapFix and not playWithRewardData_1 or (not var5 or not showPlayWithReward) or not playWithRewardData then nil else reactModule.createElement(playWithRewardComponent, {
		universeId = p1.universeId,
		placeId = p1.placeId,
		placeIdOverride = p1.placeIdOverride,
		experienceJoinData = p1.experienceJoinData,
		flowId = playWithRewardData.flowId,
		fetchedUniverseId = playWithRewardData.universeId,
		isAdDataExpected = playWithRewardData.isAdDataExpected,
		playWithRewardAdData = playWithRewardData.adData,
		useLargerStyles = p1.useLargerStyles,
		layoutOrder = p1.layoutOrder
	})
end)