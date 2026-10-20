local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local Game = require(Parent.DataHydration).Game
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetSduiClientPageScopeFunction = SduiCoreSystemModule.getSduiClientPageScope

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Game (copy), GetSduiClientPageScopeFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.DismissGameFeedback
		}, p2.appPage)
		
		return
	end
	local RootPlaceId = ActionParams.rootPlaceId
	
	if RootPlaceId == nil or typeof(RootPlaceId) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid rootPlaceId",
			name = SduiActionType.DismissGameFeedback
		}, p2.appPage)
		
		return
	end
	Game.getUserVoteFeedbackMetadataStore(false).clearItem(RootPlaceId)
	
	if p2.configKey then
		GetSduiClientPageScopeFunction(p2.configKey).set("showPlayerFeedback", false)
	end
end