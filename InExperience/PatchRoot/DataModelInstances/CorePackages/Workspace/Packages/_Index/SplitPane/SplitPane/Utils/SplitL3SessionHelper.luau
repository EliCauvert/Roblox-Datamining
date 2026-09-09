local splitPane = script:FindFirstAncestor("SplitPane")
local parent = splitPane.Parent
local appSplitViewModule = require(parent.AppSplitView)
local navigationRoduxModule = require(parent.NavigationRodux)
local sessionType = require(parent.RobloxAppSessionization).SessionType
local signalsModule = require(parent.Signals)
local sessionTypeModule = require(splitPane.SessionType)
local splitL3StoreModule = require(splitPane.Stores.SplitL3Store)
local splitPaneStoreModule = require(splitPane.Stores.SplitPaneStore)
local appPage = require(parent.RobloxAppEnums).AppPage
local splitPaneSlot = appSplitViewModule.Enums.SplitPaneSlot
local tempRnSwitchNavigatorName = navigationRoduxModule.Constants.TempRnSwitchNavigatorName

local function routeHasSupportAboveContent(p1, p2)
	-- upvalues: splitPaneSlot (ref)
	if p2 == nil then
		return false
	end
	local var1 = false
	
	for i = #p1, 1, -1 do
		local name = p2[p1[i].name]
		
		if name == splitPaneSlot.Support then
			var1 = true
		elseif not var1 or name ~= splitPaneSlot.Content then
			continue
		end
		return true
	end
	return false
end

local function createResolveEligibility(p3)
	-- upvalues: tempRnSwitchNavigatorName (ref)
	return if p3 == nil then nil else function(p4)
		-- upvalues: p3 (ref), tempRnSwitchNavigatorName (copy)
		local t = { state = { routeName = p4 } }
		local ok, status = pcall(function()
			-- upvalues: p3 (copy), t (ref)
			return p3.getScreenOptions(t, {})
		end)
		
		if ok and status ~= nil and status.splitPaneEligibility ~= nil then
			return status.splitPaneEligibility
		end
		local var2 = if p3.childRouters then p3.childRouters[tempRnSwitchNavigatorName] else nil
		
		if var2 ~= nil then
			local ok_1, status_1 = pcall(function()
				-- upvalues: var2 (ref), t (ref)
				return var2.getScreenOptions(t, {})
			end)
			local var3 = status_1
			
			return if ok_1 and var3 ~= nil and var3.splitPaneEligibility ~= nil then var3.splitPaneEligibility else nil
		end
	end
end

local var2 = nil

local function getLevel2RouteAndExclusions(p3, p4)
	-- upvalues: routeHasSupportAboveContent (ref), var2 (write), splitPaneSlot (ref)
	if not routeHasSupportAboveContent(p3, p4) then
		var2 = nil
		
		return p3, nil
	end
	local t = {}
	local t_1 = {}
	local var3 = false
	local var4 = var2 == nil
	local var5 = var2 or {}
	
	for i, v in p3 do
		local name = p4[v.name]
		
		if name == splitPaneSlot.Support then
			var3 = true
			t_1[v.name] = true
			
			if not var4 and var5[v.name] == nil then
				var4 = true
			end
		elseif name == splitPaneSlot.Content or not var3 then
			table.insert(t, v)
		else
			t_1[v.name] = true
			
			if not var4 and var5[v.name] == nil then
				var4 = true
			end
		end
	end
	if not var4 then
		for i_1 in var5 do
			if t_1[i_1] == nil then
				var4 = true
				break
			end
		end
	end
	if var4 then
		var2 = t_1
	end
	return t, var2
end

local function _(p5)
	-- upvalues: appPage (ref)
	return if p5 == nil then false else appPage[p5] ~= nil
end

