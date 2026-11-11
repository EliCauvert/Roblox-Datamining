local TeleportService = game:GetService("TeleportService")
local GamesMultigetPlaceDetailsFunction = require(game:GetService("CorePackages").Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))

return function()
	-- upvalues: GamesMultigetPlaceDetailsFunction (copy), v1 (copy), TeleportService (copy)
	if game.PlaceId ~= 0 then
		GamesMultigetPlaceDetailsFunction(v1, game.PlaceId):andThen(function(Result)
			-- upvalues: TeleportService (upval)
			TeleportService:Teleport(Result.responseBody[1].universeRootPlaceId)
		end, function() end)
	end
end