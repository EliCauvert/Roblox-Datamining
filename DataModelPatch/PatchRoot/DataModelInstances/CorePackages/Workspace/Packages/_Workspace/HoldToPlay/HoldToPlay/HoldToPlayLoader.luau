local Parent = script:FindFirstAncestor("HoldToPlay").Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local AppSessionService = RoactServiceTagsModule.AppSessionService
local GamePlayButtonModule = require(Parent.GamePlayButton)
local UseOnPlayButtonCallbackFunction = GamePlayButtonModule.useOnPlayButtonCallback
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local HoldToPlayLauncher = require(Parent.ExperienceAnalytics).Constants.Context.HoldToPlayLauncher

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), AppSessionService (copy), UsePlayButtonStateFunction (copy), UseOnPlayButtonCallbackFunction (copy), HoldToPlayLauncher (copy), ReactModule (copy), SetGamePlaySessionFunction (copy), SessionType (copy), PlayButtonStates (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceResult, p1.universeId)
	local UseOnPlayButtonCallbackResult = UseOnPlayButtonCallbackFunction(p1.universeId, nil, HoldToPlayLauncher, nil, nil)
	ReactModule.useEffect(function()
		-- upvalues: UsePlayButtonStateResult (copy), p1 (copy), SetGamePlaySessionFunction (upval), UseRoactServiceResult1 (copy), SessionType (upval), UseOnPlayButtonCallbackResult (copy), PlayButtonStates (upval)
		local PlayButtonState = UsePlayButtonStateResult.playButtonState
		
		if p1.shouldAttemptLaunch then
			SetGamePlaySessionFunction(UseRoactServiceResult1, SessionType.StructuralIdentifier.GamePlayFromHoldToPlay, true)
			UseOnPlayButtonCallbackResult(PlayButtonState, p1.reportExperienceLaunched)
			
			if p1.onLaunched and PlayButtonState == PlayButtonStates.Playable then
				p1.onLaunched()
			end
		end
	end, {
		p1.shouldAttemptLaunch, p1.onLaunched,
		UsePlayButtonStateResult.playButtonState, UseRoactServiceResult1,
		p1.reportExperienceLaunched, UseOnPlayButtonCallbackResult
	})
	
	return nil
end