local function createCounters()
	local config = {
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
	local NewTotalDelta = 0
	
	return config, function(p1)
		-- upvalues: config (copy), NewTotalDelta (ref)
		if p1.kind ~= "rangeChanged" then
			if p1.kind == "poolChanged" then
				if p1.action == "create" then
					config.poolCreates += 1
				elseif p1.action == "acquire" then
					config.poolAcquires += 1
				elseif p1.action == "release" then
					config.poolReleases += 1
				else
					config.poolEvictions += 1
				end
				NewTotalDelta += p1.totalDelta
				config.peakItemViews = math.max(config.peakItemViews, NewTotalDelta)
				
				return
			elseif p1.kind == "itemViewsSynchronized" then
				config.synchronizations += 1
				config.retainedAssignments += p1.retained
				config.reassignedAssignments += p1.reassigned
				config.acquiredAssignments += p1.acquired
				config.releasedAssignments += p1.released
				
				return
			else
				if p1.kind == "measurementsProcessed" then
					config.acceptedMeasurements += p1.accepted
					config.droppedMeasurements += p1.dropped
					
					return
				end
				if p1.kind == "scrollCorrection" then
					config.scrollCorrections += 1
				end
				return
			end
		elseif p1.rangeKind == "visible" then
			config.visibleRangeChanges += 1
			
			return
		else
			config.renderedRangeChanges += 1
		end
	end
end

local function values(p1)
	local Buffer = table.create(p1)
	
	for i = 1, p1 do
		Buffer[i] = {
			id = `item{i}`,
			kind = if i % 10 == 0 then "header" else "row"
		}
	end
	return Buffer
end

local function runScenario(p2, p3)
	-- upvalues: createCounters (copy), values (copy)
	local Counters, Counters2 = createCounters()
	local SequenceResult = p2.DataSource.sequence(values(100), function(p4)
		return p4.id
	end)
	local MeasuredResult = if p3 then p2.Layout.measured({ estimatedItemLength = 40 }) else p2.Layout.uniform({ itemLength = 40 })
	local Count = 0
	local RecyclingScope = p2.Adapter.createRecyclingScope({
		maxPoolSize = 2,
		adapter = {
			create = function(): number
				-- upvalues: Count (ref)
				Count += 1
				
				return Count
			end,
			destroy = function() end
		},
		onPoolChanged = function(p4)
			-- upvalues: Counters2 (copy)
			Counters2({
				kind = "poolChanged",
				action = p4.action,
				itemViewType = p4.viewType,
				occupiedDelta = p4.occupiedDelta,
				vacantDelta = p4.vacantDelta,
				totalDelta = p4.totalDelta
			})
		end
	})
	local Virtualizer = p2.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = SequenceResult,
		layout = MeasuredResult,
		recyclingScope = RecyclingScope,
		getItemViewType = function(p4)
			return p4.kind
		end,
		diagnostics = Counters2
	})
	Virtualizer.dispatch({ type = p2.VirtualizerCommandType.Activate })
	Virtualizer.dispatch({
		scrollAxisLength = 160,
		crossAxisLength = 320,
		type = p2.VirtualizerCommandType.SetViewportSize
	})
	
	for _, Offset in {
		40,
		80,
		400,
		800,
		0
	} do
		Virtualizer.dispatch({
			type = p2.VirtualizerCommandType.SetScrollOffset,
			offset = Offset
		})
	end
	SequenceResult.setItem(1, { id = "item1", kind = "header" })
	
	if p3 then
		local MeasurementIdentity = nil
		local QueryResult = nil
		
		for _, ItemView in Virtualizer.query({ type = p2.VirtualizerQueryType.GetItemViews }) do
			QueryResult = Virtualizer.query({
				type = p2.VirtualizerQueryType.GetPlacementIntent,
				itemView = ItemView
			})
			
			if QueryResult ~= nil and QueryResult.measurementIdentity.itemKey == "item1" then
				MeasurementIdentity = QueryResult.measurementIdentity
				break
			end
		end
		assert(MeasurementIdentity ~= nil, "expected item1 measurement identity")
		Virtualizer.dispatch({
			type = p2.VirtualizerCommandType.SubmitMeasurements,
			measurements = {
				{
					length = 80,
					itemIndex = MeasurementIdentity.itemIndex,
					itemKey = MeasurementIdentity.itemKey,
					assignmentGeneration = MeasurementIdentity.assignmentGeneration,
					itemRevision = MeasurementIdentity.itemRevision
				},
				{
					itemIndex = 2,
					itemKey = "stale",
					itemRevision = 0,
					length = 80,
					assignmentGeneration = MeasurementIdentity.assignmentGeneration
				}
			}
		})
	end
	Virtualizer.dispatch({ type = p2.VirtualizerCommandType.Destroy })
	RecyclingScope.destroy()
	MeasuredResult.destroy()
	
	return Counters
end

return {
	run = function(p4)
		-- upvalues: runScenario (copy)
		return {
			fixed = runScenario(p4, false),
			measured = runScenario(p4, true)
		}
	end
}