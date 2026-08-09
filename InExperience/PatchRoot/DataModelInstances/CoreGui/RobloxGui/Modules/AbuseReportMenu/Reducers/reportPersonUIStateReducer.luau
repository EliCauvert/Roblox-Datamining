local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)
local playerMenuActions = constantsModule.PlayerMenuActions
local fFlagInGameMenuAddChatLineReporting = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting

return function(p0, p1) --[[ line: 11 | named "reportPersonUIStateReducer" ]]
	-- upvalues: playerMenuActions (ref), constantsModule (ref), fFlagInGameMenuAddChatLineReporting (ref)
	local cloned = table.clone(p0)
	local type = p1.type
	
	if type == playerMenuActions.UpdateAbuseReason then
		cloned.abuseReason = p1.abuseReason
		
		return cloned
	elseif type == playerMenuActions.UpdateComment then
		cloned.comment = p1.comment
		
		return cloned
	elseif type == playerMenuActions.UpdateMethodOfAbuse then
		cloned.playerObjects = {}
		cloned.abuseReason = nil
		cloned.methodOfAbuse = p1.methodOfAbuse
		
		return cloned
	elseif type == playerMenuActions.UpdateAbuser then
		cloned.allegedAbuserId = p1.abuseId
		cloned.allegedAbuser = p1.abuser
		
		return cloned
	elseif type == playerMenuActions.UpdatePlayerNameMap then
		cloned.playerObjects = p1.playerObjects
		
		return cloned
	elseif type == playerMenuActions.SetVoiceEnabled then
		cloned.isVoiceEnabled = p1.enabled
		
		return cloned
	elseif type == playerMenuActions.SetMenuOpenTimestamp then
		cloned.menuOpenedUnixTimestampMilliseconds = p1.timestamp
		
		return cloned
	elseif type == playerMenuActions.ClearState then
		cloned = table.clone(constantsModule.InitPersonUIState)
		
		return cloned
	elseif type == playerMenuActions.SetShowModalSelector then
		cloned.isModalSelectorShown = p1.isShown
		cloned.modalSelectorCellData = p1.cellData
		
		return cloned
	elseif type == playerMenuActions.SetPreselectedPlayer then
		cloned.preselectedPlayer = p1.player
		
		return cloned
	elseif fFlagInGameMenuAddChatLineReporting and type == playerMenuActions.UpdatedSelectedChatAndOrderedMessages then
		cloned.selectedMessage = p1.selectedMessage
		cloned.orderedMessages = p1.orderedMessages
	end
	return cloned
end