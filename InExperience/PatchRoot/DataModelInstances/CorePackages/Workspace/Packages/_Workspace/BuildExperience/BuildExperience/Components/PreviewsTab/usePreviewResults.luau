local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local Players = game:GetService("Players")
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CreatorGroupsModule = require(Parent.DataHydration.CreatorGroups)
local UniverseSearchModule = require(Parent.DataHydration.UniverseSearch)
local FFlagBuildUpdatedSearchUXForGAModule = require(BuildExperience.Flags.FFlagBuildUpdatedSearchUXForGA)
local GamesFilterModule = require(BuildExperience.Stores.GetMyCreationsFilterStore.GamesFilter)
local _ = require(BuildExperience.Stores.GetMyCreationsFilterStore)
local GetSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local ThumbForUniverseIdModule = require(BuildExperience.utils.thumbForUniverseId)
local UseActiveTabQueryModule = require(BuildExperience.utils.useActiveTabQuery)
local UseCursorSearchPagesModule = require(BuildExperience.utils.useCursorSearchPages)
local DataStatus = DataHydrationModule.DataStatus
local UseSignalStateFunction = SignalsReactModule.useSignalState
local config = { games = GamesFilterModule.All }
local PreviewGroups = {}
local t = {}

local function toPreviewItem(p1)
	-- upvalues: ThumbForUniverseIdModule (copy)
	return {
		universeId = p1.id,
		experienceName = p1.name or "",
		creatorName = if typeof(p1.creatorName) == "string" and p1.creatorName ~= "" then p1.creatorName else nil,
		gameIcon = ThumbForUniverseIdModule(p1.id),
		isGroupGame = p1.creatorType == "Group"
	}
end

local function createSource(Creators, p1)
	-- upvalues: FFlagBuildUpdatedSearchUXForGAModule (copy)
	local Buffer = table.create(#Creators)
	
	for i, creator in Creators do
		Buffer[i] = `{creator.creatorType}:{creator.creatorTargetId}`
	end
	local Joined = table.concat(Buffer, ",")
	
	return {
		key = if FFlagBuildUpdatedSearchUXForGAModule then `{p1}\0{Joined}` else Joined,
		params = {
			surface = "BuildPreview",
			isArchived = false,
			sortParam = "LastUpdated",
			sortOrder = "Desc",
			pageSize = 15,
			creators = Creators,
			search = if FFlagBuildUpdatedSearchUXForGAModule and p1 ~= "" then p1 else nil
		}
	}
end

local function ignorePromiseRejection() end

local function usePreviewSources(CreatorGroupsStore, CreatorTargetId, Filter, p2)
	-- upvalues: ReactModule (copy), UseSignalStateFunction (copy), GamesFilterModule (copy), PreviewGroups (copy), DataStatus (copy), createSource (copy), FFlagBuildUpdatedSearchUXForGAModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreatorGroupsStore (copy)
		return (CreatorGroupsStore.getAndFetchGroups("BuildPreview"))
	end, { CreatorGroupsStore })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.data)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult.status)
	local Games = Filter.games
	local GroupId = Filter.groupId
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), Games (copy), GamesFilterModule (upval), PreviewGroups (upval), UseSignalStateResult1 (copy), DataStatus (upval), GroupId (copy), createSource (upval), FFlagBuildUpdatedSearchUXForGAModule (upval), p2 (copy), CreatorTargetId (copy)
		if UseSignalStateResult == nil and Games ~= GamesFilterModule.SharedGames then
			return {
				sources = nil,
				previewGroups = PreviewGroups,
				status = if UseSignalStateResult1 == DataStatus.Failed then DataStatus.Failed else DataStatus.NotReady
			}
		end
		local PreviewGroups1 = if UseSignalStateResult == nil then PreviewGroups else UseSignalStateResult.groups
		local v1 = false
		
		for _, value in PreviewGroups1 do
			v1 = v1 or value.id == GroupId
		end
		local List = {}
		
		if Games ~= GamesFilterModule.SharedGames then
			local Creators = {}
			
			for _, value1 in PreviewGroups1 do
				if not v1 or Games ~= GamesFilterModule.GroupGames or value1.id == GroupId then
					table.insert(Creators, { creatorType = "Group", creatorTargetId = value1.id })
				end
			end
			if #Creators > 0 then
				table.insert(List, (createSource(Creators, if FFlagBuildUpdatedSearchUXForGAModule then p2 else nil)))
			end
		end
		if Games ~= GamesFilterModule.GroupGames then
			table.insert(List, (createSource({
				{ creatorType = "Team", creatorTargetId = CreatorTargetId }
			}, if FFlagBuildUpdatedSearchUXForGAModule then p2 else nil)))
		end
		return {
			sources = List,
			previewGroups = PreviewGroups1,
			status = DataStatus.Ready
		}
	end, {
		Games, GroupId, UseSignalStateResult, UseSignalStateResult1, CreatorTargetId,
		if FFlagBuildUpdatedSearchUXForGAModule then p2 else nil
	}))
