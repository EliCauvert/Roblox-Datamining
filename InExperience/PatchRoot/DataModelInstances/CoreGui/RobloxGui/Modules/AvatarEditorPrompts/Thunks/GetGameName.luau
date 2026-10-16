local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))
local GameNameFetchedModule = require(script.Parent.Parent.Actions.GameNameFetched)
local GetGameNameAndDescriptionFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return function(p1) --[[ Line: 20 ]]
	-- upvalues: PromiseModule (copy), GetGameNameAndDescriptionFunction (copy), v1 (copy), GameNameFetchedModule (copy)
	return if game.GameId == 0 then PromiseModule.resolve() else GetGameNameAndDescriptionFunction(v1, game.GameId):andThen(function(Result) --[[ Line: 25 ]]
		-- upvalues: p1 (copy), GameNameFetchedModule (upval)
		p1:dispatch(GameNameFetchedModule(Result.Name))
		
		return Result.Name
	end, function() --[[ Line: 29 ]]
		-- upvalues: PromiseModule (upval)
		warn("Unable to get game name for Avatar Editor Prompts")
		
		return PromiseModule.reject()
	end)
end