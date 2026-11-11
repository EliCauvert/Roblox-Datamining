local WhatsNew = script:FindFirstAncestor("WhatsNew")
local EnumsModule = require(WhatsNew.Enums)
local SignalsModule = require(WhatsNew.Parent.Signals)
local _ = require(WhatsNew.Types)
local TourTipCtaAccessModule = require(WhatsNew.TourTipCtaAccess)
local LoadWhatsNewRegistryModule = require(WhatsNew.registry.LoadWhatsNewRegistry)
local _ = require(WhatsNew.registry.ScopeActions)

local function createIdleState()
	-- upvalues: EnumsModule (copy)
	return {
		screenScopeId = "",
		activeTourType = nil,
		globalTotalSteps = 0,
		globalStepIndex = nil,
		currentScopeTour = nil,
		currentEntry = nil,
		currentTipIndex = 0,
		openMenu = nil,
		scopeStack = {},
		surface = EnumsModule.WhatsNewSurface.Idle
	}
end

local function tourHasEligibleTips(ScopeTree): boolean
	-- upvalues: TourTipCtaAccessModule (copy), EnumsModule (copy), tourHasEligibleTips (copy)
	for _, tourTip in ScopeTree.tourTips do
		if tourTip.toShow then
			return true
		end
		local WrapResult = TourTipCtaAccessModule.wrap(tourTip.cta)
		
		if WrapResult:getKind() == EnumsModule.TourTipCtaKind.Nested and tourHasEligibleTips(WrapResult:getScope()) then
			return true
		end
	end
	return false
end

local function _(p1)
	for i, tourTip in p1.tourTips do
		if tourTip.toShow then
			return i
		end
	end
	return nil
end

local _ = function(p2, p3): number?
	for i = p3, #p2.tourTips do
		if p2.tourTips[i].toShow then
			return i
		end
	end
	return nil
end

local _ = function(p4, p5): number?
	for i = p5, 1, -1 do
		if p4.tourTips[i].toShow then
			return i
		end
	end
	return nil
end

local function getCloseActionKeyForFrame(p6)
	-- upvalues: TourTipCtaAccessModule (copy)
	return TourTipCtaAccessModule.wrap(p6.parentScopeTour.tourTips[p6.parentTipIndex].cta):getCloseActionKey()
end

