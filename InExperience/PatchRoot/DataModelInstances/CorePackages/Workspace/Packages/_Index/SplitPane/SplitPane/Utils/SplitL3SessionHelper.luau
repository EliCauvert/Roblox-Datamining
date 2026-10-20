local SplitPane = script:FindFirstAncestor("SplitPane")
local Parent = SplitPane.Parent
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local SignalsModule = require(Parent.Signals)
local SessionTypeModule = require(SplitPane.SessionType)
local SplitL3StoreModule = require(SplitPane.Stores.SplitL3Store)
local SplitPaneStoreModule = require(SplitPane.Stores.SplitPaneStore)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SplitPaneSlot = require(Parent.AppSplitView).Enums.SplitPaneSlot
local TempRnSwitchNavigatorName = require(Parent.NavigationRodux).Constants.TempRnSwitchNavigatorName

local function routeHasSupportAboveContent(p1, p2): boolean
	-- upvalues: SplitPaneSlot (copy)
	if p2 == nil then
		return false
	end
	local Flag = false
	
	for i = #p1, 1, -1 do
		local Content = p2[p1[i].name]
		
		if Content == SplitPaneSlot.Support then
			Flag = true
		elseif Flag and Content == SplitPaneSlot.Content then
			return true
		end
	end
	return false
end

local v1 = nil

local function getLevel2RouteAndExclusions(List, p3)
	-- upvalues: routeHasSupportAboveContent (copy), v1 (ref), SplitPaneSlot (copy)
	if not routeHasSupportAboveContent(List, p3) then
		v1 = nil
		
		return List, nil
	end
	local List1 = {}
	local t = {}
	local Flag = false
	local Flag1 = v1 == nil
	local V11 = v1 or {}
	for _, value in List do
		local Content = p3[value.name]
		
		if Content == SplitPaneSlot.Support then
			Flag = true
			t[value.name] = true
			
			if not Flag1 and V11[value.name] == nil then
				Flag1 = true
			end
		elseif Content == SplitPaneSlot.Content or not Flag then
			table.insert(List1, value)
		else
			t[value.name] = true
			
			if not Flag1 and V11[value.name] == nil then
				Flag1 = true
			end
		end
	end
	if not Flag1 then
		for i in V11 do
			if t[i] == nil then
				Flag1 = true
				break
			end
		end
	end
	if Flag1 then
		v1 = t
	end
	return List1, v1
end

local function _(p4): boolean
	-- upvalues: AppPage (copy)
	return p4 ~= nil and AppPage[p4] ~= nil
end

local function resolveL3Page(p4, p5)
	-- upvalues: SplitPaneSlot (copy), AppPage (copy)
	local v2 = nil
	local v3 = nil
	
	for i = #p4, 1, -1 do
		v3 = p4[i]
		local Content = p5[v3.name]
		
		if Content ~= SplitPaneSlot.Content then
			if Content == SplitPaneSlot.Support then
				if v2 == nil then
					return v3, v3
				else
					return v2, v3
				end
			end
			if v2 == nil then
				local Name = v3.name
				
				if Name == nil or AppPage[Name] == nil then
					v2 = v3
				end
			end
		end
	end
	return nil, nil
end

local _ = function(p6, p7)
	-- upvalues: resolveL3Page (copy), SessionTypeModule (copy)
	local ResolveL3PageResult = resolveL3Page(p6, p7)
	
	return if ResolveL3PageResult == nil then nil else SessionTypeModule.Tag.SplitSubPane[ResolveL3PageResult.name] or ResolveL3PageResult.name
end

local _ = function(p6, p7)
	-- upvalues: resolveL3Page (copy)
	local ResolveL3PageResult, ResolveL3PageResult2 = resolveL3Page(p6, p7)
	
	return if ResolveL3PageResult == nil then nil elseif ResolveL3PageResult.detail == nil then if ResolveL3PageResult2 == nil then nil else ResolveL3PageResult2.detail else ResolveL3PageResult.detail
end

local function getIsSplitL3Enabled(p6)
	-- upvalues: SplitPaneStoreModule (copy)
	return SplitPaneStoreModule.getStore().getIsBreakpointEnabled(p6)
end

local function resolveEligibilityMap(p6, Callback)
	local t = {}
	
	for i = #p6, 1, -1 do
		local v4 = p6[i]
		local NoCallback = Callback == nil
		local CallbackResult = nil
		
		if not NoCallback then
			CallbackResult = Callback(v4.name)
			NoCallback = CallbackResult == nil
		end
		if not NoCallback then
			t[v4.name] = CallbackResult
		end
	end
	return t
