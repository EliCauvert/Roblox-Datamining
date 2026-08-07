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

local function createIdleState(p0) --[[ line: 30 ]]
	-- upvalues: enumsModule (ref)
	return {
		activeTourType = nil,
		globalTotalSteps = 0,
		globalStepIndex = nil,
		currentScopeTour = nil,
		currentEntry = nil,
		currentTipIndex = 0,
		screenScopeId = p0,
		scopeStack = {},
		surface = enumsModule.WhatsNewSurface.Idle
	}
end

local function _(p1) --[[ line: 45 | named "hasBeenSeen" ]]
	-- upvalues: entryStorageModule (ref)
	local var11 = entryStorageModule.getEntries()[p1]
	
	return var11 ~= nil and var11.seen ~= nil
end

local _ = function(p2) --[[ line: 51 | named "isEligibleForNewSession" ]]
	-- upvalues: entryStorageModule (ref)
	local toShow = p2.toShow
	
	if toShow then
		local id = entryStorageModule.getEntries()[p2.id]
		toShow = not (id ~= nil and id.seen ~= nil)
	end
	return toShow
end

local _ = function(p3) --[[ line: 55 | named "countEligibleTips" ]]
	-- upvalues: entryStorageModule (ref)
	local var12 = 0
	
	for i, v in p3.tourTips do
		local toShow = v.toShow
		
		if toShow then
			local id = entryStorageModule.getEntries()[v.id]
			toShow = not (id ~= nil and id.seen ~= nil)
		end
		if toShow then
			var12 += v.stepCount
		end
	end
	return var12
end

local _ = function(p4) --[[ line: 66 | named "tourHasEligibleRootTips" ]]
	-- upvalues: entryStorageModule (ref)
	for i, v in p4.tourTips do
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

local _ = function(p5) --[[ line: 75 | named "findFirstEligibleTipIndex" ]]
	-- upvalues: entryStorageModule (ref)
	for i, v in p5.tourTips do
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

local _ = function(p6, p7) --[[ line: 85 | named "findNextVisibleTipIndexFrom" ]]
	for i = p7, #p6.tourTips do
		if not p6.tourTips[i].toShow then
			continue
		end
		return i
	end
	return nil
end

local _ = function(p8, p9) --[[ line: 94 | named "findPreviousVisibleTipIndexFrom" ]]
	for i = p9, 1, -1 do
		if not p8.tourTips[i].toShow then
			continue
		end
		return i
	end
	return nil
end

local function findGatewayTipByOpenActionKey(p10, p11) --[[ line: 103 ]]
	-- upvalues: findGatewayTipByOpenActionKey (ref)
	for i, v in p10.tourTips do
		local gateway = v.gateway
		
		if gateway == nil or gateway.openActionKey ~= p11 then
			if gateway ~= nil then
				local var13 = findGatewayTipByOpenActionKey(gateway.scope, p11)
				
				if var13 ~= nil then
					return var13
				end
			end
		end
		return v
	end
	return nil
end

local function findCloseActionKeyForScope(p12, p13) --[[ line: 119 ]]
	-- upvalues: findCloseActionKeyForScope (ref)
	for i, v in p12.tourTips do
		local gateway = v.gateway
		
		if gateway ~= nil then
			if gateway.scope.id ~= p13 then
				local var14 = findCloseActionKeyForScope(gateway.scope, p13)
				
				if var14 ~= nil then
					return var14
				end
			end
			return gateway.closeActionKey
		end
	end
	return nil
end

