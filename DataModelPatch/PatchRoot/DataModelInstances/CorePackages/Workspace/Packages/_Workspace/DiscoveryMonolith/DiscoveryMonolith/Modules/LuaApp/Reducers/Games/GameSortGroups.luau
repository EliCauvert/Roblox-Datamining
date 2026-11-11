local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local CryoModule = require(Parent.Cryo)
local Modules = DiscoveryMonolith.Modules
local AppendGameSortsInGroupModule = require(Modules.LuaApp.Actions.Games.AppendGameSortsInGroup)
local SetGameSortsInGroupModule = require(Modules.LuaApp.Actions.Games.SetGameSortsInGroup)
local GameSortGroupModule = require(Modules.LuaApp.Models.GameSortGroup)
local config = {
	Games = GameSortGroupModule.new(),
	GamesSeeAll = GameSortGroupModule.new(),
	HomeGames = GameSortGroupModule.new(),
	GamesList = GameSortGroupModule.new(),
	SearchLandingPage = if require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage then GameSortGroupModule.new() else nil
}

return function(p1, p2)
	-- upvalues: config (copy), SetGameSortsInGroupModule (copy), CryoModule (copy), AppendGameSortsInGroupModule (copy)
	local P0 = p1 or config
	assert(P0, "")
	
	if p2.type ~= SetGameSortsInGroupModule.name then
		if p2.type == AppendGameSortsInGroupModule.name and P0[p2.groupId] then
			local Entry = P0[p2.groupId]
			local Sorts = p2.sorts
			
			if Entry.sorts then
				Sorts = CryoModule.List.join(Entry.sorts, Sorts)
			end
			P0 = CryoModule.Dictionary.join(P0, {
				[p2.groupId] = CryoModule.Dictionary.join(Entry, { pageId = "", sorts = Sorts })
			})
		end
	elseif P0[p2.groupId] then
		P0 = CryoModule.Dictionary.join(P0, {
			[p2.groupId] = CryoModule.Dictionary.join(P0[p2.groupId], { sorts = p2.sorts, pageId = p2.pageId })
		})
		
		return P0
	end
	return P0
end