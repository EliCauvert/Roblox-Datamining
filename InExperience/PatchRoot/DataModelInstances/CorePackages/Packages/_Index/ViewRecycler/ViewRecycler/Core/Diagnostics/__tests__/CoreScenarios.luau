local function createCounters() --[[ line: 19 ]]
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
	local var4 = 0
	
	return t, function(p0) --[[ line: 39 | named "diagnostics" ]]
		-- upvalues: t (ref), var4 (write)
		if p0.kind == "rangeChanged" then
			if p0.rangeKind == "visible" then
				t.visibleRangeChanges += 1
				
				return
			end
			t.renderedRangeChanges += 1
			
			return
		elseif p0.kind == "poolChanged" then
			if p0.action == "create" then
				t.poolCreates += 1
			elseif p0.action == "acquire" then
				t.poolAcquires += 1
			elseif p0.action == "release" then
				t.poolReleases += 1
			else
				t.poolEvictions += 1
			end
			var4 += p0.totalDelta
			t.peakItemViews = math.max(t.peakItemViews, var4)
			
			return
		elseif p0.kind == "itemViewsSynchronized" then
			t.synchronizations += 1
			t.retainedAssignments += p0.retained
			t.reassignedAssignments += p0.reassigned
			t.acquiredAssignments += p0.acquired
			t.releasedAssignments += p0.released
			
			return
		elseif p0.kind == "measurementsProcessed" then
			t.acceptedMeasurements += p0.accepted
			t.droppedMeasurements += p0.dropped
			
			return
		elseif p0.kind == "scrollCorrection" then
			t.scrollCorrections += 1
		end
	end
end

local function values(p1) --[[ line: 75 ]]
	local list = table.create(p1)
	
	for i = 1, p1 do
		list[i] = {
			id = `item{i}`,
			kind = if i % 10 == 0 then "header" else "row"
		}
	end
	return list
end

local function runScenario(p2, p3) --[[ line: 86 ]]
	-- upvalues: createCounters (ref), values (ref)
	local var6, var7 = createCounters()
	local var8 = p2.DataSource.sequence(values(100), function(p4) --[[ line: 88 ]]
		return p4.id
	end)
	local var9 = if p3 then p2.Layout.measured({ estimatedItemLength = 40 }) else p2.Layout.uniform({ itemLength = 40 })
	local var10 = 0
	local var11 = p2.Adapter.createRecyclingScope({
		maxPoolSize = 2,
		adapter = {
			create = function() --[[ line: 97 ]]
				-- upvalues: var10 (write)
				var10 += 1
				
				return var10
			end,
			destroy = function() --[[ line: 101 ]] end
		},
		onPoolChanged = function(p5) --[[ line: 104 ]]
			-- upvalues: var7 (ref)
			var7({
				kind = "poolChanged",
				action = p5.action,
				itemViewType = p5.viewType,
				occupiedDelta = p5.occupiedDelta,
				vacantDelta = p5.vacantDelta,
				totalDelta = p5.totalDelta
			})
		end
	})
	local var12 = p2.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = var8,
		layout = var9,
		recyclingScope = var11,
		getItemViewType = function(p6) --[[ line: 119 ]]
			return p6.kind
		end,
		diagnostics = var7
	})
	var12.dispatch({ type = p2.VirtualizerCommandType.Activate })
	var12.dispatch({
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
		var12.dispatch({
			type = p2.VirtualizerCommandType.SetScrollOffset,
			offset = v
		})
	end
	var8.setItem(1, { id = "item1", kind = "header" })
	
	if p3 then
		local var13
		local measurementIdentity = nil
		
		for i_1, v_1 in var12.query({ type = p2.VirtualizerQueryType.GetItemViews }) do
			var13 = var12.query({
				type = p2.VirtualizerQueryType.GetPlacementIntent,
				itemView = v_1
			})
			
			if var13 ~= nil and var13.measurementIdentity.itemKey == "item1" then
				measurementIdentity = var13.measurementIdentity
				break
			end
		end
		assert(measurementIdentity ~= nil, "expected item1 measurement identity")
		var12.dispatch({
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
	var12.dispatch({ type = p2.VirtualizerCommandType.Destroy })
	var11.destroy()
	var9.destroy()
	
	return var6
end

return {
	run = function(p7) --[[ line: 177 ]]
		-- upvalues: runScenario (ref)
		return {
			fixed = runScenario(p7, false),
			measured = runScenario(p7, true)
		}
	end
}