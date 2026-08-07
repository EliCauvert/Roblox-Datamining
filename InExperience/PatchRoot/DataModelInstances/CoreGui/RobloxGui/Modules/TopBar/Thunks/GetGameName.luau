local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local var3 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local setGameNameModule = require(script.Parent.Parent.Actions.SetGameName)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else function(p0) --[[ line: 28 ]]
	-- upvalues: promiseModule (ref), getGameNameAndDescription (ref), var3 (ref), setGameNameModule (ref)
	return if game.GameId == 0 then promiseModule.resolve() else getGameNameAndDescription(var3, game.GameId):andThen(function(p1) --[[ line: 33 ]]
		-- upvalues: p0 (ref), setGameNameModule (copy)
		p0:dispatch(setGameNameModule(p1.Name))
		
		return p1.Name
	end, function() --[[ line: 37 ]]
		-- upvalues: promiseModule (copy)
		warn("Unable to get game name for Gamepad Menu")
		
		return promiseModule.reject()
	end)
end