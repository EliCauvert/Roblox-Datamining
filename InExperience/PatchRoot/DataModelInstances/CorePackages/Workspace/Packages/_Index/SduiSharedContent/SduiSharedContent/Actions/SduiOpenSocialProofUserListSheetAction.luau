local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local gameConnectionsPlayedChipClicked = require(parent.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), playersService (ref), gameConnectionsPlayedChipClicked (ref), appPage (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.OpenSocialProofUserListSheet
		}, p2.appPage)
		
		return
	end
	local userIds = var1.userIds
	
	if userIds == nil or typeof(userIds) ~= "table" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing or invalid userIds",
			name = sduiActionType.OpenSocialProofUserListSheet
		}, p2.appPage)
		
		return
	end
	local sheetTitle = var1.sheetTitle
	local universeId = var1.universeId
	local placeId = var1.placeId
	local totalConnections = var1.totalConnections
	local analyticsSource = var1.analyticsSource
	
	if universeId and placeId and (totalConnections and analyticsSource) then
		local userId = playersService.LocalPlayer and playersService.LocalPlayer.UserId
		gameConnectionsPlayedChipClicked({
			uid = if userId then tostring(userId) else "",
			universeId = universeId,
			placeId = placeId,
			totalConnections = totalConnections
		}, analyticsSource)
	end
	local t = {}
	
	for i, v in userIds do
		local var2 = tonumber(if typeof(v) == "table" then v.userId else v)
		
		if var2 then
			table.insert(t, var2)
		end
	end
	p2.dependencies.getNavigation().navigate(appPage.SocialProofVerticalUserListSheet, { extraProps = { userIds = t, title = sheetTitle } })
end