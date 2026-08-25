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

return function(p0)
	-- upvalues: useRoactService (ref), roactNetworking (ref), appSessionService (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), holdToPlayLauncher (ref), reactModule (ref), setGamePlaySession (ref), sessionType (ref), playButtonStates (ref)
	local var4 = useRoactService(appSessionService)
	local var5 = usePlayButtonState(useRoactService(roactNetworking), p0.universeId)
	local var6 = useOnPlayButtonCallback(p0.universeId, nil, holdToPlayLauncher, nil, nil)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p0 (ref), setGamePlaySession (copy), var4 (ref), sessionType (copy), var6 (ref), playButtonStates (copy)
		local playButtonState = var5.playButtonState
		
		if p0.shouldAttemptLaunch then
			setGamePlaySession(var4, sessionType.StructuralIdentifier.GamePlayFromHoldToPlay, true)
			var6(playButtonState, p0.reportExperienceLaunched)
			
			if p0.onLaunched and playButtonState == playButtonStates.Playable then
				p0.onLaunched()
			end
		end
	end, {
		p0.shouldAttemptLaunch, p0.onLaunched, var5.playButtonState, var4,
		p0.reportExperienceLaunched, var6
	})
	
	return nil
end