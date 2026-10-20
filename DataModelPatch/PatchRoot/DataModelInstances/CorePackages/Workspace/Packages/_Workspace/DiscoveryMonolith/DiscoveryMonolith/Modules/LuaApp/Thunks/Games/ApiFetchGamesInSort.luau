local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local PromiseModule = require(Parent.Promise)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameSortGroups = DiscoveryTypesModule.GameSortGroups
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local SetFetchStatusFunction = FetchStatusRoduxModule.SetFetchStatus
local GameFiltersReducer = require(Parent.GameFilters).DataStore.GameFiltersReducer
local GetSelectedGameFilterOptionsFunction = require(Parent.GameFilters).DataStore.getSelectedGameFilterOptions
local Modules = DiscoveryMonolith.Modules
local ExploreGetSortContentsModule = require(Modules.LuaApp.Http.Requests.ExploreApi.ExploreGetSortContents)
local UpdateGamesSortDataModule = require(script.Parent.updateGamesSortData)
local DiscoverPageSessionModule = require(Modules.Personalization.Sessions.DiscoverPageSession)

local function v14(Name, Done)
	-- upvalues: SetFetchStatusFunction (copy), FetchStatusNamespace (copy)
	return SetFetchStatusFunction(FetchStatusNamespace.GameSorts, Name, Done)
end

return function(p1, p2, p3, p4)
	-- upvalues: PromiseModule (copy), DiscoveryTypesModule (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), RetrievalStatus (copy), DiscoverPageSessionModule (copy), GameFiltersReducer (copy), GameSortGroups (copy), GetSelectedGameFilterOptionsFunction (copy), v14 (copy), ExploreGetSortContentsModule (copy), UpdateGamesSortDataModule (copy)
	return function(p5)
		-- upvalues: p2 (copy), PromiseModule (upval), DiscoveryTypesModule (upval), FetchStatusReducer (upval), FetchStatusNamespace (upval), RetrievalStatus (upval), p4 (copy), DiscoverPageSessionModule (upval), GameFiltersReducer (upval), GameSortGroups (upval), GetSelectedGameFilterOptionsFunction (upval), v14 (upval), ExploreGetSortContentsModule (upval), p1 (copy), UpdateGamesSortDataModule (upval), p3 (copy)
		if p2 == nil or p2.name == nil then
			return PromiseModule.resolve("Invalid sort request")
		end
		assert(p2, "sort should always exist; assert for linter")
		
		if p2.dataSource ~= DiscoveryTypesModule.DataSourceType.ExploreApi then
			return PromiseModule.resolve(`Could not fetch games for {p2.name}; expected an ExploreApi sort but the sort is from {p2.dataSource}`)
		end
		if p5:getState().Personalization[FetchStatusReducer.key][FetchStatusNamespace.GameSorts][p2.name] == RetrievalStatus.Fetching then
			return PromiseModule.resolve("Request for sort " .. p2.name .. " has been debounced")
		end
		local P5 = p4 or {}
		P5.sortId = p2.name
		P5.sessionId = DiscoverPageSessionModule:Get()
		local PersonalizationEntry = p5:getState().Personalization[GameFiltersReducer.key][GameSortGroups.Games]
		local AllFilters = if PersonalizationEntry then PersonalizationEntry.allFilters else {}
		for i, value in GetSelectedGameFilterOptionsFunction(AllFilters) do
			if P5[i] then
				warn(`URL parameter {i} already exists`)
			else
				P5[i] = value
			end
		end
		p5:dispatch(v14(p2.name, RetrievalStatus.Fetching))
		
		return ExploreGetSortContentsModule(p1, P5):andThen(function(Result)
			-- upvalues: UpdateGamesSortDataModule (upval), p1 (upval), p5 (copy), p3 (upval), v14 (upval), p2 (upval), RetrievalStatus (upval)
			UpdateGamesSortDataModule(p1, p5, Result.responseBody, p3)
			p5:dispatch(v14(p2.name, RetrievalStatus.Done))
		end, function(p6)
			-- upvalues: p5 (copy), v14 (upval), p2 (upval), RetrievalStatus (upval), PromiseModule (upval)
			p5:dispatch(v14(p2.name, RetrievalStatus.Failed))
			
			return PromiseModule.reject(p6)
		end)
	end
end