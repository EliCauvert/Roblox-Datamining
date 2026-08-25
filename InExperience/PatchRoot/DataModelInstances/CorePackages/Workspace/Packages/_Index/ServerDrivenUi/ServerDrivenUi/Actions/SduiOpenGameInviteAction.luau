local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local gameInviteModule = require(parent.GameInvite)
local gameInviteModalManager = gameInviteModule.GameInviteModalManager
local gameInviteAnalyticsManager = gameInviteModule.GameInviteAnalyticsManager

return function(p0, _, p1)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), gameInviteAnalyticsManager (ref), gameInviteModalManager (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenGameInvite
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local universeId = var2.universeId
	local rootPlaceId = var2.rootPlaceId
	local trigger = var2.trigger
	local buttonName = var2.buttonName
	
	if typeof(rootPlaceId) ~= "string" or rootPlaceId == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "rootPlaceId",
			name = sduiActionType.OpenGameInvite,
			message = `Invalid or missing rootPlaceId: {rootPlaceId}`
		}, p1.appPage)
		
		return
	elseif typeof(trigger) ~= "string" or trigger == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "trigger",
			name = sduiActionType.OpenGameInvite,
			message = `Invalid or missing trigger: {trigger}`
		}, p1.appPage)
		
		return
	elseif typeof(buttonName) == "string" and buttonName ~= "" then
		gameInviteAnalyticsManager:withButtonName(buttonName)
		gameInviteAnalyticsManager:inputShareGameEntryPoint(rootPlaceId, universeId)
	end
	gameInviteModalManager:openModal({
		trigger = trigger,
		rootPlaceId = rootPlaceId,
		universeId = universeId
	})
end