local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local GameSortGroups = require(Parent.DiscoveryTypes).GameSortGroups
local PromiseModule = require(Parent.Promise)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local Modules = DiscoveryMonolith.Modules
local ApiFetchSortTokensModule = require(Modules.LuaApp.Thunks.Games.ApiFetchSortTokens)
local SetGamesPageDataStatusModule = require(Modules.LuaApp.Actions.SetGamesPageDataStatus)
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(Parent.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange
local LuaAppsDiagPageLoadTimeGamesFVariable = settings():GetFVariable("LuaAppsDiagPageLoadTimeGames")

return function(p1, p2, p3, p4, p5)
	-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), RetrievalStatus (copy), PromiseModule (copy), SetGamesPageDataStatusModule (copy), ApiFetchSortTokensModule (copy), GameSortGroups (copy), LuaAppsDiagPageLoadTimeGamesFVariable (copy)
	return function(p6)
		-- upvalues: FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval), RetrievalStatus (upval), PromiseModule (upval), SetGamesPageDataStatusModule (upval), p5 (copy), ApiFetchSortTokensModule (upval), p1 (copy), GameSortGroups (upval), p3 (copy), p4 (copy), p2 (copy), LuaAppsDiagPageLoadTimeGamesFVariable (upval)
		if (if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then p6:getState().Startup.GamesPageDataStatus.status else p6:getState().Startup.GamesPageDataStatus) == RetrievalStatus.Fetching then
			return PromiseModule.resolve("games page data is already fetching")
		else
			local CurrentTime = tick()
			p6:dispatch(SetGamesPageDataStatusModule(RetrievalStatus.Fetching, if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then p5 else nil))
			
			return p6:dispatch(ApiFetchSortTokensModule(p1, GameSortGroups.Games, p3, p4)):andThen(function()
				-- upvalues: p6 (copy), SetGamesPageDataStatusModule (upval), RetrievalStatus (upval), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval), p5 (upval), p3 (upval), CurrentTime (copy), p2 (upval), LuaAppsDiagPageLoadTimeGamesFVariable (upval), PromiseModule (upval)
				p6:dispatch(SetGamesPageDataStatusModule(RetrievalStatus.Done, if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then p5 else nil))
				
				if not p3 or p3 == "" then
					p2.Diag:reportStats(LuaAppsDiagPageLoadTimeGamesFVariable, (tick() - CurrentTime) * 1000)
				end
				return PromiseModule.resolve()
			end, function(p7)
				-- upvalues: p6 (copy), SetGamesPageDataStatusModule (upval), RetrievalStatus (upval), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval), p5 (upval), PromiseModule (upval)
				p6:dispatch(SetGamesPageDataStatusModule(RetrievalStatus.Failed, if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then p5 else nil))
				
				return PromiseModule.reject(p7)
			end)
		end
	end
end