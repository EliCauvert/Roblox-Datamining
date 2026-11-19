local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local DataHydrationModule = require(ExperienceStoreServerDrivenUi.Parent.DataHydration)
local GameItemDetailsStoreRefreshSkippedCounterModule = require(ExperienceStoreServerDrivenUi.Events.GameItemDetailsStoreRefreshSkippedCounter)
local GameItemTypeModule = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)
local LogCounterModule = require(ExperienceStoreServerDrivenUi.Utils.logCounter)
local Players = game:GetService("Players")

return function(p1)
	-- upvalues: GameItemTypeModule (copy), DataHydrationModule (copy), Players (copy), LogCounterModule (copy), GameItemDetailsStoreRefreshSkippedCounterModule (copy)
	if p1.itemType == GameItemTypeModule.GamePass then
		DataHydrationModule.Game.getGamePassStore(false).fetchPassesForUniverse(p1.universeId)
		
		return
	end
	if p1.itemType == GameItemTypeModule.DeveloperProduct then
		local DataResult = DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p1.universeId).data(false)
		local RootPlaceId = DataResult and DataResult.rootPlaceId
		local LocalPlayer = Players.LocalPlayer
		
		if RootPlaceId == nil then
			if DataResult ~= nil then
				LogCounterModule(GameItemDetailsStoreRefreshSkippedCounterModule)
			end
			return
		elseif LocalPlayer == nil then return end
		DataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(LocalPlayer.UserId), (tostring(RootPlaceId)))
	end
end