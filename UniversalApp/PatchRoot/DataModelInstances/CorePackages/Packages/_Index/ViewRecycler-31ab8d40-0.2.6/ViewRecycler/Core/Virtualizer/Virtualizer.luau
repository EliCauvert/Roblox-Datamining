local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataPrefetch)
local _ = require(ViewRecycler.Core.DataSource)
local _ = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Layout)
local _ = require(ViewRecycler.Core.OverscanPolicy)
local _ = require(ViewRecycler.Core.PinnedItems)
local _ = require(ViewRecycler.Core.Placement.PlacementTypes)
local _ = require(ViewRecycler.Core.Enums.ScrollAlignment)
local SignalsModule = require(ViewRecycler.Parent.Signals)
local _ = require(ViewRecycler.Core.Types)
local VirtualizerCommandTypeModule = require(ViewRecycler.Core.Enums.VirtualizerCommandType)
local External = VirtualizerCommandTypeModule.External
local Internal = VirtualizerCommandTypeModule.Internal
local VirtualizerEffectTypeModule = require(ViewRecycler.Core.Enums.VirtualizerEffectType)
local VirtualizerQueryTypeModule = require(ViewRecycler.Core.Enums.VirtualizerQueryType)
local _ = require(ViewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local ListPresentationModule = require(ViewRecycler.Core.Virtualizer.ListPresentation)
local _ = require(ViewRecycler.Core.RecyclingScope)
local VirtualizerEngineModule = require(ViewRecycler.Core.Virtualizer.VirtualizerEngine)

return function(p1)
	-- upvalues: VirtualizerEngineModule (copy), ListPresentationModule (copy), Internal (copy), External (copy), VirtualizerEffectTypeModule (copy), SignalsModule (copy), VirtualizerQueryTypeModule (copy)
	local RecyclingScope = p1.recyclingScope
	local VirtualizerEngineModuleResult = VirtualizerEngineModule({
		dataSource = p1.dataSource,
		layout = p1.layout,
		getRecyclableViewType = p1.getItemViewType,
		overscan = p1.overscan,
		overscanPolicy = p1.overscanPolicy,
		dataPrefetch = p1.dataPrefetch,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endThreshold,
		preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange,
		diagnostics = p1.diagnostics,
		isItemStickyHeader = p1.isItemStickyHeader,
		pinnedStartItem = p1.pinnedStartItem,
		pinnedEndItem = p1.pinnedEndItem
	})
	local ListPresentationModuleResult = ListPresentationModule({
		recyclingScope = RecyclingScope,
		prepareDesiredAssignment = p1.prepareDesiredAssignment,
		prepareAssignment = p1.prepareAssignment,
		postCommitAssignment = p1.postCommitAssignment,
		presentAssignment = p1.presentAssignment,
		applyPlacementIntent = p1.applyPlacementIntent
	})
	local DataSource = p1.dataSource
	local SubscribeResult: (() -> ())? = nil
	local Flag = false
	local NoActive = p1.active == nil
	local Flag1 = false
	local Flag2 = false
	local Flag3 = false
	local config = {
		boundaryDropped = 0,
		trusted = true,
		type = Internal.SubmitLogicalMeasurements,
		measurements = {}
	}
	local Callback = nil
	local Callback1: (() -> ())? = nil
	
	local function _()
		-- upvalues: SubscribeResult (ref), Flag (ref), Flag2 (ref), DataSource (ref), Callback (ref), Internal (upval)
		if SubscribeResult == nil and Flag and not Flag2 then
			SubscribeResult = DataSource.subscribe(function(ChangeBatch)
				-- upvalues: Callback (upval), Internal (upval)
				Callback(nil, {
					type = Internal.ApplyDataSourceChange,
					changeBatch = ChangeBatch
				})
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: SubscribeResult (ref)
		if SubscribeResult ~= nil then
			SubscribeResult()
			SubscribeResult = nil
		end
	end
	
	local function executeDispatch(p2, Snapshot, p3)
		-- upvalues: External (upval), DataSource (ref), SubscribeResult (ref), VirtualizerEngineModuleResult (copy), Flag (ref), Flag2 (ref), Callback (ref), Internal (upval), NoActive (ref), ListPresentationModuleResult (copy), Flag1 (ref), VirtualizerEffectTypeModule (upval)
		if p2 ~= nil and (p2.type == External.SetDataSource or p2.type == External.SetDataSourceAndLayout) then
			local DataSource1 = p2.dataSource
			
			if DataSource1 ~= DataSource then
				if SubscribeResult ~= nil then
					SubscribeResult()
					SubscribeResult = nil
				end
				DataSource = DataSource1
			end
		end
		local Config = if p3 == nil then {
			result = nil,
			snapshot = Snapshot,
			presentation = { assignmentsChanged = false, placementChanged = false },
			effects = {}
		} else VirtualizerEngineModuleResult.dispatch(p3)
		
		if p2 == nil or p2.type ~= External.Activate then
			if p2 == nil or p2.type ~= External.SetActive then
				if p2 ~= nil and p2.type == External.Destroy then
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					ListPresentationModuleResult.destroy()
					Flag2 = true
					
					return Config
				end
			else
				NoActive = p2.active
			end
		else
			Flag = true
			
			if SubscribeResult == nil and Flag and not Flag2 then
				SubscribeResult = DataSource.subscribe(function(ChangeBatch)
					-- upvalues: Callback (upval), Internal (upval)
					Callback(nil, {
						type = Internal.ApplyDataSourceChange,
						changeBatch = ChangeBatch
					})
				end)
			end
		end
		local ApplyResult = nil
		
		if NoActive then
			local Presentation = Config.presentation
			local Snapshot1 = Config.snapshot
			
			if not Flag1 or Presentation.assignmentsChanged or Presentation.placementChanged or Snapshot.entries ~= Snapshot1.entries or Snapshot.contentStartOffset ~= Snapshot1.contentStartOffset then
				ApplyResult = ListPresentationModuleResult.apply(Snapshot, Snapshot1, Presentation)
				Flag1 = true
			end
		else
			ApplyResult = ListPresentationModuleResult.apply(Snapshot, nil, { assignmentsChanged = true, placementChanged = true })
			Flag1 = false
		end
		if ApplyResult ~= nil then
			for _, Event in ApplyResult do
				table.insert(Config.effects, {
					type = VirtualizerEffectTypeModule.Diagnostic,
					event = Event
				})
			end
		end
		if SubscribeResult == nil and SubscribeResult == nil and Flag then
			if Flag2 then
				return Config
			end
			SubscribeResult = DataSource.subscribe(function(ChangeBatch)
				-- upvalues: Callback (upval), Internal (upval)
				Callback(nil, {
					type = Internal.ApplyDataSourceChange,
					changeBatch = ChangeBatch
				})
			end)
		end
		return Config
	end
	
	Callback = function(p4, p5)
		-- upvalues: External (upval), ListPresentationModuleResult (copy), config (copy), Callback1 (ref), Flag3 (ref), Flag2 (ref), VirtualizerEngineModuleResult (copy), executeDispatch (copy), p1 (copy), VirtualizerEffectTypeModule (upval)
		if p5 == nil and p4 ~= nil then
			if p4.type == External.SubmitMeasurements then
				config.measurements, config.boundaryDropped = ListPresentationModuleResult.validateMeasurements(p4.measurements)
				p5 = config
			elseif p4.type ~= External.SetActive then
				p5 = p4
			end
		end
		if p4 ~= nil and p4.type == External.Destroy and Callback1 ~= nil then
			Callback1()
			Callback1 = nil
		end
		assert(not Flag3, "Virtualizer: cannot mutate during a transaction")
		
		if Flag2 then
			assert(p4 ~= nil and p4.type == External.Destroy, "Virtualizer: cannot dispatch after destruction")
		end
		Flag3 = true
		local Snapshot = VirtualizerEngineModuleResult.getSnapshot()
		local Success, Result = pcall(executeDispatch, p4, Snapshot, p5)
		Flag3 = false
		
		if not Success then
			error(Result, 0)
		end
		if p1.diagnostics ~= nil then
			for _, effect in Result.effects do
				if effect.type == VirtualizerEffectTypeModule.Diagnostic then
					p1.diagnostics(effect.event)
				end
			end
		end
		if p1.onUpdate ~= nil then
			p1.onUpdate(Snapshot, Result)
		end
		return Result
	end
	
	if p1.active ~= nil then
		Callback1 = SignalsModule.createEffect(function(p6)
			-- upvalues: Callback (ref), External (upval), p1 (copy)
			Callback({ type = External.SetActive, active = p1.active(p6) })
		end)
	end
	return {
		dispatch = Callback,
		getSnapshot = VirtualizerEngineModuleResult.getSnapshot,
		query = function(p6)
			-- upvalues: VirtualizerQueryTypeModule (upval), ListPresentationModuleResult (copy), VirtualizerEngineModuleResult (copy)
			return if p6.type == VirtualizerQueryTypeModule.GetItemViews then ListPresentationModuleResult.getItemViews() elseif p6.type == VirtualizerQueryTypeModule.GetPlacementIntent then ListPresentationModuleResult.resolvePlacementIntent(p6.itemView) else VirtualizerEngineModuleResult.query(p6)
		end
	}
end