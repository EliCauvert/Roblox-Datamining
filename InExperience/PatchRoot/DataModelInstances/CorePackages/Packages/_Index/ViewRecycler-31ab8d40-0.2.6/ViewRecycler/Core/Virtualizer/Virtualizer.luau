local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataPrefetch)
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Layout)
local _ = require(viewRecycler.Core.OverscanPolicy)
local _ = require(viewRecycler.Core.PinnedItems)
local _ = require(viewRecycler.Core.Placement.PlacementTypes)
local _ = require(viewRecycler.Core.Enums.ScrollAlignment)
local signalsModule = require(viewRecycler.Parent.Signals)
local _ = require(viewRecycler.Core.Types)
local virtualizerCommandTypeModule = require(viewRecycler.Core.Enums.VirtualizerCommandType)
local external = virtualizerCommandTypeModule.External
local internal = virtualizerCommandTypeModule.Internal
local virtualizerEffectTypeModule = require(viewRecycler.Core.Enums.VirtualizerEffectType)
local virtualizerQueryTypeModule = require(viewRecycler.Core.Enums.VirtualizerQueryType)
local _ = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local listPresentationModule = require(viewRecycler.Core.Virtualizer.ListPresentation)
local _ = require(viewRecycler.Core.RecyclingScope)
local virtualizerEngineModule = require(viewRecycler.Core.Virtualizer.VirtualizerEngine)

return function(p1)
	-- upvalues: virtualizerEngineModule (ref), listPresentationModule (ref), internal (ref), external (ref), virtualizerEffectTypeModule (ref), signalsModule (ref), virtualizerQueryTypeModule (ref)
	local var1 = virtualizerEngineModule({
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
	local var2 = listPresentationModule({
		recyclingScope = p1.recyclingScope,
		prepareDesiredAssignment = p1.prepareDesiredAssignment,
		prepareAssignment = p1.prepareAssignment,
		postCommitAssignment = p1.postCommitAssignment,
		presentAssignment = p1.presentAssignment,
		applyPlacementIntent = p1.applyPlacementIntent
	})
	local dataSource = p1.dataSource
	local var3 = nil
	local var4 = false
	local var5 = p1.active == nil
	local var6 = false
	local var7 = false
	local var8 = false
	local t = {
		boundaryDropped = 0,
		trusted = true,
		type = internal.SubmitLogicalMeasurements,
		measurements = {}
	}
	local var9 = nil
	local var10 = nil
	
	local function _()
		-- upvalues: var3 (write), var4 (write), var7 (write), dataSource (write), var9 (write), internal (copy)
		if var3 == nil and var4 and not var7 then
			var3 = dataSource.subscribe(function(p2)
				-- upvalues: var9 (copy), internal (copy)
				var9(nil, { type = internal.ApplyDataSourceChange, changeBatch = p2 })
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var3 (write)
		if var3 ~= nil then
			var3()
			var3 = nil
		end
	end
	
	local function executeDispatch(p2, p3, p4)
		-- upvalues: external (copy), dataSource (write), var3 (write), var1 (ref), var4 (write), var7 (write), var9 (write), internal (copy), var5 (write), var2 (ref), var6 (write), virtualizerEffectTypeModule (copy)
		if p2 ~= nil and (p2.type == external.SetDataSource or p2.type == external.SetDataSourceAndLayout) then
			local dataSource_1 = p2.dataSource
			
			if dataSource_1 ~= dataSource then
				if var3 ~= nil then
					var3()
					var3 = nil
				end
				dataSource = dataSource_1
			end
		end
		local var11 = if p4 == nil then {
			result = nil,
			snapshot = p3,
			presentation = { assignmentsChanged = false, placementChanged = false },
			effects = {}
		} else var1.dispatch(p4)
		
		if p2 ~= nil and p2.type == external.Activate then
			var4 = true
			
			if var3 == nil and not var7 then
				var3 = dataSource.subscribe(function(p5)
					-- upvalues: var9 (copy), internal (copy)
					var9(nil, { type = internal.ApplyDataSourceChange, changeBatch = p5 })
				end)
			end
		elseif p2 == nil or p2.type ~= external.SetActive then
			if p2 == nil or p2.type ~= external.Destroy then
				local var12 = nil
				
				if var5 then
					local presentation = var11.presentation
					local snapshot = var11.snapshot
					
					if not var6 or presentation.assignmentsChanged or (presentation.placementChanged or p3.entries ~= snapshot.entries) or p3.contentStartOffset ~= snapshot.contentStartOffset then
						var12 = var2.apply(p3, snapshot, presentation)
						var6 = true
					end
				else
					var12 = var2.apply(p3, nil, { assignmentsChanged = true, placementChanged = true })
					var6 = false
				end
				if var12 ~= nil then
					for i, v in var12 do
						table.insert(var11.effects, { type = virtualizerEffectTypeModule.Diagnostic, event = v })
					end
				end
				if var3 == nil and var3 == nil and var4 then
					if var7 then
						return var11
					end
					var3 = dataSource.subscribe(function(p5)
						-- upvalues: var9 (copy), internal (copy)
						var9(nil, { type = internal.ApplyDataSourceChange, changeBatch = p5 })
					end)
				end
				return var11
			elseif var3 ~= nil then
				var3()
				var3 = nil
			end
			var2.destroy()
			var7 = true
			
			return var11
		else
			var5 = p2.active
		end
	end
	
	var9 = function(p5, p6)
		-- upvalues: external (copy), var2 (ref), t (ref), var10 (write), var8 (write), var7 (write), var1 (ref), executeDispatch (ref), p1 (ref), virtualizerEffectTypeModule (copy)
		if p6 == nil and p5 ~= nil then
			if p5.type == external.SubmitMeasurements then
				local var13, var14 = var2.validateMeasurements(p5.measurements)
				t.measurements = var13
				t.boundaryDropped = var14
				p6 = t
			elseif p5.type ~= external.SetActive then
				p6 = p5
			end
		end
		if p5 ~= nil and p5.type == external.Destroy and var10 ~= nil then
			var10()
			var10 = nil
		end
		assert(not var8, "Virtualizer: cannot mutate during a transaction")
		
		if var7 then
			assert(p5 ~= nil and p5.type == external.Destroy, "Virtualizer: cannot dispatch after destruction")
		end
		var8 = true
		local snapshot = var1.getSnapshot()
		local ok, status = pcall(executeDispatch, p5, snapshot, p6)
		var8 = false
		
		if not ok then
			error(status, 0)
		end
		if p1.diagnostics ~= nil then
			for i, v in status.effects do
				if v.type == virtualizerEffectTypeModule.Diagnostic then
					p1.diagnostics(v.event)
				end
			end
		end
		if p1.onUpdate ~= nil then
			p1.onUpdate(snapshot, status)
		end
		return status
	end
	
	if p1.active ~= nil then
		var10 = signalsModule.createEffect(function(p7)
			-- upvalues: var9 (write), external (copy), p1 (ref)
			var9({ type = external.SetActive, active = p1.active(p7) })
		end)
	end
	return {
		dispatch = var9,
		getSnapshot = var1.getSnapshot,
		query = function(p7)
			-- upvalues: virtualizerQueryTypeModule (copy), var2 (ref), var1 (ref)
			return if p7.type == virtualizerQueryTypeModule.GetItemViews then var2.getItemViews() elseif p7.type == virtualizerQueryTypeModule.GetPlacementIntent then var2.resolvePlacementIntent(p7.itemView) else var1.query(p7)
		end
	}
end