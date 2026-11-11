local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local TutilsModule = require(Parent.tutils)
local Modules = DiscoveryMonolith.Modules
local GameSearchEntryModule = require(Modules.LuaApp.Models.GamesApi.GameSearchEntry)
local ArgCheckModule = require(Parent.ArgCheck)
local PaginationMethodModule = require(Modules.LuaApp.Enum.PaginationMethod)
local SearchInGamesModule = {
	new = function()
		return {}
	end
}

function SearchInGamesModule.mock()
	-- upvalues: SearchInGamesModule (copy), GameSearchEntryModule (copy), PaginationMethodModule (copy)
	local NewSearchInGames = SearchInGamesModule.new()
	NewSearchInGames.keyword = "Meepcity"
	NewSearchInGames.entries = { GameSearchEntryModule.mock() }
	NewSearchInGames.emphasis = true
	NewSearchInGames.hasMoreRows = false
	NewSearchInGames.nextPageToken = nil
	NewSearchInGames.paginationMethod = PaginationMethodModule.Scroll
	
	return NewSearchInGames
end

function SearchInGamesModule.fromOmniSearch(Keyword, Entries, Emphasis, NextPageToken, p1)
	-- upvalues: SearchInGamesModule (copy), PaginationMethodModule (copy), ArgCheckModule (copy)
	local NewSearchInGames = SearchInGamesModule.new()
	NewSearchInGames.keyword = Keyword
	NewSearchInGames.entries = Entries
	NewSearchInGames.emphasis = Emphasis
	NewSearchInGames.updatedTimestamp = tick()
	
	if not NextPageToken or NextPageToken == "" then
		NewSearchInGames.nextPageToken = nil
		NewSearchInGames.hasMoreRows = false
		
		return NewSearchInGames
	end
	if p1 then
		NewSearchInGames.paginationMethod = PaginationMethodModule[p1]
		ArgCheckModule.assert(NewSearchInGames.paginationMethod, `Unknown pagination method: {p1}`)
	else
		NewSearchInGames.paginationMethod = PaginationMethodModule.Scroll
	end
	NewSearchInGames.nextPageToken = NextPageToken
	NewSearchInGames.hasMoreRows = true
	
	return NewSearchInGames
end

function SearchInGamesModule.IsEqual(p1, p2)
	-- upvalues: TutilsModule (copy)
	return if TutilsModule.shallowEqual(p1.entries, p2.entries) then TutilsModule.shallowEqual(p1, p2, { entries = true }) else false
end

return SearchInGamesModule