local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local NavigationModule = require(Parent.Navigation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local DisplayModule = require(Parent.Display)
local FFlagEnableGroupOverviewPane = require(Parent.SharedFlags).FFlagEnableGroupOverviewPane
local FFlagDataHydrationStaleTime = require(Parent.SharedFlags).FFlagDataHydrationStaleTime
local ConstantsModule = require(Groups.Common.constants)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local UseIsCompactTouchModule = require(Groups.Hooks.useIsCompactTouch)
local GroupSidebarContextModule = require(Groups.Contexts.GroupSidebarContext)
local GetGroupSduiPageConfigModule = require(Groups.Common.getGroupSduiPageConfig)
local GetGroupSduiPageConfigFunction = GetGroupSduiPageConfigModule.getGroupSduiPageConfig
local FetchGroupSduiPageModule = require(Groups.Common.fetchGroupSduiPage)
local GetSidebarEntryIdentifierModule = require(Groups.Common.getSidebarEntryIdentifier)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(Groups.Common.TextKeys)
local GetSidebarWidthModule = require(script.Parent.getSidebarWidth)
local _ = require(Groups.Stores.createGroupSidebarState)

local function requestFor(Tbl, UseContextResult, UseRefResult, SelectedGroupIdResult)
	-- upvalues: GetGroupSduiPageConfigModule (copy), SduiSharedUtilitiesModule (copy), GetSidebarEntryIdentifierModule (copy)
	local SelectedGroupIdResult1 = if GetGroupSduiPageConfigModule.isValidGroupId(SelectedGroupIdResult) then SelectedGroupIdResult else nil
	local InputData = SduiSharedUtilitiesModule.getSduiApiStore().getInputData(Tbl.configKey, GetSidebarEntryIdentifierModule(Tbl.configKey, false), false)
	
	if InputData and SelectedGroupIdResult1 then
		local InitiallyExpandedGroupId = InputData.initially_expanded_group_id
		
		if InitiallyExpandedGroupId and InitiallyExpandedGroupId ~= SelectedGroupIdResult1 and not UseContextResult.hasEntryExpansion and UseContextResult.expanded(false)[`group:{InitiallyExpandedGroupId}`] == nil then
			UseContextResult.setExpanded(`group:{InitiallyExpandedGroupId}`, true)
		end
	end
	UseRefResult.current = if InputData and SelectedGroupIdResult1 and (InputData.selected_group_id ~= SelectedGroupIdResult1 or UseRefResult.current == SelectedGroupIdResult1) then SelectedGroupIdResult1 else nil
	
	if SelectedGroupIdResult1 == nil or SelectedGroupIdResult1 == Tbl.groupId then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy.groupId = SelectedGroupIdResult1
		
		return Copy
	end
end

local Computed = SignalsModule.createComputed(function(p1)
	-- upvalues: GetSidebarWidthModule (copy), DisplayModule (copy)
	return GetSidebarWidthModule(DisplayModule.GetDisplayStore(p1).getViewportSize(p1).X)
end)
local _ = require(script.Parent.GroupSidebarPageView)

local function _(p1)
	-- upvalues: SduiSharedUtilitiesModule (copy), FetchGroupSduiPageModule (copy)
	local LoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(p1.surfaceKey)
	LoadTimer.start("refresh")
	
	return FetchGroupSduiPageModule(p1, LoadTimer, true):finally(LoadTimer.logRefreshComplete)
end

return function()
	-- upvalues: UseGroupsWrapperContextModule (copy), NavigationModule (copy), ReactModule (copy), GroupSidebarContextModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseIsCompactTouchModule (copy), SignalsReactModule (copy), Computed (copy), FFlagEnableGroupOverviewPane (copy), GetGroupSduiPageConfigFunction (copy), SduiSharedUtilitiesModule (copy), SignalsModule (copy), GetSidebarEntryIdentifierModule (copy), requestFor (copy), FetchGroupSduiPageModule (copy), FFlagDataHydrationStaleTime (copy), ConstantsModule (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseRouteNameResult = NavigationModule.useRouteName()
	local UseContextResult = ReactModule.useContext(GroupSidebarContextModule)
	assert(UseContextResult, "Community sidebar requires its page provider")
	local UseLocalizationResult = UseLocalizationFunction({
		title = TextKeysModule.HeadingGroups,
		create = TextKeysModule.ActionCreateGroup
	})
	local UseIsCompactTouchModuleResult = UseIsCompactTouchModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Computed)
	local NoUseIsCompactTouchModuleResult: boolean = FFlagEnableGroupOverviewPane and not UseIsCompactTouchModuleResult
	local Expanded: string = if NoUseIsCompactTouchModuleResult then "expanded" else "compactTouch"
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetGroupSduiPageConfigFunction (upval), UseGroupsWrapperContextModuleResult (copy), Expanded (copy)
		return GetGroupSduiPageConfigFunction("sidebar", UseGroupsWrapperContextModuleResult.userId, UseGroupsWrapperContextModuleResult.groupId, Expanded) or GetGroupSduiPageConfigFunction("sidebar", UseGroupsWrapperContextModuleResult.userId, nil, Expanded)
	end, {
		UseGroupsWrapperContextModuleResult.userId,
		UseGroupsWrapperContextModuleResult.groupId,
		Expanded
	})
	assert(UseMemoResult, "Invalid initial community selection")
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SduiSharedUtilitiesModule (upval), UseMemoResult (copy)
		local LoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(UseMemoResult.surfaceKey)
		LoadTimer.start("mount")
		
		return LoadTimer
	end, { UseMemoResult })
	SduiSharedUtilitiesModule.usePageScopeRef(UseMemoResult.configKey)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseContextResult.selectedGroupId)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), SduiSharedUtilitiesModule (upval), UseMemoResult (copy), GetSidebarEntryIdentifierModule (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: SduiSharedUtilitiesModule (upval), UseMemoResult (upval), GetSidebarEntryIdentifierModule (upval)
			local SduiApiStore = SduiSharedUtilitiesModule.getSduiApiStore()
			SduiApiStore.getData(UseMemoResult.configKey).data(p1)
			
			return SduiApiStore.getInputData(UseMemoResult.configKey, GetSidebarEntryIdentifierModule(UseMemoResult.configKey, p1), p1)
		end)
	end, { UseMemoResult })))
	local SelectedGroupId = UseSignalStateResult2 and UseSignalStateResult2.selected_group_id
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult2 (copy)
		local GroupIds = {}
		local VisitingGroups = if UseSignalStateResult2 and UseSignalStateResult2.visiting_groups then UseSignalStateResult2.visiting_groups else {}
		for _, visitingGroup in VisitingGroups do
			table.insert(GroupIds, visitingGroup.group_id)
		end
		return GroupIds
	end, { UseSignalStateResult2 })
	
	local function isListed(Value): boolean
		-- upvalues: UseMemoResult2 (copy), UseSignalStateResult2 (copy)
		if Value == nil then
			return false
		end
		if table.find(UseMemoResult2, Value) then
			return true
		end
		local Groups = if UseSignalStateResult2 then UseSignalStateResult2.groups else {}
		for _, group in Groups do
			if group.group_id == Value then
				return true
			end
		end
		return false
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), UseMemoResult2 (copy)
		UseContextResult.setVisitingGroups(UseMemoResult2)
	end, { UseContextResult, UseMemoResult2 })
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: SduiSharedUtilitiesModule (upval), UseMemoResult (copy), GetSidebarEntryIdentifierModule (upval), UseContextResult (copy), requestFor (upval), UseRefResult (copy), FetchGroupSduiPageModule (upval), UseMemoResult1 (copy), FFlagDataHydrationStaleTime (upval), ConstantsModule (upval), UseRefResult1 (copy)
		local InputData = SduiSharedUtilitiesModule.getSduiApiStore().getInputData(UseMemoResult.configKey, GetSidebarEntryIdentifierModule(UseMemoResult.configKey, false), false)
		local RequestForResult = requestFor(UseMemoResult, UseContextResult, UseRefResult, UseContextResult.selectedGroupId(false) or InputData and InputData.selected_group_id)
		local Flag = false
		FetchGroupSduiPageModule(RequestForResult, UseMemoResult1, not FFlagDataHydrationStaleTime, if FFlagDataHydrationStaleTime then ConstantsModule.SIDEBAR_STALE_TIME_SEC else nil):finally(function()
			-- upvalues: Flag (ref)
			Flag = true
		end)
		UseRefResult1.current = if Flag then nil else InputData
	end, { UseMemoResult, UseMemoResult1, UseContextResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult2 (copy), UseSignalStateResult1 (copy), isListed (copy), UseRefResult1 (copy), UseContextResult (copy), NoUseIsCompactTouchModuleResult (copy), SelectedGroupId (copy)
		if UseSignalStateResult2 and UseSignalStateResult1 and not isListed(UseSignalStateResult1) then
			if UseSignalStateResult2 ~= UseRefResult1.current then
				UseContextResult.selectGroup(nil)
				
				return
			end
		elseif NoUseIsCompactTouchModuleResult and not UseSignalStateResult1 and isListed(SelectedGroupId) then
			UseContextResult.selectGroup(SelectedGroupId)
		end
	end, {
		UseSignalStateResult2,
		UseSignalStateResult1,
		SelectedGroupId,
		NoUseIsCompactTouchModuleResult,
		UseContextResult
	})
	local SelectedGroupId1 = if UseRefResult.current == nil or UseRefResult.current ~= UseSignalStateResult1 then SelectedGroupId else nil
	local UseSignalStateResult3 = if isListed(UseSignalStateResult1) then UseSignalStateResult1 else SelectedGroupId
	
	return {
		configKey = UseMemoResult.configKey,
		pageTimer = UseMemoResult1,
		routeName = UseRouteNameResult,
		showOverview = NoUseIsCompactTouchModuleResult,
		sidebarWidth = UseSignalStateResult,
		selectedId = UseSignalStateResult3,
		isOverviewEmbedded = UseSignalStateResult3 ~= nil and UseSignalStateResult3 == SelectedGroupId1,
		refresh = ReactModule.useCallback(function()
			-- upvalues: requestFor (upval), UseMemoResult (copy), UseContextResult (copy), UseRefResult (copy), SduiSharedUtilitiesModule (upval), FetchGroupSduiPageModule (upval)
			local RequestForResult = requestFor(UseMemoResult, UseContextResult, UseRefResult, UseContextResult.selectedGroupId(false))
			local LoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(RequestForResult.surfaceKey)
			LoadTimer.start("refresh")
			FetchGroupSduiPageModule(RequestForResult, LoadTimer, true):finally(LoadTimer.logRefreshComplete):finally(UseContextResult.refreshSections)
		end, { UseMemoResult, UseContextResult }),
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseGroupsWrapperContextModuleResult (copy)
			if UseGroupsWrapperContextModuleResult.navigateTo.previousView then
				UseGroupsWrapperContextModuleResult.navigateTo.previousView()
			end
		end, {
			UseGroupsWrapperContextModuleResult.navigateTo.previousView
		}),
		title = UseLocalizationResult.title,
		createLabel = UseLocalizationResult.create,
		canCreate = not UseSignalStateResult2 or UseSignalStateResult2.can_create_group == nil or UseSignalStateResult2.can_create_group,
		onCreate = UseGroupsWrapperContextModuleResult.navigateTo.createGroup
	}
end