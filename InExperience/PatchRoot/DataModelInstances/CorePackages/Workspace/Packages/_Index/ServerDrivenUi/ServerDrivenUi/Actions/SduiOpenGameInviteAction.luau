local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local gameInviteModule = require(parent.GameInvite)
local gameInviteModalManager = gameInviteModule.GameInviteModalManager
local gameInviteAnalyticsManager = gameInviteModule.GameInviteAnalyticsManager

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), gameInviteAnalyticsManager (ref), gameInviteModalManager (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenGameInvite
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local universeId = var1.universeId
	local rootPlaceId = var1.rootPlaceId
	local trigger = var1.trigger
	local buttonName = var1.buttonName
	
	if typeof(rootPlaceId) ~= "string" or rootPlaceId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "rootPlaceId",
			name = sduiActionType.OpenGameInvite,
			message = `Invalid or missing rootPlaceId: {rootPlaceId}`
		}, p2.appPage)
		
		return
	elseif typeof(trigger) ~= "string" or trigger == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "trigger",
			name = sduiActionType.OpenGameInvite,
			message = `Invalid or missing trigger: {trigger}`
		}, p2.appPage)
		
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