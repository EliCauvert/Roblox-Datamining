local httpRbxApiService = game:GetService("HttpRbxApiService")
local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local setGameNameAndDescriptionModule = require(parent.Actions.SetGameNameAndDescription)
local var3 = require(parent.Network.httpRequest)(httpRbxApiService)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return function(p0)
	-- upvalues: getGameNameAndDescription (ref), var3 (ref), setGameNameAndDescriptionModule (ref)
	if game.GameId == 0 then
		return
	end
	getGameNameAndDescription(var3, game.GameId):andThen(function(p1)
		-- upvalues: p0 (ref), setGameNameAndDescriptionModule (copy)
		p0:dispatch(setGameNameAndDescriptionModule(p1.Name, p1.Description))
	end):catch(function()
		warn("Unable to retrieve game name for in game menu")
	end)
end