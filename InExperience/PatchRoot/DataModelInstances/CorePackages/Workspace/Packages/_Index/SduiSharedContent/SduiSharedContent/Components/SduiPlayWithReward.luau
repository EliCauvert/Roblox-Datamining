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

return reactModule.memo(function(p1)
	-- upvalues: useNavigationFocus (ref), reactModule (ref), usePlayButtonState (ref), playButtonStates (ref), usePlayWithRewardData (ref), getSduiClientPageScope (ref), playWithRewardComponent (ref)
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
	local playWithRewardData_1 = var5 and (var6.showPlayWithReward and playWithRewardData)
	local var7 = var4.playButtonState ~= playButtonStates.Loading and (playWithRewardData and not playWithRewardData_1)
	local configKey = p1.sduiContext and p1.sduiContext.configKey
	reactModule.useEffect(function()
		-- upvalues: configKey (ref), var7 (ref), getSduiClientPageScope (copy)
		if configKey and var7 then
			getSduiClientPageScope(configKey).set("filterPlayWithReward", true)
			
			return
		end
	end, { configKey, var7 })
	
	return if playWithRewardData_1 then reactModule.createElement(playWithRewardComponent, {
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
	}) else nil
end)