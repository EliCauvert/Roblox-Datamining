local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local HostPresentationPhaseModule = require(script.Parent.HostPresentationPhase)
local PlacementKindModule = require(script.Parent.PlacementKind)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsExperimentalModule = require(ViewRecyclerReact.Parent.SignalsExperimental)

return function(Id, ItemViewType, CommitGated, p1, p2)
	-- upvalues: RecyclableViewRegistryModule (copy), SignalsModule (copy), ReactModule (copy), ViewRecyclerModule (copy), PlacementKindModule (copy), HostPresentationPhaseModule (copy), RecyclableViewReadinessModule (copy), SignalsExperimentalModule (copy)
	local Metadata = RecyclableViewRegistryModule.getMetadata(ItemViewType)
	assert(Metadata ~= nil, "RecyclableView: unknown Recyclable view type")
	local P3 = p1 or Metadata.readiness
	local HideWhilePending = if p2 == nil then Metadata.hideWhilePending else p2
	local Signal, Signal2 = SignalsModule.createSignal(CommitGated)
	local Signal1, Signal2_1 = SignalsModule.createSignal(CommitGated)
	local Binding, Binding2 = ReactModule.createBinding(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(if CommitGated == nil then 0 else 1)
	local Signal4, Signal2_3 = SignalsModule.createSignal({ selfSizing = false, axis = ViewRecyclerModule.Axis.Y })
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local Frame = Instance.new("Frame")
	Frame.Name = `ListItemViewFrame{Id}`
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new()
	Frame.Size = UDim2.new()
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local Composition = nil
	local Flag = false
	local t = {}
	local CommitGated1 = CommitGated
	local SignalResult = Signal4(false)
	local Count: number = if CommitGated == nil then 0 else 1
	local Flag1 = true
	local Flag2 = false
	
	local function _(p3)
		-- upvalues: CommitGated1 (ref), HostPresentationPhaseModule (upval), P3 (copy), RecyclableViewReadinessModule (upval), Flag1 (ref), HideWhilePending (copy), Flag2 (ref), Frame (copy)
		local Assignment = CommitGated1
		local Hidden = HostPresentationPhaseModule.Hidden
		
		if Assignment ~= nil then
			if P3 == RecyclableViewReadinessModule.ReadyOnAssignment or Flag1 then
				Hidden = HostPresentationPhaseModule.Presented
			elseif not HideWhilePending then
				Hidden = HostPresentationPhaseModule.Pending
			end
		end
		p3.assignment = Assignment
		p3.host = if Flag2 then nil else Frame
		p3.phase = Hidden
		p3.visible = Assignment ~= nil and Hidden ~= HostPresentationPhaseModule.Hidden
		
		return p3
	end
	
	local _ = function(p3)
		-- upvalues: Flag2 (ref), CommitGated1 (ref), v1 (ref), v2 (ref), Flag (ref)
		assert(not Flag2, "RecyclableView: cannot publish after destroy")
		local CommitGated = CommitGated1
		
		if p3 == nil and CommitGated ~= nil or CommitGated ~= nil and CommitGated.key ~= p3.key then
			local v4 = v1
			
			if v4 ~= nil and v2 == nil and not Flag then
				v4.clearSelection()
			end
		end
		Flag = false
		
		return CommitGated
	end
	
	local _ = function()
		-- upvalues: v2 (ref), t (copy), CommitGated1 (ref), HostPresentationPhaseModule (upval), P3 (copy), RecyclableViewReadinessModule (upval), Flag1 (ref), HideWhilePending (copy), Flag2 (ref), Frame (copy)
		local v4 = v2
		
		if v4 == nil then return end
		local Assignment = CommitGated1
		local Hidden = HostPresentationPhaseModule.Hidden
		
		if Assignment ~= nil then
			if P3 == RecyclableViewReadinessModule.ReadyOnAssignment or Flag1 then
				Hidden = HostPresentationPhaseModule.Presented
			elseif not HideWhilePending then
				Hidden = HostPresentationPhaseModule.Pending
			end
		end
		t.assignment = Assignment
		t.host = if Flag2 then nil else Frame
		t.phase = Hidden
		t.visible = Assignment ~= nil and Hidden ~= HostPresentationPhaseModule.Hidden
		v4.apply(t)
	end
	
	local function setImmediate(Value)
		-- upvalues: Flag2 (ref), CommitGated1 (ref), v1 (ref), v2 (ref), Flag (ref), Signal2 (copy), Flag1 (ref), Composition (ref), v3 (ref), Signal2_1 (copy), t (copy), HostPresentationPhaseModule (upval), P3 (copy), RecyclableViewReadinessModule (upval), HideWhilePending (copy), Frame (copy)
		assert(not Flag2, "RecyclableView: cannot publish after destroy")
		local CommitGated = CommitGated1
		
		if Value == nil and CommitGated ~= nil or CommitGated ~= nil and CommitGated.key ~= Value.key then
			local v4 = v1
			
			if v4 ~= nil and v2 == nil and not Flag then
				v4.clearSelection()
			end
		end
		Flag = false
		
		if Value == nil then
			CommitGated1 = nil
			Signal2(nil)
			
			return
		end
		CommitGated1 = Value
		Flag1 = true
		Composition = v3
		Signal2_1(Value)
		Signal2(Value)
		local v5 = v2
		
		if v5 == nil then return end
		local Assignment = CommitGated1
		local Hidden = HostPresentationPhaseModule.Hidden
		
		if Assignment ~= nil then
			if P3 == RecyclableViewReadinessModule.ReadyOnAssignment or Flag1 then
				Hidden = HostPresentationPhaseModule.Presented
			elseif not HideWhilePending then
				Hidden = HostPresentationPhaseModule.Pending
			end
		end
		t.assignment = Assignment
		t.host = if Flag2 then nil else Frame
		t.phase = Hidden
		t.visible = Assignment ~= nil and Hidden ~= HostPresentationPhaseModule.Hidden
		v5.apply(t)
	end
	
	local function setCommitGated(Value)
		-- upvalues: Flag2 (ref), CommitGated1 (ref), v1 (ref), v2 (ref), Flag (ref), Flag1 (ref), Count (ref), SignalsExperimentalModule (upval), Composition (ref), v3 (ref), Signal2_1 (copy), Signal2_2 (copy), Signal2 (copy), Binding2 (copy), t (copy), HostPresentationPhaseModule (upval), P3 (copy), RecyclableViewReadinessModule (upval), HideWhilePending (copy), Frame (copy)
		assert(not Flag2, "RecyclableView: cannot publish after destroy")
		local CommitGated = CommitGated1
		
		if Value == nil and CommitGated ~= nil or CommitGated ~= nil and CommitGated.key ~= Value.key then
			local v4 = v1
			
			if v4 ~= nil and v2 == nil and not Flag then
				v4.clearSelection()
			end
		end
		Flag = false
		local NoCommitGated: boolean = Value ~= nil and (CommitGated == nil or (CommitGated.generation ~= Value.generation or not Flag1))
		
		if NoCommitGated then
			Count += 1
		end
		CommitGated1 = Value
		
		if Value == nil or NoCommitGated then
			Flag1 = false
		end
		SignalsExperimentalModule.batch(function()
			-- upvalues: Value (copy), Composition (upval), v3 (upval), Signal2_1 (upval), NoCommitGated (copy), Signal2_2 (upval), Count (upval), Signal2 (upval), Binding2 (upval)
			if Value ~= nil then
				Composition = v3
				Signal2_1(Value)
			end
			if NoCommitGated then
				Signal2_2(Count)
			end
			Signal2(Value)
			
			if Value == nil or NoCommitGated then
				Binding2(Value ~= nil)
			end
		end)
		
		if Value ~= nil then
			local v5 = v2
			
			if v5 == nil then return end
			local Assignment = CommitGated1
			local Hidden = HostPresentationPhaseModule.Hidden
			
			if Assignment ~= nil then
				if P3 == RecyclableViewReadinessModule.ReadyOnAssignment or Flag1 then
					Hidden = HostPresentationPhaseModule.Presented
				elseif not HideWhilePending then
					Hidden = HostPresentationPhaseModule.Pending
				end
			end
			t.assignment = Assignment
			t.host = if Flag2 then nil else Frame
			t.phase = Hidden
			t.visible = Assignment ~= nil and Hidden ~= HostPresentationPhaseModule.Hidden
			v5.apply(t)
		end
	end
	
	return {
		id = Id,
		viewType = ItemViewType,
		itemViewType = ItemViewType,
		signal = Signal,
		itemSignal = function(p3)
			-- upvalues: Signal1 (copy), Composition (ref), PlacementKindModule (upval)
			local SignalResult = Signal1(p3)
			assert(SignalResult ~= nil, "RecyclableView: item read before first Assignment")
			
			return if Composition == PlacementKindModule.Composition then SignalResult.value.props else SignalResult.value
		end,
		itemKeySignal = function(p3)
			-- upvalues: Signal1 (copy)
			local SignalResult = Signal1(p3)
			assert(SignalResult ~= nil, "RecyclableView: item key read before first Assignment")
			
			return SignalResult.key
		end,
		set = if P3 == RecyclableViewReadinessModule.ReadyOnAssignment then setImmediate else setCommitGated,
		pending = Binding,
		contentRevision = Signal3,
		commitContent = function(Generation, Count1): boolean
			-- upvalues: CommitGated1 (ref), Flag2 (ref), P3 (copy), RecyclableViewReadinessModule (upval), Count (ref), Flag1 (ref), Binding2 (copy), v2 (ref), t (copy), HostPresentationPhaseModule (upval), HideWhilePending (copy), Frame (copy)
			local CommitGated = CommitGated1
			
			if Flag2 or P3 ~= RecyclableViewReadinessModule.ReadyOnCommit or CommitGated == nil or CommitGated.generation ~= Generation or Count1 ~= Count then
				return false
			end
			Flag1 = true
			Binding2(false)
			local v4 = v2
			
			if v4 ~= nil then
				local Assignment = CommitGated1
				local Hidden = HostPresentationPhaseModule.Hidden
				
				if Assignment ~= nil then
					if P3 == RecyclableViewReadinessModule.ReadyOnAssignment or Flag1 then
						Hidden = HostPresentationPhaseModule.Presented
					elseif not HideWhilePending then
						Hidden = HostPresentationPhaseModule.Pending
					end
				end
				t.assignment = Assignment
				t.host = if Flag2 then nil else Frame
				t.phase = Hidden
				t.visible = Assignment ~= nil and Hidden ~= HostPresentationPhaseModule.Hidden
				v4.apply(t)
			end
			return true
		end,
		bindPlacement = function(p3, p4)
			-- upvalues: Flag2 (ref), v2 (ref), v3 (ref), Flag (ref), CommitGated1 (ref)
			assert(not Flag2, "RecyclableView: cannot bind placement after destroy")
			assert(p3 == nil == (p4 == nil), "RecyclableView: placement kind and port must be bound together")
			
			if v2 == p4 then
				assert(v3 == p3, "RecyclableView: one placement port cannot change kind")
				
				return
			end
			if v2 ~= nil then
				v2.apply(nil)
				Flag = CommitGated1 ~= nil
			end
			v2 = p4
			v3 = p3
		end,
		readiness = P3,
		hideWhilePending = HideWhilePending,
		structuralPlacement = Signal4,
		compositionPlacement = Signal5,
		setStructuralPlacement = function(Axis, SelfSizing)
			-- upvalues: SignalResult (ref), Signal2_3 (copy)
			if SignalResult.axis ~= Axis or SignalResult.selfSizing ~= SelfSizing then
				SignalResult = { axis = Axis, selfSizing = SelfSizing }
				Signal2_3(SignalResult)
				
				return
			end
		end,
		setCompositionPlacement = Signal2_4,
		portalFrame = function(_)
			-- upvalues: Flag2 (ref), Frame (copy)
			return if Flag2 then nil else Frame
		end,
		bindHost = function(p3)
			-- upvalues: Flag2 (ref), v1 (ref)
			assert(not Flag2, "RecyclableView: cannot bind a destroyed host")
			assert(v1 == nil, "RecyclableView: host is already bound")
			v1 = p3
			local Flag = true
			
			return function()
				-- upvalues: Flag (ref), v1 (upval), p3 (copy)
				if Flag and v1 == p3 then
					Flag = false
					v1 = nil
				end
			end
		end,
		clearSelection = function()
			-- upvalues: v1 (ref)
			local v4 = v1
			
			if v4 ~= nil then
				v4.clearSelection()
			end
		end,
		detachFromPlaceholder = function(p3)
			-- upvalues: v1 (ref)
			local v4 = v1
			
			if v4 ~= nil then
				v4.detachFromPlaceholder(p3)
			end
		end,
		destroy = function()
			-- upvalues: Flag2 (ref), v2 (ref), v3 (ref), v1 (ref), Binding2 (copy), Frame (copy)
			if Flag2 then return end
			if v2 ~= nil then
				v2.apply(nil)
				v2 = nil
				v3 = nil
			end
			Flag2 = true
			v1 = nil
			Binding2(false)
			Frame.Parent = nil
			Frame:Destroy()
		end
	}
end