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
	local RecyclingScope1 = {
		bind = function(Tbl)
			-- upvalues: RecyclingScope (copy)
			local Copy = table.clone(Tbl)
			Copy.capacity = 2
			
			return RecyclingScope.bind(Copy)
		end,
		dispose = RecyclingScope.dispose
	}
	local Virtualizer = p2.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = SequenceResult,
		layout = MeasuredResult,
		recyclingScope = RecyclingScope1,
		getItemViewType = function(p4)
			return p4.kind
		end,
		diagnostics = Counters2
	})
	Virtualizer.activate()
	Virtualizer.setViewportSize(160, 320)
	
	for _, value in {
		40,
		80,
		400,
		800,
		0
	} do
		Virtualizer.setScrollOffset(value)
	end
	SequenceResult.setItem(1, { id = "item1", kind = "header" })
	
	if p3 then
		local ItemView = nil
		local Tbl = nil
		local ItemView1 = nil
		local State = nil
		
		for _, mountedView in Virtualizer.getCurrent().mountedViews do
			ItemView1 = mountedView.itemView
			State = mountedView.state
			
			if State ~= nil and State.assignment.key == "item1" then
				ItemView = ItemView1
				Tbl = State
				break
			end
		end
		assert(ItemView ~= nil and Tbl ~= nil, "expected item1 view state")
		local Copy = table.clone(Tbl)
		Copy.assignment = table.clone(Tbl.assignment)
		Virtualizer.submitMeasurements({
			{ length = 80, itemView = ItemView, state = Tbl },
			{ length = 80, itemView = ItemView, state = Copy }
		})
	end
	Virtualizer.destroy()
	RecyclingScope1.dispose()
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