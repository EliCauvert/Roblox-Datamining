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

return function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appSessionService (ref), usePlayButtonState (ref), reactModule (ref), useOnPlayButtonCallback (ref), playButtonStates (ref), setGamePlaySession (ref), sessionType (ref)
	local var1 = useRoactService(appSessionService)
	local var2 = usePlayButtonState(useRoactService(roactNetworking), p1.universeId, nil, true)
	local var3 = reactModule.useRef(false)
	local var4 = useOnPlayButtonCallback(p1.universeId, p1.referralSource, p1.eventContext, nil, p1.launchSource, reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return { launchData = p1.launchData }
	end, { p1.launchData }), p1.placeId)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), playButtonStates (copy), setGamePlaySession (copy), var1 (ref), sessionType (copy), var4 (ref), p1 (ref)
		if var3.current or var2.playButtonState == playButtonStates.Loading then return end
		var3.current = true
		
		if var2.playButtonState == playButtonStates.Playable then
			setGamePlaySession(var1, sessionType.StructuralIdentifier.GamePlayFromInstantPlay, true)
			var4(var2.playButtonState, p1.reportExperienceLaunched)
		else
			p1.openGameDetails()
		end
		p1.onLaunchAttemptCompleted()
	end, {
		var4, var2.playButtonState, var1, p1.openGameDetails,
		p1.onLaunchAttemptCompleted, p1.reportExperienceLaunched
	})
	
	return nil
end