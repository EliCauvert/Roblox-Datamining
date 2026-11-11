local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local DataHydrationModule = require(Parent.DataHydration)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local Players = game:GetService("Players")

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Players (copy), DataHydrationModule (copy)
	local ActionParams = p1 and p1.actionParams
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.RefreshDeveloperProducts
		}, p2.appPage)
		
		return
	end
	local PlaceId = ActionParams.placeId
	
	if PlaceId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing placeId",
			name = SduiActionType.RefreshDeveloperProducts
		}, p2.appPage)
		
		return
	end
	local LocalPlayer = Players.LocalPlayer
	local UserId = LocalPlayer and LocalPlayer.UserId
	
	if UserId ~= nil then
		DataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(UserId), (tostring(PlaceId)))
		
		return
	end
end