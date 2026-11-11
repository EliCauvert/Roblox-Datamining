local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local PerformFetch = require(DiscoveryMonolith.Parent.Http).PerformFetch
local Modules = DiscoveryMonolith.Modules
local GameMediaEntryModule = require(Modules.LuaApp.Models.GamesApi.GameMediaEntry)
local GamesGetMediaModule = require(Modules.LuaApp.Http.Requests.GamesApi.GamesGetMedia)
local UpdateGameMediaModule = require(Modules.LuaApp.Actions.Games.UpdateGameMedia)

return {
	KeyMapper = function(Text): string
		return "luaapp.gamesapi.gamemedia." .. Text
	end,
	Fetch = function(p1, Text)
		-- upvalues: PerformFetch (copy), GamesGetMediaModule (copy), GameMediaEntryModule (copy), UpdateGameMediaModule (copy)
		assert(typeof(Text) == "string", "universeId should be a string")
		assert(#Text > 0, "universeId should not be empty")
		
		return PerformFetch.Single("luaapp.gamesapi.gamemedia." .. Text, function(p2)
			-- upvalues: GamesGetMediaModule (upval), p1 (copy), Text (copy), GameMediaEntryModule (upval), UpdateGameMediaModule (upval)
			return GamesGetMediaModule(p1, Text):andThen(function(Result)
				-- upvalues: GameMediaEntryModule (upval), p2 (copy), UpdateGameMediaModule (upval), Text (upval)
				assert(typeof(Result.responseBody.data) == "table", "Malformed response from server, missing 'data' object")
				local FromJsonDataResults = {}
				
				for _, entry in ipairs(Result.responseBody.data) do
					table.insert(FromJsonDataResults, (GameMediaEntryModule.fromJsonData(entry)))
				end
				if #FromJsonDataResults > 0 then
					p2:dispatch(UpdateGameMediaModule(Text, FromJsonDataResults))
				end
				return FromJsonDataResults
			end)
		end)
	end,
	GetFetchingStatus = function(p2, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p2, "luaapp.gamesapi.gamemedia." .. Text)
	end
}