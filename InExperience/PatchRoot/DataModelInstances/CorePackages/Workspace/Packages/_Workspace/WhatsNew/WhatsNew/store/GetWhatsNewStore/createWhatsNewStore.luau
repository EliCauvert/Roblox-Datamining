local v1 = DateTime
local WhatsNew = script:FindFirstAncestor("WhatsNew")
local EnumsModule = require(WhatsNew.Enums)
local EntryStorageModule = require(WhatsNew.storage.EntryStorage)
local SignalsModule = require(WhatsNew.Parent.Signals)
local _ = require(WhatsNew.Types)
local WhatsNewTelemetryModule = require(WhatsNew.telemetry.WhatsNewTelemetry)
local LoadWhatsNewRegistryModule = require(WhatsNew.registry.LoadWhatsNewRegistry)
local _ = require(WhatsNew.registry.ScopeActions)

local function createIdleState(ScreenScopeId) --[[ Line: 30 ]]
	-- upvalues: EnumsModule (copy)
	return {
		activeTourType = nil,
		globalTotalSteps = 0,
		globalStepIndex = nil,
		currentScopeTour = nil,
		currentEntry = nil,
		currentTipIndex = 0,
		screenScopeId = ScreenScopeId,
		scopeStack = {},
		surface = EnumsModule.WhatsNewSurface.Idle
	}
end

local function _(p1): boolean --[[ Line: 45 | Named "hasBeenSeen" ]]
	-- upvalues: EntryStorageModule (copy)
	local Entry = EntryStorageModule.getEntries()[p1]
	
	return Entry ~= nil and Entry.seen ~= nil
end

local _ = function(p1) --[[ Line: 51 | Named "isEligibleForNewSession" ]]
	-- upvalues: EntryStorageModule (copy)
	local ToShow = p1.toShow
	
	if ToShow then
		local Entry = EntryStorageModule.getEntries()[p1.id]
		ToShow = not (Entry ~= nil and Entry.seen ~= nil)
	end
	return ToShow
end

local _ = function(p1): number --[[ Line: 55 | Named "countEligibleTips" ]]
	-- upvalues: EntryStorageModule (copy)
	local NewStepCount = 0
	
	for _, tourTip in p1.tourTips do
		local ToShow = tourTip.toShow
		
		if ToShow then
			local Entry = EntryStorageModule.getEntries()[tourTip.id]
			ToShow = not (Entry ~= nil and Entry.seen ~= nil)
		end
		if ToShow then
			NewStepCount += tourTip.stepCount
		end
	end
	return NewStepCount
end

local _ = function(p2): boolean --[[ Line: 66 | Named "tourHasEligibleRootTips" ]]
	-- upvalues: EntryStorageModule (copy)
	for _, tourTip in p2.tourTips do
		local ToShow = tourTip.toShow
		
		if ToShow then
			local Entry = EntryStorageModule.getEntries()[tourTip.id]
			ToShow = not (Entry ~= nil and Entry.seen ~= nil)
		end
		if ToShow then
			return true
		end
	end
	return false
end

local _ = function(p3) --[[ Line: 75 | Named "findFirstEligibleTipIndex" ]]
	-- upvalues: EntryStorageModule (copy)
	for i, tourTip in p3.tourTips do
		local ToShow = tourTip.toShow
		
		if ToShow then
			local Entry = EntryStorageModule.getEntries()[tourTip.id]
			ToShow = not (Entry ~= nil and Entry.seen ~= nil)
		end
		if ToShow then
			return i
		end
	end
	return nil
end

local _ = function(p4, p5): number? --[[ Line: 85 | Named "findNextVisibleTipIndexFrom" ]]
	for i = p5, #p4.tourTips do
		if p4.tourTips[i].toShow then
			return i
		end
	end
	return nil
end

local _ = function(p6, p7): number? --[[ Line: 94 | Named "findPreviousVisibleTipIndexFrom" ]]
	for i = p7, 1, -1 do
		if p6.tourTips[i].toShow then
			return i
		end
	end
	return nil
end

local function findGatewayTipByOpenActionKey(Scope, OpenActionKey) --[[ Line: 103 ]]
	-- upvalues: findGatewayTipByOpenActionKey (copy)
	local GatewayTipByOpenActionKey = nil
	for _, tourTip in Scope.tourTips do
		local Gateway = tourTip.gateway
		
		if Gateway ~= nil and Gateway.openActionKey == OpenActionKey then
			return tourTip
		end
		local NoGateway = Gateway == nil
		
		if not NoGateway then
			GatewayTipByOpenActionKey = findGatewayTipByOpenActionKey(Gateway.scope, OpenActionKey)
			NoGateway = GatewayTipByOpenActionKey == nil
		end
		if not NoGateway then
			return GatewayTipByOpenActionKey
		end
	end
	return nil
end

