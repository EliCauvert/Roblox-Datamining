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
local itemViewPresentationModule = require(viewRecycler.Core.Virtualizer.ItemViewPresentation)
local _ = require(viewRecycler.Core.RecyclingScope)
local virtualizerEngineModule = require(viewRecycler.Core.Virtualizer.VirtualizerEngine)

return function(p0) --[[ line: 75 | named "createVirtualizer" ]]
	-- upvalues: virtualizerEngineModule (ref), itemViewPresentationModule (ref), internal (ref), external (ref), virtualizerEffectTypeModule (ref), signalsModule (ref), virtualizerQueryTypeModule (ref)
	local var7 = virtualizerEngineModule({
		dataSource = p0.dataSource,
		layout = p0.layout,
		getRecyclableViewType = p0.getItemViewType,
		overscan = p0.overscan,
		overscanPolicy = p0.overscanPolicy,
		dataPrefetch = p0.dataPrefetch,
		contentAlignment = p0.contentAlignment,
		endThreshold = p0.endThreshold,
		preserveScrollPositionOnChange = p0.preserveScrollPositionOnChange,
		diagnostics = p0.diagnostics,
		isItemStickyHeader = p0.isItemStickyHeader,
		pinnedStartItem = p0.pinnedStartItem,
		pinnedEndItem = p0.pinnedEndItem
	})
	local var8 = itemViewPresentationModule({
		recyclingScope = p0.recyclingScope,
		prepareDesiredAssignment = p0.prepareItemViewDesiredAssignment,
		prepareItemViewAssignment = p0.prepareItemViewAssignment,
		postCommitItemViewAssignment = p0.postCommitItemViewAssignment,
		presentItemViewAssignment = p0.presentItemViewAssignment,
		applyItemViewPlacementIntent = p0.applyItemViewPlacementIntent
	})
	local dataSource = p0.dataSource
	local var9 = nil
	local var10 = false
	local var11 = p0.active == nil
	local var12 = false
	local var13 = false
	local var14 = false
	local t = {
		boundaryDropped = 0,
		trusted = true,
		type = internal.SubmitLogicalMeasurements,
		measurements = {}
	}
	local var16 = nil
	local var17 = nil
	
	local function _() --[[ line: 120 | named "subscribe" ]]
		-- upvalues: var9 (write), var10 (write), var13 (write), dataSource (write), var16 (write), internal (copy)
		if var9 == nil and var10 and not var13 then
			var9 = dataSource.subscribe(function(p1) --[[ line: 124 ]]
				-- upvalues: var16 (copy), internal (copy)
				var16(nil, { type = internal.ApplyDataSourceChange, changeBatch = p1 })
			end)
			
			return
		end
	end
	
	local _ = function() --[[ line: 132 | named "unsubscribe" ]]
		-- upvalues: var9 (write)
		if var9 ~= nil then
			var9()
			var9 = nil
		end
	end
	
	local function executeDispatch(p2, p3, p4) --[[ line: 139 ]]
		-- upvalues: external (copy), dataSource (write), var9 (write), var7 (ref), var10 (write), var13 (write), var16 (write), internal (copy), var11 (write), var8 (ref), var12 (write), virtualizerEffectTypeModule (copy)
		if p2 ~= nil and (p2.type == external.SetDataSource or p2.type == external.SetDataSourceAndLayout) then
			local dataSource_1 = p2.dataSource
			
			if dataSource_1 ~= dataSource then
				if var9 ~= nil then
					var9()
					var9 = nil
				end
				dataSource = dataSource_1
			end
		end
		local var19 = if p4 == nil then {
			result = nil,
			snapshot = p3,
			presentation = { assignmentsChanged = false, placementChanged = false },
			effects = {}
		} else var7.dispatch(p4)
		
		if p2 ~= nil and p2.type == external.Activate then
			var10 = true
			
			if var9 == nil and not var13 then
				var9 = dataSource.subscribe(function(p5) --[[ line: 124 ]]
					-- upvalues: var16 (copy), internal (copy)
					var16(nil, { type = internal.ApplyDataSourceChange, changeBatch = p5 })
				end)
			end
		elseif p2 == nil or p2.type ~= external.SetActive then
			if p2 == nil or p2.type ~= external.Destroy then
				local var20 = nil
				
				if var11 then
					local presentation = var19.presentation
					local snapshot = var19.snapshot
					
					if not var12 or presentation.assignmentsChanged or (presentation.placementChanged or p3.entries ~= snapshot.entries) or p3.contentStartOffset ~= snapshot.contentStartOffset then
						var20 = var8.apply(p3, snapshot, presentation)
						var12 = true
					end
				else
					var20 = var8.apply(p3, nil, { assignmentsChanged = true, placementChanged = true })
					var12 = false
				end
				if var20 ~= nil then
					for i, v in var20 do
						table.insert(var19.effects, { type = virtualizerEffectTypeModule.Diagnostic, event = v })
					end
				end
				if var9 == nil and var9 == nil and var10 then
					if var13 then
						return var19
					end
					var9 = dataSource.subscribe(function(p6) --[[ line: 124 ]]
						-- upvalues: var16 (copy), internal (copy)
						var16(nil, { type = internal.ApplyDataSourceChange, changeBatch = p6 })
					end)
				end
				return var19
			elseif var9 ~= nil then
				var9()
				var9 = nil
			end
			var8.destroy()
			var13 = true
			
			return var19
		else
			var11 = p2.active
		end
	end
	
	var16 = function(p7, p8) --[[ line: 211 ]]
		-- upvalues: external (copy), var8 (ref), t (ref), var17 (write), var14 (write), var13 (write), var7 (ref), executeDispatch (ref), p0 (ref), virtualizerEffectTypeModule (copy)
		if p8 == nil and p7 ~= nil then
			if p7.type == external.SubmitMeasurements then
				local var21, var22 = var8.validateMeasurements(p7.measurements)
				t.measurements = var21
				t.boundaryDropped = var22
				p8 = t
			elseif p7.type ~= external.SetActive then
				p8 = p7
			end
		end
		if p7 ~= nil and p7.type == external.Destroy and var17 ~= nil then
			var17()
			var17 = nil
		end
		assert(not var14, "Virtualizer: cannot mutate during a transaction")
		
		if var13 then
			assert(p7 ~= nil and p7.type == external.Destroy, "Virtualizer: cannot dispatch after destruction")
		end
		var14 = true
		local snapshot = var7.getSnapshot()
		local ok, status = pcall(executeDispatch, p7, snapshot, p8)
		var14 = false
		
		if not ok then
			error(status, 0)
		end
		if p0.diagnostics ~= nil then
			for i, v in status.effects do
				if v.type == virtualizerEffectTypeModule.Diagnostic then
					p0.diagnostics(v.event)
				end
			end
		end
		if p0.onUpdate ~= nil then
			p0.onUpdate(snapshot, status)
		end
		return status
	end
	
	if p0.active ~= nil then
		var17 = signalsModule.createEffect(function(p9) --[[ line: 255 ]]
			-- upvalues: var16 (write), external (copy), p0 (ref)
			var16({ type = external.SetActive, active = p0.active(p9) })
		end)
	end
	return {
		dispatch = var16,
		getSnapshot = var7.getSnapshot,
		query = function(p10) --[[ line: 263 ]]
			-- upvalues: virtualizerQueryTypeModule (copy), var8 (ref), var7 (ref)
			return if p10.type == virtualizerQueryTypeModule.GetItemViews then var8.getItemViews() elseif p10.type == virtualizerQueryTypeModule.GetPlacementIntent then var8.resolvePlacementIntent(p10.itemView) else var7.query(p10)
		end
	}
end