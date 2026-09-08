local parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local playersService = game:GetService("Players")

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), playersService (ref), dataHydrationModule (ref)
	local actionParams = p1 and p1.actionParams
	
	if actionParams == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RefreshDeveloperProducts
		}, p2.appPage)
		
		return
	end
	local placeId = actionParams.placeId
	
	if placeId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			name = sduiActionType.RefreshDeveloperProducts
		}, p2.appPage)
		
		return
	end
	local localPlayer = playersService.LocalPlayer
	local userId = localPlayer and localPlayer.UserId
	
	if userId == nil then
		return
	end
	dataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(userId), tostring(placeId))
end