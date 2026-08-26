local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local var1 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local setGameNameModule = require(script.Parent.Parent.Actions.SetGameName)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else function(p1)
	-- upvalues: promiseModule (ref), getGameNameAndDescription (ref), var1 (ref), setGameNameModule (ref)
	return if game.GameId == 0 then promiseModule.resolve() else getGameNameAndDescription(var1, game.GameId):andThen(function(p2)
		-- upvalues: p1 (ref), setGameNameModule (copy)
		p1:dispatch(setGameNameModule(p2.Name))
		
		return p2.Name
	end, function()
		-- upvalues: promiseModule (copy)
		warn("Unable to get game name for Gamepad Menu")
		
		return promiseModule.reject()
	end)
end