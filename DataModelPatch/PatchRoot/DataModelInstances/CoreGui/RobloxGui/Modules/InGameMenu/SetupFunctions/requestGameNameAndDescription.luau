local Parent = script.Parent.Parent
local SetGameNameAndDescriptionModule = require(Parent.Actions.SetGameNameAndDescription)
local v1 = require(Parent.Network.httpRequest)((game:GetService("HttpRbxApiService")))
local GetGameNameAndDescriptionFunction = require(game:GetService("CorePackages").Workspace.Packages.GameDetailRodux).GetGameNameAndDescription

return function(p1)
	-- upvalues: GetGameNameAndDescriptionFunction (copy), v1 (copy), SetGameNameAndDescriptionModule (copy)
	if game.GameId ~= 0 then
		GetGameNameAndDescriptionFunction(v1, game.GameId):andThen(function(Result)
			-- upvalues: p1 (copy), SetGameNameAndDescriptionModule (upval)
			p1:dispatch(SetGameNameAndDescriptionModule(Result.Name, Result.Description))
		end):catch(function()
			warn("Unable to retrieve game name for in game menu")
		end)
		
		return
	end
end