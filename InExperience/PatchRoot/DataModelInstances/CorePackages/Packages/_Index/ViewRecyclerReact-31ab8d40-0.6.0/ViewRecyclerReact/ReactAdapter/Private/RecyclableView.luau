local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local ViewRecyclerRobloxModule = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox)
local HostPresentationPhase = ViewRecyclerRobloxModule.HostPresentationPhase
local PlacementKindModule = require(script.Parent.PlacementKind)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local ReparentableHost = ViewRecyclerRobloxModule.ReparentableHost
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)
local SignalsSchedulerModule = require(ViewRecyclerReact.Parent.SignalsScheduler)

return function(Id, ItemViewType, p1, p2, p3)
	-- upvalues: RecyclableViewRegistryModule (copy), SignalsModule (copy), ReactModule (copy), RecyclableViewReadinessModule (copy), ReparentableHost (copy), PlacementKindModule (copy), HostPresentationPhase (copy), SignalsSchedulerModule (copy), SignalsExperimentalModule (copy)
	local Metadata = RecyclableViewRegistryModule.getMetadata(ItemViewType)
	assert(Metadata ~= nil, "RecyclableView: unknown Recyclable view type")
	local P3 = p2 or Metadata.readiness
	local HideWhilePending = if p3 == nil then Metadata.hideWhilePending else p3
	local Signal, Signal2 = SignalsModule.createSignal(p1)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(p1)
	local Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	local Binding, Binding2 = ReactModule.createBinding(false)
	local Count: number = if p1 == nil then 0 else 1
	local Signal2_4 = nil
	
	if P3 == RecyclableViewReadinessModule.ReadyOnCommit then
		local Signal5
		Signal5, Signal2_4 = SignalsModule.createSignal(Count)
	else
		local function Signal5(_)
			-- upvalues: Count (ref)
			return Count
		end
		
		Signal2_4 = function(_) end
	end
	local Frame = Instance.new("Frame")
	Frame.Name = `ListItemViewFrame{Id}`
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new()
	Frame.Size = UDim2.new()
	local v1 = nil
	local v2 = nil
	local Composition = nil
	local IsReadyOnAssignmentMatch = true
	local ContentMounted = false
	local v3 = nil
	local Hidden = nil
	local Sink = nil
	local v4 = nil
	local CompositionPlacement = nil
	local Flag = false
	local Flag1 = false
	local v5 = nil
	
	local function _()
		-- upvalues: ReparentableHost (upval), Frame (copy)
		ReparentableHost.detach(Frame)
		Frame.AnchorPoint = Vector2.zero
		Frame.Position = UDim2.new()
		Frame.Size = UDim2.new()
		Frame.AutomaticSize = Enum.AutomaticSize.None
	end
	
	local function measurementDependencies(CompositionPlacement)
		-- upvalues: Signal (copy), SignalsModule (upval)
		return {
			get = function()
				-- upvalues: Signal (upval), CompositionPlacement (copy)
				local SignalResult = Signal(false)
				
				return if SignalResult == nil then {} else CompositionPlacement.getMeasurementDependencies(SignalResult)
			end,
			subscribe = function(Callback)
				-- upvalues: SignalsModule (upval), Signal (upval), CompositionPlacement (copy)
				local v6 = nil
				local SubscribeMeasurementDependenciesResult = nil
				local Flag = true
				local Effect = SignalsModule.createEffect(function(p4)
					-- upvalues: Signal (upval), v6 (ref), SubscribeMeasurementDependenciesResult (ref), CompositionPlacement (upval), Callback (copy), Flag (ref)
					local SignalResult = Signal(p4)
					
					if v6 ~= SignalResult then
						if SubscribeMeasurementDependenciesResult ~= nil then
							SubscribeMeasurementDependenciesResult()
							SubscribeMeasurementDependenciesResult = nil
						end
						v6 = SignalResult
						
						if SignalResult ~= nil then
							SubscribeMeasurementDependenciesResult = CompositionPlacement.subscribeMeasurementDependencies(SignalResult, Callback)
						end
						if not Flag then
							Callback()
						end
					end
					Flag = false
				end)
				
				return function()
					-- upvalues: Effect (copy), SubscribeMeasurementDependenciesResult (ref)
					Effect()
					
					if SubscribeMeasurementDependenciesResult ~= nil then
						SubscribeMeasurementDependenciesResult()
					end
				end
			end
		}
	end
	
	local _ = function()
		-- upvalues: Sink (ref), v4 (ref), CompositionPlacement (ref)
		if Sink ~= nil and Sink.setMeasurementDependencies ~= nil then
			Sink.setMeasurementDependencies(nil)
		end
		Sink = nil
		v4 = nil
		CompositionPlacement = nil
	end
	
	local function registerListDependencies(Destination)
		-- upvalues: Sink (ref), v4 (ref), CompositionPlacement (ref), measurementDependencies (copy)
		local Sink1 = Destination.sink
		local CompositionPlacement1 = Destination.compositionPlacement
		
		if Sink == Sink1 and (CompositionPlacement1 == nil and v4 == nil or v4 ~= nil and CompositionPlacement == CompositionPlacement1) then return end
		if Sink ~= nil and Sink.setMeasurementDependencies ~= nil then
			Sink.setMeasurementDependencies(nil)
		end
		Sink = nil
		v4 = nil
		CompositionPlacement = nil
		
		if CompositionPlacement1 ~= nil and Sink1.setMeasurementDependencies ~= nil then
			v4 = measurementDependencies(CompositionPlacement1)
			Sink = Sink1
			CompositionPlacement = CompositionPlacement1
			Sink1.setMeasurementDependencies(v4)
		end
	end
	
	local _ = function(p4)
		-- upvalues: PlacementKindModule (upval), Sink (ref), v4 (ref), CompositionPlacement (ref), Frame (copy), ReparentableHost (upval)
		if p4 == nil then return end
		local Destination = p4.destination
		
		if Destination.kind ~= PlacementKindModule.List then
			Destination.detachMeasurementDependency(Frame)
			ReparentableHost.detach(Frame)
			Frame.AnchorPoint = Vector2.zero
			Frame.Position = UDim2.new()
			Frame.Size = UDim2.new()
			Frame.AutomaticSize = Enum.AutomaticSize.None
			
			return
		end
		Destination.sink.apply(nil)
		
		if Sink ~= nil and Sink.setMeasurementDependencies ~= nil then
			Sink.setMeasurementDependencies(nil)
		end
		Sink = nil
		v4 = nil
		CompositionPlacement = nil
	end
	
	local _ = function()
		-- upvalues: v2 (ref), HostPresentationPhase (upval), ContentMounted (ref), P3 (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), HideWhilePending (copy)
		return if v2 == nil then HostPresentationPhase.Hidden elseif ContentMounted and (P3 == RecyclableViewReadinessModule.ReadyOnAssignment or IsReadyOnAssignmentMatch) then HostPresentationPhase.Presented elseif HideWhilePending then HostPresentationPhase.Hidden else HostPresentationPhase.Pending
	end
	
	v5 = function()
		-- upvalues: Flag1 (ref), v2 (ref), Flag (ref), HostPresentationPhase (upval), ContentMounted (ref), P3 (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), HideWhilePending (copy), v3 (ref), Hidden (ref), PlacementKindModule (upval), registerListDependencies (copy), Frame (copy), ReparentableHost (upval)
		Flag1 = false
		local v6 = v2
		
		if v6 == nil or Flag then return end
		local Hidden1 = if v2 == nil then HostPresentationPhase.Hidden elseif ContentMounted and (P3 == RecyclableViewReadinessModule.ReadyOnAssignment or IsReadyOnAssignmentMatch) then HostPresentationPhase.Presented elseif HideWhilePending then HostPresentationPhase.Hidden else HostPresentationPhase.Pending
		
		if v3 == v6 and Hidden == Hidden1 then return end
		local Destination = v6.destination
		
		if Destination.kind == PlacementKindModule.List then
			registerListDependencies(Destination)
			Destination.sink.apply({ host = Frame, phase = Hidden1, state = Destination.state })
		else
			if Frame.Parent ~= Destination.placeholder or Frame.AutomaticSize ~= Destination.automaticSize then
				ReparentableHost.place(Frame, Destination)
			end
			Frame.Visible = Hidden1 ~= HostPresentationPhase.Hidden
			Destination.attachMeasurementDependency(Frame)
		end
		v3 = v6
		Hidden = Hidden1
	end
	
	local function requestPublication()
		-- upvalues: Flag1 (ref), SignalsSchedulerModule (upval), v5 (ref)
		if not Flag1 then
			Flag1 = true
			SignalsSchedulerModule.schedule(v5)
		end
	end
	
	return {
		id = Id,
		viewType = ItemViewType,
		itemViewType = ItemViewType,
		signal = Signal,
		indexSignal = Signal1,
		itemSignal = function(p4)
			-- upvalues: Signal3 (copy), Composition (ref), PlacementKindModule (upval)
			local SignalResult = Signal3(p4)
			assert(SignalResult ~= nil, "RecyclableView: item read before first Assignment")
			
			return if Composition == PlacementKindModule.Composition then SignalResult.value(p4) else SignalResult.value
		end,
		itemKeySignal = function(p4)
			-- upvalues: Signal3 (copy)
			local SignalResult = Signal3(p4)
			assert(SignalResult ~= nil, "RecyclableView: item key read before first Assignment")
			
			return SignalResult.key
		end,
		hasItem = function(p4): boolean
			-- upvalues: Signal3 (copy)
			return Signal3(p4) ~= nil
		end,
		transition = function(p4)
			-- upvalues: Flag (ref), v2 (ref), PlacementKindModule (upval), Sink (ref), v4 (ref), CompositionPlacement (ref), Frame (copy), ReparentableHost (upval), v3 (ref), Hidden (ref), v1 (ref), HostPresentationPhase (upval), Composition (ref), P3 (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), Count (ref), SignalsExperimentalModule (upval), Signal2_2 (copy), Signal2_4 (ref), Signal2_1 (copy), Signal2 (copy), Signal2_3 (copy), Binding2 (copy), Flag1 (ref), SignalsSchedulerModule (upval), v5 (ref)
			if Flag then
				assert(p4 == nil, "RecyclableView: cannot transition an occupied state after destroy")
				
				return
			end
			local v6 = v2
			local Assignment = if v6 == nil then nil else v6.assignment
			local Assignment1 = if p4 == nil then nil else p4.assignment
			local Destination = if v6 == nil then nil else v6.destination
			local Destination1 = if p4 == nil then nil else p4.destination
			
			if Destination ~= nil and (Destination1 == nil or (Destination.kind ~= Destination1.kind or (Destination.kind == PlacementKindModule.List and Destination.sink ~= Destination1.sink or Destination.kind == PlacementKindModule.Composition and Destination.placementId ~= Destination1.placementId))) then
				if v6 ~= nil then
					local Destination2 = v6.destination
					
					if Destination2.kind == PlacementKindModule.List then
						Destination2.sink.apply(nil)
						
						if Sink ~= nil and Sink.setMeasurementDependencies ~= nil then
							Sink.setMeasurementDependencies(nil)
						end
						Sink = nil
						v4 = nil
						CompositionPlacement = nil
					else
						Destination2.detachMeasurementDependency(Frame)
						ReparentableHost.detach(Frame)
						Frame.AnchorPoint = Vector2.zero
						Frame.Position = UDim2.new()
						Frame.Size = UDim2.new()
						Frame.AutomaticSize = Enum.AutomaticSize.None
					end
				end
				v3 = nil
				Hidden = nil
			end
			if Assignment ~= nil and Assignment ~= Assignment1 then
				local v7 = v1
				
				if v7 ~= nil then
					v7.clearSelection()
				end
			end
			v2 = p4
			
			if Assignment ~= Assignment1 and p4 ~= nil then
				local Destination3 = p4.destination
				
				if Destination3.kind == PlacementKindModule.List then
					Destination3.sink.apply({
						host = Frame,
						phase = HostPresentationPhase.Hidden,
						state = Destination3.state
					})
				else
					Frame.Visible = false
				end
				v3 = p4
				Hidden = HostPresentationPhase.Hidden
			end
			local Kind = if p4 == nil then nil else p4.destination.kind
			local IsNotAssignmentMatch: boolean = Assignment1 ~= nil and (Assignment ~= Assignment1 or Composition ~= Kind)
			local IsNotAssignmentMatch1: boolean = P3 == RecyclableViewReadinessModule.ReadyOnCommit and (Assignment1 ~= nil and (Assignment ~= Assignment1 or not IsReadyOnAssignmentMatch))
			
			if IsNotAssignmentMatch1 then
				Count += 1
			end
			IsReadyOnAssignmentMatch = Assignment1 ~= nil and (P3 == RecyclableViewReadinessModule.ReadyOnAssignment or not IsNotAssignmentMatch1 and IsReadyOnAssignmentMatch)
			SignalsExperimentalModule.batch(function()
				-- upvalues: IsNotAssignmentMatch (copy), Composition (upval), Kind (copy), Signal2_2 (upval), Assignment1 (copy), IsNotAssignmentMatch1 (copy), Signal2_4 (upval), Count (upval), Signal2_1 (upval), p4 (copy), Signal2 (upval), Signal2_3 (upval), P3 (upval), RecyclableViewReadinessModule (upval), Binding2 (upval), Flag1 (upval), SignalsSchedulerModule (upval), v5 (upval)
				if IsNotAssignmentMatch then
					Composition = Kind
					Signal2_2(Assignment1)
				end
				if IsNotAssignmentMatch1 then
					Signal2_4(Count)
				end
				Signal2_1(if p4 == nil then nil else p4.index)
				Signal2(Assignment1)
				Signal2_3(if p4 == nil then nil else p4.destination.compositionPlacement)
				
				if P3 == RecyclableViewReadinessModule.ReadyOnCommit and (Assignment1 == nil or IsNotAssignmentMatch1) then
					Binding2(Assignment1 ~= nil)
				end
				if p4 ~= nil and not Flag1 then
					Flag1 = true
					SignalsSchedulerModule.schedule(v5)
				end
			end)
		end,
		pending = Binding,
		contentRevision = Signal5,
		commitContent = function(Count1): boolean
			-- upvalues: Flag (ref), P3 (copy), RecyclableViewReadinessModule (upval), v2 (ref), Count (ref), IsReadyOnAssignmentMatch (ref), SignalsExperimentalModule (upval), Binding2 (copy), Flag1 (ref), SignalsSchedulerModule (upval), v5 (ref)
			if Flag or P3 ~= RecyclableViewReadinessModule.ReadyOnCommit or v2 == nil or Count1 ~= Count then
				return false
			else
				IsReadyOnAssignmentMatch = true
				SignalsExperimentalModule.batch(function()
					-- upvalues: Binding2 (upval), Flag1 (upval), SignalsSchedulerModule (upval), v5 (upval)
					Binding2(false)
					
					if not Flag1 then
						Flag1 = true
						SignalsSchedulerModule.schedule(v5)
					end
				end)
				
				return true
			end
		end,
		setContentMounted = function(Value)
			-- upvalues: Flag (ref), ContentMounted (ref), v2 (ref), SignalsExperimentalModule (upval), requestPublication (copy)
			if Flag or ContentMounted == Value then return end
			ContentMounted = Value
			
			if Value and v2 ~= nil then
				SignalsExperimentalModule.batch(requestPublication)
			end
		end,
		readiness = P3,
		hideWhilePending = HideWhilePending,
		compositionPlacement = Signal4,
		portalFrame = function(_)
			-- upvalues: Flag (ref), Frame (copy)
			return if Flag then nil else Frame
		end,
		bindHost = function(p4)
			-- upvalues: Flag (ref), v1 (ref)
			assert(not Flag, "RecyclableView: cannot bind a destroyed host")
			assert(v1 == nil, "RecyclableView: host is already bound")
			v1 = p4
			local Flag1 = true
			
			return function()
				-- upvalues: Flag1 (ref), v1 (upval), p4 (copy)
				if Flag1 and v1 == p4 then
					Flag1 = false
					v1 = nil
				end
			end
		end,
		clearSelection = function()
			-- upvalues: v1 (ref)
			local v6 = v1
			
			if v6 ~= nil then
				v6.clearSelection()
			end
		end,
		detachFromPlaceholder = function(p4)
			-- upvalues: v1 (ref)
			local v6 = v1
			
			if v6 ~= nil then
				v6.detachFromPlaceholder(p4)
			end
		end,
		destroy = function()
			-- upvalues: Flag (ref), v2 (ref), PlacementKindModule (upval), Sink (ref), v4 (ref), CompositionPlacement (ref), Frame (copy), ReparentableHost (upval), v1 (ref), Binding2 (copy)
			if Flag then return end
			Flag = true
			local v6 = v2
			
			if v6 ~= nil then
				local Destination = v6.destination
				
				if Destination.kind == PlacementKindModule.List then
					Destination.sink.apply(nil)
					
					if Sink ~= nil and Sink.setMeasurementDependencies ~= nil then
						Sink.setMeasurementDependencies(nil)
					end
					Sink = nil
					v4 = nil
					CompositionPlacement = nil
				else
					Destination.detachMeasurementDependency(Frame)
					ReparentableHost.detach(Frame)
					Frame.AnchorPoint = Vector2.zero
					Frame.Position = UDim2.new()
					Frame.Size = UDim2.new()
					Frame.AutomaticSize = Enum.AutomaticSize.None
				end
			end
			v2 = nil
			v1 = nil
			Binding2(false)
			Frame.Parent = nil
			Frame:Destroy()
		end
	}
end