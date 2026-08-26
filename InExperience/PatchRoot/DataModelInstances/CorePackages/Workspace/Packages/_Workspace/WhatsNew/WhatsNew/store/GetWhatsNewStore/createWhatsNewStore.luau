local _DateTime = DateTime
local whatsNew = script:FindFirstAncestor("WhatsNew")
local parent = whatsNew.Parent
local enumsModule = require(whatsNew.Enums)
local entryStorageModule = require(whatsNew.storage.EntryStorage)
local signalsModule = require(parent.Signals)
local _ = require(whatsNew.Types)
local whatsNewTelemetryModule = require(whatsNew.telemetry.WhatsNewTelemetry)
local loadWhatsNewRegistryModule = require(whatsNew.registry.LoadWhatsNewRegistry)
local _ = require(whatsNew.registry.ScopeActions)

local function createIdleState(p1)
	-- upvalues: enumsModule (ref)
	return {
		activeTourType = nil,
		globalTotalSteps = 0,
		globalStepIndex = nil,
		currentScopeTour = nil,
		currentEntry = nil,
		currentTipIndex = 0,
		screenScopeId = p1,
		scopeStack = {},
		surface = enumsModule.WhatsNewSurface.Idle
	}
end

local function _(p1)
	-- upvalues: entryStorageModule (ref)
	local var1 = entryStorageModule.getEntries()[p1]
	
	return var1 ~= nil and var1.seen ~= nil
end

local _ = function(p1)
	-- upvalues: entryStorageModule (ref)
	local toShow = p1.toShow
	
	if toShow then
		local id = entryStorageModule.getEntries()[p1.id]
		toShow = not (id ~= nil and id.seen ~= nil)
	end
	return toShow
end

local _ = function(p1)
	-- upvalues: entryStorageModule (ref)
	local var1 = 0
	
	for i, v in p1.tourTips do
		local toShow = v.toShow
		
		if toShow then
			local id = entryStorageModule.getEntries()[v.id]
			toShow = not (id ~= nil and id.seen ~= nil)
		end
		if toShow then
			var1 += v.stepCount
		end
	end
	return var1
end

local _ = function(p2)
	-- upvalues: entryStorageModule (ref)
	for i, v in p2.tourTips do
		local toShow = v.toShow
		
		if toShow then
			local id = entryStorageModule.getEntries()[v.id]
			toShow = not (id ~= nil and id.seen ~= nil)
		end
		if toShow then
			return true
		end
	end
	return false
end

local _ = function(p3)
	-- upvalues: entryStorageModule (ref)
	for i, v in p3.tourTips do
		local toShow = v.toShow
		
		if toShow then
			local id = entryStorageModule.getEntries()[v.id]
			toShow = not (id ~= nil and id.seen ~= nil)
		end
		if toShow then
			return i
		end
	end
	return nil
end

local _ = function(p4, p5)
	for i = p5, #p4.tourTips do
		if not p4.tourTips[i].toShow then
			continue
		end
		return i
	end
	return nil
end

local _ = function(p6, p7)
	for i = p7, 1, -1 do
		if not p6.tourTips[i].toShow then
			continue
		end
		return i
	end
	return nil
end

local function findGatewayTipByOpenActionKey(p8, p9)
	-- upvalues: findGatewayTipByOpenActionKey (ref)
	for i, v in p8.tourTips do
		local gateway = v.gateway
		
		if gateway == nil or gateway.openActionKey ~= p9 then
			if gateway ~= nil then
				local var2 = findGatewayTipByOpenActionKey(gateway.scope, p9)
				
				if var2 ~= nil then
					return var2
				end
			end
		end
		return v
	end
	return nil
end

local function findCloseActionKeyForScope(p10, p11)
	-- upvalues: findCloseActionKeyForScope (ref)
	for i, v in p10.tourTips do
		local gateway = v.gateway
		
		if gateway ~= nil then
			if gateway.scope.id ~= p11 then
				local var3 = findCloseActionKeyForScope(gateway.scope, p11)
				
				if var3 ~= nil then
					return var3
				end
			end
			return gateway.closeActionKey
		end
	end
	return nil
