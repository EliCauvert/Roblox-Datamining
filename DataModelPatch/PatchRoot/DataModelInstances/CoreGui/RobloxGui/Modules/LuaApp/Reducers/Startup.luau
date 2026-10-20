local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules1 = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local HomePageDataStatusFunction = Modules1.LuaApp.Reducers.HomePageDataStatus
local FetchHomePageDataStatusAllFunction = Modules1.LuaApp.Reducers.FetchHomePageDataStatusAll
local GamesPageDataStatusFunction = Modules1.LuaApp.Reducers.GamesPageDataStatus
local SetPreloadingModule = require(Modules.LuaApp.Actions.SetPreloading)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange

local function _(Done): boolean
	-- upvalues: RetrievalStatusModule (copy)
	return Done == RetrievalStatusModule.NotStarted or (Done == RetrievalStatusModule.Fetching or (Done == RetrievalStatusModule.Failed or Done == RetrievalStatusModule.Done))
end

local function joinRetrievalStatus(Done, Done1)
	-- upvalues: RetrievalStatusModule (copy)
	if Done ~= RetrievalStatusModule.NotStarted and (Done ~= RetrievalStatusModule.Fetching and (Done ~= RetrievalStatusModule.Failed and Done ~= RetrievalStatusModule.Done)) then
		Done = nil
	end
	if Done1 ~= RetrievalStatusModule.NotStarted and (Done1 ~= RetrievalStatusModule.Fetching and (Done1 ~= RetrievalStatusModule.Failed and Done1 ~= RetrievalStatusModule.Done)) then
		Done1 = nil
	end
	return if Done == nil then Done1 elseif Done1 == nil then Done elseif Done == RetrievalStatusModule.Failed or Done1 == RetrievalStatusModule.Failed then RetrievalStatusModule.Failed elseif Done == RetrievalStatusModule.NotStarted and Done1 == RetrievalStatusModule.NotStarted then RetrievalStatusModule.NotStarted elseif Done == RetrievalStatusModule.Done and Done1 == RetrievalStatusModule.Done then RetrievalStatusModule.Done else RetrievalStatusModule.Fetching
end

return function(p1, p2)
	-- upvalues: GamesPageDataStatusFunction (copy), HomePageDataStatusFunction (copy), FetchHomePageDataStatusAllFunction (copy), SetPreloadingModule (copy), CryoModule (copy), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), joinRetrievalStatus (copy)
	local P3 = p1 or {}
	local GamesPageDataStatusResult = GamesPageDataStatusFunction(P3.GamesPageDataStatus, p2)
	local HomePageDataStatusResult = HomePageDataStatusFunction(P3.HomePageDataStatus, p2)
	local HomePageDataStatusAll = FetchHomePageDataStatusAllFunction(P3.FetchHomePageDataStatusAll, p2)
	
	return {
		GamesPageDataStatus = GamesPageDataStatusResult,
		HomePageDataStatus = HomePageDataStatusResult,
		FetchHomePageDataStatusAll = HomePageDataStatusAll,
		Preloading = if p2.type == SetPreloadingModule.name then p2.isPreloading else P3.Preloading == nil or P3.Preloading,
		AppDataStatus = CryoModule.List.foldLeft({
			if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then GamesPageDataStatusResult.status else GamesPageDataStatusResult,
			HomePageDataStatusResult,
			HomePageDataStatusAll
		}, joinRetrievalStatus)
	}
end