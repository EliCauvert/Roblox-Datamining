local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorGroupsModule = require(Parent.DataHydration.CreatorGroups)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local GetMyCreationsFilterStoreModule = require(BuildExperience.Stores.GetMyCreationsFilterStore)
local MatchesSearchQueryModule = require(BuildExperience.utils.matchesSearchQuery)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)
local _ = require(script.Parent.MyCreationsFilterView)
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local config = { games = "MyGames" }
local List = { "All", "MyGames", "GroupGames" }

local function _(p1): string --[[ Line: 38 | Named "getGroupIcon" ]]
	return string.format("rbxthumb://type=GroupIcon&id=%d&w=150&h=150", p1)
end

return function(Frame) --[[ Line: 42 | Named "useMyCreationsFilterViewModel" ]]
	-- upvalues: GetMyCreationsFilterStoreModule (copy), CreatorGroupsModule (copy), ReactModule (copy), UseSignalStateFunction (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseClosableFocusRootModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), List (copy), config (copy), MatchesSearchQueryModule (copy)
	local FilterStore = Frame.filterStore or GetMyCreationsFilterStoreModule()
	local UseFilterResult = FilterStore.useFilter()
	local CreatorGroupsStore = Frame.creatorGroupsStore or CreatorGroupsModule.getCreatorGroupsStore()
	local UseSignalStateResult = UseSignalStateFunction(ReactModule.useMemo(function() --[[ Line: 46 ]]
		-- upvalues: CreatorGroupsStore (copy)
		return (CreatorGroupsStore.getAndFetchGroups("Build"))
	end, { CreatorGroupsStore }).data)
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
		title = LocalizationStringsModule.MY_CREATIONS_FILTER_TITLE
	})
	local All = UseLocalizationResult.all
	local AllGames = UseLocalizationResult.allGames
	local GroupGames = UseLocalizationResult.groupGames
	local MyGames = UseLocalizationResult.myGames
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseFilterResult)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 71 ]]
		-- upvalues: UseStateResult2 (copy), FilterStore (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2(FilterStore.getFilter())
		UseStateResult2_1("")
		UseStateResult2_2(true)
	end, { FilterStore })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 77 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseClosableFocusRootModuleResult = UseClosableFocusRootModule({
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isOpen = UseStateResult3,
		onClose = UseResult1
	})
	local UseResult2 = ReactModule.useCallback(function(Value) --[[ Line: 87 ]]
		-- upvalues: List (upval), UseStateResult2 (copy)
		if table.find(List, Value) then
			UseStateResult2(function(p1) --[[ Line: 90 ]]
				-- upvalues: Value (copy)
				return {
					games = Value,
					groupId = if Value == "GroupGames" then p1.groupId else nil
				}
			end)
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(GroupId) --[[ Line: 99 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1) --[[ Line: 100 ]]
			-- upvalues: GroupId (copy)
			return {
				games = "GroupGames",
				groupId = if p1.groupId == GroupId then nil else GroupId
			}
		end)
	end, {})
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 108 ]]
		-- upvalues: FilterStore (copy), UseStateResult (copy), UseStateResult2_2 (copy)
		FilterStore.setFilter(UseStateResult)
		UseStateResult2_2(false)
	end, { UseStateResult, FilterStore })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 113 ]]
		-- upvalues: UseStateResult2 (copy), config (upval), UseStateResult2_1 (copy)
		UseStateResult2(config)
		UseStateResult2_1("")
	end, {})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 118 ]]
		-- upvalues: All (copy), MyGames (copy), GroupGames (copy)
		return {
			{ value = "All", label = All },
			{ value = "MyGames", label = MyGames },
			{ value = "GroupGames", label = GroupGames }
		}
	end, { All, GroupGames, MyGames })
	local GroupId = UseStateResult.groupId
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 127 ]]
		-- upvalues: UseSignalStateResult (copy), MatchesSearchQueryModule (upval), UseStateResult1 (copy), GroupId (copy), UseResult3 (copy)
		local List = {}
		
		if UseSignalStateResult == nil then
			return List
		end
		for _, group in UseSignalStateResult.groups do
			if MatchesSearchQueryModule(group.name, UseStateResult1) then
				table.insert(List, {
					id = group.id,
					name = group.name,
					icon = string.format("rbxthumb://type=GroupIcon&id=%d&w=150&h=150", group.id),
					isSelected = group.id == GroupId,
					onActivated = function() --[[ Line: 139 ]]
						-- upvalues: UseResult3 (upval), group (copy)
						UseResult3(group.id)
					end
				})
			end
		end
		return List
	end, {
		UseStateResult1,
		UseSignalStateResult,
		UseResult3,
		GroupId
	})
	local Name = nil
	
	if UseFilterResult.games == "GroupGames" and UseFilterResult.groupId ~= nil and UseSignalStateResult ~= nil then
		for _, group in UseSignalStateResult.groups do
			if group.id == UseFilterResult.groupId then
				Name = group.name
				break
			end
		end
	end
	return {
		LayoutOrder = Frame.LayoutOrder,
		label = if Name == nil then if UseFilterResult.games == "MyGames" then MyGames elseif UseFilterResult.games == "GroupGames" then GroupGames else AllGames else Name,
		onOpenSheet = UseResult,
		isSheetOpen = UseStateResult3,
		onSheetClosed = UseResult1,
		focusRootRef = UseClosableFocusRootModuleResult,
		titleText = UseLocalizationResult.title,
		gamesLegend = UseLocalizationResult.games,
		gamesOptions = UseMemoResult,
		selectedGames = UseStateResult.games,
		onGamesChanged = UseResult2,
		isGroupsVisible = UseStateResult.games == "GroupGames" and (UseSignalStateResult ~= nil and #UseSignalStateResult.groups > 0),
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