local function findCloseActionKeyForScope(ScopeTree, Id) --[[ Line: 119 ]]
	-- upvalues: findCloseActionKeyForScope (copy)
	local Gateway = nil
	local CloseActionKeyForScope = nil
	for _, tourTip in ScopeTree.tourTips do
		Gateway = tourTip.gateway
		
		if Gateway ~= nil then
			if Gateway.scope.id == Id then
				return Gateway.closeActionKey
			end
			CloseActionKeyForScope = findCloseActionKeyForScope(Gateway.scope, Id)
			
			if CloseActionKeyForScope ~= nil then
				return CloseActionKeyForScope
			end
		end
	end
	return nil
end

local _ = function(p8) --[[ Line: 135 | Named "getCloseActionKeyForFrame" ]]
	local TourTip = p8.parentScopeTour.tourTips[p8.parentTipIndex]
	local Gateway = TourTip.gateway
	assert(Gateway ~= nil, `parent tip '{TourTip.id}' is missing gateway for scope stack frame`)
	
	return Gateway.closeActionKey
end

local _ = function(Tbl) --[[ Line: 143 | Named "popScopeStack" ]]
	local Entry = Tbl[#Tbl]
	local Copy = table.clone(Tbl)
	table.remove(Copy)
	
	return Entry, Copy
end

local _ = function(p9) --[[ Line: 150 | Named "markEntrySeen" ]]
	-- upvalues: EntryStorageModule (copy), v1 (copy)
	EntryStorageModule.markSeen(p9, v1.now():ToIsoDate())
end

local function markTipsSeenFromCurrent(CurrentScopeTour, Id, Tbl) --[[ Line: 154 ]]
	-- upvalues: EntryStorageModule (copy), v1 (copy), WhatsNewTelemetryModule (copy)
	local Flag = false
	
	local function _(CurrentEntry) --[[ Line: 161 | Named "runtimeStateForTip" ]]
		-- upvalues: Tbl (copy)
		local Copy = table.clone(Tbl)
		Copy.currentEntry = CurrentEntry
		
		return Copy
	end
	
	for _, tourTip in CurrentScopeTour.tourTips do
		local IsIdMatch = tourTip.id == Id
		
		if IsIdMatch then
			Flag = true
		end
		if Flag then
			EntryStorageModule.markSeen(tourTip.id, v1.now():ToIsoDate())
			
			if not IsIdMatch then
				local Copy = table.clone(Tbl)
				Copy.currentEntry = tourTip
				WhatsNewTelemetryModule.logTourtipInteraction(WhatsNewTelemetryModule.InteractionType.SKIP, tourTip.id, nil, Copy, WhatsNewTelemetryModule.SkipReason.TOUR_ENDED_EARLY)
			end
		end
	end
end

return function() --[[ Line: 187 | Named "createWhatsNewStore" ]]
	-- upvalues: SignalsModule (copy), createIdleState (copy), EnumsModule (copy), WhatsNewTelemetryModule (copy), markTipsSeenFromCurrent (copy), LoadWhatsNewRegistryModule (copy), findCloseActionKeyForScope (copy), EntryStorageModule (copy), findGatewayTipByOpenActionKey (copy), v1 (copy)
	local RootTourMap = nil
	local ScopeActions = nil
	local Flag = false
	
	local function _() --[[ Line: 192 | Named "assertInitialized" ]]
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
	end
	
	local _ = function() --[[ Line: 196 | Named "getRootTourAndScopeActions" ]]
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		return RootTourMap, ScopeActions
	end
	
	local Tbl = {}
	local Signal, Signal2 = SignalsModule.createSignal((createIdleState("")))
	
	local _ = function(p9) --[[ Line: 204 | Named "resolveSurfaceForAnchor" ]]
		-- upvalues: Tbl (copy), EnumsModule (upval)
		local Entry = Tbl[p9]
		
		return if Entry == nil or not Entry.isReady then EnumsModule.WhatsNewSurface.WaitingForAnchor else EnumsModule.WhatsNewSurface.TourTip
	end
	
	local function refreshSurfaceForCurrentEntry() --[[ Line: 212 ]]
		-- upvalues: Signal (copy), Signal2 (copy), Tbl (copy), EnumsModule (upval)
		local SignalResult = Signal(false)
		local CurrentEntry = SignalResult.currentEntry
		
		if CurrentEntry ~= nil then
			local Entry = Tbl[CurrentEntry.anchorId]
			Signal2({
				scopeStack = SignalResult.scopeStack,
				screenScopeId = SignalResult.screenScopeId,
				activeTourType = SignalResult.activeTourType,
				globalTotalSteps = SignalResult.globalTotalSteps,
				globalStepIndex = SignalResult.globalStepIndex,
				currentScopeTour = SignalResult.currentScopeTour,
				currentEntry = CurrentEntry,
				currentTipIndex = SignalResult.currentTipIndex,
				surface = if Entry == nil or not Entry.isReady then EnumsModule.WhatsNewSurface.WaitingForAnchor else EnumsModule.WhatsNewSurface.TourTip
			})
			
			return
		end
	end
	
	local function showTipAt(CurrentScopeTour, CurrentTipIndex, TourTip, IdleState) --[[ Line: 231 ]]
		-- upvalues: Signal (copy), Signal2 (copy), Tbl (copy), EnumsModule (upval)
		local SignalResult = Signal(false)
		local Entry = Tbl[TourTip.anchorId]
		Signal2({
			screenScopeId = IdleState.screenScopeId or SignalResult.screenScopeId,
			activeTourType = if IdleState.activeTourType == nil then SignalResult.activeTourType else IdleState.activeTourType,
			globalTotalSteps = IdleState.globalTotalSteps or SignalResult.globalTotalSteps,
			globalStepIndex = if IdleState.globalStepIndex == nil then SignalResult.globalStepIndex else IdleState.globalStepIndex,
			currentScopeTour = CurrentScopeTour,
			currentEntry = TourTip,
			currentTipIndex = CurrentTipIndex,
			scopeStack = IdleState.scopeStack or SignalResult.scopeStack,
			surface = if Entry == nil or not Entry.isReady then EnumsModule.WhatsNewSurface.WaitingForAnchor else EnumsModule.WhatsNewSurface.TourTip
		})
	end
	
	local _ = function() --[[ Line: 257 | Named "resetToIdle" ]]
		-- upvalues: Signal2 (copy), createIdleState (upval), Signal (copy)
		Signal2((createIdleState(Signal(false).screenScopeId)))
	end
	
	local Flag1 = false
	
	local _ = function(p9, p10) --[[ Line: 277 | Named "invokeCloseAction" ]]
		-- upvalues: Flag1 (ref)
		Flag1 = true
		local Success, Result = pcall(function() --[[ Line: 279 ]]
			-- upvalues: p9 (copy), p10 (copy)
			p9:invoke(p10)
		end)
		Flag1 = false
		
		if not Success then
			error(Result)
		end
	end
	
	local _ = function(p9, Tbl) --[[ Line: 288 | Named "exitNestedScope" ]]
		-- upvalues: Flag1 (ref)
		local Entry = Tbl[#Tbl]
		local Copy = table.clone(Tbl)
		table.remove(Copy)
		local TourTip = Entry.parentScopeTour.tourTips[Entry.parentTipIndex]
		local Gateway = TourTip.gateway
		assert(Gateway ~= nil, `parent tip '{TourTip.id}' is missing gateway for scope stack frame`)
		local CloseActionKey = Gateway.closeActionKey
		Flag1 = true
		local Success, Result = pcall(function() --[[ Line: 279 ]]
			-- upvalues: p9 (copy), CloseActionKey (copy)
			p9:invoke(CloseActionKey)
		end)
		Flag1 = false
		
		if not Success then
			error(Result)
		end
		return Entry, Copy
	end
	
	local function markActiveScopeEndedEarly(IdleState) --[[ Line: 297 ]]
		-- upvalues: WhatsNewTelemetryModule (upval), markTipsSeenFromCurrent (upval)
		if IdleState.currentEntry ~= nil then
			WhatsNewTelemetryModule.logTourtipInteraction(WhatsNewTelemetryModule.InteractionType.DISMISS, IdleState.currentEntry.id, WhatsNewTelemetryModule.Button.CLOSE, IdleState)
		end
		local CurrentScopeTour = IdleState.currentScopeTour
		local CurrentEntry = IdleState.currentEntry
		
		if CurrentScopeTour ~= nil and CurrentEntry ~= nil then
			markTipsSeenFromCurrent(CurrentScopeTour, CurrentEntry.id, IdleState)
		end
		WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_STOPPED, IdleState, WhatsNewTelemetryModule.StopReason.DISMISS)
	end
	
	local function completeTour(p10) --[[ Line: 321 ]]
		-- upvalues: Signal (copy), EnumsModule (upval), markActiveScopeEndedEarly (copy), Flag (ref), RootTourMap (ref), ScopeActions (ref), WhatsNewTelemetryModule (upval), Flag1 (ref), showTipAt (copy), Signal2 (copy), createIdleState (upval), LoadWhatsNewRegistryModule (upval), findCloseActionKeyForScope (upval)
		local SignalResult = Signal(false)
		
		if SignalResult.surface == EnumsModule.WhatsNewSurface.Idle then return end
		local IsEarlyDismiss: boolean = p10 ~= nil and p10.earlyDismiss == true
		
		if IsEarlyDismiss then
			markActiveScopeEndedEarly(SignalResult)
		end
		local ScopeStack = SignalResult.scopeStack
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local ScopeActions1 = ScopeActions
		
		if #ScopeStack > 0 then
			local ScopeStackEntry = nil
			local CurrentTipIndex = nil
			if not IsEarlyDismiss then
				WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, SignalResult)
			end
			while #ScopeStack > 0 do
				ScopeStackEntry = ScopeStack[#ScopeStack]
				local Copy = table.clone(ScopeStack)
				table.remove(Copy)
				local TourTip = ScopeStackEntry.parentScopeTour.tourTips[ScopeStackEntry.parentTipIndex]
				local Gateway = TourTip.gateway
				assert(Gateway ~= nil, `parent tip '{TourTip.id}' is missing gateway for scope stack frame`)
				local CloseActionKey = Gateway.closeActionKey
				Flag1 = true
				local Success, Result = pcall(function() --[[ Line: 279 ]]
					-- upvalues: ScopeActions1 (copy), CloseActionKey (copy)
					ScopeActions1:invoke(CloseActionKey)
				end)
				Flag1 = false
				
				if not Success then
					error(Result)
				end
				ScopeStack = Copy
				local ParentScopeTour = ScopeStackEntry.parentScopeTour
				CurrentTipIndex = nil
				
				for i = ScopeStackEntry.parentTipIndex + 1, #ParentScopeTour.tourTips do
					if not ParentScopeTour.tourTips[i].toShow then
						continue
					end
					CurrentTipIndex = i
					break
				end
				if CurrentTipIndex ~= nil then
					showTipAt(ScopeStackEntry.parentScopeTour, CurrentTipIndex, ScopeStackEntry.parentScopeTour.tourTips[CurrentTipIndex], {
						scopeStack = ScopeStack,
						globalStepIndex = ScopeStackEntry.parentGlobalStepIndex + 1,
						globalTotalSteps = ScopeStackEntry.parentGlobalTotalSteps
					})
					
					return
				end
				WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, {
					screenScopeId = SignalResult.screenScopeId,
					activeTourType = SignalResult.activeTourType,
					globalTotalSteps = ScopeStackEntry.parentGlobalTotalSteps,
					globalStepIndex = ScopeStackEntry.parentGlobalStepIndex,
					currentScopeTour = ScopeStackEntry.parentScopeTour,
					currentEntry = ScopeStackEntry.parentScopeTour.tourTips[ScopeStackEntry.parentTipIndex],
					currentTipIndex = ScopeStackEntry.parentTipIndex,
					scopeStack = ScopeStack,
					surface = SignalResult.surface
				})
			end
			Signal2((createIdleState(Signal(false).screenScopeId)))
			
			return
		else
			if not IsEarlyDismiss then
				WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_COMPLETED, SignalResult)
			end
			local CurrentScopeTour = SignalResult.currentScopeTour
			
			if CurrentScopeTour ~= nil and SignalResult.activeTourType ~= nil and SignalResult.screenScopeId ~= "" then
				assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
				local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(SignalResult.screenScopeId, SignalResult.activeTourType)]
				
				if RootTour ~= nil then
					local CloseActionKeyForScope = findCloseActionKeyForScope(RootTour.scopeTree, CurrentScopeTour.id)
					
					if CloseActionKeyForScope ~= nil then
						Flag1 = true
						local Success1, Result1 = pcall(function() --[[ Line: 279 ]]
							-- upvalues: ScopeActions1 (copy), CloseActionKeyForScope (copy)
							ScopeActions1:invoke(CloseActionKeyForScope)
						end)
						Flag1 = false
						
						if not Success1 then
							error(Result1)
						end
					end
				end
			end
			Signal2((createIdleState(Signal(false).screenScopeId)))
		end
	end
	
	local function startTour(ScreenScopeId, ActiveTourType) --[[ Line: 395 ]]
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), LoadWhatsNewRegistryModule (upval), EntryStorageModule (upval), showTipAt (copy), WhatsNewTelemetryModule (upval), Signal (copy)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(ScreenScopeId, ActiveTourType)]
		
		if RootTour == nil then return end
		local v2 = nil
		
		for i, tourTip in RootTour.scopeTree.tourTips do
			local ToShow = tourTip.toShow
			
			if ToShow then
				local Entry = EntryStorageModule.getEntries()[tourTip.id]
				ToShow = not (Entry ~= nil and Entry.seen ~= nil)
			end
			if ToShow then
				v2 = i
				break
			end
		end
		if v2 == nil then return end
		local ScopeTree = RootTour.scopeTree
		local CurrentTipIndex = v2
		local TourTip = RootTour.scopeTree.tourTips[v2]
		local config = {
			globalStepIndex = 0,
			screenScopeId = ScreenScopeId,
			activeTourType = ActiveTourType
		}
		local NewStepCount = 0
		
		for _, tourTip1 in RootTour.scopeTree.tourTips do
			local ToShow = tourTip1.toShow
			
			if ToShow then
				local Entry = EntryStorageModule.getEntries()[tourTip1.id]
				ToShow = not (Entry ~= nil and Entry.seen ~= nil)
			end
			if ToShow then
				NewStepCount += tourTip1.stepCount
			end
		end
		config.globalTotalSteps = NewStepCount
		config.scopeStack = {}
		showTipAt(ScopeTree, CurrentTipIndex, TourTip, config)
		WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_STARTED, Signal(false), nil, WhatsNewTelemetryModule.StartContext.ROOT)
	end
	
	local _ = function(ScreenScopeId, ActiveTourType): boolean --[[ Line: 424 | Named "tryStartTour" ]]
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), LoadWhatsNewRegistryModule (upval), EntryStorageModule (upval), startTour (copy)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(ScreenScopeId, ActiveTourType)]
		
		if RootTour ~= nil then
			local Flag1 = false
			
			for _, tourTip in RootTour.scopeTree.tourTips do
				local ToShow = tourTip.toShow
				
				if ToShow then
					local Entry = EntryStorageModule.getEntries()[tourTip.id]
					ToShow = not (Entry ~= nil and Entry.seen ~= nil)
				end
				if ToShow then
					Flag1 = true
					break
				end
			end
			if Flag1 then
				startTour(ScreenScopeId, ActiveTourType)
				
				return true
			end
		end
		return false
	end
	
	local Flag2 = false
	
	local function tryEnterNestedScope(p11): boolean --[[ Line: 510 ]]
		-- upvalues: Flag2 (ref), Signal (copy), EnumsModule (upval), EntryStorageModule (upval), showTipAt (copy), WhatsNewTelemetryModule (upval)
		if Flag2 then
			return false
		end
		local SignalResult = Signal(false)
		
		if SignalResult.surface == EnumsModule.WhatsNewSurface.Idle or SignalResult.currentEntry == nil or SignalResult.currentScopeTour == nil or SignalResult.globalStepIndex == nil then
			return false
		end
		local CurrentScopeTour = SignalResult.currentScopeTour
		local Gateway = SignalResult.currentEntry.gateway
		
		if Gateway == nil or p11.openActionKey ~= nil and Gateway.openActionKey ~= p11.openActionKey then
			return false
		end
		local Scope = Gateway.scope
		local CurrentTipIndex = nil
		
		for i, tourTip in Scope.tourTips do
			local ToShow = tourTip.toShow
			
			if ToShow then
				local Entry = EntryStorageModule.getEntries()[tourTip.id]
				ToShow = not (Entry ~= nil and Entry.seen ~= nil)
			end
			if ToShow then
				CurrentTipIndex = i
				break
			end
		end
		if CurrentTipIndex == nil then
			return false
		end
		Flag2 = true
		local Success, Result = pcall(function() --[[ Line: 541 ]]
			-- upvalues: SignalResult (copy), CurrentScopeTour (copy), Scope (copy), CurrentTipIndex (copy), showTipAt (upval), EntryStorageModule (upval), WhatsNewTelemetryModule (upval), Signal (upval)
			local Copy = table.clone(SignalResult.scopeStack)
			table.insert(Copy, {
				parentTipIndex = SignalResult.currentTipIndex,
				parentScopeTour = CurrentScopeTour,
				parentGlobalStepIndex = SignalResult.globalStepIndex,
				parentGlobalTotalSteps = SignalResult.globalTotalSteps
			})
			local TourTip = Scope.tourTips[CurrentTipIndex]
			local config = { globalStepIndex = 0, scopeStack = Copy }
			local NewStepCount = 0
			
			for _, tourTip in Scope.tourTips do
				local ToShow = tourTip.toShow
				
				if ToShow then
					local Entry = EntryStorageModule.getEntries()[tourTip.id]
					ToShow = not (Entry ~= nil and Entry.seen ~= nil)
				end
				if ToShow then
					NewStepCount += tourTip.stepCount
				end
			end
			config.globalTotalSteps = NewStepCount
			showTipAt(Scope, CurrentTipIndex, TourTip, config)
			WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_STARTED, Signal(false), nil, WhatsNewTelemetryModule.StartContext.GATEWAY)
		end)
		Flag2 = false
		
		if not Success then
			error(Result)
		end
		return true
	end
	
	local function tryStartNestedFromIdle(OpenActionKey): boolean --[[ Line: 570 ]]
		-- upvalues: Signal (copy), Flag (ref), RootTourMap (ref), ScopeActions (ref), EnumsModule (upval), LoadWhatsNewRegistryModule (upval), findGatewayTipByOpenActionKey (upval), EntryStorageModule (upval), showTipAt (copy), WhatsNewTelemetryModule (upval)
		local ScreenScopeId = Signal(false).screenScopeId
		
		if ScreenScopeId == "" then
			return false
		end
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local RootTourMap1 = RootTourMap
		local v3 = nil
		local Scope = nil
		
		for _, ActiveTourType in EnumsModule.TourTypeList do
			local RootTour = RootTourMap1[LoadWhatsNewRegistryModule.makeRootTourKey(ScreenScopeId, ActiveTourType)]
			local NoRootTour = RootTour == nil
			local Gateway = nil
			
			if not NoRootTour then
				local GatewayTipByOpenActionKey = findGatewayTipByOpenActionKey(RootTour.scopeTree, OpenActionKey)
				Gateway = if GatewayTipByOpenActionKey == nil then nil else GatewayTipByOpenActionKey.gateway
				NoRootTour = Gateway == nil
			end
			if not NoRootTour then
				Scope = Gateway.scope
				v3 = nil
				
				for i, tourTip in Scope.tourTips do
					local ToShow = tourTip.toShow
					
					if ToShow then
						local Entry = EntryStorageModule.getEntries()[tourTip.id]
						ToShow = not (Entry ~= nil and Entry.seen ~= nil)
					end
					if ToShow then
						v3 = i
						break
					end
				end
				if v3 ~= nil then
					local CurrentTipIndex = v3
					local TourTip = Scope.tourTips[v3]
					local config = {
						globalStepIndex = 0,
						screenScopeId = ScreenScopeId,
						activeTourType = ActiveTourType,
						scopeStack = {}
					}
					local NewStepCount = 0
					
					for _, tourTip1 in Scope.tourTips do
						local ToShow = tourTip1.toShow
						
						if ToShow then
							local Entry = EntryStorageModule.getEntries()[tourTip1.id]
							ToShow = not (Entry ~= nil and Entry.seen ~= nil)
						end
						if ToShow then
							NewStepCount += tourTip1.stepCount
						end
					end
					config.globalTotalSteps = NewStepCount
					showTipAt(Scope, CurrentTipIndex, TourTip, config)
					WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_STARTED, Signal(false), nil, WhatsNewTelemetryModule.StartContext.IDLE)
					
					return true
				end
			end
		end
		return false
	end
	
	local function notifyScopeOpened(OpenActionKey) --[[ Line: 610 ]]
		-- upvalues: Signal (copy), EnumsModule (upval), tryStartNestedFromIdle (copy), EntryStorageModule (upval), v1 (upval), tryEnterNestedScope (copy)
		local SignalResult = Signal(false)
		
		if SignalResult.surface == EnumsModule.WhatsNewSurface.Idle then
			tryStartNestedFromIdle(OpenActionKey)
			
			return
		end
		if SignalResult.currentEntry == nil then return end
		local CurrentEntry = SignalResult.currentEntry
		local Gateway = CurrentEntry.gateway
		
		if Gateway == nil or Gateway.openActionKey ~= OpenActionKey then return end
		if SignalResult.currentScopeTour ~= nil and SignalResult.currentScopeTour.id == Gateway.scope.id then return end
		local v4 = nil
		
		for i, tourTip in Gateway.scope.tourTips do
			local ToShow = tourTip.toShow
			
			if ToShow then
				local Entry = EntryStorageModule.getEntries()[tourTip.id]
				ToShow = not (Entry ~= nil and Entry.seen ~= nil)
			end
			if ToShow then
				v4 = i
				break
			end
		end
		if v4 ~= nil then
			EntryStorageModule.markSeen(CurrentEntry.id, v1.now():ToIsoDate())
			tryEnterNestedScope({ openActionKey = OpenActionKey })
			
			return
		end
	end
	
	local function notifyScopeClosed(CloseActionKey) --[[ Line: 643 ]]
		-- upvalues: Signal (copy), Flag1 (ref), Flag2 (ref), EnumsModule (upval), completeTour (copy), Flag (ref), RootTourMap (ref), ScopeActions (ref), LoadWhatsNewRegistryModule (upval), findCloseActionKeyForScope (upval)
		local SignalResult = Signal(false)
		
		if Flag1 or Flag2 or SignalResult.surface == EnumsModule.WhatsNewSurface.Idle then return end
		local ScopeStack = SignalResult.scopeStack
		local ScopeStackEntry = ScopeStack[#ScopeStack]
		
		if ScopeStackEntry == nil then
			local CurrentScopeTour = SignalResult.currentScopeTour
			
			if CurrentScopeTour == nil or SignalResult.activeTourType == nil or SignalResult.screenScopeId == "" then return end
			assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
			local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(SignalResult.screenScopeId, SignalResult.activeTourType)]
			
			if RootTour == nil then return end
			if findCloseActionKeyForScope(RootTour.scopeTree, CurrentScopeTour.id) == CloseActionKey then
				completeTour({ earlyDismiss = true })
				
				return
			end
			return
		else
			local TourTip = ScopeStackEntry.parentScopeTour.tourTips[ScopeStackEntry.parentTipIndex]
			local Gateway = TourTip.gateway
			assert(Gateway ~= nil, `parent tip '{TourTip.id}' is missing gateway for scope stack frame`)
			
			if Gateway.closeActionKey == CloseActionKey then
				completeTour({ earlyDismiss = true })
				
				return
			end
		end
	end
	
	return {
		initialize = function(p12) --[[ Line: 754 ]]
			-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), notifyScopeOpened (copy), notifyScopeClosed (copy), Signal (copy)
			if not Flag then
				RootTourMap = p12.rootTourMap
				ScopeActions = p12.scopeActions
				assert(ScopeActions ~= nil, "scopeActions is required")
				Flag = true
				ScopeActions:startOpenStateWiring({
					notifyScopeOpened = notifyScopeOpened,
					notifyScopeClosed = notifyScopeClosed,
					getRuntimeStateSignal = Signal
				})
				
				return
			end
		end,
		resetForTests = function() --[[ Line: 769 ]]
			-- upvalues: ScopeActions (ref), Flag (ref), RootTourMap (ref), Tbl (copy), Signal2 (copy), createIdleState (upval)
			if ScopeActions ~= nil then
				ScopeActions:stopOpenStateWiring()
			end
			Flag = false
			RootTourMap = nil
			ScopeActions = nil
			table.clear(Tbl)
			Signal2((createIdleState("")))
		end,
		getRuntimeState = function() --[[ Line: 784 ]]
			-- upvalues: Signal (copy)
			return Signal(false)
		end,
		getRuntimeStateSignal = Signal,
		getCurrentScope = function() --[[ Line: 790 ]]
			-- upvalues: Signal (copy)
			return Signal(false).currentScopeTour
		end,
		getCurrentEntry = function() --[[ Line: 794 ]]
			-- upvalues: Signal (copy)
			return Signal(false).currentEntry
		end,
		getGlobalStepIndex = function() --[[ Line: 798 ]]
			-- upvalues: Signal (copy)
			return Signal(false).globalStepIndex
		end,
		getGlobalTotalSteps = function() --[[ Line: 802 ]]
			-- upvalues: Signal (copy)
			local SignalResult = Signal(false)
			
			return if SignalResult.activeTourType == nil then 0 else SignalResult.globalTotalSteps
		end,
		registerAnchor = function(AnchorId, Ref) --[[ Line: 449 ]]
			-- upvalues: Tbl (copy), Signal (copy), refreshSurfaceForCurrentEntry (copy)
			local Entry = Tbl[AnchorId]
			
			if Entry ~= nil and Entry.ref == Ref then return end
			if Entry ~= nil and Entry.ref.Parent ~= nil then
				warn(`WhatsNew anchor '{AnchorId}' is already registered; replacing with new registration`)
			end
			Tbl[AnchorId] = { isReady = false, ref = Ref }
			local SignalResult = Signal(false)
			
			if SignalResult.currentEntry ~= nil and SignalResult.currentEntry.anchorId == AnchorId then
				refreshSurfaceForCurrentEntry()
			end
		end,
		getAnchorRef = function(p12) --[[ Line: 469 ]]
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p12]
			
			return if Entry == nil then nil else Entry.ref
		end,
		setAnchorReady = function(AnchorId, IsReady, Ref) --[[ Line: 477 ]]
			-- upvalues: Tbl (copy), Signal (copy), refreshSurfaceForCurrentEntry (copy)
			local Entry = Tbl[AnchorId]
			
			if Entry == nil then return end
			if Ref ~= nil and Entry.ref ~= Ref then return end
			Entry.isReady = IsReady
			local SignalResult = Signal(false)
			
			if SignalResult.currentEntry ~= nil and SignalResult.currentEntry.anchorId == AnchorId then
				refreshSurfaceForCurrentEntry()
			end
		end,
		unregisterAnchor = function(AnchorId, Ref) --[[ Line: 492 ]]
			-- upvalues: Tbl (copy), Signal (copy), refreshSurfaceForCurrentEntry (copy)
			local Entry = Tbl[AnchorId]
			
			if Entry == nil then return end
			if Ref ~= nil and Entry.ref ~= Ref then return end
			Tbl[AnchorId] = nil
			local SignalResult = Signal(false)
			
			if SignalResult.currentEntry ~= nil and SignalResult.currentEntry.anchorId == AnchorId then
				refreshSurfaceForCurrentEntry()
			end
		end,
		startEligibleTour = function(ScreenScopeId) --[[ Line: 434 ]]
			-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), Signal (copy), EnumsModule (upval), Signal2 (copy), createIdleState (upval), LoadWhatsNewRegistryModule (upval), EntryStorageModule (upval), startTour (copy)
			assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
			
			if Signal(false).surface == EnumsModule.WhatsNewSurface.Idle then
				Signal2((createIdleState(ScreenScopeId)))
			end
			local Flag1 = nil
			for _, value in EnumsModule.TourTypeList do
				assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
				local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(ScreenScopeId, value)]
				local Flag2 = nil
				
				if RootTour ~= nil then
					Flag1 = false
					
					for _, tourTip in RootTour.scopeTree.tourTips do
						local ToShow = tourTip.toShow
						
						if ToShow then
							local Entry = EntryStorageModule.getEntries()[tourTip.id]
							ToShow = not (Entry ~= nil and Entry.seen ~= nil)
						end
						if ToShow then
							Flag1 = true
							break
						end
					end
					if Flag1 then
						startTour(ScreenScopeId, value)
						Flag2 = true
						if Flag2 then break end
						continue
					end
				end
				Flag2 = false
			end
		end,
		startTour = startTour,
		stopTour = function() --[[ Line: 261 ]]
			-- upvalues: Signal (copy), EnumsModule (upval), WhatsNewTelemetryModule (upval), Signal2 (copy), createIdleState (upval)
			local SignalResult = Signal(false)
			
			if SignalResult.surface ~= EnumsModule.WhatsNewSurface.Idle then
				WhatsNewTelemetryModule.logTourLifecycle(WhatsNewTelemetryModule.LifecycleType.TOUR_STOPPED, SignalResult, WhatsNewTelemetryModule.StopReason.ABORT)
			end
			Signal2((createIdleState(Signal(false).screenScopeId)))
		end,
		next = function() --[[ Line: 678 ]]
			-- upvalues: Signal (copy), EnumsModule (upval), EntryStorageModule (upval), v1 (upval), WhatsNewTelemetryModule (upval), completeTour (copy), showTipAt (copy)
			local SignalResult = Signal(false)
			
			if SignalResult.surface == EnumsModule.WhatsNewSurface.Idle then return end
			assert(SignalResult.currentEntry ~= nil and (SignalResult.currentScopeTour ~= nil and SignalResult.globalStepIndex ~= nil), "next() called with inconsistent active tour state")
			local CurrentEntry = SignalResult.currentEntry
			EntryStorageModule.markSeen(CurrentEntry.id, v1.now():ToIsoDate())
			WhatsNewTelemetryModule.logTourtipInteraction(WhatsNewTelemetryModule.InteractionType.CLICK, CurrentEntry.id, WhatsNewTelemetryModule.Button.NEXT, SignalResult)
			local CurrentScopeTour = SignalResult.currentScopeTour
			local NewGlobalStepIndex = SignalResult.globalStepIndex + 1
			
			if SignalResult.globalTotalSteps <= NewGlobalStepIndex then
				completeTour()
				
				return
			end
			local CurrentTipIndex: number? = nil
			
			for i = SignalResult.currentTipIndex + 1, #CurrentScopeTour.tourTips do
				if not CurrentScopeTour.tourTips[i].toShow then
					continue
				end
				CurrentTipIndex = i
				break
			end
			if CurrentTipIndex == nil then
				completeTour()
				
				return
			else
				showTipAt(CurrentScopeTour, CurrentTipIndex, CurrentScopeTour.tourTips[CurrentTipIndex], { globalStepIndex = NewGlobalStepIndex })
			end
		end,
		back = function() --[[ Line: 718 ]]
			-- upvalues: Signal (copy), EnumsModule (upval), WhatsNewTelemetryModule (upval), showTipAt (copy)
			local SignalResult = Signal(false)
			
			if SignalResult.surface == EnumsModule.WhatsNewSurface.Idle then return end
			assert(SignalResult.currentEntry ~= nil and (SignalResult.currentScopeTour ~= nil and SignalResult.globalStepIndex ~= nil), "back() called with inconsistent active tour state")
			
			if SignalResult.globalStepIndex == 0 then return end
			WhatsNewTelemetryModule.logTourtipInteraction(WhatsNewTelemetryModule.InteractionType.CLICK, SignalResult.currentEntry.id, WhatsNewTelemetryModule.Button.BACK, SignalResult)
			local CurrentScopeTour = SignalResult.currentScopeTour
			local GlobalStepIndexDelta = SignalResult.globalStepIndex - 1
			local CurrentTipIndex: number? = nil
			
			for i = SignalResult.currentTipIndex - 1, 1, -1 do
				if not CurrentScopeTour.tourTips[i].toShow then
					continue
				end
				CurrentTipIndex = i
				break
			end
			if CurrentTipIndex == nil then
				assert(false, "back() cannot resolve previous tip at globalStepIndex > 0 within current scope")
				
				return
			else
				showTipAt(CurrentScopeTour, CurrentTipIndex, CurrentScopeTour.tourTips[CurrentTipIndex], { globalStepIndex = GlobalStepIndexDelta })
			end
		end,
		notifyScopeOpened = notifyScopeOpened,
		notifyScopeClosed = notifyScopeClosed,
		completeTour = completeTour
	}
end