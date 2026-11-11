local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local _ = require(AbuseReportMenu.Components.Types)
local PlayerMenuActions = ConstantsModule.PlayerMenuActions
local FFlagInGameMenuAddChatLineReporting = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting

return function(Tbl, p1)
	-- upvalues: PlayerMenuActions (copy), ConstantsModule (copy), FFlagInGameMenuAddChatLineReporting (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	
	if Type == PlayerMenuActions.UpdateAbuseReason then
		Copy.abuseReason = p1.abuseReason
		
		return Copy
	end
	if Type == PlayerMenuActions.UpdateComment then
		Copy.comment = p1.comment
		
		return Copy
	end
	if Type == PlayerMenuActions.UpdateMethodOfAbuse then
		Copy.playerObjects = {}
		Copy.abuseReason = nil
		Copy.methodOfAbuse = p1.methodOfAbuse
		
		return Copy
	end
	if Type == PlayerMenuActions.UpdateAbuser then
		Copy.allegedAbuserId = p1.abuseId
		Copy.allegedAbuser = p1.abuser
		
		return Copy
	end
	if Type == PlayerMenuActions.UpdatePlayerNameMap then
		Copy.playerObjects = p1.playerObjects
		
		return Copy
	end
	if Type == PlayerMenuActions.SetVoiceEnabled then
		Copy.isVoiceEnabled = p1.enabled
		
		return Copy
	end
	if Type == PlayerMenuActions.SetMenuOpenTimestamp then
		Copy.menuOpenedUnixTimestampMilliseconds = p1.timestamp
		
		return Copy
	end
	if Type == PlayerMenuActions.ClearState then
		Copy = table.clone(ConstantsModule.InitPersonUIState)
		
		return Copy
	end
	if Type == PlayerMenuActions.SetShowModalSelector then
		Copy.isModalSelectorShown = p1.isShown
		Copy.modalSelectorCellData = p1.cellData
		
		return Copy
	end
	if Type == PlayerMenuActions.SetPreselectedPlayer then
		Copy.preselectedPlayer = p1.player
		
		return Copy
	end
	if FFlagInGameMenuAddChatLineReporting and Type == PlayerMenuActions.UpdatedSelectedChatAndOrderedMessages then
		Copy.selectedMessage = p1.selectedMessage
		Copy.orderedMessages = p1.orderedMessages
	end
	return Copy
end