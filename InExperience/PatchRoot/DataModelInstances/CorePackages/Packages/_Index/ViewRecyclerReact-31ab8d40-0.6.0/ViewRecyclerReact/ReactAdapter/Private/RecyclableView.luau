local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.ViewRecycler)
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local hostPresentationPhase = viewRecyclerRobloxModule.HostPresentationPhase
local placementKindModule = require(script.Parent.PlacementKind)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewReadinessModule = require(viewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local reparentableHost = viewRecyclerRobloxModule.ReparentableHost
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsExperimentalModule = require(viewRecyclerReact.Parent.SignalsExperimental)
local signalsSchedulerModule = require(viewRecyclerReact.Parent.SignalsScheduler)

return function(p1, p2, p3, p4, p5)
	-- upvalues: recyclableViewRegistryModule (ref), signalsModule (ref), reactModule (ref), recyclableViewReadinessModule (ref), reparentableHost (ref), placementKindModule (ref), hostPresentationPhase (ref), signalsSchedulerModule (ref), signalsExperimentalModule (ref)
	local metadata = recyclableViewRegistryModule.getMetadata(p2)
	assert(metadata ~= nil, "RecyclableView: unknown Recyclable view type")
	p4 = p4 or metadata.readiness
	local var1 = if p5 == nil then metadata.hideWhilePending else p5
	local var2, var3 = signalsModule.createSignal(p3)
	local var4, var5 = signalsModule.createSignal(nil)
	local var6, var7 = signalsModule.createSignal(p3)
	local var8, var9 = signalsModule.createSignal(nil)
	local var10, var11 = reactModule.createBinding(false)
	local var12 = if p3 == nil then 0 else 1
	local _ = nil
	local _ = nil
	
	if p4 == recyclableViewReadinessModule.ReadyOnCommit then
		local var13, var14 = signalsModule.createSignal(var12)
		local var15 = var13
		local var16 = var14
	else
		local var15 = function(_)
			-- upvalues: var12 (write)
			return var12
		end
		
		local var16 = function(_) end
	end
	local frame = Instance.new("Frame")
	frame.Name = `ListItemViewFrame{p1}`
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Position = UDim2.new()
	frame.Size = UDim2.new()
	local var17 = nil
	local var18 = nil
	local var19 = nil
	local var20 = true
	local var21 = false
	local var22 = nil
	local var23 = nil
	local var24 = nil
	local var25 = nil
	local var26 = nil
	local var27 = false
	local var28 = false
	local _ = nil
	
	local function _()
		-- upvalues: reparentableHost (copy), frame (ref)
		reparentableHost.detach(frame)
		frame.AnchorPoint = Vector2.zero
		frame.Position = UDim2.new()
		frame.Size = UDim2.new()
		frame.AutomaticSize = Enum.AutomaticSize.None
	end
	
	local function measurementDependencies(p6)
		-- upvalues: var2 (ref), signalsModule (copy)
		local _ = nil
		
		return {
			get = function()
				-- upvalues: var2 (copy), p6 (ref)
				local var29 = var2(false)
				
				return if var29 == nil then {} else p6.getMeasurementDependencies(var29)
			end,
			subscribe = function(p7)
				-- upvalues: signalsModule (copy), var2 (copy), p6 (ref)
				local var29 = nil
				local var30 = nil
				local var31 = true
				local var32 = signalsModule.createEffect(function(p8)
					-- upvalues: var2 (copy), var29 (write), var30 (write), p6 (copy), p7 (ref), var31 (write)
					local var33 = var2(p8)
					
					if var29 ~= var33 then
						if var30 ~= nil then
							var30()
							var30 = nil
						end
						var29 = var33
						
						if var33 ~= nil then
							var30 = p6.subscribeMeasurementDependencies(var33, p7)
						end
						if not var31 then
							p7()
						end
					end
					var31 = false
				end)
				
				return function()
					-- upvalues: var32 (ref), var30 (write)
					var32()
					
					if var30 ~= nil then
						var30()
					end
				end
			end
		}
	end
	
	local _ = function()
		-- upvalues: var24 (write), var25 (write), var26 (write)
		if var24 ~= nil and var24.setMeasurementDependencies ~= nil then
			var24.setMeasurementDependencies(nil)
		end
		var24 = nil
		var25 = nil
		var26 = nil
	end
	
	local function registerListDependencies(p6)
		-- upvalues: var24 (write), var25 (write), var26 (write), measurementDependencies (ref)
		local sink = p6.sink
		local compositionPlacement = p6.compositionPlacement
		
		if var24 == sink and (compositionPlacement == nil and var25 == nil or var25 ~= nil and var26 == compositionPlacement) then return end
		if var24 ~= nil and var24.setMeasurementDependencies ~= nil then
			var24.setMeasurementDependencies(nil)
		end
		var24 = nil
		var25 = nil
		var26 = nil
		
		if compositionPlacement ~= nil and sink.setMeasurementDependencies ~= nil then
			var25 = measurementDependencies(compositionPlacement)
			var24 = sink
			var26 = compositionPlacement
			sink.setMeasurementDependencies(var25)
		end
	end
	
	local _ = function(p6)
		-- upvalues: placementKindModule (copy), var24 (write), var25 (write), var26 (write), frame (ref), reparentableHost (copy)
		if p6 == nil then return end
		local destination = p6.destination
		
		if destination.kind ~= placementKindModule.List then
			destination.detachMeasurementDependency(frame)
			reparentableHost.detach(frame)
			frame.AnchorPoint = Vector2.zero
			frame.Position = UDim2.new()
			frame.Size = UDim2.new()
			frame.AutomaticSize = Enum.AutomaticSize.None
			
			return
		end
		destination.sink.apply(nil)
		
		if var24 ~= nil and var24.setMeasurementDependencies ~= nil then
			var24.setMeasurementDependencies(nil)
		end
		var24 = nil
		var25 = nil
		var26 = nil
	end
	
	local _ = function()
		-- upvalues: var18 (write), hostPresentationPhase (copy), var21 (write), p4 (ref), recyclableViewReadinessModule (copy), var20 (write), var1 (ref)
		return if var18 == nil then hostPresentationPhase.Hidden elseif var21 and (p4 == recyclableViewReadinessModule.ReadyOnAssignment or var20) then hostPresentationPhase.Presented elseif var1 then hostPresentationPhase.Hidden else hostPresentationPhase.Pending
	end
	
	local var29 = function()
		-- upvalues: var28 (write), var18 (write), var27 (write), hostPresentationPhase (copy), var21 (write), p4 (ref), recyclableViewReadinessModule (copy), var20 (write), var1 (ref), var22 (write), var23 (write), placementKindModule (copy), registerListDependencies (ref), frame (ref), reparentableHost (copy)
		var28 = false
		
		if var18 == nil or var27 then return end
		local var30 = if var18 == nil then hostPresentationPhase.Hidden elseif var21 and (p4 == recyclableViewReadinessModule.ReadyOnAssignment or var20) then hostPresentationPhase.Presented elseif var1 then hostPresentationPhase.Hidden else hostPresentationPhase.Pending
		
		if var22 == var18 and var23 == var30 then return end
		local destination = var18.destination
		
		if destination.kind == placementKindModule.List then
			registerListDependencies(destination)
			destination.sink.apply({ host = frame, phase = var30, state = destination.state })
		elseif frame.Parent ~= destination.placeholder or frame.AutomaticSize ~= destination.automaticSize then
			reparentableHost.place(frame, destination)
		end
		frame.Visible = var30 ~= hostPresentationPhase.Hidden
		destination.attachMeasurementDependency(frame)
		var22 = var18
		var23 = var30
	end
	
	local function requestPublication()
		-- upvalues: var28 (write), signalsSchedulerModule (copy), var29 (write)
		if not var28 then
			var28 = true
			signalsSchedulerModule.schedule(var29)
		end
	end
	
	return {
		id = p1,
		viewType = p2,
		itemViewType = p2,
		signal = var2,
		indexSignal = var4,
		itemSignal = function(value)
			-- upvalues: var6 (ref), var19 (write), placementKindModule (copy)
			local var30 = var6(value)
			assert(var30 ~= nil, "RecyclableView: item read before first Assignment")
			
			return if var19 == placementKindModule.Composition then var30.value(value) else var30.value
		end,
		itemKeySignal = function(value)
			-- upvalues: var6 (ref)
			local var30 = var6(value)
			assert(var30 ~= nil, "RecyclableView: item key read before first Assignment")
			
			return var30.key
		end,
		hasItem = function(p6)
			-- upvalues: var6 (ref)
			return var6(p6) ~= nil
		end,
		transition = function(p6)
			-- upvalues: var27 (write), var18 (write), placementKindModule (copy), var24 (write), var25 (write), var26 (write), frame (ref), reparentableHost (copy), var22 (write), var23 (write), var17 (write), hostPresentationPhase (copy), var19 (write), p4 (ref), recyclableViewReadinessModule (copy), var20 (write), var12 (write), signalsExperimentalModule (copy), var7 (ref), var16 (write), var5 (ref), var3 (ref), var9 (ref), var11 (ref), var28 (write), signalsSchedulerModule (copy), var29 (write)
			if var27 then
				assert(p6 == nil, "RecyclableView: cannot transition an occupied state after destroy")
				
				return
			end
			local var30 = if var18 == nil then nil else var18.assignment
			local var31 = if p6 == nil then nil else p6.assignment
			local var32 = if var18 == nil then nil else var18.destination
			local var33 = if p6 == nil then nil else p6.destination
			
			if var32 ~= nil and (if var33 ~= nil then if var32.kind == var33.kind and var32.kind == placementKindModule.List then if var32.sink == var33.sink then var32.kind == placementKindModule.Composition and var32.placementId ~= var33.placementId else true else true else true) then
				if var18 ~= nil then
					local destination = var18.destination
					
					if destination.kind == placementKindModule.List then
						destination.sink.apply(nil)
						
						if var24 ~= nil and var24.setMeasurementDependencies ~= nil then
							var24.setMeasurementDependencies(nil)
						end
						var24 = nil
						var25 = nil
						var26 = nil
					else
						destination.detachMeasurementDependency(frame)
						reparentableHost.detach(frame)
						frame.AnchorPoint = Vector2.zero
						frame.Position = UDim2.new()
						frame.Size = UDim2.new()
						frame.AutomaticSize = Enum.AutomaticSize.None
					end
				end
				var22 = nil
				var23 = nil
			end
			if var30 ~= nil and var30 ~= var31 then
				local var34 = var17
				
				if var34 ~= nil then
					var34.clearSelection()
				end
			end
			var18 = p6
			
			if var30 ~= var31 and p6 ~= nil then
				local destination = p6.destination
				
				if destination.kind == placementKindModule.List then
					destination.sink.apply({
						host = frame,
						phase = hostPresentationPhase.Hidden,
						state = destination.state
					})
				else
					frame.Visible = false
				end
				var22 = p6
				var23 = hostPresentationPhase.Hidden
			end
			local var35 = if p6 == nil then nil else p6.destination.kind
			local var36 = var31 ~= nil and (if var30 == var31 then var19 ~= var35 else true)
			local var37 = p4 == recyclableViewReadinessModule.ReadyOnCommit and (var31 ~= nil and (if var30 == var31 then not var20 else true))
			
			if var37 then
				var12 += 1
			end
			var20 = if var31 == nil then false else p4 == recyclableViewReadinessModule.ReadyOnAssignment or (if var37 then false else var20)
			signalsExperimentalModule.batch(function()
				-- upvalues: var36 (ref), var19 (copy), var35 (ref), var7 (copy), var31 (ref), var37 (ref), var16 (copy), var12 (copy), var5 (copy), p6 (ref), var3 (copy), var9 (copy), p4 (copy), recyclableViewReadinessModule (copy), var11 (copy), var28 (copy), signalsSchedulerModule (copy), var29 (copy)
				if var36 then
					var19 = var35
					var7(var31)
				end
				if var37 then
					var16(var12)
				end
				var5(if p6 == nil then nil else p6.index)
				var3(var31)
				var9(if p6 == nil then nil else p6.destination.compositionPlacement)
				
				if p4 == recyclableViewReadinessModule.ReadyOnCommit and (var31 == nil or var37) then
					var11(var31 ~= nil)
				end
				if p6 ~= nil and not var28 then
					var28 = true
					signalsSchedulerModule.schedule(var29)
				end
			end)
		end,
		pending = var10,
		contentRevision = var15,
		commitContent = function(p6)
			-- upvalues: var27 (write), p4 (ref), recyclableViewReadinessModule (copy), var18 (write), var12 (write), var20 (write), signalsExperimentalModule (copy), var11 (ref), var28 (write), signalsSchedulerModule (copy), var29 (write)
			if var27 or p4 ~= recyclableViewReadinessModule.ReadyOnCommit or (var18 == nil or p6 ~= var12) then
				return false
			end
			var20 = true
			signalsExperimentalModule.batch(function()
				-- upvalues: var11 (copy), var28 (copy), signalsSchedulerModule (copy), var29 (copy)
				var11(false)
				
				if not var28 then
					var28 = true
					signalsSchedulerModule.schedule(var29)
				end
			end)
			
			return true
		end,
		setContentMounted = function(value)
			-- upvalues: var27 (write), var21 (write), var18 (write), signalsExperimentalModule (copy), requestPublication (ref)
			if var27 or var21 == value then return end
			var21 = value
			
			if value and var18 ~= nil then
				signalsExperimentalModule.batch(requestPublication)
			end
		end,
		readiness = p4,
		hideWhilePending = var1,
		compositionPlacement = var8,
		portalFrame = function(_)
			-- upvalues: var27 (write), frame (ref)
			return if var27 then nil else frame
		end,
		bindHost = function(p6)
			-- upvalues: var27 (write), var17 (write)
			assert(not var27, "RecyclableView: cannot bind a destroyed host")
			assert(var17 == nil, "RecyclableView: host is already bound")
			var17 = p6
			local var30 = true
			
			return function()
				-- upvalues: var30 (write), var17 (copy), p6 (ref)
				if var30 and var17 == p6 then
					var30 = false
					var17 = nil
				end
			end
		end,
		clearSelection = function()
			-- upvalues: var17 (write)
			if var17 ~= nil then
				var17.clearSelection()
			end
		end,
		detachFromPlaceholder = function(p6)
			-- upvalues: var17 (write)
			if var17 ~= nil then
				var17.detachFromPlaceholder(p6)
			end
		end,
		destroy = function()
			-- upvalues: var27 (write), var18 (write), placementKindModule (copy), var24 (write), var25 (write), var26 (write), frame (ref), reparentableHost (copy), var17 (write), var11 (ref)
			if var27 then return end
			var27 = true
			
			if var18 ~= nil then
				local destination = var18.destination
				
				if destination.kind == placementKindModule.List then
					destination.sink.apply(nil)
					
					if var24 ~= nil and var24.setMeasurementDependencies ~= nil then
						var24.setMeasurementDependencies(nil)
					end
					var24 = nil
					var25 = nil
					var26 = nil
				else
					destination.detachMeasurementDependency(frame)
					reparentableHost.detach(frame)
					frame.AnchorPoint = Vector2.zero
					frame.Position = UDim2.new()
					frame.Size = UDim2.new()
					frame.AutomaticSize = Enum.AutomaticSize.None
				end
			end
			var18 = nil
			var17 = nil
			var11(false)
			frame.Parent = nil
			frame:Destroy()
		end
	}
end