local _ = function(p14) --[[ line: 135 | named "getCloseActionKeyForFrame" ]]
	local parentTipIndex = p14.parentScopeTour.tourTips[p14.parentTipIndex]
	local gateway = parentTipIndex.gateway
	assert(gateway ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
	
	return gateway.closeActionKey
end

local _ = function(p15) --[[ line: 143 | named "popScopeStack" ]]
	local var15 = p15[#p15]
	local cloned = table.clone(p15)
	table.remove(cloned)
	
	return var15, cloned
end

local _ = function(p16) --[[ line: 150 | named "markEntrySeen" ]]
	-- upvalues: entryStorageModule (ref), _DateTime (ref)
	entryStorageModule.markSeen(p16, _DateTime.now():ToIsoDate())
end

local function markTipsSeenFromCurrent(p17, p18, p19) --[[ line: 154 ]]
	-- upvalues: entryStorageModule (ref), _DateTime (ref), whatsNewTelemetryModule (ref)
	local var17 = false
	
	local function _(p20) --[[ line: 161 | named "runtimeStateForTip" ]]
		-- upvalues: p19 (ref)
		local cloned = table.clone(p19)
		cloned.currentEntry = p20
		
		return cloned
	end
	
	for i, v in p17.tourTips do
		local var18 = v.id == p18
		
		if var18 then
			var17 = true
		end
		if var17 then
			entryStorageModule.markSeen(v.id, _DateTime.now():ToIsoDate())
			
			if not var18 then
				local logTourtipInteraction = whatsNewTelemetryModule.logTourtipInteraction
				local SKIP = whatsNewTelemetryModule.InteractionType.SKIP
				local id = v.id
				local var19 = nil
				local cloned = table.clone(p19)
				cloned.currentEntry = v
				logTourtipInteraction(SKIP, id, var19, cloned, whatsNewTelemetryModule.SkipReason.TOUR_ENDED_EARLY)
			end
		end
	end
end

return function() --[[ line: 187 | named "createWhatsNewStore" ]]
	-- upvalues: signalsModule (ref), createIdleState (ref), enumsModule (ref), whatsNewTelemetryModule (ref), markTipsSeenFromCurrent (ref), loadWhatsNewRegistryModule (ref), findCloseActionKeyForScope (ref), entryStorageModule (ref), findGatewayTipByOpenActionKey (ref), _DateTime (ref)
	local var22 = nil
	local var23 = nil
	local var24 = false
	
	local function _() --[[ line: 192 | named "assertInitialized" ]]
		-- upvalues: var24 (write), var22 (write), var23 (write)
		assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
	end
	
	local _ = function() --[[ line: 196 | named "getRootTourAndScopeActions" ]]
		-- upvalues: var24 (write), var22 (write), var23 (write)
		assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		return var22, var23
	end
	
	local t = {}
	local var26, var27 = signalsModule.createSignal(createIdleState(""))
	
	local _ = function(p21) --[[ line: 204 | named "resolveSurfaceForAnchor" ]]
		-- upvalues: t (ref), enumsModule (copy)
		local var45 = t[p21]
		
		return if var45 == nil or not var45.isReady then enumsModule.WhatsNewSurface.WaitingForAnchor else enumsModule.WhatsNewSurface.TourTip
	end
	
	local function refreshSurfaceForCurrentEntry() --[[ line: 212 ]]
		-- upvalues: var26 (ref), var27 (ref), t (ref), enumsModule (copy)
		local var46 = var26(false)
		local currentEntry = var46.currentEntry
		
		if currentEntry == nil then return end
		local t_1 = {
			scopeStack = var46.scopeStack,
			screenScopeId = var46.screenScopeId,
			activeTourType = var46.activeTourType,
			globalTotalSteps = var46.globalTotalSteps,
			globalStepIndex = var46.globalStepIndex,
			currentScopeTour = var46.currentScopeTour,
			currentEntry = currentEntry,
			currentTipIndex = var46.currentTipIndex
		}
		local anchorId = t[currentEntry.anchorId]
		t_1.surface = if anchorId == nil or not anchorId.isReady then enumsModule.WhatsNewSurface.WaitingForAnchor else enumsModule.WhatsNewSurface.TourTip
		var27(t_1)
	end
	
	local function showTipAt(p22, p23, p24, p25) --[[ line: 231 ]]
		-- upvalues: var26 (ref), var27 (ref), t (ref), enumsModule (copy)
		local var48 = var26(false)
		local t_1 = {
			screenScopeId = p25.screenScopeId or var48.screenScopeId,
			activeTourType = if p25.activeTourType ~= nil then var48.activeTourType else p25.activeTourType,
			globalTotalSteps = p25.globalTotalSteps or var48.globalTotalSteps,
			globalStepIndex = if p25.globalStepIndex ~= nil then var48.globalStepIndex else p25.globalStepIndex,
			currentScopeTour = p22,
			currentEntry = p24,
			currentTipIndex = p23,
			scopeStack = p25.scopeStack or var48.scopeStack
		}
		local anchorId = t[p24.anchorId]
		t_1.surface = if anchorId == nil or not anchorId.isReady then enumsModule.WhatsNewSurface.WaitingForAnchor else enumsModule.WhatsNewSurface.TourTip
		var27(t_1)
	end
	
	local _ = function() --[[ line: 257 | named "resetToIdle" ]]
		-- upvalues: var27 (ref), createIdleState (copy), var26 (ref)
		var27(createIdleState(var26(false).screenScopeId))
	end
	
	local function stopTour() --[[ line: 261 ]]
		-- upvalues: var26 (ref), enumsModule (copy), whatsNewTelemetryModule (copy), var27 (ref), createIdleState (copy)
		local var50 = var26(false)
		
		if var50.surface ~= enumsModule.WhatsNewSurface.Idle then
			whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STOPPED, var50, whatsNewTelemetryModule.StopReason.ABORT)
		end
		var27(createIdleState(var26(false).screenScopeId))
	end
	
	local var31 = false
	
	local _ = function(p26, p27) --[[ line: 277 | named "invokeCloseAction" ]]
		-- upvalues: var31 (write)
		var31 = true
		local ok, status = pcall(function() --[[ line: 279 ]]
			-- upvalues: p26 (ref), p27 (ref)
			p26:invoke(p27)
		end)
		var31 = false
		
		if not ok then
			error(status)
		end
	end
	
	local _ = function(p28, p29) --[[ line: 288 | named "exitNestedScope" ]]
		-- upvalues: var31 (write)
		local var51 = p29[#p29]
		local cloned = table.clone(p29)
		table.remove(cloned)
		local parentTipIndex = var51.parentScopeTour.tourTips[var51.parentTipIndex]
		local gateway = parentTipIndex.gateway
		assert(gateway ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
		local closeActionKey = gateway.closeActionKey
		var31 = true
		local ok, status = pcall(function() --[[ line: 279 ]]
			-- upvalues: p28 (ref), closeActionKey (ref)
			p28:invoke(closeActionKey)
		end)
		var31 = false
		
		if not ok then
			error(status)
		end
		return var51, cloned
	end
	
	local function markActiveScopeEndedEarly(p30) --[[ line: 297 ]]
		-- upvalues: whatsNewTelemetryModule (copy), markTipsSeenFromCurrent (copy)
		if p30.currentEntry ~= nil then
			whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.DISMISS, p30.currentEntry.id, whatsNewTelemetryModule.Button.CLOSE, p30)
		end
		local currentScopeTour = p30.currentScopeTour
		local currentEntry = p30.currentEntry
		
		if currentScopeTour ~= nil and currentEntry ~= nil then
			markTipsSeenFromCurrent(currentScopeTour, currentEntry.id, p30)
		end
		whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STOPPED, p30, whatsNewTelemetryModule.StopReason.DISMISS)
	end
	
	local function completeTour(p31) --[[ line: 321 ]]
		-- upvalues: var26 (ref), enumsModule (copy), markActiveScopeEndedEarly (ref), var24 (write), var22 (write), var23 (write), whatsNewTelemetryModule (copy), var31 (write), showTipAt (ref), var27 (ref), createIdleState (copy), loadWhatsNewRegistryModule (copy), findCloseActionKeyForScope (copy)
		local var53 = var26(false)
		
		if var53.surface == enumsModule.WhatsNewSurface.Idle then return end
		local var54 = p31 ~= nil and p31.earlyDismiss == true
		
		if var54 then
			markActiveScopeEndedEarly(var53)
		end
		local parentScopeTour, var58
		local scopeStack = var53.scopeStack
		assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		if #scopeStack > 0 then
			if not var54 then
				whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, var53)
			end
			while #scopeStack > 0 do
				local var55 = scopeStack[#scopeStack]
				local cloned = table.clone(scopeStack)
				table.remove(cloned)
				local parentTipIndex = var55.parentScopeTour.tourTips[var55.parentTipIndex]
				local status = parentTipIndex.gateway
				assert(status ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
				local closeActionKey = status.closeActionKey
				var31 = true
				ok, status = pcall(function() --[[ line: 279 ]]
					-- upvalues: var23 (ref), closeActionKey (ref)
					var23:invoke(closeActionKey)
				end)
				var31 = false
				
				if not ok then
					error(status)
				end
				local var57 = var55
				scopeStack = cloned
				parentScopeTour = var57.parentScopeTour
				
				for status = var57.parentTipIndex + 1, #parentScopeTour.tourTips do
					if not parentScopeTour.tourTips[status].toShow then
						continue
					end
					var58 = status
					if var58 == nil then
						whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, {
							screenScopeId = var53.screenScopeId,
							activeTourType = var53.activeTourType,
							globalTotalSteps = var57.parentGlobalTotalSteps,
							globalStepIndex = var57.parentGlobalStepIndex,
							currentScopeTour = var57.parentScopeTour,
							currentEntry = var57.parentScopeTour.tourTips[var57.parentTipIndex],
							currentTipIndex = var57.parentTipIndex,
							scopeStack = scopeStack,
							surface = var53.surface
						})
						continue
					end
					showTipAt(var57.parentScopeTour, var58, var57.parentScopeTour.tourTips[var58], {
						scopeStack = scopeStack,
						globalStepIndex = var57.parentGlobalStepIndex + 1,
						globalTotalSteps = var57.parentGlobalTotalSteps
					})
					
					return
				end
				var58 = nil
			end
			var27(createIdleState(var26(false).screenScopeId))
			
			return
		elseif not var54 then
			whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, var53)
		end
		local currentScopeTour = var53.currentScopeTour
		
		if currentScopeTour ~= nil and var53.activeTourType ~= nil and var53.screenScopeId ~= "" then
			assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
			var58 = var23
			parentScopeTour = var22[loadWhatsNewRegistryModule.makeRootTourKey(var53.screenScopeId, var53.activeTourType)]
			
			if parentScopeTour ~= nil then
				local var59 = findCloseActionKeyForScope(parentScopeTour.scopeTree, currentScopeTour.id)
				
				if var59 ~= nil then
					var31 = true
					local ok, status = pcall(function() --[[ line: 279 ]]
						-- upvalues: var23 (ref), var59 (ref)
						var23:invoke(var59)
					end)
					var31 = false
					
					if not ok then
						error(status)
					end
				end
			end
		end
		var27(createIdleState(var26(false).screenScopeId))
	end
	
	local function startTour(p32, p33) --[[ line: 395 ]]
		-- upvalues: var24 (write), var22 (write), var23 (write), loadWhatsNewRegistryModule (copy), entryStorageModule (copy), showTipAt (ref), whatsNewTelemetryModule (copy), var26 (ref)
		assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local var60 = var22[loadWhatsNewRegistryModule.makeRootTourKey(p32, p33)]
		
		if var60 == nil then return end
		local var61
		for i, v in var60.scopeTree.tourTips do
			local toShow = v.toShow
			
			if toShow then
				local id = entryStorageModule.getEntries()[v.id]
				toShow = not (id ~= nil and id.seen ~= nil)
			end
			if toShow then
				var61 = i
				if var61 == nil then return end
				local var62 = var60.scopeTree.tourTips[var61]
				local scopeTree = var60.scopeTree
				local t = {
					globalStepIndex = 0,
					screenScopeId = p32,
					activeTourType = p33
				}
				local var64 = 0
				
				for i_1, v_1 in var60.scopeTree.tourTips do
					local toShow = v_1.toShow
					
					if toShow then
						local id = entryStorageModule.getEntries()[v_1.id]
						toShow = not (id ~= nil and id.seen ~= nil)
					end
					if toShow then
						var64 += v_1.stepCount
					end
				end
				t.globalTotalSteps = var64
				t.scopeStack = {}
				showTipAt(scopeTree, var61, var62, t)
				whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STARTED, var26(false), nil, whatsNewTelemetryModule.StartContext.ROOT)
				
				return
			end
		end
		var61 = nil
	end
	
	local _ = function(p34, p35) --[[ line: 424 | named "tryStartTour" ]]
		-- upvalues: var24 (write), var22 (write), var23 (write), loadWhatsNewRegistryModule (copy), entryStorageModule (copy), startTour (ref)
		assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local var65 = var22[loadWhatsNewRegistryModule.makeRootTourKey(p34, p35)]
		
		if var65 ~= nil then
			local var66
			for i, v in var65.scopeTree.tourTips do
				local toShow = v.toShow
				
				if toShow then
					local id = entryStorageModule.getEntries()[v.id]
					toShow = not (id ~= nil and id.seen ~= nil)
				end
				if toShow then
					var66 = true
					if var66 then
						startTour(p34, p35)
						
						return true
					end
				end
			end
			var66 = false
		end
		return false
	end
	
	local function startEligibleTour(p36) --[[ line: 434 ]]
		-- upvalues: var24 (write), var22 (write), var23 (write), var26 (ref), enumsModule (copy), var27 (ref), createIdleState (copy), loadWhatsNewRegistryModule (copy), entryStorageModule (copy), startTour (ref)
		assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		if var26(false).surface == enumsModule.WhatsNewSurface.Idle then
			var27(createIdleState(p36))
		end
		for i, v in enumsModule.TourTypeList do
			local var69
			assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
			local _ = var23
			local var67 = var22[loadWhatsNewRegistryModule.makeRootTourKey(p36, v)]
			
			if var67 ~= nil then
				local var68
				for i_1, v_1 in var67.scopeTree.tourTips do
					local toShow = v_1.toShow
					
					if toShow then
						local id = entryStorageModule.getEntries()[v_1.id]
						toShow = not (id ~= nil and id.seen ~= nil)
					end
					if toShow then
						var68 = true
						if var68 then
							startTour(p36, v)
							var69 = true
						else
							var69 = false
						end
						if var69 then return end
					end
				end
				var68 = false
			end
		end
	end
	
	local function registerAnchor(p37, p38) --[[ line: 449 ]]
		-- upvalues: t (ref), var26 (ref), refreshSurfaceForCurrentEntry (ref)
		local var70 = t[p37]
		
		if var70 ~= nil and var70.ref == p38 then return end
		if var70 ~= nil and var70.ref.Parent ~= nil then
			warn(`WhatsNew anchor '{p37}' is already registered; replacing with new registration`)
		end
		t[p37] = { isReady = false, ref = p38 }
		local var71 = var26(false)
		
		if var71.currentEntry ~= nil and var71.currentEntry.anchorId == p37 then
			refreshSurfaceForCurrentEntry()
		end
	end
	
	local function getAnchorRef(p39) --[[ line: 469 ]]
		-- upvalues: t (ref)
		local var72 = t[p39]
		
		return if var72 == nil then nil else var72.ref
	end
	
	local function setAnchorReady(value, p40, p41) --[[ line: 477 ]]
		-- upvalues: t (ref), var26 (ref), refreshSurfaceForCurrentEntry (ref)
		local var73 = t[value]
		
		if var73 == nil then return end
		if p41 ~= nil and var73.ref ~= p41 then return end
		var73.isReady = p40
		local var74 = var26(false)
		
		if var74.currentEntry ~= nil and var74.currentEntry.anchorId == value then
			refreshSurfaceForCurrentEntry()
		end
	end
	
	local function unregisterAnchor(p42, p43) --[[ line: 492 ]]
		-- upvalues: t (ref), var26 (ref), refreshSurfaceForCurrentEntry (ref)
		local var75 = t[p42]
		
		if var75 == nil then return end
		if p43 ~= nil and var75.ref ~= p43 then return end
		t[p42] = nil
		local var76 = var26(false)
		
		if var76.currentEntry ~= nil and var76.currentEntry.anchorId == p42 then
			refreshSurfaceForCurrentEntry()
		end
	end
	
	local var40 = false
	
	local function tryEnterNestedScope(p44) --[[ line: 510 ]]
		-- upvalues: var40 (write), var26 (ref), enumsModule (copy), entryStorageModule (copy), showTipAt (ref), whatsNewTelemetryModule (copy)
		if var40 then
			return false
		end
		local var77 = var26(false)
		
		if var77.surface == enumsModule.WhatsNewSurface.Idle or var77.currentEntry == nil or (var77.currentScopeTour == nil or var77.globalStepIndex == nil) then
			return false
		end
		local currentScopeTour = var77.currentScopeTour
		local gateway = var77.currentEntry.gateway
		
		if gateway == nil or p44.openActionKey ~= nil and gateway.openActionKey ~= p44.openActionKey then
			return false
		end
		local var78
		local scope = gateway.scope
		
		for i, v in scope.tourTips do
			local toShow = v.toShow
			
			if toShow then
				local id = entryStorageModule.getEntries()[v.id]
				toShow = not (id ~= nil and id.seen ~= nil)
			end
			if toShow then
				var78 = i
				if var78 == nil then
					return false
				end
				var40 = true
				local ok, status = pcall(function() --[[ line: 541 ]]
					-- upvalues: var77 (ref), currentScopeTour (ref), scope (ref), var78 (ref), showTipAt (copy), entryStorageModule (copy), whatsNewTelemetryModule (copy), var26 (copy)
					local cloned = table.clone(var77.scopeStack)
					table.insert(cloned, {
						parentTipIndex = var77.currentTipIndex,
						parentScopeTour = currentScopeTour,
						parentGlobalStepIndex = var77.globalStepIndex,
						parentGlobalTotalSteps = var77.globalTotalSteps
					})
					local var80 = scope.tourTips[var78]
					local t = { globalStepIndex = 0, scopeStack = cloned }
					local var82 = 0
					
					for i, v in scope.tourTips do
						local toShow = v.toShow
						
						if toShow then
							local id = entryStorageModule.getEntries()[v.id]
							toShow = not (id ~= nil and id.seen ~= nil)
						end
						if toShow then
							var82 += v.stepCount
						end
					end
					t.globalTotalSteps = var82
					showTipAt(scope, var78, var80, t)
					whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STARTED, var26(false), nil, whatsNewTelemetryModule.StartContext.GATEWAY)
				end)
				var40 = false
				
				if not ok then
					error(status)
				end
				return true
			end
		end
		var78 = nil
	end
	
	local function tryStartNestedFromIdle(p45) --[[ line: 570 ]]
		-- upvalues: var26 (ref), var24 (write), var22 (write), var23 (write), enumsModule (copy), loadWhatsNewRegistryModule (copy), findGatewayTipByOpenActionKey (copy), entryStorageModule (copy), showTipAt (ref), whatsNewTelemetryModule (copy)
		local screenScopeId = var26(false).screenScopeId
		
		if screenScopeId == "" then
			return false
		end
		assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		for i, v in enumsModule.TourTypeList do
			local var83 = var22[loadWhatsNewRegistryModule.makeRootTourKey(screenScopeId, v)]
			
			if var83 ~= nil then
				local var84 = findGatewayTipByOpenActionKey(var83.scopeTree, p45)
				local var85 = if var84 ~= nil then nil else var84.gateway
				
				if var85 ~= nil then
					local toShow, var86
					local scope = var85.scope
					
					for i_1, v_1 in scope.tourTips do
						toShow = v_1.toShow
						
						if toShow then
							local id = entryStorageModule.getEntries()[v_1.id]
							toShow = not (id ~= nil and id.seen ~= nil)
						end
						if toShow then
							var86 = i_1
							if var86 ~= nil then
								local var87 = scope.tourTips[var86]
								toShow = {
									globalStepIndex = 0,
									screenScopeId = screenScopeId,
									activeTourType = v,
									scopeStack = {}
								}
								local var88 = 0
								
								for i_2, v_2 in scope.tourTips do
									local toShow_1 = v_2.toShow
									
									if toShow_1 then
										local id = entryStorageModule.getEntries()[v_2.id]
										toShow_1 = not (id ~= nil and id.seen ~= nil)
									end
									if toShow_1 then
										var88 += v_2.stepCount
									end
								end
								toShow.globalTotalSteps = var88
								showTipAt(scope, var86, var87, toShow)
								whatsNewTelemetryModule.logTourLifecycle(whatsNewTelemetryModule.LifecycleType.TOUR_STARTED, var26(false), nil, whatsNewTelemetryModule.StartContext.IDLE)
								
								return true
							end
						end
					end
					var86 = nil
				end
			end
		end
		return false
	end
	
	local function notifyScopeOpened(p46) --[[ line: 610 ]]
		-- upvalues: var26 (ref), enumsModule (copy), tryStartNestedFromIdle (ref), entryStorageModule (copy), _DateTime (copy), tryEnterNestedScope (ref)
		local var89 = var26(false)
		
		if var89.surface == enumsModule.WhatsNewSurface.Idle then
			tryStartNestedFromIdle(p46)
			
			return
		elseif var89.currentEntry == nil then return end
		local currentEntry = var89.currentEntry
		local gateway = currentEntry.gateway
		
		if gateway == nil or gateway.openActionKey ~= p46 then return end
		if var89.currentScopeTour ~= nil and var89.currentScopeTour.id == gateway.scope.id then return end
		local var90
		for i, v in gateway.scope.tourTips do
			local toShow = v.toShow
			
			if toShow then
				local id = entryStorageModule.getEntries()[v.id]
				toShow = not (id ~= nil and id.seen ~= nil)
			end
			if toShow then
				var90 = i
				if var90 == nil then
					return
				end
				entryStorageModule.markSeen(currentEntry.id, _DateTime.now():ToIsoDate())
				tryEnterNestedScope({ openActionKey = p46 })
				
				return
			end
		end
		var90 = nil
	end
	
	local function notifyScopeClosed(p47) --[[ line: 643 ]]
		-- upvalues: var26 (ref), var31 (write), var40 (write), enumsModule (copy), completeTour (ref), var24 (write), var22 (write), var23 (write), loadWhatsNewRegistryModule (copy), findCloseActionKeyForScope (copy)
		local var91 = var26(false)
		
		if var31 or var40 or var91.surface == enumsModule.WhatsNewSurface.Idle then return end
		local scopeStack = var91.scopeStack
		local var92 = scopeStack[#scopeStack]
		
		if var92 == nil then
			local currentScopeTour = var91.currentScopeTour
			
			if currentScopeTour == nil or var91.activeTourType == nil or var91.screenScopeId == "" then return end
			assert(var24 and (var22 ~= nil and var23 ~= nil), "WhatsNew store not initialized. Call initialize first.")
			local screenScopeId = var22[loadWhatsNewRegistryModule.makeRootTourKey(var91.screenScopeId, var91.activeTourType)]
			
			if screenScopeId == nil then return end
			if findCloseActionKeyForScope(screenScopeId.scopeTree, currentScopeTour.id) == p47 then
				completeTour({ earlyDismiss = true })
				
				return
			end
			return
		else
			local parentTipIndex = var92.parentScopeTour.tourTips[var92.parentTipIndex]
			local gateway = parentTipIndex.gateway
			assert(gateway ~= nil, `parent tip '{parentTipIndex.id}' is missing gateway for scope stack frame`)
			
			if gateway.closeActionKey == p47 then
				completeTour({ earlyDismiss = true })
				
				return
			end
		end
	end
	
	return {
		initialize = function(p48) --[[ line: 754 ]]
			-- upvalues: var24 (write), var22 (write), var23 (write), notifyScopeOpened (ref), notifyScopeClosed (ref), var26 (ref)
			if var24 then
				return
			end
			var22 = p48.rootTourMap
			var23 = p48.scopeActions
			assert(var23 ~= nil, "scopeActions is required")
			var24 = true
			var23:startOpenStateWiring({
				notifyScopeOpened = notifyScopeOpened,
				notifyScopeClosed = notifyScopeClosed,
				getRuntimeStateSignal = var26
			})
		end,
		resetForTests = function() --[[ line: 769 ]]
			-- upvalues: var23 (write), var24 (write), var22 (write), t (ref), var27 (ref), createIdleState (copy)
			if var23 ~= nil then
				var23:stopOpenStateWiring()
			end
			var24 = false
			var22 = nil
			var23 = nil
			table.clear(t)
			var27(createIdleState(""))
		end,
		getRuntimeState = function() --[[ line: 784 ]]
			-- upvalues: var26 (ref)
			return var26(false)
		end,
		getRuntimeStateSignal = var26,
		getCurrentScope = function() --[[ line: 790 ]]
			-- upvalues: var26 (ref)
			return var26(false).currentScopeTour
		end,
		getCurrentEntry = function() --[[ line: 794 ]]
			-- upvalues: var26 (ref)
			return var26(false).currentEntry
		end,
		getGlobalStepIndex = function() --[[ line: 798 ]]
			-- upvalues: var26 (ref)
			return var26(false).globalStepIndex
		end,
		getGlobalTotalSteps = function() --[[ line: 802 ]]
			-- upvalues: var26 (ref)
			local var93 = var26(false)
			
			return if var93.activeTourType == nil then 0 else var93.globalTotalSteps
		end,
		registerAnchor = registerAnchor,
		getAnchorRef = getAnchorRef,
		setAnchorReady = setAnchorReady,
		unregisterAnchor = unregisterAnchor,
		startEligibleTour = startEligibleTour,
		startTour = startTour,
		stopTour = stopTour,
		next = function() --[[ line: 678 ]]
			-- upvalues: var26 (ref), enumsModule (copy), entryStorageModule (copy), _DateTime (copy), whatsNewTelemetryModule (copy), completeTour (ref), showTipAt (ref)
			local var94 = var26(false)
			
			if var94.surface == enumsModule.WhatsNewSurface.Idle then return end
			assert(var94.currentEntry ~= nil and (var94.currentScopeTour ~= nil and var94.globalStepIndex ~= nil), "next() called with inconsistent active tour state")
			local currentEntry = var94.currentEntry
			entryStorageModule.markSeen(currentEntry.id, _DateTime.now():ToIsoDate())
			whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.CLICK, currentEntry.id, whatsNewTelemetryModule.Button.NEXT, var94)
			local currentScopeTour = var94.currentScopeTour
			local var95 = var94.globalStepIndex + 1
			
			if var94.globalTotalSteps <= var95 then
				completeTour()
				
				return
			end
			local var96
			for i = var94.currentTipIndex + 1, #currentScopeTour.tourTips do
				if not currentScopeTour.tourTips[i].toShow then
					continue
				end
				var96 = i
				if var96 == nil then
					completeTour()
					
					return
				end
				showTipAt(currentScopeTour, var96, currentScopeTour.tourTips[var96], { globalStepIndex = var95 })
				
				return
			end
			var96 = nil
		end,
		back = function() --[[ line: 718 ]]
			-- upvalues: var26 (ref), enumsModule (copy), whatsNewTelemetryModule (copy), showTipAt (ref)
			local var97 = var26(false)
			
			if var97.surface == enumsModule.WhatsNewSurface.Idle then return end
			assert(var97.currentEntry ~= nil and (var97.currentScopeTour ~= nil and var97.globalStepIndex ~= nil), "back() called with inconsistent active tour state")
			
			if var97.globalStepIndex == 0 then return end
			local var99
			whatsNewTelemetryModule.logTourtipInteraction(whatsNewTelemetryModule.InteractionType.CLICK, var97.currentEntry.id, whatsNewTelemetryModule.Button.BACK, var97)
			local currentScopeTour = var97.currentScopeTour
			local var98 = var97.globalStepIndex - 1
			
			for i = var97.currentTipIndex - 1, 1, -1 do
				if not currentScopeTour.tourTips[i].toShow then
					continue
				end
				var99 = i
				if var99 == nil then
					assert(false, "back() cannot resolve previous tip at globalStepIndex > 0 within current scope")
					
					return
				end
				showTipAt(currentScopeTour, var99, currentScopeTour.tourTips[var99], { globalStepIndex = var98 })
				
				return
			end
			var99 = nil
		end,
		notifyScopeOpened = notifyScopeOpened,
		notifyScopeClosed = notifyScopeClosed,
		completeTour = completeTour
	}
end