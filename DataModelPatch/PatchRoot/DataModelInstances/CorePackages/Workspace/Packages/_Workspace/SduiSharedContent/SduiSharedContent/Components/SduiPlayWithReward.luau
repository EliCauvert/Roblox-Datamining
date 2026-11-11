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
local FFlagSduiPlayWithRewardGapFix = require(Parent.SharedFlags).FFlagSduiPlayWithRewardGapFix

return ReactModule.memo(function(p1)
	-- upvalues: UseNavigationFocusFunction (copy), ReactModule (copy), UsePlayButtonStateFunction (copy), PlayButtonStates (copy), UsePlayWithRewardDataFunction (copy), FFlagSduiPlayWithRewardGapFix (copy), GetSduiClientPageScopeFunction (copy), PlayWithRewardComponent (copy)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(p1.sduiContext and (p1.sduiContext.dependencies and p1.sduiContext.dependencies.networking), p1.universeId)
	local IsPlayButtonStateMatch = UsePlayButtonStateResult.playButtonState == PlayButtonStates.Playable
	ReactModule.useEffect(function()
		-- upvalues: UseNavigationFocusResult (copy), UseStateResult2 (copy)
		if UseNavigationFocusResult then
			UseStateResult2(true)
		end
	end, { UseNavigationFocusResult })
	local UsePlayWithRewardDataResult = UsePlayWithRewardDataFunction({
		universeId = p1.universeId,
		shouldFetch = UseStateResult,
		onFetchDispatched = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end
	})
	local PlayWithRewardData = UsePlayWithRewardDataResult.playWithRewardData
	local ShowPlayWithReward = UsePlayWithRewardDataResult.showPlayWithReward
	local v1 = nil
	
	if FFlagSduiPlayWithRewardGapFix then
		v1 = IsPlayButtonStateMatch and (ShowPlayWithReward and PlayWithRewardData)
		local NoV15: boolean = UsePlayButtonStateResult.playButtonState ~= PlayButtonStates.Loading and (PlayWithRewardData and not v1)
		local ConfigKey = p1.sduiContext and p1.sduiContext.configKey
		ReactModule.useEffect(function()
			-- upvalues: ConfigKey (copy), NoV15 (copy), GetSduiClientPageScopeFunction (upval)
			if ConfigKey and NoV15 then
				GetSduiClientPageScopeFunction(ConfigKey).set("filterPlayWithReward", true)
				
				return
			end
		end, { ConfigKey, NoV15 })
	end
	if FFlagSduiPlayWithRewardGapFix and not v1 or (not IsPlayButtonStateMatch or not ShowPlayWithReward or not PlayWithRewardData) then
		return nil
	else
		return ReactModule.createElement(PlayWithRewardComponent, {
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
		})
	end
end)