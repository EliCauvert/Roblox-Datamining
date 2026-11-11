local CorePackages = game:GetService("CorePackages")
local Immutable = require(CorePackages.Workspace.Packages.AppCommonLib).Immutable
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SetSearchInGames = Modules.LuaApp.Actions.SetSearchInGames
local AppendSearchInGames = Modules.LuaApp.Actions.AppendSearchInGames
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local RemoveSearchInGamesModule = require(Modules1.LuaApp.Actions.RemoveSearchInGames)
local ResetSearchesInGamesModule = require(Modules1.LuaApp.Actions.ResetSearchesInGames)

return function(p1, p2)
	-- upvalues: SetSearchInGames (copy), Immutable (copy), AppendSearchInGames (copy), RemoveSearchInGamesModule (copy), ResetSearchesInGamesModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetSearchInGames.name then
		P0 = Immutable.Set(P0, p2.searchUuid, p2.searchInGames)
		
		return P0
	end
	if p2.type == AppendSearchInGames.name then
		local SearchUuid = p2.searchUuid
		local Entry = P0[SearchUuid]
		local SearchInGames = p2.searchInGames
		
		if Entry then
			SearchInGames.emphasis = Entry.emphasis
			SearchInGames.entries = Immutable.JoinLists(Entry.entries, SearchInGames.entries)
		end
		P0 = Immutable.Set(P0, SearchUuid, SearchInGames)
		
		return P0
	else
		if p2.type == RemoveSearchInGamesModule.name then
			P0 = Immutable.Set(P0, p2.searchUuid, nil)
			
			return P0
		end
		if p2.type == ResetSearchesInGamesModule.name then
			P0 = {}
		end
		return P0
	end
end