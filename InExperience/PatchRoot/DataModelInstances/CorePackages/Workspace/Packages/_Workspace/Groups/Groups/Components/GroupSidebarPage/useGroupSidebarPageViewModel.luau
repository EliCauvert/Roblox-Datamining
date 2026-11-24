local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local NavigationModule = require(Parent.Navigation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local DisplayModule = require(Parent.Display)
local DataHydrationModule = require(Parent.DataHydration)
local FFlagEnableGroupOverviewPane = require(Parent.SharedFlags).FFlagEnableGroupOverviewPane
local FFlagDataHydrationStaleTime = require(Parent.SharedFlags).FFlagDataHydrationStaleTime
local ConstantsModule = require(Groups.Common.constants)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local UseIsCompactTouchModule = require(Groups.Hooks.useIsCompactTouch)
local UseOnChangeModule = require(Groups.Hooks.useOnChange)
local GroupSidebarContextModule = require(Groups.Contexts.GroupSidebarContext)
local GroupSidebarActionsModule = require(Groups.Navigation.groupSidebarActions)
local GroupDestinationsModule = require(Groups.Navigation.groupDestinations)
local GetGroupTabUrlModule = require(Groups.Common.getGroupTabUrl)
local GetGroupSduiPageConfigModule = require(Groups.Common.getGroupSduiPageConfig)
local GetGroupSduiPageConfigFunction = GetGroupSduiPageConfigModule.getGroupSduiPageConfig
local FetchGroupSduiPageModule = require(Groups.Common.fetchGroupSduiPage)
local RegisterOverviewPaneActionsModule = require(Groups.Common.registerOverviewPaneActions)
local GetSidebarEntryIdentifierModule = require(Groups.Common.getSidebarEntryIdentifier)
local SidebarChangeCountsModule = require(Groups.Common.sidebarChangeCounts)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(Groups.Common.TextKeys)
local GetGroupPostsUrlModule = require(Groups.Common.getGroupPostsUrl)
local GroupsRoutesModule = require(Groups.Navigation.GroupsRoutes)
local GetSidebarWidthModule = require(script.Parent.getSidebarWidth)
local _ = require(Groups.Stores.createGroupSidebarState)

local function requestFor(Tbl, UseContextResult, UseRefResult, SelectedGroupIdResult)
	-- upvalues: GetGroupSduiPageConfigModule (copy), SduiSharedUtilitiesModule (copy), GetSidebarEntryIdentifierModule (copy)
	local SelectedGroupIdResult1 = if GetGroupSduiPageConfigModule.isValidGroupId(SelectedGroupIdResult) then SelectedGroupIdResult else nil
	local GroupId = if Tbl.groupId and UseContextResult.isVisiting(Tbl.groupId, false) then Tbl.groupId else SelectedGroupIdResult1
	local InputData = SduiSharedUtilitiesModule.getSduiApiStore().getInputData(Tbl.configKey, GetSidebarEntryIdentifierModule(Tbl.configKey, false), false)
	
	if InputData and GroupId then
		local InitiallyExpandedGroupId = InputData.initially_expanded_group_id
		
		if InitiallyExpandedGroupId and InitiallyExpandedGroupId ~= GroupId and not UseContextResult.hasEntryExpansion and UseContextResult.expanded(false)[`group:{InitiallyExpandedGroupId}`] == nil then
			UseContextResult.setExpanded(`group:{InitiallyExpandedGroupId}`, true)
		end
	end
	UseRefResult.current = if InputData and SelectedGroupIdResult1 and (InputData.selected_group_id ~= SelectedGroupIdResult1 or UseRefResult.current == SelectedGroupIdResult1) then SelectedGroupIdResult1 else nil
	
	if GroupId == nil or GroupId == Tbl.groupId then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy.groupId = GroupId
		
		return Copy
	end
end

local Computed = SignalsModule.createComputed(function(p1)
	-- upvalues: GetSidebarWidthModule (copy), DisplayModule (copy)
	return GetSidebarWidthModule(DisplayModule.GetDisplayStore(p1).getViewportSize(p1).X)
end)
local Computed1 = SignalsModule.createComputed(function(p1)
	-- upvalues: DataHydrationModule (copy)
	return DataHydrationModule.Group.getGroupInfoStore(p1).membershipChangeCount(p1)
end)
local Signal = SignalsModule.createSignal(0)
local _ = require(script.Parent.GroupSidebarPageView)

local function fetchRefresh(p1)
	-- upvalues: SduiSharedUtilitiesModule (copy), FetchGroupSduiPageModule (copy)
	local LoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(p1.surfaceKey)
	LoadTimer.start("refresh")
	local GroupSduiPageModule = FetchGroupSduiPageModule(p1, LoadTimer, true)
	GroupSduiPageModule:finally(LoadTimer.logRefreshComplete)
	
	return GroupSduiPageModule
end

local function sendCounted(ConfigKey, Callback, p1)
	-- upvalues: SidebarChangeCountsModule (copy)
	local CountForRequestResult = SidebarChangeCountsModule.countForRequest(ConfigKey)
	
	return Callback(p1):andThen(function()
		-- upvalues: SidebarChangeCountsModule (upval), ConfigKey (copy), CountForRequestResult (copy)
		SidebarChangeCountsModule.markFetched(ConfigKey, CountForRequestResult)
	end, function() end), CountForRequestResult == nil
end

return function()
	-- upvalues: UseGroupsWrapperContextModule (copy), NavigationModule (copy), ReactModule (copy), GroupSidebarContextModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseIsCompactTouchModule (copy), SignalsReactModule (copy), Computed (copy), FFlagEnableGroupOverviewPane (copy), GetGroupSduiPageConfigFunction (copy), SduiSharedUtilitiesModule (copy), SignalsModule (copy), GetSidebarEntryIdentifierModule (copy), requestFor (copy), SidebarChangeCountsModule (copy), RegisterOverviewPaneActionsModule (copy), sendCounted (copy), FetchGroupSduiPageModule (copy), FFlagDataHydrationStaleTime (copy), ConstantsModule (copy), GetGroupPostsUrlModule (copy), GroupDestinationsModule (copy), GetGroupTabUrlModule (copy), GroupsRoutesModule (copy), GroupSidebarActionsModule (copy), fetchRefresh (copy), Signal (copy), UseOnChangeModule (copy), Computed1 (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseNavigationResult = NavigationModule.useNavigation()
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
		-- upvalues: SduiSharedUtilitiesModule (upval), UseMemoResult (copy), GetSidebarEntryIdentifierModule (upval), UseContextResult (copy), UseGroupsWrapperContextModuleResult (copy), requestFor (upval), UseRefResult (copy), SidebarChangeCountsModule (upval), NoUseIsCompactTouchModuleResult (copy), RegisterOverviewPaneActionsModule (upval), sendCounted (upval), FetchGroupSduiPageModule (upval), UseMemoResult1 (copy), FFlagDataHydrationStaleTime (upval), ConstantsModule (upval), UseRefResult1 (copy)
		local InputData = SduiSharedUtilitiesModule.getSduiApiStore().getInputData(UseMemoResult.configKey, GetSidebarEntryIdentifierModule(UseMemoResult.configKey, false), false)
		local RequestForResult = requestFor(UseMemoResult, UseContextResult, UseRefResult, UseContextResult.selectedGroupId(false) or (if UseGroupsWrapperContextModuleResult.expandedBranch then UseGroupsWrapperContextModuleResult.groupId else InputData and InputData.selected_group_id))
		local IsOutdated = SidebarChangeCountsModule.isOutdated(UseMemoResult.configKey)
		
		if NoUseIsCompactTouchModuleResult then
			RegisterOverviewPaneActionsModule()
		end
		local Flag = false
		sendCounted(UseMemoResult.configKey, function(p1)
			-- upvalues: FetchGroupSduiPageModule (upval), UseMemoResult1 (upval), IsOutdated (copy), FFlagDataHydrationStaleTime (upval), ConstantsModule (upval)
			return FetchGroupSduiPageModule(p1, UseMemoResult1, IsOutdated or not FFlagDataHydrationStaleTime, if FFlagDataHydrationStaleTime then ConstantsModule.SIDEBAR_STALE_TIME_SEC else nil)
		end, RequestForResult):finally(function()
			-- upvalues: Flag (ref), IsOutdated (copy), UseContextResult (upval)
			Flag = true
			
			if IsOutdated then
				UseContextResult.refreshSections()
			end
		end)
		UseRefResult1.current = if Flag then nil else InputData
	end, {
		UseMemoResult, UseMemoResult1, UseContextResult,
		UseGroupsWrapperContextModuleResult.expandedBranch,
		UseGroupsWrapperContextModuleResult.groupId, NoUseIsCompactTouchModuleResult
	})
	local GroupId = if UseGroupsWrapperContextModuleResult.expandedBranch then UseGroupsWrapperContextModuleResult.groupId else SelectedGroupId
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult2 (copy), UseSignalStateResult1 (copy), isListed (copy), UseRefResult1 (copy), UseContextResult (copy), NoUseIsCompactTouchModuleResult (copy), GroupId (copy)
		if UseSignalStateResult2 and UseSignalStateResult1 and not isListed(UseSignalStateResult1) then
			if UseSignalStateResult2 ~= UseRefResult1.current then
				UseContextResult.selectGroup(nil)
				
				return
			end
		elseif NoUseIsCompactTouchModuleResult and not UseSignalStateResult1 and isListed(GroupId) then
			UseContextResult.selectGroup(GroupId)
		end
	end, {
		UseSignalStateResult2,
		UseSignalStateResult1,
		GroupId,
		NoUseIsCompactTouchModuleResult,
		UseContextResult
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseGroupsWrapperContextModuleResult (copy), UseNavigationResult (copy)
		if UseGroupsWrapperContextModuleResult.navigateTo.previousView then
			UseGroupsWrapperContextModuleResult.navigateTo.previousView()
			
			return
		else
			UseNavigationResult.goBack()
		end
	end, {
		UseGroupsWrapperContextModuleResult.navigateTo.previousView,
		UseNavigationResult
	})
	local UseResult1 = ReactModule.useCallback(function(GroupId, Source, p1, p2)
		-- upvalues: isListed (copy), UseGroupsWrapperContextModuleResult (copy), GetGroupPostsUrlModule (upval), UseContextResult (copy), GroupDestinationsModule (upval), GetGroupTabUrlModule (upval), UseIsCompactTouchModuleResult (copy), FFlagEnableGroupOverviewPane (upval), UseNavigationResult (copy), GroupsRoutesModule (upval)
		if not GroupId or not isListed(GroupId) then return end
		if p2 then
			UseGroupsWrapperContextModuleResult.navigateTo.webView(GetGroupPostsUrlModule(GroupId, p2))
			
			return
		end
		local GroupName: string = `group:{GroupId}`
		
		if not p1 and UseContextResult.expanded(false)[GroupName] ~= true then
			UseContextResult.setExpanded(GroupName, true)
		end
		local GroupDestinationsModuleEntry = if p1 then GroupDestinationsModule[p1] else nil
		
		if GroupDestinationsModuleEntry then
			UseGroupsWrapperContextModuleResult.navigateTo.webView(GetGroupTabUrlModule(GroupId, GroupDestinationsModuleEntry.webTab))
			
			return
		end
		UseContextResult.selectGroup(GroupId)
		
		if UseIsCompactTouchModuleResult and FFlagEnableGroupOverviewPane then
			UseNavigationResult.navigate(GroupsRoutesModule.GroupOverviewPane, { groupId = GroupId, source = Source })
			
			return
		end
		if not FFlagEnableGroupOverviewPane then
			UseGroupsWrapperContextModuleResult.navigateTo.groupDetails(GroupId)
		end
	end, {
		UseContextResult, UseIsCompactTouchModuleResult, UseNavigationResult,
		UseGroupsWrapperContextModuleResult.navigateTo.groupDetails,
		UseGroupsWrapperContextModuleResult.navigateTo.webView, UseSignalStateResult2
	})
	local UseRefResult2 = ReactModule.useRef(UseResult1)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseResult1 (copy)
		UseRefResult2.current = UseResult1
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: GroupSidebarActionsModule (upval), UseMemoResult (copy), UseRefResult2 (copy)
		return GroupSidebarActionsModule.register(UseMemoResult.configKey, function(p1, p2, p3, p4)
			-- upvalues: UseRefResult2 (upval)
			UseRefResult2.current(p1, p2, p3, p4)
		end)
	end, { UseMemoResult.configKey })
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: requestFor (upval), UseMemoResult (copy), UseContextResult (copy), UseRefResult (copy), sendCounted (upval), fetchRefresh (upval), UseRefResult3 (copy), SidebarChangeCountsModule (upval)
		local SendCountedResult, SendCountedResult2 = sendCounted(UseMemoResult.configKey, fetchRefresh, (requestFor(UseMemoResult, UseContextResult, UseRefResult, UseContextResult.selectedGroupId(false))))
		SendCountedResult:finally(function()
			-- upvalues: UseContextResult (upval), SendCountedResult2 (copy), UseRefResult3 (upval), SidebarChangeCountsModule (upval), UseMemoResult (upval)
			UseContextResult.refreshSections()
			
			if SendCountedResult2 then
				task.defer(function()
					-- upvalues: UseRefResult3 (upval), SidebarChangeCountsModule (upval), UseMemoResult (upval)
					local CurrentFunction: () -> () = UseRefResult3.current
					
					if CurrentFunction and SidebarChangeCountsModule.isOutdated(UseMemoResult.configKey) then
						CurrentFunction()
					end
				end)
			end
		end)
	end, { UseMemoResult, UseContextResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), UseResult2 (copy)
		UseRefResult3.current = UseResult2
		
		return function()
			-- upvalues: UseRefResult3 (upval)
			UseRefResult3.current = nil
		end
	end, { UseResult2 })
	UseOnChangeModule(SignalsReactModule.useSignalState(UseGroupsWrapperContextModuleResult.getReturnCount or Signal), UseResult2)
	UseOnChangeModule(SignalsReactModule.useSignalState(Computed1), UseResult2)
	local SelectedGroupId1 = if UseRefResult.current == nil or UseRefResult.current ~= UseSignalStateResult1 then SelectedGroupId else nil
	local UseSignalStateResult3 = if isListed(UseSignalStateResult1) then UseSignalStateResult1 else SelectedGroupId
	
	return {
		configKey = UseMemoResult.configKey,
		pageTimer = UseMemoResult1,
		routeName = UseRouteNameResult,
		showOverview = NoUseIsCompactTouchModuleResult,
		isCompactTouch = UseIsCompactTouchModuleResult,
		sidebarWidth = UseSignalStateResult,
		selectedId = UseSignalStateResult3,
		isOverviewEmbedded = UseSignalStateResult3 ~= nil and UseSignalStateResult3 == SelectedGroupId1,
		refresh = UseResult2,
		onClose = UseResult,
		title = UseLocalizationResult.title,
		createLabel = UseLocalizationResult.create,
		canCreate = not UseSignalStateResult2 or UseSignalStateResult2.can_create_group == nil or UseSignalStateResult2.can_create_group,
		onCreate = UseGroupsWrapperContextModuleResult.navigateTo.createGroup
	}
end