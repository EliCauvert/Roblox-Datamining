local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local GameConnectionsPlayedChipClickedFunction = require(Parent.DiscoveryAnalytics).Events.gameConnectionsPlayedChipClicked
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _) --[[ Line: 19 | Named "SduiOpenSocialProofUserListSheetAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Players (copy), GameConnectionsPlayedChipClickedFunction (copy), AppPage (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.OpenSocialProofUserListSheet
		}, p2.appPage)
		
		return
	end
	local UserIds = ActionParams.userIds
	
	if UserIds == nil or typeof(UserIds) ~= "table" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid userIds",
			name = SduiActionType.OpenSocialProofUserListSheet
		}, p2.appPage)
		
		return
	end
	local SheetTitle = ActionParams.sheetTitle
	local UniverseId = ActionParams.universeId
	local PlaceId = ActionParams.placeId
	local TotalConnections = ActionParams.totalConnections
	local AnalyticsSource = ActionParams.analyticsSource
	
	if UniverseId and PlaceId and TotalConnections and AnalyticsSource then
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId
		GameConnectionsPlayedChipClickedFunction({
			uid = if UserId then tostring(UserId) else "",
			universeId = UniverseId,
			placeId = PlaceId,
			totalConnections = TotalConnections
		}, AnalyticsSource)
	end
	local UserIds1 = {}
	
	for _, userId in UserIds do
		local Number: number? = tonumber(if typeof(userId) == "table" then userId.userId else userId)
		
		if Number then
			table.insert(UserIds1, Number)
		end
	end
	p2.dependencies.getNavigation().navigate(AppPage.SocialProofVerticalUserListSheet, { extraProps = { userIds = UserIds1, title = SheetTitle } })
end