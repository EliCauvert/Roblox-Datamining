local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local NavigateToDevStoreSeeAllFunction = require(Parent.ExperienceStoreServerDrivenUi).navigateToDevStoreSeeAll
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), NavigateToDevStoreSeeAllFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenExperienceStoreSeeAll
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if typeof(UniverseId) == "string" and UniverseId ~= "" then
		NavigateToDevStoreSeeAllFunction(p2.dependencies.getNavigation(), UniverseId)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = SduiActionType.OpenExperienceStoreSeeAll,
			message = `Invalid or missing universeId: {tostring(UniverseId)}`
		}, p2.appPage)
	end
end