local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler)
local absolutePlacementModule = require(viewRecyclerRoblox.RobloxAdapter.AbsolutePlacement)
local canvasItemPlacerModule = require(viewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local hostMeasurementModule = require(viewRecyclerRoblox.RobloxAdapter.HostMeasurement)
local hostPresentationPhaseModule = require(viewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local reparentableHostModule = require(viewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local stackPlacementModule = require(viewRecyclerRoblox.RobloxAdapter.StackPlacement)
local t = {}

local function zero()
	return 0
end

function t.new(p1)
	-- upvalues: zero (ref), absolutePlacementModule (ref), hostMeasurementModule (ref), reparentableHostModule (ref), canvasItemPlacerModule (ref), stackPlacementModule (ref), hostPresentationPhaseModule (ref)
	local t = {
		container = p1.container,
		viewportContainer = p1.viewportContainer,
		axis = p1.axis,
		selfSizing = p1.selfSizing,
		stackedSpacing = p1.stackedSpacing
	}
	local t_1 = {}
	local var1 = nil
	local var2 = nil
	local var3 = false
	local var4 = 0
	local var5 = false
	local getCanvasOriginOffset = p1.getCanvasOriginOffset or zero
	local var6 = absolutePlacementModule.new(t.axis, t.selfSizing, getCanvasOriginOffset)
	
	local function _()
		-- upvalues: var1 (write), var3 (write)
		if var1 ~= nil and not var3 then
			var1.commit()
		end
	end
	
	local var7 = hostMeasurementModule.new({
		axis = t.axis,
		isUnchanged = function()
			-- upvalues: var1 (write), t_1 (ref)
			local var8 = if var1 ~= nil then not var1.takeChanged() else true
			
			for i, v in t_1 do
				local host = v.host
				
				if v.measuring and host ~= nil and (var1 == nil or not var1.isStacked(host)) then
					local absoluteSize = host.AbsoluteSize
					
					if v.checkedSize ~= absoluteSize then
						v.checkedSize = absoluteSize
						var8 = false
					end
				end
			end
			return var8
		end,
		onItemMeasurements = p1.onItemMeasurements
	})
	
	local _ = function(p2, p3)
		-- upvalues: var7 (ref)
		p3.checkedSize = nil
		
		if p3.measuring then
			p3.measuring = false
			var7.measure(p2, nil, nil)
		end
	end
	
	local function detachHost(p2, p3)
		-- upvalues: var1 (write), reparentableHostModule (copy), canvasItemPlacerModule (copy), var6 (ref), var7 (ref)
		local host = p3.host
		
		if host ~= nil then
			if var1 ~= nil then
				var1.remove(host)
			end
			reparentableHostModule.clearSelection(host)
			canvasItemPlacerModule.detachForTransfer(host, p3.placerState)
			var6.remove(host)
			p3.host = nil
		end
		p3.checkedSize = nil
		
		if p3.measuring then
			p3.measuring = false
			var7.measure(p2, nil, nil)
		end
	end
	
	local _ = function(p2)
		-- upvalues: t_1 (ref), canvasItemPlacerModule (copy), var4 (write)
		local var9 = t_1[p2]
		
		if var9 == nil then
			var9 = {
				host = nil,
				physicalState = nil,
				presentedAssignment = nil,
				measuring = false,
				checkedSize = nil,
				measurementDependencies = nil,
				placerState = canvasItemPlacerModule.createState()
			}
			t_1[p2] = var9
			var4 += 1
		end
		return var9
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: p1 (ref)
		if p3.presentedAssignment == p4 then return end
		p3.presentedAssignment = p4
		local onItemViewPresentationChanged = p1.onItemViewPresentationChanged
		
		if onItemViewPresentationChanged ~= nil then
			onItemViewPresentationChanged(p2, p4)
		end
	end
	
	local function applyPhysical(p2, p3)
		-- upvalues: detachHost (ref), p1 (ref), t (write), var1 (write), stackPlacementModule (copy), var6 (ref), reparentableHostModule (copy), hostPresentationPhaseModule (copy), var7 (ref)
		local physicalState = p3.physicalState
		
		if physicalState == nil then
			detachHost(p2, p3)
			
			if p3.presentedAssignment == nil then return end
			p3.presentedAssignment = nil
			local onItemViewPresentationChanged = p1.onItemViewPresentationChanged
			
			if onItemViewPresentationChanged ~= nil then
				onItemViewPresentationChanged(p2, nil)
			end
			return
		else
			local state = physicalState.state
			local host = physicalState.host
			
			if p3.host ~= nil and p3.host ~= host then
				detachHost(p2, p3)
			end
			local var9 = state.viewportPlacement ~= nil and t.viewportContainer ~= nil
			local var10 = if var9 then t.viewportContainer else t.container
			
			if var10 == nil then
				detachHost(p2, p3)
				
				if p3.presentedAssignment == nil then return end
				p3.presentedAssignment = nil
				local onItemViewPresentationChanged = p1.onItemViewPresentationChanged
				
				if onItemViewPresentationChanged ~= nil then
					onItemViewPresentationChanged(p2, nil)
				end
				return
			else
				local var11
				local _ = nil
				
				if var1 == nil or var9 or not stackPlacementModule.isPlacedFromLayoutOffsets(state) then
					if var1 ~= nil then
						var1.remove(host)
					end
					var11 = var6.place(host, p3.placerState, var10, state, not var9, physicalState.phase)
				else
					var11 = var1.place(host, p3.placerState, state, physicalState.phase)
					var6.remove(host)
				end
				if not var11 then
					reparentableHostModule.clearSelection(host)
				end
				p3.host = host
				local var12 = physicalState.phase == hostPresentationPhaseModule.Presented
				local selfSizing = var12 and (t.selfSizing or state.pinnedPosition ~= nil)
				p3.measuring = selfSizing
				var7.measure(p2, host, if selfSizing then state else nil, p3.measurementDependencies)
				local var13 = if var12 then state.assignment else nil
				
				if p3.presentedAssignment == var13 then return end
				p3.presentedAssignment = var13
				local onItemViewPresentationChanged = p1.onItemViewPresentationChanged
				
				if onItemViewPresentationChanged ~= nil then
					onItemViewPresentationChanged(p2, var13)
				end
			end
		end
	end
	
	local function syncStack()
		-- upvalues: t (write), var1 (write), t_1 (ref), detachHost (ref), stackPlacementModule (copy), var2 (write), getCanvasOriginOffset (ref)
		local container = t.container
		local stackedSpacing = t.stackedSpacing
		local var9 = stackedSpacing ~= nil and container ~= nil
		
		if var1 ~= nil and var9 and var1.matches(container, t.axis, stackedSpacing, t.selfSizing) then return end
		if var1 ~= nil then
			for i, v in t_1 do
				if v.host ~= nil and var1.isStacked(v.host) then
					detachHost(i, v)
				end
			end
			var1.destroy()
			var1 = nil
		end
		if var9 then
			local var10 = stackPlacementModule.new(container, t.axis, stackedSpacing, t.selfSizing)
			
			if var2 ~= nil then
				var10.setWindow(var2, getCanvasOriginOffset())
			end
			var1 = var10
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: t_1 (ref), var4 (write)
		if p3.physicalState == nil and p3.measurementDependencies == nil and t_1[p2] == p3 then
			t_1[p2] = nil
			var4 -= 1
		end
	end
	
	syncStack()
	
	return {
		apply = function(p2, p3)
			-- upvalues: var5 (write), t_1 (ref), canvasItemPlacerModule (copy), var4 (write), applyPhysical (ref), var1 (write), var3 (write)
			assert(not var5, "HostPlacement: cannot apply physical state after destroy")
			local var11 = t_1[p2]
			
			if var11 == nil then
				var11 = {
					host = nil,
					physicalState = nil,
					presentedAssignment = nil,
					measuring = false,
					checkedSize = nil,
					measurementDependencies = nil,
					placerState = canvasItemPlacerModule.createState()
				}
				t_1[p2] = var11
				var4 += 1
			end
			var11.physicalState = p3
			applyPhysical(p2, var11)
			
			if var11.physicalState == nil and var11.measurementDependencies == nil and t_1[p2] == var11 then
				t_1[p2] = nil
				var4 -= 1
			end
			if var1 ~= nil and not var3 then
				var1.commit()
			end
		end,
		setMeasurementDependencies = function(value, p2)
			-- upvalues: var5 (write), t_1 (ref), canvasItemPlacerModule (copy), var4 (write), applyPhysical (ref), var1 (write), var3 (write)
			assert(not var5, "HostPlacement: cannot register Measurement dependencies after destroy")
			local var11 = t_1[value]
			
			if var11 == nil and p2 == nil then return end
			if var11 == nil then
				local var12 = t_1[value]
				
				if var12 == nil then
					var12 = {
						host = nil,
						physicalState = nil,
						presentedAssignment = nil,
						measuring = false,
						checkedSize = nil,
						measurementDependencies = nil,
						placerState = canvasItemPlacerModule.createState()
					}
					t_1[value] = var12
					var4 += 1
				end
				var11 = var12
			end
			if var11.measurementDependencies == p2 then
				local var13 = var11
				
				if var13.physicalState == nil and var13.measurementDependencies == nil and t_1[value] == var13 then
					t_1[value] = nil
					var4 -= 1
				end
				return
			else
				var11.measurementDependencies = p2
				applyPhysical(value, var11)
				
				if var11.physicalState == nil and var11.measurementDependencies == nil and t_1[value] == var11 then
					t_1[value] = nil
					var4 -= 1
				end
				if var1 ~= nil and not var3 then
					var1.commit()
				end
			end
		end,
		setConfiguration = function(value)
			-- upvalues: var5 (write), t (write), var7 (ref), var6 (ref), syncStack (ref), t_1 (ref), applyPhysical (ref), var1 (write), var3 (write)
			if not var5 then
				t = value
				var7.setAxis(t.axis)
				var6.setConfiguration(t.axis, t.selfSizing)
				syncStack()
				
				for i, v in t_1 do
					applyPhysical(i, v)
				end
				if var1 ~= nil and not var3 then
					var1.commit()
				end
			end
		end,
		reposition = function()
			-- upvalues: var5 (write), getCanvasOriginOffset (ref), var6 (ref), var1 (write)
			if var5 then return end
			local var11 = getCanvasOriginOffset()
			var6.setOriginOffset(var11)
			
			if var1 ~= nil then
				var1.setOriginOffset(var11)
			end
		end,
		setMountedWindow = function(value, p2)
			-- upvalues: var5 (write), var2 (write), var1 (write), getCanvasOriginOffset (ref), var3 (write), t_1 (ref), applyPhysical (ref)
			if var5 then
				p2()
				
				return
			end
			var2 = value
			
			if var1 == nil then
				p2()
				
				return
			end
			var1.setWindow(value, getCanvasOriginOffset())
			var3 = true
			local ok, status = pcall(p2)
			var3 = false
			
			if var1 == var1 then
				local t = {}
				
				for i, v in var1.getStaleHosts() do
					t[v] = true
				end
				for i_1, v_1 in t_1 do
					if v_1.host ~= nil and t[v_1.host] then
						applyPhysical(i_1, v_1)
					end
				end
				var1.commit()
			end
			if not ok then
				error(status, 0)
			end
		end,
		cancelPendingMeasurements = function()
			-- upvalues: var7 (ref)
			var7.cancelPending()
		end,
		getTrackedItemViewCount = function()
			-- upvalues: var4 (write)
			return var4
		end,
		isPrePaintPassConnected = function()
			-- upvalues: var7 (ref)
			return var7.isPassConnected()
		end,
		getPrePaintReadCount = function()
			-- upvalues: var7 (ref)
			return var7.getPassReadCount()
		end,
		destroy = function()
			-- upvalues: var5 (write), var7 (ref), t_1 (ref), detachHost (ref), var6 (ref), var1 (write), var4 (write)
			if var5 then return end
			var5 = true
			var7.destroy()
			
			for i, v in t_1 do
				detachHost(i, v)
			end
			var6.destroy()
			
			if var1 ~= nil then
				var1.destroy()
				var1 = nil
			end
			table.clear(t_1)
			var4 = 0
		end
	}
end

return t