local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local GamePlayButtonModule = require(Parent.GamePlayButton)
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local UseOnPlayButtonCallbackFunction = GamePlayButtonModule.useOnPlayButtonCallback
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType

return function(p1) --[[ Line: 30 | Named "InstantPlayLauncher" ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), AppSessionService (copy), UsePlayButtonStateFunction (copy), ReactModule (copy), UseOnPlayButtonCallbackFunction (copy), PlayButtonStates (copy), SetGamePlaySessionFunction (copy), SessionType (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceResult, p1.universeId, nil, true)
	local UseRefResult = ReactModule.useRef(false)
	local UseOnPlayButtonCallbackResult = UseOnPlayButtonCallbackFunction(p1.universeId, p1.referralSource, p1.eventContext, nil, p1.launchSource, ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: p1 (copy)
		return { launchData = p1.launchData }
	end, { p1.launchData }), p1.placeId)
	ReactModule.useEffect(function() --[[ Line: 53 ]]
		-- upvalues: UseRefResult (copy), UsePlayButtonStateResult (copy), PlayButtonStates (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult1 (copy), SessionType (upval), UseOnPlayButtonCallbackResult (copy), p1 (copy)
		if UseRefResult.current or UsePlayButtonStateResult.playButtonState == PlayButtonStates.Loading then return end
		UseRefResult.current = true
		
		if UsePlayButtonStateResult.playButtonState == PlayButtonStates.Playable then
			SetGamePlaySessionFunction(UseRoactServiceResult1, SessionType.StructuralIdentifier.GamePlayFromInstantPlay, true)
			UseOnPlayButtonCallbackResult(UsePlayButtonStateResult.playButtonState, p1.reportExperienceLaunched)
		else
			p1.openGameDetails()
		end
		p1.onLaunchAttemptCompleted()
	end, {
		UseOnPlayButtonCallbackResult, UsePlayButtonStateResult.playButtonState,
		UseRoactServiceResult1, p1.openGameDetails, p1.onLaunchAttemptCompleted,
		p1.reportExperienceLaunched
	})
	
	return nil
end