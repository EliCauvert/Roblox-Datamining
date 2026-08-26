local function createCounters()
	local t = {
		visibleRangeChanges = 0,
		renderedRangeChanges = 0,
		poolCreates = 0,
		poolAcquires = 0,
		poolReleases = 0,
		poolEvictions = 0,
		peakItemViews = 0,
		synchronizations = 0,
		retainedAssignments = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0,
		droppedMeasurements = 0,
		scrollCorrections = 0
	}
	local var1 = 0
	
	return t, function(p1)
		-- upvalues: t (ref), var1 (write)
		if p1.kind == "rangeChanged" then
			if p1.rangeKind == "visible" then
				t.visibleRangeChanges += 1
				
				return
			end
			t.renderedRangeChanges += 1
			
			return
		elseif p1.kind == "poolChanged" then
			if p1.action == "create" then
				t.poolCreates += 1
			elseif p1.action == "acquire" then
				t.poolAcquires += 1
			elseif p1.action == "release" then
				t.poolReleases += 1
			else
				t.poolEvictions += 1
			end
			var1 += p1.totalDelta
			t.peakItemViews = math.max(t.peakItemViews, var1)
			
			return
		elseif p1.kind == "itemViewsSynchronized" then
			t.synchronizations += 1
			t.retainedAssignments += p1.retained
			t.reassignedAssignments += p1.reassigned
			t.acquiredAssignments += p1.acquired
			t.releasedAssignments += p1.released
			
			return
		elseif p1.kind == "measurementsProcessed" then
			t.acceptedMeasurements += p1.accepted
			t.droppedMeasurements += p1.dropped
			
			return
		elseif p1.kind == "scrollCorrection" then
			t.scrollCorrections += 1
		end
	end
end

local function values(p1)
	local list = table.create(p1)
	
	for i = 1, p1 do
		list[i] = {
			id = `item{i}`,
			kind = if i % 10 == 0 then "header" else "row"
		}
	end
	return list
end

local function runScenario(p2, p3)
	-- upvalues: createCounters (ref), values (ref)
	local var1, var2 = createCounters()
	local var3 = p2.DataSource.sequence(values(100), function(p4)
		return p4.id
	end)
	local var4 = if p3 then p2.Layout.measured({ estimatedItemLength = 40 }) else p2.Layout.uniform({ itemLength = 40 })
	local var5 = 0
	local var6 = p2.Adapter.createRecyclingScope({
		maxPoolSize = 2,
		adapter = {
			create = function()
				-- upvalues: var5 (write)
				var5 += 1
				
				return var5
			end,
			destroy = function() end
		},
		onPoolChanged = function(p4)
			-- upvalues: var2 (ref)
			var2({
				kind = "poolChanged",
				action = p4.action,
				itemViewType = p4.viewType,
				occupiedDelta = p4.occupiedDelta,
				vacantDelta = p4.vacantDelta,
				totalDelta = p4.totalDelta
			})
		end
	})
	local var7 = p2.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = var3,
		layout = var4,
		recyclingScope = var6,
		getItemViewType = function(p4)
			return p4.kind
		end,
		diagnostics = var2
	})
	var7.dispatch({ type = p2.VirtualizerCommandType.Activate })
	var7.dispatch({
		scrollAxisLength = 160,
		crossAxisLength = 320,
		type = p2.VirtualizerCommandType.SetViewportSize
	})
	
	for i, v in {
		40,
		80,
		400,
		800,
		0
	} do
		var7.dispatch({
			type = p2.VirtualizerCommandType.SetScrollOffset,
			offset = v
		})
	end
	var3.setItem(1, { id = "item1", kind = "header" })
	
	if p3 then
		local var8
		local measurementIdentity = nil
		
		for i_1, v_1 in var7.query({ type = p2.VirtualizerQueryType.GetItemViews }) do
			var8 = var7.query({
				type = p2.VirtualizerQueryType.GetPlacementIntent,
				itemView = v_1
			})
			
			if var8 ~= nil and var8.measurementIdentity.itemKey == "item1" then
				measurementIdentity = var8.measurementIdentity
				break
			end
		end
		assert(measurementIdentity ~= nil, "expected item1 measurement identity")
		var7.dispatch({
			type = p2.VirtualizerCommandType.SubmitMeasurements,
			measurements = {
				{
					length = 80,
					itemIndex = measurementIdentity.itemIndex,
					itemKey = measurementIdentity.itemKey,
					assignmentGeneration = measurementIdentity.assignmentGeneration,
					itemRevision = measurementIdentity.itemRevision
				},
				{
					itemIndex = 2,
					itemKey = "stale",
					itemRevision = 0,
					length = 80,
					assignmentGeneration = measurementIdentity.assignmentGeneration
				}
			}
		})
	end
	var7.dispatch({ type = p2.VirtualizerCommandType.Destroy })
	var6.destroy()
	var4.destroy()
	
	return var1
end

return {
	run = function(p4)
		-- upvalues: runScenario (ref)
		return {
			fixed = runScenario(p4, false),
			measured = runScenario(p4, true)
		}
	end
}