local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorGroupsModule = require(parent.DataHydration.CreatorGroups)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local getMyCreationsFilterStoreModule = require(buildExperience.Stores.GetMyCreationsFilterStore)
local matchesSearchQueryModule = require(buildExperience.utils.matchesSearchQuery)
local useClosableFocusRootModule = require(buildExperience.utils.useClosableFocusRoot)
local _ = require(script.Parent.MyCreationsFilterView)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local t = { games = "MyGames" }
local list = { "All", "MyGames", "GroupGames" }

local function _(p1)
	return string.format("rbxthumb://type=GroupIcon&id=%d&w=150&h=150", p1)
end

return function(p1)
	-- upvalues: getMyCreationsFilterStoreModule (ref), creatorGroupsModule (ref), reactModule (ref), useSignalState (ref), useLocalization (ref), localizationStringsModule (ref), useClosableFocusRootModule (ref), focusNavigableSurfaceIdentifierEnum (ref), list (ref), t (ref), matchesSearchQueryModule (ref)
	local filterStore = p1.filterStore or getMyCreationsFilterStoreModule()
	local var1 = filterStore.useFilter()
	local creatorGroupsStore = p1.creatorGroupsStore or creatorGroupsModule.getCreatorGroupsStore()
	local var2 = useSignalState(reactModule.useMemo(function()
		-- upvalues: creatorGroupsStore (ref)
		return creatorGroupsStore.getAndFetchGroups("Build")
	end, { creatorGroupsStore }).data)
	local var3 = useLocalization({
		all = localizationStringsModule.MY_CREATIONS_FILTER_ALL,
		allGames = localizationStringsModule.MY_CREATIONS_FILTER_ALL_GAMES,
		apply = localizationStringsModule.MY_CREATIONS_FILTER_APPLY,
		games = localizationStringsModule.MY_CREATIONS_FILTER_GAMES,
		groupGames = localizationStringsModule.MY_CREATIONS_FILTER_GROUP_GAMES,
		groups = localizationStringsModule.MY_CREATIONS_FILTER_GROUPS,
		myGames = localizationStringsModule.MY_CREATIONS_FILTER_MY_GAMES,
		reset = localizationStringsModule.MY_CREATIONS_FILTER_RESET,
		searchGroups = localizationStringsModule.MY_CREATIONS_FILTER_SEARCH_GROUPS,
		title = localizationStringsModule.MY_CREATIONS_FILTER_TITLE
	})
	local all = var3.all
	local allGames = var3.allGames
	local groupGames = var3.groupGames
	local myGames = var3.myGames
	local var4, var5 = reactModule.useState(var1)
	local var6, var7 = reactModule.useState("")
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), filterStore (ref), var7 (ref), var9 (ref)
		var5(filterStore.getFilter())
		var7("")
		var9(true)
	end, { filterStore })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(false)
	end, {})
	local var12 = useClosableFocusRootModule({
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		isOpen = var8,
		onClose = var11
	})
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: list (copy), var5 (ref)
		if table.find(list, p2) then
			var5(function(p3)
				-- upvalues: p2 (ref)
				return {
					games = p2,
					groupId = if p2 == "GroupGames" then p3.groupId else nil
				}
			end)
		end
	end, {})
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		var5(function(p3)
			-- upvalues: p2 (ref)
			return {
				games = "GroupGames",
				groupId = if p3.groupId == p2 then nil else p2
			}
		end)
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: filterStore (ref), var4 (ref), var9 (ref)
		filterStore.setFilter(var4)
		var9(false)
	end, { var4, filterStore })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), t (copy), var7 (ref)
		var5(t)
		var7("")
	end, {})
	local var17 = reactModule.useMemo(function()
		-- upvalues: all (ref), myGames (ref), groupGames (ref)
		return {
			{ value = "All", label = all },
			{ value = "MyGames", label = myGames },
			{ value = "GroupGames", label = groupGames }
		}
	end, { all, groupGames, myGames })
	local groupId = var4.groupId
	local var18 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), matchesSearchQueryModule (copy), var6 (ref), groupId (ref), var14 (ref)
		local t = {}
		
		if var2 == nil then
			return t
		end
		for i, v in var2.groups do
			if matchesSearchQueryModule(v.name, var6) then
				table.insert(t, {
					id = v.id,
					name = v.name,
					icon = string.format("rbxthumb://type=GroupIcon&id=%d&w=150&h=150", v.id),
					isSelected = v.id == groupId,
					onActivated = function()
						-- upvalues: var14 (copy), v (ref)
						var14(v.id)
					end
				})
			end
		end
		return t
	end, { var6, var2, var14, groupId })
	local name = nil
	
	if var1.games == "GroupGames" and var1.groupId ~= nil and var2 ~= nil then
		for i, v in var2.groups do
			if v.id == var1.groupId then
				name = v.name
				break
			end
		end
	end
	return {
		LayoutOrder = p1.LayoutOrder,
		label = if name ~= nil then if var1.games == "MyGames" then myGames elseif var1.games == "GroupGames" then groupGames else allGames else name,
		onOpenSheet = var10,
		isSheetOpen = var8,
		onSheetClosed = var11,
		focusRootRef = var12,
		titleText = var3.title,
		gamesLegend = var3.games,
		gamesOptions = var17,
		selectedGames = var4.games,
		onGamesChanged = var13,
		isGroupsVisible = var4.games == "GroupGames" and (var2 ~= nil and #var2.groups > 0),
		groupsLegend = var3.groups,
		groupSearchText = var6,
		groupSearchPlaceholder = var3.searchGroups,
		onGroupSearchTextChanged = var7,
		groups = var18,
		applyText = var3.apply,
		resetText = var3.reset,
		onApply = var15,
		onReset = var16,
		testId = p1.testId
	}
end