local function resolveL3Page(p5, p6)
	-- upvalues: splitPaneSlot (ref), appPage (ref)
	local var6 = nil
	
	for i = #p5, 1, -1 do
		local var7 = p5[i]
		local name = p6[var7.name]
		
		if name == splitPaneSlot.Content then
			continue
		end
		if name ~= splitPaneSlot.Support then
			if var6 == nil then
				local name_1 = var7.name
				
				if not (if name_1 == nil then false else appPage[name_1] ~= nil) then
					var6 = var7
				end
			end
		end
		if var6 == nil then
			return var7, var7
		end
		return var6, var7
	end
	return nil, nil
end

local _ = function(p7, p8)
	-- upvalues: resolveL3Page (ref), sessionTypeModule (ref)
	local var8 = resolveL3Page(p7, p8)
	
	return if var8 == nil then nil else sessionTypeModule.Tag.SplitSubPane[var8.name] or var8.name
end

local _ = function(p7, p8)
	-- upvalues: resolveL3Page (ref)
	local var8, var9 = resolveL3Page(p7, p8)
	
	return if var8 == nil then nil elseif var8.detail == nil then if var9 == nil then nil else var9.detail else var8.detail
end

local function getIsSplitL3Enabled(p7)
	-- upvalues: splitPaneStoreModule (ref)
	return splitPaneStoreModule.getStore().getIsBreakpointEnabled(p7)
end

local function resolveEligibilityMap(p7, p8)
	local t = {}
	
	for i = #p7, 1, -1 do
		local var8 = p7[i]
		
		if p8 ~= nil then
			local var9 = p8(var8.name)
			
			if var9 ~= nil then
				t[var8.name] = var9
			end
		end
	end
	return t
end

