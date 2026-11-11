local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local PromiseModule = require(DiscoveryMonolith.Parent.Promise)
local Modules = DiscoveryMonolith.Modules
local ApiFetchGamesDataModule = require(Modules.LuaApp.Thunks.Games.ApiFetchGamesData)
local ApiFetchSortTokensModule = require(Modules.LuaApp.Thunks.Games.ApiFetchSortTokens)

return function(p1, p2, p3, p4)
	-- upvalues: ApiFetchSortTokensModule (copy), PromiseModule (copy), ApiFetchGamesDataModule (copy)
	assert(type(p2) == "table", "sortCategories should be a table")
	assert(#p2 >= 1, "Need more than 1 sortCategories")
	
	return function(p5)
		-- upvalues: p2 (copy), ApiFetchSortTokensModule (upval), p1 (copy), PromiseModule (upval), ApiFetchGamesDataModule (upval), p3 (copy), p4 (copy)
		local DispatchResults = {}
		
		for _, value in ipairs(p2) do
			table.insert(DispatchResults, p5:dispatch(ApiFetchSortTokensModule(p1, value, nil)))
		end
		return PromiseModule.all(DispatchResults):andThen(function()
			-- upvalues: p2 (upval), p5 (copy), ApiFetchGamesDataModule (upval), p1 (upval), p3 (upval), p4 (upval), PromiseModule (upval)
			local DispatchResults = {}
			
			for _, value in ipairs(p2) do
				table.insert(DispatchResults, p5:dispatch(ApiFetchGamesDataModule(p1, value, p3, p4, nil)))
			end
			return PromiseModule.all(DispatchResults)
		end)
	end
end