end

return function(p3)
	-- upvalues: UniverseSearchModule (copy), CreatorGroupsModule (copy), Players (copy), FFlagBuildUpdatedSearchUXForGAModule (copy), UseActiveTabQueryModule (copy), GetSearchQueryStoreModule (copy), config (copy), usePreviewSources (copy), UseCursorSearchPagesModule (copy), ReactModule (copy), GamesFilterModule (copy), ignorePromiseRejection (copy), t (copy), toPreviewItem (copy)
	local SearchStore = p3.searchStore or UniverseSearchModule.getUniverseSearchStore()
	local CreatorGroupsStore = p3.creatorGroupsStore or CreatorGroupsModule.getCreatorGroupsStore()
	local IsIsFocused = p3.isFocused ~= false
	local UseActiveTabQueryModuleResult = if FFlagBuildUpdatedSearchUXForGAModule then UseActiveTabQueryModule(p3.searchQueryStore or GetSearchQueryStoreModule(), IsIsFocused and p3.isActiveTab ~= false) else nil
	local Filter = p3.filter or config
	local UsePreviewSourcesResult = usePreviewSources(CreatorGroupsStore, p3.userId or (if Players.LocalPlayer then Players.LocalPlayer.UserId else 0), Filter, if FFlagBuildUpdatedSearchUXForGAModule then UseActiveTabQueryModuleResult else nil)
	local UseCursorSearchPagesModuleResult = UseCursorSearchPagesModule({
		searchStore = SearchStore,
		sources = UsePreviewSourcesResult.sources
	})
	local RefreshFunction = UseCursorSearchPagesModuleResult.refresh
	local Games = Filter.games
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Games (copy), GamesFilterModule (upval), CreatorGroupsStore (copy), RefreshFunction (copy)
		if Games ~= GamesFilterModule.SharedGames then
			CreatorGroupsStore.fetchGroups("BuildPreview")
		end
		return RefreshFunction()
	end, { CreatorGroupsStore, Games, RefreshFunction })
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), IsIsFocused (copy), UseResult (copy), ignorePromiseRejection (upval)
		local Current = UseRefResult.current
		UseRefResult.current = IsIsFocused
		
		if IsIsFocused and not Current then
			UseResult():catch(ignorePromiseRejection)
		end
	end, { IsIsFocused, UseResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseCursorSearchPagesModuleResult (copy), t (upval), toPreviewItem (upval)
		if #UseCursorSearchPagesModuleResult.items == 0 then
			return t
		end
		local Buffer = table.create(#UseCursorSearchPagesModuleResult.items)
		
		for _, item in UseCursorSearchPagesModuleResult.items do
			table.insert(Buffer, (toPreviewItem(item)))
		end
		return Buffer
	end, { UseCursorSearchPagesModuleResult.items })
	
	return {
		items = UseMemoResult,
		status = if UsePreviewSourcesResult.sources == nil then UsePreviewSourcesResult.status else UseCursorSearchPagesModuleResult.status,
		query = if FFlagBuildUpdatedSearchUXForGAModule then UseActiveTabQueryModuleResult else nil,
		hasPreviews = #UseMemoResult > 0,
		previewGroups = UsePreviewSourcesResult.previewGroups,
		isLoadingMore = UseCursorSearchPagesModuleResult.isLoadingMore,
		failedLoadMore = UseCursorSearchPagesModuleResult.failedLoadMore,
		refresh = UseResult,
		loadMore = UseCursorSearchPagesModuleResult.loadMore
	}
end