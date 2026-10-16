local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))
local SetGameNameModule = require(script.Parent.Parent.Actions.SetGameName)
local GetGameNameAndDescriptionFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateGameInfoRodux) then nil else function(p1) --[[ Line: 28 ]]
	-- upvalues: PromiseModule (copy), GetGameNameAndDescriptionFunction (copy), v1 (copy), SetGameNameModule (copy)
	return if game.GameId == 0 then PromiseModule.resolve() else GetGameNameAndDescriptionFunction(v1, game.GameId):andThen(function(Result) --[[ Line: 33 ]]
		-- upvalues: p1 (copy), SetGameNameModule (upval)
		p1:dispatch(SetGameNameModule(Result.Name))
		
		return Result.Name
	end, function() --[[ Line: 37 ]]
		-- upvalues: PromiseModule (upval)
		warn("Unable to get game name for Gamepad Menu")
		
		return PromiseModule.reject()
	end)
end