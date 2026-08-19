local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local gamePlayButtonModule = require(parent.GamePlayButton)
local playButtonStates = gamePlayButtonModule.PlayButtonStates
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local useOnPlayButtonCallback = gamePlayButtonModule.useOnPlayButtonCallback
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType

return function(p0) --[[ line: 30 | named "InstantPlayLauncher" ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), appSessionService (ref), usePlayButtonState (ref), reactModule (ref), useOnPlayButtonCallback (ref), playButtonStates (ref), setGamePlaySession (ref), sessionType (ref)
	local var3 = useRoactService(appSessionService)
	local var4 = usePlayButtonState(useRoactService(roactNetworking), p0.universeId, nil, true)
	local var5 = reactModule.useRef(false)
	local var6 = useOnPlayButtonCallback(p0.universeId, p0.referralSource, p0.eventContext, nil, p0.launchSource, reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: p0 (ref)
		return { launchData = p0.launchData }
	end, { p0.launchData }), p0.placeId)
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: var5 (ref), var4 (ref), playButtonStates (copy), setGamePlaySession (copy), var3 (ref), sessionType (copy), var6 (ref), p0 (ref)
		if var5.current or var4.playButtonState == playButtonStates.Loading then return end
		var5.current = true
		
		if var4.playButtonState == playButtonStates.Playable then
			setGamePlaySession(var3, sessionType.StructuralIdentifier.GamePlayFromInstantPlay, true)
			var6(var4.playButtonState, p0.reportExperienceLaunched)
		else
			p0.openGameDetails()
		end
		p0.onLaunchAttemptCompleted()
	end, {
		var6, var4.playButtonState, var3, p0.openGameDetails,
		p0.onLaunchAttemptCompleted, p0.reportExperienceLaunched
	})
	
	return nil
end