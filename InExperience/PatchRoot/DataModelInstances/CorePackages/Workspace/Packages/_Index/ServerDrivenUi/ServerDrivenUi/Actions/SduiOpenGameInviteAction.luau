local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GameInviteModule = require(Parent.GameInvite)
local GameInviteModalManager = GameInviteModule.GameInviteModalManager
local GameInviteAnalyticsManager = GameInviteModule.GameInviteAnalyticsManager

return function(p1, _, p2) --[[ Line: 16 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), GameInviteAnalyticsManager (copy), GameInviteModalManager (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenGameInvite
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local UniverseId = ActionParams.universeId
	local RootPlaceId = ActionParams.rootPlaceId
	local Trigger = ActionParams.trigger
	local ButtonName = ActionParams.buttonName
	
	if typeof(RootPlaceId) ~= "string" or RootPlaceId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "rootPlaceId",
			name = SduiActionType.OpenGameInvite,
			message = `Invalid or missing rootPlaceId: {RootPlaceId}`
		}, p2.appPage)
		
		return
	end
	if typeof(Trigger) ~= "string" or Trigger == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "trigger",
			name = SduiActionType.OpenGameInvite,
			message = `Invalid or missing trigger: {Trigger}`
		}, p2.appPage)
		
		return
	end
	if typeof(ButtonName) == "string" and ButtonName ~= "" then
		GameInviteAnalyticsManager:withButtonName(ButtonName)
		GameInviteAnalyticsManager:inputShareGameEntryPoint(RootPlaceId, UniverseId)
	end
	GameInviteModalManager:openModal({
		trigger = Trigger,
		rootPlaceId = RootPlaceId,
		universeId = UniverseId
	})
end