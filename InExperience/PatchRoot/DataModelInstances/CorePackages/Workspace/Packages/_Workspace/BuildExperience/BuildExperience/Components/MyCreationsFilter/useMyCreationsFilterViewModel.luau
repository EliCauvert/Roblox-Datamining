local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorGroupsModule = require(Parent.DataHydration.CreatorGroups)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperiencePreviewsTabModule = require(BuildExperience.Flags.FFlagBuildExperiencePreviewsTab)
local GamesFilterModule = require(BuildExperience.Stores.GetMyCreationsFilterStore.GamesFilter)
local GetMyCreationsFilterStoreModule = require(BuildExperience.Stores.GetMyCreationsFilterStore)
local MatchesSearchQueryModule = require(BuildExperience.utils.matchesSearchQuery)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)
local _ = require(script.Parent.MyCreationsFilterView)
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local config = { games = "MyGames" }
local list = { "All", "MyGames", "GroupGames", "SharedGames" }

local function _(p1): string
	return string.format("rbxthumb://type=GroupIcon&id=%d&w=150&h=150", p1)
end

return function(Frame)
	-- upvalues: GetMyCreationsFilterStoreModule (copy), CreatorGroupsModule (copy), ReactModule (copy), UseSignalStateFunction (copy), config (copy), list (copy), FFlagBuildExperiencePreviewsTabModule (copy), LocalizationStringsModule (copy), UseLocalizationFunction (copy), UseClosableFocusRootModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), GamesFilterModule (copy), MatchesSearchQueryModule (copy)
	local FilterStore = Frame.filterStore or GetMyCreationsFilterStoreModule()
	local UseFilterResult = FilterStore.useFilter()
	local CreatorGroupsStore = Frame.creatorGroupsStore or CreatorGroupsModule.getCreatorGroupsStore()
	local UseSignalStateResult = UseSignalStateFunction(ReactModule.useMemo(function()
		-- upvalues: CreatorGroupsStore (copy)
		return (CreatorGroupsStore.getAndFetchGroups("Build"))
	end, { CreatorGroupsStore }).data)
	local Groups = if UseSignalStateResult == nil then nil else UseSignalStateResult.groups
	local DefaultFilter = config
	local List = list
	
	if FFlagBuildExperiencePreviewsTabModule then
		Groups = Frame.groups or Groups
		DefaultFilter = Frame.defaultFilter or DefaultFilter
		List = Frame.options or List
	end
	local UseLocalizationResult = UseLocalizationFunction({
		all = LocalizationStringsModule.MY_CREATIONS_FILTER_ALL,
		allGames = LocalizationStringsModule.MY_CREATIONS_FILTER_ALL_GAMES,
		apply = LocalizationStringsModule.MY_CREATIONS_FILTER_APPLY,
		games = LocalizationStringsModule.MY_CREATIONS_FILTER_GAMES,
		groupGames = LocalizationStringsModule.MY_CREATIONS_FILTER_GROUP_GAMES,
		groups = LocalizationStringsModule.MY_CREATIONS_FILTER_GROUPS,
		myGames = LocalizationStringsModule.MY_CREATIONS_FILTER_MY_GAMES,
		reset = LocalizationStringsModule.MY_CREATIONS_FILTER_RESET,
		searchGroups = LocalizationStringsModule.MY_CREATIONS_FILTER_SEARCH_GROUPS,
		sharedGames = LocalizationStringsModule.MY_CREATIONS_FILTER_SHARED_GAMES,
		title = LocalizationStringsModule.MY_CREATIONS_FILTER_TITLE
	})
	local All = UseLocalizationResult.all
	local AllGames = UseLocalizationResult.allGames
	local GroupGames = UseLocalizationResult.groupGames
	local MyGames = UseLocalizationResult.myGames
	local SharedGames = UseLocalizationResult.sharedGames
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseFilterResult)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), FilterStore (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2(FilterStore.getFilter())
		UseStateResult2_1("")
		UseStateResult2_2(true)
	end, { FilterStore })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseClosableFocusRootModuleResult = UseClosableFocusRootModule({
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isOpen = UseStateResult3,
		onClose = UseResult1
	})
	local UseResult2 = ReactModule.useCallback(function(Value)
		-- upvalues: List (ref), UseStateResult2 (copy)
		if table.find(List, Value) then
			UseStateResult2(function(p1)
				-- upvalues: Value (copy)
				return {
					games = Value,
					groupId = if Value == "GroupGames" then p1.groupId else nil
				}
			end)
		end
	end, { List })
	local UseResult3 = ReactModule.useCallback(function(GroupId)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1)
			-- upvalues: GroupId (copy)
			return {
				games = "GroupGames",
				groupId = if p1.groupId == GroupId then nil else GroupId
			}
		end)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FilterStore (copy), UseStateResult (copy), UseStateResult2_2 (copy)
		FilterStore.setFilter(UseStateResult)
		UseStateResult2_2(false)
	end, { UseStateResult, FilterStore })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), DefaultFilter (ref), UseStateResult2_1 (copy)
		UseStateResult2(DefaultFilter)
		UseStateResult2_1("")
	end, { DefaultFilter })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagBuildExperiencePreviewsTabModule (upval), GamesFilterModule (upval), All (copy), MyGames (copy), GroupGames (copy), SharedGames (copy), List (ref)
		if not FFlagBuildExperiencePreviewsTabModule then
			return {
				{ value = "All", label = All },
				{ value = "MyGames", label = MyGames },
				{ value = "GroupGames", label = GroupGames },
				{ value = "SharedGames", label = SharedGames }
			}
		end
		local config = {
			[GamesFilterModule.All] = All,
			[GamesFilterModule.MyGames] = MyGames,
			[GamesFilterModule.GroupGames] = GroupGames,
			[GamesFilterModule.SharedGames] = SharedGames
		}
		local List1 = {}
		
		for _, Value in List do
			table.insert(List1, { value = Value, label = config[Value] })
		end
		return List1
	end, {
		All,
		GroupGames,
		MyGames,
		SharedGames,
		List
	})
	local GroupId = UseStateResult.groupId
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Groups (ref), MatchesSearchQueryModule (upval), UseStateResult1 (copy), GroupId (copy), UseResult3 (copy)
		local List = {}
		
		if Groups == nil then
			return List
		end
		for _, group in Groups do
			if MatchesSearchQueryModule(group.name, UseStateResult1) then
				table.insert(List, {
					id = group.id,
					name = group.name,
					icon = string.format("rbxthumb://type=GroupIcon&id=%d&w=150&h=150", group.id),
					isSelected = group.id == GroupId,
					onActivated = function()
						-- upvalues: UseResult3 (upval), group (copy)
						UseResult3(group.id)
					end
				})
			end
		end
		return List
	end, { UseStateResult1, Groups, UseResult3, GroupId })
	local Name = nil
	
	if UseFilterResult.games == "GroupGames" and UseFilterResult.groupId ~= nil and Groups ~= nil then
		for _, group in Groups do
			if group.id == UseFilterResult.groupId then
				Name = group.name
				break
			end
		end
	end
	return {
		LayoutOrder = Frame.LayoutOrder,
		label = if Name == nil then if UseFilterResult.games == "MyGames" then MyGames elseif UseFilterResult.games == "GroupGames" then GroupGames elseif UseFilterResult.games == "SharedGames" then SharedGames else AllGames else Name,
		onOpenSheet = UseResult,
		isSheetOpen = UseStateResult3,
		onSheetClosed = UseResult1,
		focusRootRef = UseClosableFocusRootModuleResult,
		titleText = UseLocalizationResult.title,
		gamesLegend = UseLocalizationResult.games,
		gamesOptions = UseMemoResult,
		selectedGames = UseStateResult.games,
		onGamesChanged = UseResult2,
		isGroupsVisible = UseStateResult.games == "GroupGames" and (Groups ~= nil and #Groups > 0),
		groupsLegend = UseLocalizationResult.groups,
		groupSearchText = UseStateResult1,
		groupSearchPlaceholder = UseLocalizationResult.searchGroups,
		onGroupSearchTextChanged = UseStateResult2_1,
		groups = UseMemoResult1,
		applyText = UseLocalizationResult.apply,
		resetText = UseLocalizationResult.reset,
		onApply = UseResult4,
		onReset = UseResult5,
		testId = Frame.testId
	}
end