local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCoreSystem)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local DataHydrationModule = require(Parent.DataHydration)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local GroupSidebarContextModule = require(Groups.Contexts.GroupSidebarContext)
local ConstantsModule = require(Groups.Common.constants)
local GetGroupSduiPageConfigFunction = require(Groups.Common.getGroupSduiPageConfig).getGroupSduiPageConfig
local FetchGroupSduiPageModule = require(Groups.Common.fetchGroupSduiPage)

local function _(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return p1 ~= nil and os.clock() - p1 < ConstantsModule.SIDEBAR_STALE_TIME_SEC
end

local function noRefreshes(): number
	return 0
end

return function(p1, GroupId)
	-- upvalues: UseGroupsWrapperContextModule (copy), ReactModule (copy), GroupSidebarContextModule (copy), GetGroupSduiPageConfigFunction (copy), SduiSharedUtilitiesModule (copy), SignalsReactModule (copy), FetchGroupSduiPageModule (copy), ConstantsModule (copy), noRefreshes (copy), DataHydrationModule (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseContextResult = ReactModule.useContext(GroupSidebarContextModule)
	local ConfigKey = p1.configKey
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetGroupSduiPageConfigFunction (upval), UseGroupsWrapperContextModuleResult (copy), GroupId (copy)
		return GetGroupSduiPageConfigFunction("sidebarSection", UseGroupsWrapperContextModuleResult.userId, GroupId)
	end, { UseGroupsWrapperContextModuleResult.userId, GroupId })
	local ConfigKey1 = if UseMemoResult then UseMemoResult.configKey else ""
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: ConfigKey (copy), SduiSharedUtilitiesModule (upval), GroupId (copy)
		if ConfigKey then
			local SduiApiStore = SduiSharedUtilitiesModule.getSduiApiStore()
			SduiApiStore.getData(ConfigKey).data(p2)
			local GroupSidebarSectionInputData = SduiApiStore.getInputData(ConfigKey, "groupSidebarSection", p2)
			
			return if GroupSidebarSectionInputData and GroupSidebarSectionInputData.group_id == GroupId then SduiApiStore.getRootConfig(ConfigKey, p2, `{ConfigKey}_groupSidebarSection`) else nil
		else
			return nil
		end
	end, { ConfigKey, GroupId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseResult)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: SduiSharedUtilitiesModule (upval), ConfigKey1 (copy)
		return SduiSharedUtilitiesModule.getSduiApiStore().getRootConfig(ConfigKey1, p2, nil)
	end, { ConfigKey1 })))
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: ConfigKey (copy), UseResult (copy), SduiSharedUtilitiesModule (upval)
		return if ConfigKey and UseResult(p2) ~= nil then SduiSharedUtilitiesModule.getSduiApiStore().getDataUpdatedTimestamp(ConfigKey, p2, `{ConfigKey}_groupSidebarSection`) else nil
	end, { ConfigKey, UseResult })
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseResult1 (copy), SduiSharedUtilitiesModule (upval), ConfigKey1 (copy)
		local UseResultResult = UseResult1(p2)
		local DataUpdatedTimestamp = SduiSharedUtilitiesModule.getSduiApiStore().getDataUpdatedTimestamp(ConfigKey1, p2, nil)
		
		return UseResultResult ~= nil and (DataUpdatedTimestamp == nil or DataUpdatedTimestamp < UseResultResult)
	end, { UseResult1, ConfigKey1 })))
	local UseRefResult = ReactModule.useRef(0)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: SduiSharedUtilitiesModule (upval), ConfigKey1 (copy)
		return SduiSharedUtilitiesModule.getSduiApiStore().getData(ConfigKey1).status(p2)
	end, { ConfigKey1 })))
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult (copy), SduiSharedUtilitiesModule (upval), FetchGroupSduiPageModule (upval), ConstantsModule (upval)
		if UseMemoResult then
			local LoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(UseMemoResult.surfaceKey)
			LoadTimer.start(if p2 then "refresh" else "mount")
			local GroupSduiPageModule = FetchGroupSduiPageModule(UseMemoResult, LoadTimer, p2, ConstantsModule.SIDEBAR_STALE_TIME_SEC)
			
			if p2 then
				GroupSduiPageModule:finally(LoadTimer.logRefreshComplete)
				
				return
			end
			GroupSduiPageModule:andThen(LoadTimer.logComponentReady, function() end)
		end
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), SduiSharedUtilitiesModule (upval), ConfigKey (copy), UseResult (copy), ConstantsModule (upval), UseResult2 (copy)
		if not UseMemoResult then return end
		UseRefResult.current = os.clock()
		local SduiApiStore = SduiSharedUtilitiesModule.getSduiApiStore()
		local DataUpdatedTimestamp = if ConfigKey then SduiApiStore.getDataUpdatedTimestamp(ConfigKey, false, `{ConfigKey}_groupSidebarSection`) else nil
		
		if UseResult(false) == nil or (DataUpdatedTimestamp == nil or os.clock() - DataUpdatedTimestamp >= ConstantsModule.SIDEBAR_STALE_TIME_SEC) then
			UseResult2(false)
			
			return
		end
	end, { UseMemoResult, UseResult2, UseResult, ConfigKey })
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(if UseContextResult then UseContextResult.sectionRefreshCount else noRefreshes)
	local UseRefResult1 = ReactModule.useRef(UseSignalStateResult4)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult4 (copy), UseRefResult1 (copy), UseResult1 (copy), UseRefResult (copy), UseResult2 (copy)
		if UseSignalStateResult4 ~= UseRefResult1.current then
			UseRefResult1.current = UseSignalStateResult4
			local UseResultResult = UseResult1(false)
			local IsCurrentBelow: boolean = UseResultResult ~= nil and UseRefResult.current < UseResultResult
			UseRefResult.current = os.clock()
			
			if not IsCurrentBelow then
				UseResult2(true)
			end
		end
	end, { UseSignalStateResult4, UseResult2, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult2 (copy)
		UseResult2(true)
	end, { UseResult2 })
	local UseSignalStateResult5 = if UseSignalStateResult2 and UseSignalStateResult then UseSignalStateResult else UseSignalStateResult1 or UseSignalStateResult
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseSignalStateResult5 then
		UseRefResult2.current = { groupId = GroupId, root = UseSignalStateResult5 }
	elseif UseSignalStateResult3 ~= DataHydrationModule.DataHydrationTypes.DataStatus.Ready and UseRefResult2.current and UseRefResult2.current.groupId == GroupId then
		UseSignalStateResult5 = UseRefResult2.current.root
	end
	return {
		root = UseSignalStateResult5,
		status = UseSignalStateResult3,
		retry = UseResult3
	}
end