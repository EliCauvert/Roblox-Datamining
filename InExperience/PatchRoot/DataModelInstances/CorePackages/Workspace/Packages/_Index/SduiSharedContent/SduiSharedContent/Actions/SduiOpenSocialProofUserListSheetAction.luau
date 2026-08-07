local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local gameConnectionsPlayedChipClicked = require(parent.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, _, p1, _) --[[ line: 19 | named "SduiOpenSocialProofUserListSheetAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), playersService (ref), gameConnectionsPlayedChipClicked (ref), appPage (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.OpenSocialProofUserListSheet
		}, p1.appPage)
		
		return
	end
	local userIds = var2.userIds
	
	if userIds == nil or typeof(userIds) ~= "table" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing or invalid userIds",
			name = sduiActionType.OpenSocialProofUserListSheet
		}, p1.appPage)
		
		return
	end
	local sheetTitle = var2.sheetTitle
	local universeId = var2.universeId
	local placeId = var2.placeId
	local totalConnections = var2.totalConnections
	local analyticsSource = var2.analyticsSource
	
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
		local var5 = tonumber(if typeof(v) == "table" then v.userId else v)
		
		if var5 then
			table.insert(t, var5)
		end
	end
	p1.dependencies.getNavigation().navigate(appPage.SocialProofVerticalUserListSheet, { extraProps = { userIds = t, title = sheetTitle } })
end