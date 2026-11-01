local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local NavigateToExperienceLeaderboardSeeAllFunction = require(Parent.Leaderboards).navigateToExperienceLeaderboardSeeAll
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), NavigateToExperienceLeaderboardSeeAllFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenExperienceLeaderboardSeeAll
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) ~= "string" or UniverseId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = SduiActionType.OpenExperienceLeaderboardSeeAll,
			message = `Invalid or missing universeId: {tostring(UniverseId)}`
		}, p2.appPage)
		
		return
	end
	local InitialTab = ActionParams.initialTab
	
	if InitialTab ~= nil and InitialTab ~= "friends" and InitialTab ~= "global" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "initialTab",
			name = SduiActionType.OpenExperienceLeaderboardSeeAll,
			message = `Unrecognized initialTab: {tostring(InitialTab)}`
		}, p2.appPage)
		InitialTab = nil
	end
	NavigateToExperienceLeaderboardSeeAllFunction(p2.dependencies.getNavigation(), UniverseId, InitialTab)
end