local _ = function(Tbl)
	local Entry = Tbl[#Tbl]
	local Copy = table.clone(Tbl)
	table.remove(Copy)
	
	return Entry, Copy
end

local _ = function(p6, Tbl)
	-- upvalues: getCloseActionKeyForFrame (copy)
	local Entry = Tbl[#Tbl]
	local Copy = table.clone(Tbl)
	table.remove(Copy)
	p6:invoke(getCloseActionKeyForFrame(Entry))
	
	return Entry, Copy
end

return function()
	-- upvalues: SignalsModule (copy), createIdleState (copy), EnumsModule (copy), getCloseActionKeyForFrame (copy), LoadWhatsNewRegistryModule (copy), tourHasEligibleTips (copy), TourTipCtaAccessModule (copy)
	local RootTourMap = nil
	local ScopeActions = nil
	local Flag = false
	
	local function _()
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
	end
	
	local _ = function()
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		
		return RootTourMap, ScopeActions
	end
	
	local Tbl = {}
	local Signal, Signal2 = SignalsModule.createSignal((createIdleState()))
	
	local _ = function(p6)
		-- upvalues: Tbl (copy), EnumsModule (upval)
		local Entry = Tbl[p6]
		
		return if Entry == nil or not Entry.isReady then EnumsModule.WhatsNewSurface.WaitingForAnchor else EnumsModule.WhatsNewSurface.TourTip
	end
	
	local function refreshSurfaceForCurrentEntry()
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
				openMenu = SignalResult.openMenu,
				surface = if Entry == nil or not Entry.isReady then EnumsModule.WhatsNewSurface.WaitingForAnchor else EnumsModule.WhatsNewSurface.TourTip
			})
			
			return
		end
	end
	
	local function showTipAt(CurrentScopeTour, CurrentTipIndex, TourTip, IdleState)
		-- upvalues: Signal (copy), Signal2 (copy), Tbl (copy), EnumsModule (upval)
		local SignalResult = Signal(false)
		local Entry = Tbl[TourTip.anchorId]
		Signal2({
			openMenu = nil,
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
	
	local function closeScopeStack(ScopeStack)
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), getCloseActionKeyForFrame (upval)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local ScopeActions1 = ScopeActions
		
		for i = #ScopeStack, 1, -1 do
			ScopeActions1:invoke(getCloseActionKeyForFrame(ScopeStack[i]))
		end
	end
	
	local function resumeAfterScopeEnd(Tbl, ParentScopeTour, ParentTipIndex: number, GlobalStepIndex)
		-- upvalues: showTipAt (copy), Signal2 (copy), createIdleState (upval), Flag (ref), RootTourMap (ref), ScopeActions (ref), getCloseActionKeyForFrame (upval), resumeAfterScopeEnd (copy)
		local CurrentTipIndex: number? = nil
		
		for i = ParentTipIndex + 1, #ParentScopeTour.tourTips do
			if not ParentScopeTour.tourTips[i].toShow then
				continue
			end
			CurrentTipIndex = i
			break
		end
		if CurrentTipIndex ~= nil then
			showTipAt(ParentScopeTour, CurrentTipIndex, ParentScopeTour.tourTips[CurrentTipIndex], { scopeStack = Tbl, globalStepIndex = GlobalStepIndex })
			
			return
		end
		if #Tbl == 0 then
			Signal2((createIdleState()))
			
			return
		else
			assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
			local ScopeActions1 = ScopeActions
			local Entry = Tbl[#Tbl]
			local Copy = table.clone(Tbl)
			table.remove(Copy)
			ScopeActions1:invoke(getCloseActionKeyForFrame(Entry))
			resumeAfterScopeEnd(Copy, Entry.parentScopeTour, Entry.parentTipIndex, GlobalStepIndex)
		end
	end
	
	local function startTour(ScreenScopeId, ActiveTourType)
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), LoadWhatsNewRegistryModule (upval), showTipAt (copy)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(ScreenScopeId, ActiveTourType)]
		
		if RootTour == nil or RootTour.globalTotalSteps == 0 then return end
		local CurrentTipIndex = nil
		
		for i, tourTip in RootTour.scopeTree.tourTips do
			if tourTip.toShow then
				CurrentTipIndex = i
				break
			end
		end
		if CurrentTipIndex ~= nil then
			showTipAt(RootTour.scopeTree, CurrentTipIndex, RootTour.scopeTree.tourTips[CurrentTipIndex], {
				globalStepIndex = 0,
				screenScopeId = ScreenScopeId,
				activeTourType = ActiveTourType,
				globalTotalSteps = RootTour.globalTotalSteps,
				scopeStack = {}
			})
			
			return
		end
	end
	
	local _ = function(ScreenScopeId, ActiveTourType): boolean
		-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), LoadWhatsNewRegistryModule (upval), tourHasEligibleTips (upval), startTour (copy)
		assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
		local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(ScreenScopeId, ActiveTourType)]
		
		if RootTour == nil or RootTour.globalTotalSteps <= 0 or not tourHasEligibleTips(RootTour.scopeTree) then
			return false
		else
			startTour(ScreenScopeId, ActiveTourType)
			
			return true
		end
	end
	
	return {
		initialize = function(p6)
			-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref)
			if not Flag then
				RootTourMap = p6.rootTourMap
				ScopeActions = p6.scopeActions
				Flag = true
				
				return
			end
		end,
		resetForTests = function()
			-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), Tbl (copy), Signal2 (copy), createIdleState (upval)
			Flag = false
			RootTourMap = nil
			ScopeActions = nil
			table.clear(Tbl)
			Signal2((createIdleState()))
		end,
		getRuntimeState = function()
			-- upvalues: Signal (copy)
			return Signal(false)
		end,
		getRuntimeStateSignal = Signal,
		getCurrentScope = function()
			-- upvalues: Signal (copy)
			return Signal(false).currentScopeTour
		end,
		getCurrentEntry = function()
			-- upvalues: Signal (copy)
			return Signal(false).currentEntry
		end,
		getOpenMenu = function()
			-- upvalues: Signal (copy)
			return Signal(false).openMenu
		end,
		getGlobalStepIndex = function()
			-- upvalues: Signal (copy)
			return Signal(false).globalStepIndex
		end,
		getGlobalTotalSteps = function()
			-- upvalues: Signal (copy)
			local SignalResult = Signal(false)
			
			return if SignalResult.activeTourType == nil then 0 else SignalResult.globalTotalSteps
		end,
		registerAnchor = function(AnchorId, Ref)
			-- upvalues: Tbl (copy), Signal (copy), refreshSurfaceForCurrentEntry (copy)
			if Tbl[AnchorId] ~= nil then
				warn(`WhatsNew anchor '{AnchorId}' is already registered; ignoring duplicate registration`)
				
				return
			end
			Tbl[AnchorId] = { isReady = false, ref = Ref }
			local SignalResult = Signal(false)
			
			if SignalResult.currentEntry ~= nil and SignalResult.currentEntry.anchorId == AnchorId then
				refreshSurfaceForCurrentEntry()
			end
		end,
		getAnchorRef = function(p6)
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p6]
			
			return if Entry == nil then nil else Entry.ref
		end,
		setAnchorReady = function(AnchorId, IsReady, Ref)
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
		unregisterAnchor = function(AnchorId, Ref)
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
		startEligibleTour = function(ScreenScopeId)
			-- upvalues: Flag (ref), RootTourMap (ref), ScopeActions (ref), EnumsModule (upval), LoadWhatsNewRegistryModule (upval), tourHasEligibleTips (upval), startTour (copy)
			assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
			
			for _, value in {
				EnumsModule.TourType.Onboarding,
				EnumsModule.TourType.WhatsNew
			} do
				assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
				local RootTour = RootTourMap[LoadWhatsNewRegistryModule.makeRootTourKey(ScreenScopeId, value)]
				local Flag1 = nil
				
				if RootTour == nil or RootTour.globalTotalSteps <= 0 or not tourHasEligibleTips(RootTour.scopeTree) then
					Flag1 = false
				else
					startTour(ScreenScopeId, value)
					Flag1 = true
				end
				if Flag1 then break end
			end
		end,
		startTour = startTour,
		stopTour = function()
			-- upvalues: Signal2 (copy), createIdleState (upval)
			Signal2((createIdleState()))
		end,
		next = function()
			-- upvalues: Signal (copy), EnumsModule (upval), TourTipCtaAccessModule (upval), Flag (ref), RootTourMap (ref), ScopeActions (ref), showTipAt (copy), closeScopeStack (copy), Signal2 (copy), createIdleState (upval), getCloseActionKeyForFrame (upval), resumeAfterScopeEnd (copy)
			local SignalResult = Signal(false)
			
			if SignalResult.surface == EnumsModule.WhatsNewSurface.Idle or SignalResult.surface == EnumsModule.WhatsNewSurface.UpdateMenu then return end
			assert(SignalResult.currentEntry ~= nil and (SignalResult.currentScopeTour ~= nil and SignalResult.globalStepIndex ~= nil), "next() called with inconsistent active tour state")
			local CurrentEntry = SignalResult.currentEntry
			local CurrentScopeTour = SignalResult.currentScopeTour
			local WrapResult = TourTipCtaAccessModule.wrap(CurrentEntry.cta)
			local Kind = WrapResult:getKind()
			
			if Kind == EnumsModule.TourTipCtaKind.Nested then
				local Scope = WrapResult:getScope()
				local CurrentTipIndex = nil
				
				for i, tourTip in Scope.tourTips do
					if tourTip.toShow then
						CurrentTipIndex = i
						break
					end
				end
				assert(CurrentTipIndex ~= nil, `nested tour tip '{CurrentEntry.id}' has no visible child tips; loader should not emit empty nested gateways`)
				assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
				ScopeActions:invoke(WrapResult:getOpenActionKey())
				local Copy = table.clone(SignalResult.scopeStack)
				table.insert(Copy, {
					parentTipIndex = SignalResult.currentTipIndex,
					parentScopeTour = CurrentScopeTour
				})
				showTipAt(Scope, CurrentTipIndex, Scope.tourTips[CurrentTipIndex], {
					scopeStack = Copy,
					globalStepIndex = SignalResult.globalStepIndex + 1
				})
				
				return
			else
				if Kind ~= EnumsModule.TourTipCtaKind.None then return end
				local NewGlobalStepIndex = SignalResult.globalStepIndex + 1
				
				if SignalResult.globalTotalSteps <= NewGlobalStepIndex then
					closeScopeStack(Signal(false).scopeStack)
					Signal2((createIdleState()))
					
					return
				end
				local CurrentTipIndex: number? = nil
				
				for i1 = SignalResult.currentTipIndex + 1, #CurrentScopeTour.tourTips do
					if not CurrentScopeTour.tourTips[i1].toShow then
						continue
					end
					CurrentTipIndex = i1
					break
				end
				if CurrentTipIndex ~= nil then
					showTipAt(CurrentScopeTour, CurrentTipIndex, CurrentScopeTour.tourTips[CurrentTipIndex], { globalStepIndex = NewGlobalStepIndex })
					
					return
				end
				if #SignalResult.scopeStack == 0 then
					closeScopeStack(Signal(false).scopeStack)
					Signal2((createIdleState()))
					
					return
				else
					assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
					local ScopeActions1 = ScopeActions
					local ScopeStack = SignalResult.scopeStack
					local ScopeStackEntry = ScopeStack[#ScopeStack]
					local Copy = table.clone(ScopeStack)
					table.remove(Copy)
					ScopeActions1:invoke(getCloseActionKeyForFrame(ScopeStackEntry))
					resumeAfterScopeEnd(Copy, ScopeStackEntry.parentScopeTour, ScopeStackEntry.parentTipIndex, NewGlobalStepIndex)
				end
			end
		end,
		back = function()
			-- upvalues: Signal (copy), EnumsModule (upval), showTipAt (copy), Flag (ref), RootTourMap (ref), ScopeActions (ref), getCloseActionKeyForFrame (upval)
			local SignalResult = Signal(false)
			
			if SignalResult.surface == EnumsModule.WhatsNewSurface.Idle or SignalResult.surface == EnumsModule.WhatsNewSurface.UpdateMenu then return end
			assert(SignalResult.currentEntry ~= nil and (SignalResult.currentScopeTour ~= nil and SignalResult.globalStepIndex ~= nil), "back() called with inconsistent active tour state")
			
			if SignalResult.globalStepIndex == 0 then return end
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
				assert(#SignalResult.scopeStack > 0, "back() cannot resolve previous tip at globalStepIndex > 0")
				assert(Flag and (RootTourMap ~= nil and ScopeActions ~= nil), "WhatsNew store not initialized. Call initialize first.")
				local ScopeActions1 = ScopeActions
				local ScopeStack = SignalResult.scopeStack
				local ScopeStackEntry = ScopeStack[#ScopeStack]
				local Copy = table.clone(ScopeStack)
				table.remove(Copy)
				ScopeActions1:invoke(getCloseActionKeyForFrame(ScopeStackEntry))
				showTipAt(ScopeStackEntry.parentScopeTour, ScopeStackEntry.parentTipIndex, ScopeStackEntry.parentScopeTour.tourTips[ScopeStackEntry.parentTipIndex], {
					scopeStack = Copy,
					globalStepIndex = GlobalStepIndexDelta
				})
				
				return
			else
				showTipAt(CurrentScopeTour, CurrentTipIndex, CurrentScopeTour.tourTips[CurrentTipIndex], { globalStepIndex = GlobalStepIndexDelta })
			end
		end,
		completeTour = function()
			-- upvalues: Signal (copy), closeScopeStack (copy), Signal2 (copy), createIdleState (upval)
			closeScopeStack(Signal(false).scopeStack)
			Signal2((createIdleState()))
		end,
		openUpdateMenu = function(_) end,
		closeUpdateMenu = function() end
	}
end