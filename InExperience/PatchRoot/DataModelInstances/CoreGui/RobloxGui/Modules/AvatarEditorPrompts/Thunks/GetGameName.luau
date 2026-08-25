local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local var3 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local gameNameFetchedModule = require(script.Parent.Parent.Actions.GameNameFetched)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return function(p0)
	-- upvalues: promiseModule (ref), getGameNameAndDescription (ref), var3 (ref), gameNameFetchedModule (ref)
	return if game.GameId == 0 then promiseModule.resolve() else getGameNameAndDescription(var3, game.GameId):andThen(function(p1)
		-- upvalues: p0 (ref), gameNameFetchedModule (copy)
		p0:dispatch(gameNameFetchedModule(p1.Name))
		
		return p1.Name
	end, function()
		-- upvalues: promiseModule (copy)
		warn("Unable to get game name for Avatar Editor Prompts")
		
		return promiseModule.reject()
	end)
end