end

local _ = function(p12)
	local parentTipIndex = p12.parentScopeTour.tourTips[p12.parentTipIndex]
	local gateway = parentTipIndex.gateway
	assert(gateway ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
	
	return gateway.closeActionKey
end

local _ = function(p13)
	local var4 = p13[#p13]
	local cloned = table.clone(p13)
	table.remove(cloned)
	
	return var4, cloned
end

local _ = function(p13)
	-- upvalues: entryStorageModule (ref), _DateTime (ref)
	entryStorageModule.markSeen(p13, _DateTime.now():ToIsoDate())
end

local function markTipsSeenFromCurrent(p13, p14, p15)
	-- upvalues: entryStorageModule (ref), _DateTime (ref), whatsNewTelemetryModule (ref)
	local var4 = false
	
	local function _(p16)
		-- upvalues: p15 (ref)
		local cloned = table.clone(p15)
		cloned.currentEntry = p16
		
		return cloned
	end
	
	for i, v in p13.tourTips do
		local var5 = v.id == p14
		
		if var5 then
			var4 = true
		end
		if var4 then
			entryStorageModule.markSeen(v.id, _DateTime.now():ToIsoDate())
			
			if not var5 then
				local logTourtipInteraction = whatsNewTelemetryModule.logTourtipInteraction
				local SKIP = whatsNewTelemetryModule.InteractionType.SKIP
				local id = v.id
				local var6 = nil
				local cloned = table.clone(p15)
				cloned.currentEntry = v
				logTourtipInteraction(SKIP, id, var6, cloned, whatsNewTelemetryModule.SkipReason.TOUR_ENDED_EARLY)
			end
		end
	end
end

return function()
	-- upvalues: signalsModule (ref), createIdleState (ref), enumsModule (ref), whatsNewTelemetryModule (ref), markTipsSeenFromCurrent (ref), loadWhatsNewRegistryModule (ref), findCloseActionKeyForScope (ref), entryStorageModule (ref), findGatewayTipByOpenActionKey (ref), _DateTime (ref)
	local var7 = nil
	local var8 = nil
	local var9 = false
	
	local function _()
		-- upvalues: var9 (write), var7 (write), var8 (write)
		assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
	end
	
	local _ = function()
		-- upvalues: var9 (write), var7 (write), var8 (write)
		assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		return var7, var8
	end
	
	local t = {}
	local var10, var11 = signalsModule.createSignal(createIdleState(""))
	
	local _ = function(p16)
		-- upvalues: t (ref), enumsModule (copy)
		local var12 = t[p16]
		
		return if var12 == nil or not var12.isReady then enumsModule.WhatsNewSurface.WaitingForAnchor else enumsModule.WhatsNewSurface.TourTip
	end
	
	local function refreshSurfaceForCurrentEntry()
		-- upvalues: var10 (ref), var11 (ref), t (ref), enumsModule (copy)
		local var12 = var10(false)
		local currentEntry = var12.currentEntry
		
		if currentEntry == nil then return end
		local t_1 = {
			scopeStack = var12.scopeStack,
			screenScopeId = var12.screenScopeId,
			activeTourType = var12.activeTourType,
			globalTotalSteps = var12.globalTotalSteps,
			globalStepIndex = var12.globalStepIndex,
			currentScopeTour = var12.currentScopeTour,
			currentEntry = currentEntry,
			currentTipIndex = var12.currentTipIndex
		}
		local anchorId = t[currentEntry.anchorId]
		t_1.surface = if anchorId == nil or not anchorId.isReady then enumsModule.WhatsNewSurface.WaitingForAnchor else enumsModule.WhatsNewSurface.TourTip
		var11(t_1)
	end
	
	local function showTipAt(p16, p17, p18, p19)
		-- upvalues: var10 (ref), var11 (ref), t (ref), enumsModule (copy)
		local var12 = var10(false)
		local t_1 = {
			screenScopeId = p19.screenScopeId or var12.screenScopeId,
			activeTourType = if p19.activeTourType ~= nil then var12.activeTourType else p19.activeTourType,
			globalTotalSteps = p19.globalTotalSteps or var12.globalTotalSteps,
			globalStepIndex = if p19.globalStepIndex ~= nil then var12.globalStepIndex else p19.globalStepIndex,
			currentScopeTour = p16,
			currentEntry = p18,
			currentTipIndex = p17,
			scopeStack = p19.scopeStack or var12.scopeStack
		}
		local anchorId = t[p18.anchorId]
		t_1.surface = if anchorId == nil or not anchorId.isReady then enumsModule.WhatsNewSurface.WaitingForAnchor else enumsModule.WhatsNewSurface.TourTip
		var11(t_1)
	end
	
	local _ = function()
		-- upvalues: var11 (ref), createIdleState (copy), var10 (ref)
		var11(createIdleState(var10(false).screenScopeId))
	end
	
	local function stopTour()
		-- upvalues: var10 (ref), enumsModule (copy), whatsNewTelemetryModule (copy), var11 (ref), createIdleState (copy)
		local var12 = var10(false)
		
		if var12.surface ~= enumsModule.WhatsNewSurface.Idle then
			whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STOPPED, var12, whatsNewTelemetryModule.StopReason.ABORT)
		end
		var11(createIdleState(var10(false).screenScopeId))
	end
	
	local var12 = false
	
	local _ = function(p16, p17)
		-- upvalues: var12 (write)
		var12 = true
		local ok, status = pcall(function()
			-- upvalues: p16 (ref), p17 (ref)
			p16:invoke(p17)
		end)
		var12 = false
		
		if not ok then
			error(status)
		end
	end
	
	local _ = function(p16, p17)
		-- upvalues: var12 (write)
		local var13 = p17[#p17]
		local cloned = table.clone(p17)
		table.remove(cloned)
		local parentTipIndex = var13.parentScopeTour.tourTips[var13.parentTipIndex]
		local gateway = parentTipIndex.gateway
		assert(gateway ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
		local closeActionKey = gateway.closeActionKey
		var12 = true
		local ok, status = pcall(function()
			-- upvalues: p16 (ref), closeActionKey (ref)
			p16:invoke(closeActionKey)
		end)
		var12 = false
		
		if not ok then
			error(status)
		end
		return var13, cloned
	end
	
	local function markActiveScopeEndedEarly(p18)
		-- upvalues: whatsNewTelemetryModule (copy), markTipsSeenFromCurrent (copy)
		if p18.currentEntry ~= nil then
			whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.DISMISS, p18.currentEntry.id, whatsNewTelemetryModule.Button.CLOSE, p18)
		end
		local currentScopeTour = p18.currentScopeTour
		local currentEntry = p18.currentEntry
		
		if currentScopeTour ~= nil and currentEntry ~= nil then
			markTipsSeenFromCurrent(currentScopeTour, currentEntry.id, p18)
		end
		whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STOPPED, p18, whatsNewTelemetryModule.StopReason.DISMISS)
	end
	
	local function completeTour(p18)
		-- upvalues: var10 (ref), enumsModule (copy), markActiveScopeEndedEarly (ref), var9 (write), var7 (write), var8 (write), whatsNewTelemetryModule (copy), var12 (write), showTipAt (ref), var11 (ref), createIdleState (copy), loadWhatsNewRegistryModule (copy), findCloseActionKeyForScope (copy)
		local var14 = var10(false)
		
		if var14.surface == enumsModule.WhatsNewSurface.Idle then return end
		local var15 = p18 ~= nil and p18.earlyDismiss == true
		
		if var15 then
			markActiveScopeEndedEarly(var14)
		end
		local parentScopeTour, var16
		local scopeStack = var14.scopeStack
		assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		if #scopeStack > 0 then
			if not var15 then
				whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, var14)
			end
			while #scopeStack > 0 do
				local var17 = scopeStack[#scopeStack]
				local cloned = table.clone(scopeStack)
				table.remove(cloned)
				local parentTipIndex = var17.parentScopeTour.tourTips[var17.parentTipIndex]
				local status = parentTipIndex.gateway
				assert(status ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
				local closeActionKey = status.closeActionKey
				var12 = true
				ok, status = pcall(function()
					-- upvalues: var8 (ref), closeActionKey (ref)
					var8:invoke(closeActionKey)
				end)
				var12 = false
				
				if not ok then
					error(status)
				end
				local var18 = var17
				scopeStack = cloned
				parentScopeTour = var18.parentScopeTour
				
				for status = var18.parentTipIndex + 1, #parentScopeTour.tourTips do
					if not parentScopeTour.tourTips[status].toShow then
						continue
					end
					var16 = status
					if var16 == nil then
						whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, {
							screenScopeId = var14.screenScopeId,
							activeTourType = var14.activeTourType,
							globalTotalSteps = var18.parentGlobalTotalSteps,
							globalStepIndex = var18.parentGlobalStepIndex,
							currentScopeTour = var18.parentScopeTour,
							currentEntry = var18.parentScopeTour.tourTips[var18.parentTipIndex],
							currentTipIndex = var18.parentTipIndex,
							scopeStack = scopeStack,
							surface = var14.surface
						})
						continue
					end
					showTipAt(var18.parentScopeTour, var16, var18.parentScopeTour.tourTips[var16], {
						scopeStack = scopeStack,
						globalStepIndex = var18.parentGlobalStepIndex + 1,
						globalTotalSteps = var18.parentGlobalTotalSteps
					})
					
					return
				end
				var16 = nil
			end
			var11(createIdleState(var10(false).screenScopeId))
			
			return
		elseif not var15 then
			whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, var14)
		end
		local currentScopeTour = var14.currentScopeTour
		
		if currentScopeTour ~= nil and var14.activeTourType ~= nil and var14.screenScopeId ~= "" then
			assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
			var16 = var8
			parentScopeTour = var7[loadWhatsNewRegistryModule.makeRootTourKey(var14.screenScopeId, var14.activeTourType)]
			
			if parentScopeTour ~= nil then
				local var19 = findCloseActionKeyForScope(parentScopeTour.scopeTree, currentScopeTour.id)
				
				if var19 ~= nil then
					var12 = true
					local ok, status = pcall(function()
						-- upvalues: var8 (ref), var19 (ref)
						var8:invoke(var19)
					end)
					var12 = false
					
					if not ok then
						error(status)
					end
				end
			end
		end
		var11(createIdleState(var10(false).screenScopeId))
	end
	
	local function startTour(p19, p20)
		-- upvalues: var9 (write), var7 (write), var8 (write), loadWhatsNewRegistryModule (copy), entryStorageModule (copy), showTipAt (ref), whatsNewTelemetryModule (copy), var10 (ref)
		assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local var20 = var7[loadWhatsNewRegistryModule.makeRootTourKey(p19, p20)]
		
		if var20 == nil then return end
		local var21
		for i, v in var20.scopeTree.tourTips do
			local toShow = v.toShow
			
			if toShow then
				local id = entryStorageModule.getEntries()[v.id]
				toShow = not (id ~= nil and id.seen ~= nil)
			end
			if toShow then
				var21 = i
				if var21 == nil then return end
				local var22 = var20.scopeTree.tourTips[var21]
				local scopeTree = var20.scopeTree
				local t = {
					globalStepIndex = 0,
					screenScopeId = p19,
					activeTourType = p20
				}
				local var23 = 0
				
				for i_1, v_1 in var20.scopeTree.tourTips do
					local toShow = v_1.toShow
					
					if toShow then
						local id = entryStorageModule.getEntries()[v_1.id]
						toShow = not (id ~= nil and id.seen ~= nil)
					end
					if toShow then
						var23 += v_1.stepCount
					end
				end
				t.globalTotalSteps = var23
				t.scopeStack = {}
				showTipAt(scopeTree, var21, var22, t)
				whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STARTED, var10(false), nil, whatsNewTelemetryModule.StartContext.ROOT)
				
				return
			end
		end
		var21 = nil
	end
	
	local _ = function(p21, p22)
		-- upvalues: var9 (write), var7 (write), var8 (write), loadWhatsNewRegistryModule (copy), entryStorageModule (copy), startTour (ref)
		assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local var24 = var7[loadWhatsNewRegistryModule.makeRootTourKey(p21, p22)]
		
		if var24 ~= nil then
			local var25
			for i, v in var24.scopeTree.tourTips do
				local toShow = v.toShow
				
				if toShow then
					local id = entryStorageModule.getEntries()[v.id]
					toShow = not (id ~= nil and id.seen ~= nil)
				end
				if toShow then
					var25 = true
					if var25 then
						startTour(p21, p22)
						
						return true
					end
				end
			end
			var25 = false
		end
		return false
	end
	
	local function startEligibleTour(p23)
		-- upvalues: var9 (write), var7 (write), var8 (write), var10 (ref), enumsModule (copy), var11 (ref), createIdleState (copy), loadWhatsNewRegistryModule (copy), entryStorageModule (copy), startTour (ref)
		assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		if var10(false).surface == enumsModule.WhatsNewSurface.Idle then
			var11(createIdleState(p23))
		end
		for i, v in enumsModule.TourTypeList do
			local var26
			assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
			local _ = var8
			local var27 = var7[loadWhatsNewRegistryModule.makeRootTourKey(p23, v)]
			
			if var27 ~= nil then
				local var28
				for i_1, v_1 in var27.scopeTree.tourTips do
					local toShow = v_1.toShow
					
					if toShow then
						local id = entryStorageModule.getEntries()[v_1.id]
						toShow = not (id ~= nil and id.seen ~= nil)
					end
					if toShow then
						var28 = true
						if var28 then
							startTour(p23, v)
							var26 = true
						else
							var26 = false
						end
						if var26 then return end
					end
				end
				var28 = false
			end
		end
	end
	
	local function registerAnchor(p24, p25)
		-- upvalues: t (ref), var10 (ref), refreshSurfaceForCurrentEntry (ref)
		local var29 = t[p24]
		
		if var29 ~= nil and var29.ref == p25 then return end
		if var29 ~= nil and var29.ref.Parent ~= nil then
			warn(`WhatsNew anchor '{p37}' is already registered; replacing with new registration`)
		end
		t[p24] = { isReady = false, ref = p25 }
		local var30 = var10(false)
		
		if var30.currentEntry ~= nil and var30.currentEntry.anchorId == p24 then
			refreshSurfaceForCurrentEntry()
		end
	end
	
	local function getAnchorRef(p24)
		-- upvalues: t (ref)
		local var29 = t[p24]
		
		return if var29 == nil then nil else var29.ref
	end
	
	local function setAnchorReady(value, p24, p25)
		-- upvalues: t (ref), var10 (ref), refreshSurfaceForCurrentEntry (ref)
		local var29 = t[value]
		
		if var29 == nil then return end
		if p25 ~= nil and var29.ref ~= p25 then return end
		var29.isReady = p24
		local var30 = var10(false)
		
		if var30.currentEntry ~= nil and var30.currentEntry.anchorId == value then
			refreshSurfaceForCurrentEntry()
		end
	end
	
	local function unregisterAnchor(p24, p25)
		-- upvalues: t (ref), var10 (ref), refreshSurfaceForCurrentEntry (ref)
		local var29 = t[p24]
		
		if var29 == nil then return end
		if p25 ~= nil and var29.ref ~= p25 then return end
		t[p24] = nil
		local var30 = var10(false)
		
		if var30.currentEntry ~= nil and var30.currentEntry.anchorId == p24 then
			refreshSurfaceForCurrentEntry()
		end
	end
	
	local var29 = false
	
	local function tryEnterNestedScope(p24)
		-- upvalues: var29 (write), var10 (ref), enumsModule (copy), entryStorageModule (copy), showTipAt (ref), whatsNewTelemetryModule (copy)
		if var29 then
			return false
		end
		local var30 = var10(false)
		
		if var30.surface == enumsModule.WhatsNewSurface.Idle or var30.currentEntry == nil or (var30.currentScopeTour == nil or var30.globalStepIndex == nil) then
			return false
		end
		local currentScopeTour = var30.currentScopeTour
		local gateway = var30.currentEntry.gateway
		
		if gateway == nil or p24.openActionKey ~= nil and gateway.openActionKey ~= p24.openActionKey then
			return false
		end
		local var31
		local scope = gateway.scope
		
		for i, v in scope.tourTips do
			local toShow = v.toShow
			
			if toShow then
				local id = entryStorageModule.getEntries()[v.id]
				toShow = not (id ~= nil and id.seen ~= nil)
			end
			if toShow then
				var31 = i
				if var31 == nil then
					return false
				end
				var29 = true
				local ok, status = pcall(function()
					-- upvalues: var30 (ref), currentScopeTour (ref), scope (ref), var31 (ref), showTipAt (copy), entryStorageModule (copy), whatsNewTelemetryModule (copy), var10 (copy)
					local cloned = table.clone(var30.scopeStack)
					table.insert(cloned, {
						parentTipIndex = var30.currentTipIndex,
						parentScopeTour = currentScopeTour,
						parentGlobalStepIndex = var30.globalStepIndex,
						parentGlobalTotalSteps = var30.globalTotalSteps
					})
					local var32 = scope.tourTips[var31]
					local t = { globalStepIndex = 0, scopeStack = cloned }
					local var33 = 0
					
					for i, v in scope.tourTips do
						local toShow = v.toShow
						
						if toShow then
							local id = entryStorageModule.getEntries()[v.id]
							toShow = not (id ~= nil and id.seen ~= nil)
						end
						if toShow then
							var33 += v.stepCount
						end
					end
					t.globalTotalSteps = var33
					showTipAt(scope, var31, var32, t)
					whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STARTED, var10(false), nil, whatsNewTelemetryModule.StartContext.GATEWAY)
				end)
				var29 = false
				
				if not ok then
					error(status)
				end
				return true
			end
		end
		var31 = nil
	end
	
	local function tryStartNestedFromIdle(p25)
		-- upvalues: var10 (ref), var9 (write), var7 (write), var8 (write), enumsModule (copy), loadWhatsNewRegistryModule (copy), findGatewayTipByOpenActionKey (copy), entryStorageModule (copy), showTipAt (ref), whatsNewTelemetryModule (copy)
		local screenScopeId = var10(false).screenScopeId
		
		if screenScopeId == "" then
			return false
		end
		assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		for i, v in enumsModule.TourTypeList do
			local var32 = var7[loadWhatsNewRegistryModule.makeRootTourKey(screenScopeId, v)]
			
			if var32 ~= nil then
				local var33 = findGatewayTipByOpenActionKey(var32.scopeTree, p25)
				local var34 = if var33 ~= nil then nil else var33.gateway
				
				if var34 ~= nil then
					local toShow, var35
					local scope = var34.scope
					
					for i_1, v_1 in scope.tourTips do
						toShow = v_1.toShow
						
						if toShow then
							local id = entryStorageModule.getEntries()[v_1.id]
							toShow = not (id ~= nil and id.seen ~= nil)
						end
						if toShow then
							var35 = i_1
							if var35 ~= nil then
								local var36 = scope.tourTips[var35]
								toShow = {
									globalStepIndex = 0,
									screenScopeId = screenScopeId,
									activeTourType = v,
									scopeStack = {}
								}
								local var37 = 0
								
								for i_2, v_2 in scope.tourTips do
									local toShow_1 = v_2.toShow
									
									if toShow_1 then
										local id = entryStorageModule.getEntries()[v_2.id]
										toShow_1 = not (id ~= nil and id.seen ~= nil)
									end
									if toShow_1 then
										var37 += v_2.stepCount
									end
								end
								toShow.globalTotalSteps = var37
								showTipAt(scope, var35, var36, toShow)
								whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STARTED, var10(false), nil, whatsNewTelemetryModule.StartContext.IDLE)
								
								return true
							end
						end
					end
					var35 = nil
				end
			end
		end
		return false
	end
	
	local function notifyScopeOpened(p26)
		-- upvalues: var10 (ref), enumsModule (copy), tryStartNestedFromIdle (ref), entryStorageModule (copy), _DateTime (copy), tryEnterNestedScope (ref)
		local var38 = var10(false)
		
		if var38.surface == enumsModule.WhatsNewSurface.Idle then
			tryStartNestedFromIdle(p26)
			
			return
		elseif var38.currentEntry == nil then return end
		local currentEntry = var38.currentEntry
		local gateway = currentEntry.gateway
		
		if gateway == nil or gateway.openActionKey ~= p26 then return end
		if var38.currentScopeTour ~= nil and var38.currentScopeTour.id == gateway.scope.id then return end
		local var39
		for i, v in gateway.scope.tourTips do
			local toShow = v.toShow
			
			if toShow then
				local id = entryStorageModule.getEntries()[v.id]
				toShow = not (id ~= nil and id.seen ~= nil)
			end
			if toShow then
				var39 = i
				if var39 == nil then
					return
				end
				entryStorageModule.markSeen(currentEntry.id, _DateTime.now():ToIsoDate())
				tryEnterNestedScope({ openActionKey = p26 })
				
				return
			end
		end
		var39 = nil
	end
	
	local function notifyScopeClosed(p27)
		-- upvalues: var10 (ref), var12 (write), var29 (write), enumsModule (copy), completeTour (ref), var9 (write), var7 (write), var8 (write), loadWhatsNewRegistryModule (copy), findCloseActionKeyForScope (copy)
		local var40 = var10(false)
		
		if var12 or var29 or var40.surface == enumsModule.WhatsNewSurface.Idle then return end
		local scopeStack = var40.scopeStack
		local var41 = scopeStack[#scopeStack]
		
		if var41 == nil then
			local currentScopeTour = var40.currentScopeTour
			
			if currentScopeTour == nil or var40.activeTourType == nil or var40.screenScopeId == "" then return end
			assert(var9 and (var7 ~= nil and var8 ~= nil), "WhatsNew store not initialized. Call initialize first.")
			local screenScopeId = var7[loadWhatsNewRegistryModule.makeRootTourKey(var40.screenScopeId, var40.activeTourType)]
			
			if screenScopeId == nil then return end
			if findCloseActionKeyForScope(screenScopeId.scopeTree, currentScopeTour.id) == p27 then
				completeTour({ earlyDismiss = true })
				
				return
			end
			return
		else
			local parentTipIndex = var41.parentScopeTour.tourTips[var41.parentTipIndex]
			local gateway = parentTipIndex.gateway
			assert(gateway ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
			
			if gateway.closeActionKey == p27 then
				completeTour({ earlyDismiss = true })
				
				return
			end
		end
	end
	
	return {
		initialize = function(p28)
			-- upvalues: var9 (write), var7 (write), var8 (write), notifyScopeOpened (ref), notifyScopeClosed (ref), var10 (ref)
			if var9 then
				return
			end
			var7 = p28.rootTourMap
			var8 = p28.scopeActions
			assert(var8 ~= nil, "scopeActions is required")
			var9 = true
			var8:startOpenStateWiring({
				notifyScopeOpened = notifyScopeOpened,
				notifyScopeClosed = notifyScopeClosed,
				getRuntimeStateSignal = var10
			})
		end,
		resetForTests = function()
			-- upvalues: var8 (write), var9 (write), var7 (write), t (ref), var11 (ref), createIdleState (copy)
			if var8 ~= nil then
				var8:stopOpenStateWiring()
			end
			var9 = false
			var7 = nil
			var8 = nil
			table.clear(t)
			var11(createIdleState(""))
		end,
		getRuntimeState = function()
			-- upvalues: var10 (ref)
			return var10(false)
		end,
		getRuntimeStateSignal = var10,
		getCurrentScope = function()
			-- upvalues: var10 (ref)
			return var10(false).currentScopeTour
		end,
		getCurrentEntry = function()
			-- upvalues: var10 (ref)
			return var10(false).currentEntry
		end,
		getGlobalStepIndex = function()
			-- upvalues: var10 (ref)
			return var10(false).globalStepIndex
		end,
		getGlobalTotalSteps = function()
			-- upvalues: var10 (ref)
			local var42 = var10(false)
			
			return if var42.activeTourType == nil then 0 else var42.globalTotalSteps
		end,
		registerAnchor = registerAnchor,
		getAnchorRef = getAnchorRef,
		setAnchorReady = setAnchorReady,
		unregisterAnchor = unregisterAnchor,
		startEligibleTour = startEligibleTour,
		startTour = startTour,
		stopTour = stopTour,
		next = function()
			-- upvalues: var10 (ref), enumsModule (copy), entryStorageModule (copy), _DateTime (copy), whatsNewTelemetryModule (copy), completeTour (ref), showTipAt (ref)
			local var42 = var10(false)
			
			if var42.surface == enumsModule.WhatsNewSurface.Idle then return end
			assert(var42.currentEntry ~= nil and (var42.currentScopeTour ~= nil and var42.globalStepIndex ~= nil), "next() called with inconsistent active tour state")
			local currentEntry = var42.currentEntry
			entryStorageModule.markSeen(currentEntry.id, _DateTime.now():ToIsoDate())
			whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.CLICK, currentEntry.id, whatsNewTelemetryModule.Button.NEXT, var42)
			local currentScopeTour = var42.currentScopeTour
			local var43 = var42.globalStepIndex + 1
			
			if var42.globalTotalSteps <= var43 then
				completeTour()
				
				return
			end
			local var44
			for i = var42.currentTipIndex + 1, #currentScopeTour.tourTips do
				if not currentScopeTour.tourTips[i].toShow then
					continue
				end
				var44 = i
				if var44 == nil then
					completeTour()
					
					return
				end
				showTipAt(currentScopeTour, var44, currentScopeTour.tourTips[var44], { globalStepIndex = var43 })
				
				return
			end
			var44 = nil
		end,
		back = function()
			-- upvalues: var10 (ref), enumsModule (copy), whatsNewTelemetryModule (copy), showTipAt (ref)
			local var45 = var10(false)
			
			if var45.surface == enumsModule.WhatsNewSurface.Idle then return end
			assert(var45.currentEntry ~= nil and (var45.currentScopeTour ~= nil and var45.globalStepIndex ~= nil), "back() called with inconsistent active tour state")
			
			if var45.globalStepIndex == 0 then return end
			local var46
			whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.CLICK, var45.currentEntry.id, whatsNewTelemetryModule.Button.BACK, var45)
			local currentScopeTour = var45.currentScopeTour
			local var47 = var45.globalStepIndex - 1
			
			for i = var45.currentTipIndex - 1, 1, -1 do
				if not currentScopeTour.tourTips[i].toShow then
					continue
				end
				var46 = i
				if var46 == nil then
					assert(false, "back() cannot resolve previous tip at globalStepIndex > 0 within current scope")
					
					return
				end
				showTipAt(currentScopeTour, var46, currentScopeTour.tourTips[var46], { globalStepIndex = var47 })
				
				return
			end
			var46 = nil
		end,
		notifyScopeOpened = notifyScopeOpened,
		notifyScopeClosed = notifyScopeClosed,
		completeTour = completeTour
	}
end