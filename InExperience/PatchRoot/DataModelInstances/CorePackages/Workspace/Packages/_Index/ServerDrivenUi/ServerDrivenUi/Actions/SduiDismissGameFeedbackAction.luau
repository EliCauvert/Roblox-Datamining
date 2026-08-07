local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local game = require(parent.DataHydration).Game
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope

return function(p0, _, p1) --[[ line: 16 | named "SduiDismissGameFeedbackAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), getSduiClientPageScope (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.DismissGameFeedback
		}, p1.appPage)
		
		return
	end
	local rootPlaceId = var1.rootPlaceId
	
	if rootPlaceId == nil or typeof(rootPlaceId) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing or invalid rootPlaceId",
			name = sduiActionType.DismissGameFeedback
		}, p1.appPage)
		
		return
	end
	game.getUserVoteFeedbackMetadataStore(false).clearItem(rootPlaceId)
	
	if p1.configKey then
		getSduiClientPageScope(p1.configKey).set("showPlayerFeedback", false)
	end
end