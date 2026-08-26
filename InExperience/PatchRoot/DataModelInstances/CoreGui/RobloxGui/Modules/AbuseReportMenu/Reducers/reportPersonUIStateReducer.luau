local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)
local playerMenuActions = constantsModule.PlayerMenuActions

return function(p1, p2)
	-- upvalues: playerMenuActions (ref), constantsModule (ref)
	local cloned = table.clone(p1)
	local type = p2.type
	
	if type == playerMenuActions.UpdateAbuseReason then
		cloned.abuseReason = p2.abuseReason
		
		return cloned
	elseif type == playerMenuActions.UpdateComment then
		cloned.comment = p2.comment
		
		return cloned
	elseif type == playerMenuActions.UpdateMethodOfAbuse then
		cloned.playerObjects = {}
		cloned.abuseReason = nil
		cloned.methodOfAbuse = p2.methodOfAbuse
		
		return cloned
	elseif type == playerMenuActions.UpdateAbuser then
		cloned.allegedAbuserId = p2.abuseId
		cloned.allegedAbuser = p2.abuser
		
		return cloned
	elseif type == playerMenuActions.UpdatePlayerNameMap then
		cloned.playerObjects = p2.playerObjects
		
		return cloned
	elseif type == playerMenuActions.SetVoiceEnabled then
		cloned.isVoiceEnabled = p2.enabled
		
		return cloned
	elseif type == playerMenuActions.SetMenuOpenTimestamp then
		cloned.menuOpenedUnixTimestampMilliseconds = p2.timestamp
		
		return cloned
	elseif type == playerMenuActions.ClearState then
		cloned = table.clone(constantsModule.InitPersonUIState)
		
		return cloned
	elseif type == playerMenuActions.SetShowModalSelector then
		cloned.isModalSelectorShown = p2.isShown
		cloned.modalSelectorCellData = p2.cellData
		
		return cloned
	elseif type == playerMenuActions.SetPreselectedPlayer then
		cloned.preselectedPlayer = p2.player
	end
	return cloned
end