local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local var1 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))
local gameNameFetchedModule = require(script.Parent.Parent.Actions.GameNameFetched)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return function(p1)
	-- upvalues: promiseModule (ref), getGameNameAndDescription (ref), var1 (ref), gameNameFetchedModule (ref)
	return if game.GameId == 0 then promiseModule.resolve() else getGameNameAndDescription(var1, game.GameId):andThen(function(p2)
		-- upvalues: p1 (ref), gameNameFetchedModule (copy)
		p1:dispatch(gameNameFetchedModule(p2.Name))
		
		return p2.Name
	end, function()
		-- upvalues: promiseModule (copy)
		warn("Unable to get game name for Avatar Editor Prompts")
		
		return promiseModule.reject()
	end)
end