end

return {
	createGetL2Exclusions = function(p7)
		-- upvalues: TempRnSwitchNavigatorName (copy), SplitPaneStoreModule (copy), resolveEligibilityMap (copy), getLevel2RouteAndExclusions (copy)
		local v5 = if p7 == nil then nil else function(RouteName)
			-- upvalues: p7 (copy), TempRnSwitchNavigatorName (upval)
			local config = { state = { routeName = RouteName } }
			local Success, Result = pcall(function()
				-- upvalues: p7 (upval), config (copy)
				return p7.getScreenOptions(config, {})
			end)
			
			if Success and Result ~= nil and Result.splitPaneEligibility ~= nil then
				return Result.splitPaneEligibility
			end
			local ChildRouter = if p7.childRouters then p7.childRouters[TempRnSwitchNavigatorName] else nil
			
			if ChildRouter ~= nil then
				local Success1, Result1 = pcall(function()
					-- upvalues: ChildRouter (copy), config (copy)
					return ChildRouter.getScreenOptions(config, {})
				end)
				
				if Success1 and Result1 ~= nil and Result1.splitPaneEligibility ~= nil then
					return Result1.splitPaneEligibility
				end
			end
			return nil
		end
		
		return function(p8, p9)
			-- upvalues: SplitPaneStoreModule (upval), resolveEligibilityMap (upval), v5 (copy), getLevel2RouteAndExclusions (upval)
			if SplitPaneStoreModule.getStore().getIsBreakpointEnabled(p8) and p9 ~= nil then
				local _, Level2RouteAndExclusions2 = getLevel2RouteAndExclusions(p9, (resolveEligibilityMap(p9, v5)))
				
				return Level2RouteAndExclusions2
			else
				return nil
			end
		end
	end,
	createResolveEligibility = function(p7)
		-- upvalues: TempRnSwitchNavigatorName (copy)
		return if p7 == nil then nil else function(RouteName)
			-- upvalues: p7 (copy), TempRnSwitchNavigatorName (upval)
			local config = { state = { routeName = RouteName } }
			local Success, Result = pcall(function()
				-- upvalues: p7 (upval), config (copy)
				return p7.getScreenOptions(config, {})
			end)
			
			if Success and Result ~= nil and Result.splitPaneEligibility ~= nil then
				return Result.splitPaneEligibility
			end
			local ChildRouter = if p7.childRouters then p7.childRouters[TempRnSwitchNavigatorName] else nil
			
			if ChildRouter ~= nil then
				local Success1, Result1 = pcall(function()
					-- upvalues: ChildRouter (copy), config (copy)
					return ChildRouter.getScreenOptions(config, {})
				end)
				
				if Success1 and Result1 ~= nil and Result1.splitPaneEligibility ~= nil then
					return Result1.splitPaneEligibility
				end
			end
			return nil
		end
	end,
	subscribeToRouteSignal = function(Callback, p7)
		-- upvalues: SplitL3StoreModule (copy), resolveEligibilityMap (copy), routeHasSupportAboveContent (copy), resolveL3Page (copy), SessionTypeModule (copy), getIsSplitL3Enabled (copy), SignalsModule (copy), SplitPaneStoreModule (copy)
		local v5 = nil
		local Store = SplitL3StoreModule.getStore()
		
		local function handleRouteChange(p8, IsBreakpointEnabled)
			-- upvalues: p7 (copy), Store (copy), resolveEligibilityMap (upval), routeHasSupportAboveContent (upval), resolveL3Page (upval), SessionTypeModule (upval)
			if not IsBreakpointEnabled or p7 == nil then
				Store.setPendingSplitSubPaneTag(nil)
				Store.setPendingSplitSubPaneDetail(nil)
				
				return
			end
			local ResolveEligibilityMapResult = resolveEligibilityMap(p8, p7)
			local RouteHasSupportAboveContentResult = routeHasSupportAboveContent(p8, ResolveEligibilityMapResult)
			local SetPendingSplitSubPaneTagFunction: (any) -> () = Store.setPendingSplitSubPaneTag
			local SplitSubPaneEntry = nil
			
			if RouteHasSupportAboveContentResult then
				local ResolveL3PageResult = resolveL3Page(p8, ResolveEligibilityMapResult)
				SplitSubPaneEntry = if ResolveL3PageResult == nil then nil else SessionTypeModule.Tag.SplitSubPane[ResolveL3PageResult.name] or ResolveL3PageResult.name
			else
				SplitSubPaneEntry = nil
			end
			SetPendingSplitSubPaneTagFunction(SplitSubPaneEntry)
			local SetPendingSplitSubPaneDetailFunction: (any) -> () = Store.setPendingSplitSubPaneDetail
			local Detail = nil
			
			if RouteHasSupportAboveContentResult then
				local ResolveL3PageResult, ResolveL3PageResult2 = resolveL3Page(p8, ResolveEligibilityMapResult)
				Detail = if ResolveL3PageResult == nil then nil elseif ResolveL3PageResult.detail == nil then if ResolveL3PageResult2 == nil then nil else ResolveL3PageResult2.detail else ResolveL3PageResult.detail
			else
				Detail = nil
			end
			SetPendingSplitSubPaneDetailFunction(Detail)
		end
		
		local CallbackResult = Callback(function(p8)
			-- upvalues: v5 (ref), handleRouteChange (copy), getIsSplitL3Enabled (upval)
			v5 = p8
			handleRouteChange(p8, getIsSplitL3Enabled(false))
		end)
		local Effect = SignalsModule.createEffect(function(p8)
			-- upvalues: SplitPaneStoreModule (upval), v5 (ref), handleRouteChange (copy)
			local IsBreakpointEnabled = SplitPaneStoreModule.getStore().getIsBreakpointEnabled(p8)
			
			if v5 ~= nil then
				handleRouteChange(v5, IsBreakpointEnabled)
			end
		end)
		
		return function()
			-- upvalues: CallbackResult (copy), Effect (copy)
			if CallbackResult ~= nil and CallbackResult.disconnect ~= nil then
				CallbackResult:disconnect()
			end
			Effect()
		end
	end,
	onSessionsUpdated = function()
		-- upvalues: SplitPaneStoreModule (copy), SplitL3StoreModule (copy)
		if SplitPaneStoreModule.getStore().getIsBreakpointEnabled(false) then
			local Store = SplitL3StoreModule.getStore()
			Store.setSplitL2SessionVersion(Store.getSplitL2SessionVersion(false) + 1)
			
			return
		end
	end,
	applySplitSubPaneSession = function(SessionService, SessionTag, ...)
		-- upvalues: SplitPaneStoreModule (copy), SplitL3StoreModule (copy), SessionType (copy), SessionTypeModule (copy)
		local IsSelectedAbove = select("#", ...) > 0
		local SplitL3AppliedDetail = if IsSelectedAbove then (...) else nil
		
		if not SplitPaneStoreModule.getStore().getIsBreakpointEnabled(false) then
			SessionTag = nil
			IsSelectedAbove = true
			SplitL3AppliedDetail = nil
		end
		local Store = SplitL3StoreModule.getStore()
		local SplitL3AppliedDetail1 = Store.getSplitL3AppliedDetail(false)
		local Level2b = SessionType.StructuralIdentifier.Level2b
		local SplitSubPane = SessionTypeModule.StructuralIdentifier.SplitSubPane
		local SessionExistsResult = SessionService:SessionExists(SplitSubPane)
		local SessionTag1 = if SessionExistsResult then SessionService:GetSessionTag(SplitSubPane) else nil
		
		local function _()
			-- upvalues: IsSelectedAbove (ref), Store (copy), SplitL3AppliedDetail (ref)
			if IsSelectedAbove then
				Store.setSplitL3AppliedDetail(SplitL3AppliedDetail)
				
				return
			else
				Store.setSplitL3AppliedDetail(nil)
			end
		end
		
		if SessionTag == nil then
			if SessionExistsResult then
				SessionService:RemoveSession(SplitSubPane)
			end
			Store.setSplitL3AppliedDetail(nil)
			
			return
		elseif not SessionService:SessionExists(Level2b) then return end
		local IsNotSplitL3AppliedDetailMatch: boolean = IsSelectedAbove and SplitL3AppliedDetail1 ~= SplitL3AppliedDetail
		
		if not SessionService:SessionExists(SplitSubPane) then
			SessionService:SetSession(Level2b, SplitSubPane, SessionTag)
			
			if IsSelectedAbove then
				Store.setSplitL3AppliedDetail(SplitL3AppliedDetail)
			else
				Store.setSplitL3AppliedDetail(nil)
			end
		elseif SessionTag1 ~= SessionTag or IsNotSplitL3AppliedDetailMatch then
			SessionService:ReplaceSession(SplitSubPane, SessionTag)
			
			if IsSelectedAbove then
				Store.setSplitL3AppliedDetail(SplitL3AppliedDetail)
			else
				Store.setSplitL3AppliedDetail(nil)
			end
		end
	end
}