local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local DescriptionWithGroupIconModule = require(BuildExperience.utils.descriptionWithGroupIcon)
local GetGameDetailsNavigationModule = require(BuildExperience.utils.getGameDetailsNavigation)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(script.Parent.PreviewsTabView)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(script.Parent.usePreviewResults)
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local GetRootNavigationFunction = NavigationModule.getRootNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = NavigationModule.useNavigation

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseStoreFunction (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), SendBuildExperienceEventModule (copy), OpenGameDetailsFunction (copy), GetGameDetailsNavigationModule (copy), GetRootNavigationFunction (copy), DescriptionWithGroupIconModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseStoreResult = UseStoreFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		loadError = LocalizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		noGames = LocalizationStringsModule.MY_CREATIONS_NO_GAMES
	})
	local Results = p1.results
	local LoadMoreFunction = Results.loadMore
	local UseResult = ReactModule.useCallback(function(UniverseId)
		-- upvalues: SendBuildExperienceEventModule (upval), OpenGameDetailsFunction (upval), GetGameDetailsNavigationModule (upval), GetRootNavigationFunction (upval), UseNavigationResult (copy), UseStoreResult (copy)
		SendBuildExperienceEventModule("PREVIEW_CLICK", { universeId = UniverseId }, { context = "BuildPreviews" })
		OpenGameDetailsFunction(tostring(UniverseId), GetGameDetailsNavigationModule(GetRootNavigationFunction(UseNavigationResult)), { source = "BuildPreviews" })(UseStoreResult)
	end, { UseNavigationResult, UseStoreResult })
	
	return {
		rows = ReactModule.useMemo(function()
			-- upvalues: Results (copy), DescriptionWithGroupIconModule (upval), UseResult (copy)
			local Buffer = table.create(#Results.items)
			
			for _, item in Results.items do
				table.insert(Buffer, {
					universeId = item.universeId,
					title = item.experienceName,
					description = if item.isGroupGame then DescriptionWithGroupIconModule(nil, true, item.creatorName) else item.creatorName,
					gameIcon = item.gameIcon,
					onActivated = function()
						-- upvalues: UseResult (upval), item (copy)
						UseResult(item.universeId)
					end
				})
			end
			return Buffer
		end, { UseResult, Results.items }),
		listStatus = Results.status,
		loadError = UseLocalizationResult.loadError,
		isLoadingMore = Results.isLoadingMore,
		failedLoadMore = Results.failedLoadMore,
		refresh = Results.refresh,
		loadMoreIfNeeded = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: LoadMoreFunction (copy)
			local Y: number = ScrollFrame.AbsoluteCanvasSize.Y
			
			if ScrollFrame.CanvasPosition.Y <= 0 or Y <= 0 or ScrollFrame.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, Y - ScrollFrame.AbsoluteWindowSize.Y - 250) < ScrollFrame.CanvasPosition.Y then
				LoadMoreFunction()
			end
		end, { LoadMoreFunction }),
		retryLoadMore = LoadMoreFunction,
		emptyText = UseLocalizationResult.noGames
	}
end