local httpRbxApiService = game:GetService("HttpRbxApiService")
local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local setGameNameAndDescriptionModule = require(parent.Actions.SetGameNameAndDescription)
local var1 = require(parent.Network.httpRequest)(httpRbxApiService)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return function(p1)
	-- upvalues: getGameNameAndDescription (ref), var1 (ref), setGameNameAndDescriptionModule (ref)
	if game.GameId == 0 then
		return
	end
	getGameNameAndDescription(var1, game.GameId):andThen(function(p2)
		-- upvalues: p1 (ref), setGameNameAndDescriptionModule (copy)
		p1:dispatch(setGameNameAndDescriptionModule(p2.Name, p2.Description))
	end):catch(function()
		warn("Unable to retrieve game name for in game menu")
	end)
end