return {
	createGetL2Exclusions = function(p9)
		-- upvalues: tempRnSwitchNavigatorName (ref), splitPaneStoreModule (ref), resolveEligibilityMap (ref), getLevel2RouteAndExclusions (ref)
		local var10 = if p9 == nil then nil else function(p10)
			-- upvalues: p9 (ref), tempRnSwitchNavigatorName (copy)
			local t = { state = { routeName = p10 } }
			local ok, status = pcall(function()
				-- upvalues: p9 (copy), t (ref)
				return p9.getScreenOptions(t, {})
			end)
			
			if ok and status ~= nil and status.splitPaneEligibility ~= nil then
				return status.splitPaneEligibility
			end
			local var11 = if p9.childRouters then p9.childRouters[tempRnSwitchNavigatorName] else nil
			
			if var11 ~= nil then
				local ok_1, status_1 = pcall(function()
					-- upvalues: var11 (ref), t (ref)
					return var11.getScreenOptions(t, {})
				end)
				
				return if ok_1 and status_1 ~= nil and status_1.splitPaneEligibility ~= nil then status_1.splitPaneEligibility else nil
			end
		end
		
		return function(p10, p11)
			-- upvalues: splitPaneStoreModule (copy), resolveEligibilityMap (copy), var10 (ref), getLevel2RouteAndExclusions (copy)
			if splitPaneStoreModule.getStore().getIsBreakpointEnabled(p10) and p11 ~= nil then
				local _, var11 = getLevel2RouteAndExclusions(p11, resolveEligibilityMap(p11, var10))
				
				return var11
			end
			return nil
		end
	end,
	createResolveEligibility = createResolveEligibility,
	subscribeToRouteSignal = function(value, p9)
		-- upvalues: splitL3StoreModule (ref), resolveEligibilityMap (ref), routeHasSupportAboveContent (ref), resolveL3Page (ref), sessionTypeModule (ref), getIsSplitL3Enabled (ref), signalsModule (ref), splitPaneStoreModule (ref)
		local var10 = nil
		local store = splitL3StoreModule.getStore()
		
		local function handleRouteChange(p10, p11)
			-- upvalues: p9 (ref), store (ref), resolveEligibilityMap (copy), routeHasSupportAboveContent (copy), resolveL3Page (copy), sessionTypeModule (copy)
			if not p11 or p9 == nil then
				store.setPendingSplitSubPaneTag(nil)
				store.setPendingSplitSubPaneDetail(nil)
				
				return
			end
			local var11
			local var12 = resolveEligibilityMap(p10, p9)
			local var13 = routeHasSupportAboveContent(p10, var12)
			local setPendingSplitSubPaneTag = store.setPendingSplitSubPaneTag
			
			if var13 then
				local var14 = resolveL3Page(p10, var12)
				var11 = if var14 == nil then nil else sessionTypeModule.Tag.SplitSubPane[var14.name] or var14.name
			else
				var11 = nil
			end
			local var15
			setPendingSplitSubPaneTag(var11)
			local setPendingSplitSubPaneDetail = store.setPendingSplitSubPaneDetail
			
			if var13 then
				local var16, var17 = resolveL3Page(p10, var12)
				var15 = if var16 == nil then nil elseif var16.detail ~= nil then if var17 ~= nil then nil else var17.detail else var16.detail
			else
				var15 = nil
			end
			setPendingSplitSubPaneDetail(var15)
		end
		
		local var11 = value(function(p10)
			-- upvalues: var10 (write), handleRouteChange (ref), getIsSplitL3Enabled (copy)
			var10 = p10
			handleRouteChange(p10, getIsSplitL3Enabled(false))
		end)
		local var12 = signalsModule.createEffect(function(p10)
			-- upvalues: splitPaneStoreModule (copy), var10 (write), handleRouteChange (ref)
			local isBreakpointEnabled = splitPaneStoreModule.getStore().getIsBreakpointEnabled(p10)
			
			if var10 ~= nil then
				handleRouteChange(var10, isBreakpointEnabled)
			end
		end)
		
		return function()
			-- upvalues: var11 (ref), var12 (ref)
			if var11 ~= nil and var11.disconnect ~= nil then
				var11:disconnect()
			end
			var12()
		end
	end,
	onSessionsUpdated = function()
		-- upvalues: splitPaneStoreModule (ref), splitL3StoreModule (ref)
		if splitPaneStoreModule.getStore().getIsBreakpointEnabled(false) then
			local store = splitL3StoreModule.getStore()
			store.setSplitL2SessionVersion(store.getSplitL2SessionVersion(false) + 1)
			
			return
		end
	end,
	applySplitSubPaneSession = function(p9, p10, ...)
		-- upvalues: splitPaneStoreModule (ref), splitL3StoreModule (ref), sessionType (ref), sessionTypeModule (ref)
		local var10 = select("#", ...) > 0
		local var11 = if var10 then ... else nil
		
		if not splitPaneStoreModule.getStore().getIsBreakpointEnabled(false) then
			p10 = nil
			var10 = true
			var11 = nil
		end
		local store = splitL3StoreModule.getStore()
		local splitL3AppliedDetail = store.getSplitL3AppliedDetail(false)
		local level2b = sessionType.StructuralIdentifier.Level2b
		local splitSubPane = sessionTypeModule.StructuralIdentifier.SplitSubPane
		local var12 = p9:SessionExists(splitSubPane)
		local var13 = if var12 then p9:GetSessionTag(splitSubPane) else nil
		
		local function _()
			-- upvalues: var10 (write), store (ref), var11 (write)
			if var10 then
				store.setSplitL3AppliedDetail(var11)
				
				return
			end
			store.setSplitL3AppliedDetail(nil)
		end
		
		if p10 == nil then
			if var12 then
				p9:RemoveSession(splitSubPane)
			end
			store.setSplitL3AppliedDetail(nil)
			
			return
		elseif not p9:SessionExists(level2b) then return end
		local var14 = var10 and splitL3AppliedDetail ~= var11
		
		if not p9:SessionExists(splitSubPane) then
			p9:SetSession(level2b, splitSubPane, p10)
			
			if var10 then
				store.setSplitL3AppliedDetail(var11)
			else
				store.setSplitL3AppliedDetail(nil)
			end
		elseif var13 ~= p10 or var14 then
			p9:ReplaceSession(splitSubPane, p10)
			
			if var10 then
				store.setSplitL3AppliedDetail(var11)
			else
				store.setSplitL3AppliedDetail(nil)
			end
		end
	end
}