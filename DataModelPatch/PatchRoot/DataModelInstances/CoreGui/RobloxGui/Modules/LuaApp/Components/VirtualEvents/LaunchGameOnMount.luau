local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local PlayButtonStates = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonStates
local GetFFlagLuaAppEnableVirtualEventPlaceIdFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled

return require(script:FindFirstAncestor("Modules").LuaApp.Common.Experience.Connectors.LaunchExperienceConnector).connect(function(p1)
	-- upvalues: GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (copy)
	return {
		universeId = p1.universeId,
		placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1.placeId else nil,
		launchSource = p1.launchSource,
		referralSource = p1.referralSource,
		extraParams = if p1.experienceJoinData then p1.experienceJoinData else nil
	}
end, function(p1)
	return {
		playabilityStatus = p1.playabilityStatus,
		playButtonState = p1.playButtonState,
		onPlayButtonActivated = p1.onPlayButtonActivated
	}
end)(function(p1)
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), ReactModule (copy), PlayButtonStates (copy)
	local v1 = nil
	v1 = if GetFFlagIsSquadEnabledFunction() then p1 else p1
	ReactModule.useEffect(function()
		-- upvalues: v1 (ref), PlayButtonStates (upval), GetFFlagIsSquadEnabledFunction (upval)
		if v1.playButtonState == PlayButtonStates.Playable or GetFFlagIsSquadEnabledFunction() and v1.playButtonState == PlayButtonStates.PlayableWithParty then
			if v1.onGameLaunching then
				v1.onGameLaunching()
			end
			if v1.playButtonState == PlayButtonStates.PlayableWithParty then
				v1.onPlayButtonActivated(PlayButtonStates.Playable)
				
				return
			end
			v1.onPlayButtonActivated()
		end
	end, { v1.playButtonState })
	
	return nil
end)