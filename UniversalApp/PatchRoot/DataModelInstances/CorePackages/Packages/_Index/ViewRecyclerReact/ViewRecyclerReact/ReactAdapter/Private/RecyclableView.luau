local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact08
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local DestinationModule = require(script.Parent.Destination)
local ViewRecyclerRobloxModule = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox)
local HostPresentationPhase = ViewRecyclerRobloxModule.HostPresentationPhase
local PlacementKindModule = require(script.Parent.PlacementKind)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local ReparentableHost = if FFlagViewRecyclerReact08 then nil else ViewRecyclerRobloxModule.ReparentableHost
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)
local SignalsSchedulerModule = require(ViewRecyclerReact.Parent.SignalsScheduler)

return if FFlagViewRecyclerReact08 then function(Id, ItemViewType, p1, p2)
	-- upvalues: RecyclableViewRegistryModule (copy), SignalsModule (copy), ReactModule (copy), RecyclableViewReadinessModule (copy), DestinationModule (copy), HostPresentationPhase (copy), SignalsSchedulerModule (copy), SignalsExperimentalModule (copy)
	local Metadata = RecyclableViewRegistryModule.getMetadata(ItemViewType)
	assert(Metadata ~= nil, "RecyclableView: unknown Recyclable view type")
	local Readiness = Metadata.readiness
	local HideWhilePending = Metadata.hideWhilePending
	local Signal, Signal2 = SignalsModule.createSignal(p1)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(p1)
	local Signal4, Signal2_3 = SignalsModule.createSignal(p1 ~= nil)
	local Binding, Binding2 = ReactModule.createBinding(false)
	local Count: number = if p1 == nil then 0 else 1
	local Signal2_4 = nil
	
	if Readiness == RecyclableViewReadinessModule.ReadyOnCommit then
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
	local DestroyingConnection = Frame.Destroying:Connect(function() end)
	local v1 = nil
	local v2 = nil
	local List = DestinationModule.Kind.List
	local IsReadyOnAssignmentMatch = true
	local ContentMounted = false
	local v3 = nil
	local Hidden = nil
	local Flag = false
	local Flag1 = false
	local v4 = nil
	local v5 = nil
	
	local function _(p3)
		-- upvalues: DestinationModule (upval), v5 (ref), Frame (copy)
		if p3 ~= nil then
			local Destination = p3.destination
			DestinationModule.behaviors[Destination.kind].detach(v5, Frame, Destination)
		end
	end
	
	local _ = function()
		-- upvalues: v2 (ref), HostPresentationPhase (upval), ContentMounted (ref), Readiness (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), HideWhilePending (copy)
		return if v2 == nil then HostPresentationPhase.Hidden elseif ContentMounted then if Readiness == RecyclableViewReadinessModule.ReadyOnAssignment or IsReadyOnAssignmentMatch then HostPresentationPhase.Presented elseif HideWhilePending then HostPresentationPhase.Hidden else HostPresentationPhase.Pending else HostPresentationPhase.Hidden
	end
	
	local _ = function(p3, p4)
		-- upvalues: DestinationModule (upval), v5 (ref), Frame (copy), v3 (ref), Hidden (ref)
		local Destination = p3.destination
		DestinationModule.behaviors[Destination.kind].present(v5, Frame, Destination, p4)
		v3 = p3
		Hidden = p4
	end
	
	v4 = function()
		-- upvalues: Flag1 (ref), v2 (ref), Flag (ref), HostPresentationPhase (upval), ContentMounted (ref), Readiness (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), HideWhilePending (copy), v3 (ref), Hidden (ref), DestinationModule (upval), v5 (ref), Frame (copy)
		Flag1 = false
		local v6 = v2
		
		if v6 == nil or Flag then return end
		local Hidden1 = if v2 == nil then HostPresentationPhase.Hidden elseif ContentMounted then if Readiness == RecyclableViewReadinessModule.ReadyOnAssignment or IsReadyOnAssignmentMatch then HostPresentationPhase.Presented elseif HideWhilePending then HostPresentationPhase.Hidden else HostPresentationPhase.Pending else HostPresentationPhase.Hidden
		
		if v3 ~= v6 or Hidden ~= Hidden1 then
			local Destination = v6.destination
			DestinationModule.behaviors[Destination.kind].present(v5, Frame, Destination, Hidden1)
			v3 = v6
			Hidden = Hidden1
			
			return
		end
	end
	
	local function requestPublication()
		-- upvalues: Flag1 (ref), SignalsSchedulerModule (upval), v4 (ref)
		if not Flag1 then
			Flag1 = true
			SignalsSchedulerModule.schedule(v4)
		end
	end
	
	local _ = function(p3, p4)
		-- upvalues: DestinationModule (upval)
		return p3.kind == p4.kind and DestinationModule.behaviors[p3.kind].sameOwner(p3, p4)
	end
	
	v5 = {
		id = Id,
		viewType = ItemViewType,
		itemViewType = ItemViewType,
		signal = Signal,
		indexSignal = Signal1,
		itemSignal = function(p3)
			-- upvalues: Signal3 (copy), DestinationModule (upval), List (ref)
			local SignalResult = Signal3(p3)
			assert(SignalResult ~= nil, "RecyclableView: item read before first Assignment")
			
			return DestinationModule.behaviors[List].readItem(SignalResult.value, p3)
		end,
		itemKeySignal = function(p3)
			-- upvalues: Signal3 (copy)
			local SignalResult = Signal3(p3)
			assert(SignalResult ~= nil, "RecyclableView: item key read before first Assignment")
			
			return SignalResult.key
		end,
		hasItem = Signal4,
		transition = function(p3)
			-- upvalues: Flag (ref), v2 (ref), DestinationModule (upval), v5 (ref), Frame (copy), v3 (ref), Hidden (ref), v1 (ref), HostPresentationPhase (upval), List (ref), Readiness (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), Count (ref), SignalsExperimentalModule (upval), Signal2_2 (copy), Signal4 (copy), Signal2_3 (copy), Signal2_4 (ref), Signal2_1 (copy), Signal2 (copy), Binding2 (copy), Flag1 (ref), SignalsSchedulerModule (upval), v4 (ref)
			if Flag then
				assert(p3 == nil, "RecyclableView: cannot transition an occupied state after destroy")
				
				return
			end
			local v6 = v2
			local Assignment = if v6 == nil then nil else v6.assignment
			local Assignment1 = if p3 == nil then nil else p3.assignment
			local Destination = if v6 == nil then nil else v6.destination
			local Destination1 = if p3 == nil then nil else p3.destination
			
			if Destination ~= nil and (Destination1 == nil or not (Destination.kind == Destination1.kind and DestinationModule.behaviors[Destination.kind].sameOwner(Destination, Destination1))) then
				if v6 ~= nil then
					local Destination2 = v6.destination
					DestinationModule.behaviors[Destination2.kind].detach(v5, Frame, Destination2)
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
			v2 = p3
			
			if Destination1 ~= nil then
				DestinationModule.behaviors[Destination1.kind].attach(Frame, Destination1)
			end
			if p3 ~= nil and v3 == nil then
				local Hidden1 = HostPresentationPhase.Hidden
				local Destination3 = p3.destination
				DestinationModule.behaviors[Destination3.kind].present(v5, Frame, Destination3, Hidden1)
				v3 = p3
				Hidden = Hidden1
			end
			local Kind = if p3 == nil then nil else p3.destination.kind
			local IsNotAssignmentMatch: boolean = Assignment1 ~= nil and (Assignment ~= Assignment1 or List ~= Kind)
			local IsNotAssignmentMatch1: boolean = Readiness == RecyclableViewReadinessModule.ReadyOnCommit and (Assignment1 ~= nil and (Assignment ~= Assignment1 or not IsReadyOnAssignmentMatch))
			
			if IsNotAssignmentMatch1 then
				Count += 1
			end
			IsReadyOnAssignmentMatch = Assignment1 ~= nil and (Readiness == RecyclableViewReadinessModule.ReadyOnAssignment or not IsNotAssignmentMatch1 and IsReadyOnAssignmentMatch)
			SignalsExperimentalModule.batch(function()
				-- upvalues: IsNotAssignmentMatch (copy), List (upval), Kind (copy), Signal2_2 (upval), Assignment1 (copy), Signal4 (upval), Signal2_3 (upval), IsNotAssignmentMatch1 (copy), Signal2_4 (upval), Count (upval), Signal2_1 (upval), p3 (copy), Signal2 (upval), Readiness (upval), RecyclableViewReadinessModule (upval), Binding2 (upval), Flag1 (upval), SignalsSchedulerModule (upval), v4 (upval)
				if IsNotAssignmentMatch then
					List = Kind
					Signal2_2(Assignment1)
					
					if not Signal4(false) then
						Signal2_3(true)
					end
				end
				if IsNotAssignmentMatch1 then
					Signal2_4(Count)
				end
				Signal2_1(if p3 == nil then nil else p3.index)
				Signal2(Assignment1)
				
				if Readiness == RecyclableViewReadinessModule.ReadyOnCommit and (Assignment1 == nil or IsNotAssignmentMatch1) then
					Binding2(Assignment1 ~= nil)
				end
				if p3 ~= nil and not Flag1 then
					Flag1 = true
					SignalsSchedulerModule.schedule(v4)
				end
			end)
		end,
		pending = Binding,
		contentRevision = Signal5,
		commitContent = function(Count1): boolean
			-- upvalues: Flag (ref), Readiness (copy), RecyclableViewReadinessModule (upval), v2 (ref), Count (ref), IsReadyOnAssignmentMatch (ref), SignalsExperimentalModule (upval), Binding2 (copy), Flag1 (ref), SignalsSchedulerModule (upval), v4 (ref)
			if Flag or Readiness ~= RecyclableViewReadinessModule.ReadyOnCommit or v2 == nil or Count1 ~= Count then
				return false
			else
				IsReadyOnAssignmentMatch = true
				SignalsExperimentalModule.batch(function()
					-- upvalues: Binding2 (upval), Flag1 (upval), SignalsSchedulerModule (upval), v4 (upval)
					Binding2(false)
					
					if not Flag1 then
						Flag1 = true
						SignalsSchedulerModule.schedule(v4)
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
		compositionPlacement = function(_)
			-- upvalues: p2 (copy)
			return p2
		end,
		portalFrame = function(_)
			-- upvalues: Flag (ref), Frame (copy)
			return if Flag then nil else Frame
		end,
		bindHost = function(p3)
			-- upvalues: Flag (ref), v1 (ref)
			assert(not Flag, "RecyclableView: cannot bind a destroyed host")
			assert(v1 == nil, "RecyclableView: host is already bound")
			v1 = p3
			local Flag1 = true
			
			return function()
				-- upvalues: Flag1 (ref), v1 (upval), p3 (copy)
				if Flag1 and v1 == p3 then
					Flag1 = false
					v1 = nil
				end
			end
		end,
		isHostDestroyed = function()
			-- upvalues: Flag (ref), DestroyingConnection (copy)
			return Flag or not DestroyingConnection.Connected
		end,
		destroy = function()
			-- upvalues: Flag (ref), v2 (ref), DestinationModule (upval), v5 (ref), Frame (copy), v1 (ref), Binding2 (copy), DestroyingConnection (copy)
			if Flag then return end
			Flag = true
			local v6 = v2
			
			if v6 ~= nil then
				local Destination = v6.destination
				DestinationModule.behaviors[Destination.kind].detach(v5, Frame, Destination)
			end
			v2 = nil
			v1 = nil
			Binding2(false)
			DestroyingConnection:Disconnect()
			Frame.Parent = nil
			Frame:Destroy()
		end
	}
	
	return v5
end else function(Id, ItemViewType, p1, p2, p3)
	-- upvalues: RecyclableViewRegistryModule (copy), SignalsModule (copy), ReactModule (copy), RecyclableViewReadinessModule (copy), ReparentableHost (ref), PlacementKindModule (copy), HostPresentationPhase (copy), SignalsSchedulerModule (copy), SignalsExperimentalModule (copy)
	local Metadata = RecyclableViewRegistryModule.getMetadata(ItemViewType)
	assert(Metadata ~= nil, "RecyclableView: unknown Recyclable view type")
	local P22 = p2 or Metadata.readiness
	local HideWhilePending = if p3 == nil then Metadata.hideWhilePending else p3
	local Signal, Signal2 = SignalsModule.createSignal(p1)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(p1)
	local Signal4, Signal2_3 = SignalsModule.createSignal(p1 ~= nil)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local Binding, Binding2 = ReactModule.createBinding(false)
	local Count: number = if p1 == nil then 0 else 1
	local Signal2_5 = nil
	
	if P22 == RecyclableViewReadinessModule.ReadyOnCommit then
		local Signal6
		Signal6, Signal2_5 = SignalsModule.createSignal(Count)
	else
		local function Signal6(_)
			-- upvalues: Count (ref)
			return Count
		end
		
		Signal2_5 = function(_) end
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
	local Flag = false
	local Flag1 = false
	local v4 = nil
	
	local function _()
		-- upvalues: ReparentableHost (upval), Frame (copy)
		ReparentableHost.detach(Frame)
		Frame.AnchorPoint = Vector2.zero
		Frame.Position = UDim2.new()
		Frame.Size = UDim2.new()
		Frame.AutomaticSize = Enum.AutomaticSize.None
	end
	
	local _ = function(p4)
		-- upvalues: PlacementKindModule (upval), ReparentableHost (upval), Frame (copy)
		if p4 == nil then return end
		local Destination = p4.destination
		
		if Destination.kind == PlacementKindModule.List then
			Destination.sink.apply(nil)
			
			return
		else
			ReparentableHost.detach(Frame)
			Frame.AnchorPoint = Vector2.zero
			Frame.Position = UDim2.new()
			Frame.Size = UDim2.new()
			Frame.AutomaticSize = Enum.AutomaticSize.None
		end
	end
	
	local _ = function()
		-- upvalues: v2 (ref), HostPresentationPhase (upval), ContentMounted (ref), P22 (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), HideWhilePending (copy)
		return if v2 == nil then HostPresentationPhase.Hidden elseif ContentMounted then if P22 == RecyclableViewReadinessModule.ReadyOnAssignment or IsReadyOnAssignmentMatch then HostPresentationPhase.Presented elseif HideWhilePending then HostPresentationPhase.Hidden else HostPresentationPhase.Pending else HostPresentationPhase.Hidden
	end
	
	local function publish(p4, Hidden1)
		-- upvalues: PlacementKindModule (upval), Frame (copy), ReparentableHost (upval), HostPresentationPhase (upval), v3 (ref), Hidden (ref)
		local Destination = p4.destination
		
		if Destination.kind == PlacementKindModule.List then
			Destination.sink.apply({ host = Frame, phase = Hidden1, state = Destination.state })
		else
			if Frame.Parent ~= Destination.placeholder or Frame.AutomaticSize ~= Destination.automaticSize then
				ReparentableHost.place(Frame, Destination)
			end
			Frame.Visible = Hidden1 ~= HostPresentationPhase.Hidden
		end
		v3 = p4
		Hidden = Hidden1
	end
	
	v4 = function()
		-- upvalues: Flag1 (ref), v2 (ref), Flag (ref), HostPresentationPhase (upval), ContentMounted (ref), P22 (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), HideWhilePending (copy), v3 (ref), Hidden (ref), publish (copy)
		Flag1 = false
		local v5 = v2
		
		if v5 == nil or Flag then return end
		local Hidden1 = if v2 == nil then HostPresentationPhase.Hidden elseif ContentMounted then if P22 == RecyclableViewReadinessModule.ReadyOnAssignment or IsReadyOnAssignmentMatch then HostPresentationPhase.Presented elseif HideWhilePending then HostPresentationPhase.Hidden else HostPresentationPhase.Pending else HostPresentationPhase.Hidden
		
		if v3 ~= v5 or Hidden ~= Hidden1 then
			publish(v5, Hidden1)
			
			return
		end
	end
	
	local function requestPublication()
		-- upvalues: Flag1 (ref), SignalsSchedulerModule (upval), v4 (ref)
		if not Flag1 then
			Flag1 = true
			SignalsSchedulerModule.schedule(v4)
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
		hasItem = Signal4,
		transition = function(p4)
			-- upvalues: Flag (ref), v2 (ref), PlacementKindModule (upval), ReparentableHost (upval), Frame (copy), v3 (ref), Hidden (ref), v1 (ref), publish (copy), HostPresentationPhase (upval), Composition (ref), P22 (copy), RecyclableViewReadinessModule (upval), IsReadyOnAssignmentMatch (ref), Count (ref), SignalsExperimentalModule (upval), Signal2_2 (copy), Signal4 (copy), Signal2_3 (copy), Signal2_5 (ref), Signal2_1 (copy), Signal2 (copy), Signal2_4 (copy), Binding2 (copy), Flag1 (ref), SignalsSchedulerModule (upval), v4 (ref)
			if Flag then
				assert(p4 == nil, "RecyclableView: cannot transition an occupied state after destroy")
				
				return
			end
			local v5 = v2
			local Assignment = if v5 == nil then nil else v5.assignment
			local Assignment1 = if p4 == nil then nil else p4.assignment
			local Destination = if v5 == nil then nil else v5.destination
			local Destination1 = if p4 == nil then nil else p4.destination
			
			if Destination ~= nil and (Destination1 == nil or (Destination.kind ~= Destination1.kind or (Destination.kind == PlacementKindModule.List and Destination.sink ~= Destination1.sink or Destination.kind == PlacementKindModule.Composition and Destination.placementId ~= Destination1.placementId))) then
				if v5 ~= nil then
					local Destination2 = v5.destination
					
					if Destination2.kind == PlacementKindModule.List then
						Destination2.sink.apply(nil)
					else
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
				local v6 = v1
				
				if v6 ~= nil then
					v6.clearSelection()
				end
			end
			v2 = p4
			
			if p4 ~= nil and v3 == nil then
				publish(p4, HostPresentationPhase.Hidden)
			end
			local Kind = if p4 == nil then nil else p4.destination.kind
			local IsNotAssignmentMatch: boolean = Assignment1 ~= nil and (Assignment ~= Assignment1 or Composition ~= Kind)
			local IsNotAssignmentMatch1: boolean = P22 == RecyclableViewReadinessModule.ReadyOnCommit and (Assignment1 ~= nil and (Assignment ~= Assignment1 or not IsReadyOnAssignmentMatch))
			
			if IsNotAssignmentMatch1 then
				Count += 1
			end
			IsReadyOnAssignmentMatch = Assignment1 ~= nil and (P22 == RecyclableViewReadinessModule.ReadyOnAssignment or not IsNotAssignmentMatch1 and IsReadyOnAssignmentMatch)
			SignalsExperimentalModule.batch(function()
				-- upvalues: IsNotAssignmentMatch (copy), Composition (upval), Kind (copy), Signal2_2 (upval), Assignment1 (copy), Signal4 (upval), Signal2_3 (upval), IsNotAssignmentMatch1 (copy), Signal2_5 (upval), Count (upval), Signal2_1 (upval), p4 (copy), Signal2 (upval), Signal2_4 (upval), P22 (upval), RecyclableViewReadinessModule (upval), Binding2 (upval), Flag1 (upval), SignalsSchedulerModule (upval), v4 (upval)
				if IsNotAssignmentMatch then
					Composition = Kind
					Signal2_2(Assignment1)
					
					if not Signal4(false) then
						Signal2_3(true)
					end
				end
				if IsNotAssignmentMatch1 then
					Signal2_5(Count)
				end
				Signal2_1(if p4 == nil then nil else p4.index)
				Signal2(Assignment1)
				Signal2_4(if p4 == nil then nil else p4.destination.compositionPlacement)
				
				if P22 == RecyclableViewReadinessModule.ReadyOnCommit and (Assignment1 == nil or IsNotAssignmentMatch1) then
					Binding2(Assignment1 ~= nil)
				end
				if p4 ~= nil and not Flag1 then
					Flag1 = true
					SignalsSchedulerModule.schedule(v4)
				end
			end)
		end,
		pending = Binding,
		contentRevision = Signal6,
		commitContent = function(Count1): boolean
			-- upvalues: Flag (ref), P22 (copy), RecyclableViewReadinessModule (upval), v2 (ref), Count (ref), IsReadyOnAssignmentMatch (ref), SignalsExperimentalModule (upval), Binding2 (copy), Flag1 (ref), SignalsSchedulerModule (upval), v4 (ref)
			if Flag or P22 ~= RecyclableViewReadinessModule.ReadyOnCommit or v2 == nil or Count1 ~= Count then
				return false
			else
				IsReadyOnAssignmentMatch = true
				SignalsExperimentalModule.batch(function()
					-- upvalues: Binding2 (upval), Flag1 (upval), SignalsSchedulerModule (upval), v4 (upval)
					Binding2(false)
					
					if not Flag1 then
						Flag1 = true
						SignalsSchedulerModule.schedule(v4)
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
		readiness = P22,
		hideWhilePending = HideWhilePending,
		compositionPlacement = Signal5,
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
			local v5 = v1
			
			if v5 ~= nil then
				v5.clearSelection()
			end
		end,
		detachFromPlaceholder = function(p4)
			-- upvalues: v1 (ref)
			local v5 = v1
			
			if v5 ~= nil then
				v5.detachFromPlaceholder(p4)
			end
		end,
		destroy = function()
			-- upvalues: Flag (ref), v2 (ref), PlacementKindModule (upval), ReparentableHost (upval), Frame (copy), v1 (ref), Binding2 (copy)
			if Flag then return end
			Flag = true
			local v5 = v2
			
			if v5 ~= nil then
				local Destination = v5.destination
				
				if Destination.kind == PlacementKindModule.List then
					Destination.sink.apply(nil)
				else
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