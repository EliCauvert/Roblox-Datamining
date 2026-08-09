local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local teleportService = game:GetService("TeleportService")
local gamesMultigetPlaceDetails = require(corePackagesService.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails
local var3 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(httpRbxApiService)

return function() --[[ line: 14 ]]
	-- upvalues: gamesMultigetPlaceDetails (ref), var3 (ref), teleportService (ref)
	if game.PlaceId ~= 0 then
		gamesMultigetPlaceDetails(var3, game.PlaceId):andThen(function(p0) --[[ line: 16 ]]
			-- upvalues: teleportService (copy)
			teleportService:Teleport(p0.responseBody[1].universeRootPlaceId)
		end, function() --[[ line: 19 ]] end)
	end
end