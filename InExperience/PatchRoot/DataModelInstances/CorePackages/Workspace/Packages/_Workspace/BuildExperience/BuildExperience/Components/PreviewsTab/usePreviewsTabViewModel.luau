local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local GameDetailModule = require(Parent.GameDetail)
local LocalizationModule = require(Parent.Localization)
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(Parent.DataHydration.CreatorAgentChat)
local DescriptionWithGroupIconModule = require(BuildExperience.utils.descriptionWithGroupIcon)
local FFlagBuildExperienceUnreadServiceModule = require(BuildExperience.Flags.FFlagBuildExperienceUnreadService)
local FFlagBuildUpdatedSearchUXForGAModule = require(BuildExperience.Flags.FFlagBuildUpdatedSearchUXForGA)
local GetGameDetailsNavigationModule = require(BuildExperience.utils.getGameDetailsNavigation)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.PreviewsTabView)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(script.Parent.usePreviewResults)
local OpenGameDetailsFunction = GameDetailModule.OpenGameDetails
local GetRootNavigationFunction = NavigationModule.getRootNavigation
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseNavigationFunction = NavigationModule.useNavigation

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseStoreFunction (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildUpdatedSearchUXForGAModule (copy), ReactModule (copy), SendBuildExperienceEventModule (copy), OpenGameDetailsFunction (copy), GetGameDetailsNavigationModule (copy), GetRootNavigationFunction (copy), FFlagBuildExperienceUnreadServiceModule (copy), DescriptionWithGroupIconModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseStoreResult = UseStoreFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		loadError = LocalizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		noGames = LocalizationStringsModule.MY_CREATIONS_NO_GAMES,
		noSearchResults = if FFlagBuildUpdatedSearchUXForGAModule then LocalizationStringsModule.LIBRARY_SEARCH_EMPTY else nil
	})
	local Results = p1.results
	local LoadMoreFunction = Results.loadMore
	local UseResult = ReactModule.useCallback(function(UniverseId)
		-- upvalues: SendBuildExperienceEventModule (upval), OpenGameDetailsFunction (upval), GetGameDetailsNavigationModule (upval), GetRootNavigationFunction (upval), UseNavigationResult (copy), UseStoreResult (copy)
		SendBuildExperienceEventModule("PREVIEW_CLICK", { universeId = UniverseId }, { context = "BuildPreviews" })
		OpenGameDetailsFunction(tostring(UniverseId), GetGameDetailsNavigationModule(GetRootNavigationFunction(UseNavigationResult)), { source = "BuildPreviews" })(UseStoreResult)
	end, { UseNavigationResult, UseStoreResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagBuildExperienceUnreadServiceModule (upval), p1 (copy), Results (copy), DescriptionWithGroupIconModule (upval), UseResult (copy)
		local v1 = nil
		
		if FFlagBuildExperienceUnreadServiceModule and p1.unreadEntries ~= nil then
			local t = {}
			
			for _, unreadEntry in p1.unreadEntries do
				t[unreadEntry.universeId] = true
			end
			v1 = t
		end
		local Buffer = table.create(#Results.items)
		
		for _, item in Results.items do
			table.insert(Buffer, {
				universeId = item.universeId,
				title = item.experienceName,
				description = if item.isGroupGame then DescriptionWithGroupIconModule(nil, true, item.creatorName) else item.creatorName,
				gameIcon = item.gameIcon,
				hasUnseenAttention = if v1 == nil then nil else v1[tostring(item.universeId)] == true,
				onActivated = function()
					-- upvalues: UseResult (upval), item (copy)
					UseResult(item.universeId)
				end
			})
		end
		return Buffer
	end, if FFlagBuildExperienceUnreadServiceModule then { UseResult, Results.items, p1.unreadEntries or false } else { UseResult, Results.items })
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: LoadMoreFunction (copy)
		local Y: number = ScrollFrame.AbsoluteCanvasSize.Y
		
		if ScrollFrame.CanvasPosition.Y <= 0 or Y <= 0 or ScrollFrame.AbsoluteWindowSize.Y <= 0 then return end
		if math.max(0, Y - ScrollFrame.AbsoluteWindowSize.Y - 250) < ScrollFrame.CanvasPosition.Y then
			LoadMoreFunction()
		end
	end, { LoadMoreFunction })
	local Refresh = Results.refresh
	
	if FFlagBuildExperienceUnreadServiceModule then
		local RefreshUnreadFunction = p1.refreshUnread
		Refresh = ReactModule.useCallback(function()
			-- upvalues: RefreshUnreadFunction (copy), Results (copy)
			if RefreshUnreadFunction ~= nil then
				RefreshUnreadFunction()
			end
			return Results.refresh()
		end, { Results.refresh, RefreshUnreadFunction or false })
	end
	return {
		rows = UseMemoResult,
		listStatus = Results.status,
		loadError = UseLocalizationResult.loadError,
		isLoadingMore = Results.isLoadingMore,
		failedLoadMore = Results.failedLoadMore,
		refresh = Refresh,
		loadMoreIfNeeded = UseResult1,
		retryLoadMore = LoadMoreFunction,
		emptyText = if FFlagBuildUpdatedSearchUXForGAModule and Results.query ~= "" then UseLocalizationResult.noSearchResults else UseLocalizationResult.noGames
	}
end