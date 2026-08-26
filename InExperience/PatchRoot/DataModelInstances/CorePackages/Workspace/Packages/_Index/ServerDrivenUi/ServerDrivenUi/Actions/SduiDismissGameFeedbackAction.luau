local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local game = require(parent.DataHydration).Game
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), getSduiClientPageScope (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.DismissGameFeedback
		}, p2.appPage)
		
		return
	end
	local rootPlaceId = var1.rootPlaceId
	
	if rootPlaceId == nil or typeof(rootPlaceId) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing or invalid rootPlaceId",
			name = sduiActionType.DismissGameFeedback
		}, p2.appPage)
		
		return
	end
	game.getUserVoteFeedbackMetadataStore(false).clearItem(rootPlaceId)
	
	if p2.configKey then
		getSduiClientPageScope(p2.configKey).set("showPlayerFeedback", false)
	end
end