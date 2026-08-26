local parent = script:FindFirstAncestor("HoldToPlay").Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactNetworking = roactServiceTagsModule.RoactNetworking
local appSessionService = roactServiceTagsModule.AppSessionService
local gamePlayButtonModule = require(parent.GamePlayButton)
local useOnPlayButtonCallback = gamePlayButtonModule.useOnPlayButtonCallback
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local playButtonStates = gamePlayButtonModule.PlayButtonStates
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local holdToPlayLauncher = require(parent.ExperienceAnalytics).Constants.Context.HoldToPlayLauncher

return function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appSessionService (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), holdToPlayLauncher (ref), reactModule (ref), setGamePlaySession (ref), sessionType (ref), playButtonStates (ref)
	local var1 = useRoactService(appSessionService)
	local var2 = usePlayButtonState(useRoactService(roactNetworking), p1.universeId)
	local var3 = useOnPlayButtonCallback(p1.universeId, nil, holdToPlayLauncher, nil, nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), setGamePlaySession (copy), var1 (ref), sessionType (copy), var3 (ref), playButtonStates (copy)
		local playButtonState = var2.playButtonState
		
		if p1.shouldAttemptLaunch then
			setGamePlaySession(var1, sessionType.StructuralIdentifier.GamePlayFromHoldToPlay, true)
			var3(playButtonState, p1.reportExperienceLaunched)
			
			if p1.onLaunched and playButtonState == playButtonStates.Playable then
				p1.onLaunched()
			end
		end
	end, {
		p1.shouldAttemptLaunch, p1.onLaunched, var2.playButtonState, var1,
		p1.reportExperienceLaunched, var3
	})
	
	return nil
end