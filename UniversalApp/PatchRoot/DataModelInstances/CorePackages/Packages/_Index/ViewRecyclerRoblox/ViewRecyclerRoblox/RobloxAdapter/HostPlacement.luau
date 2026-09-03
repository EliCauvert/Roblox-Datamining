local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local canvasItemPlacerModule = require(viewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local hostPresentationPhaseModule = require(viewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local measurementBatcherModule = require(viewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local measurerModule = require(viewRecyclerRoblox.RobloxAdapter.Measurer)
local reparentableHostModule = require(viewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local shallowTable = viewRecyclerModule.Adapter._Private.ShallowTable
local frozen = table.freeze({ "key", "generation" })

return {
	new = function(p1)
		-- upvalues: measurementBatcherModule (ref), reparentableHostModule (ref), canvasItemPlacerModule (ref), measurerModule (ref), shallowTable (ref), frozen (ref), hostPresentationPhaseModule (ref)
		local t = {
			container = p1.container,
			viewportContainer = p1.viewportContainer,
			axis = p1.axis,
			selfSizing = p1.selfSizing
		}
		local t_1 = {}
		local var1 = measurementBatcherModule.new(p1.onItemMeasurements)
		local var2 = false
		
		local function _(p2)
			if p2.measurer ~= nil then
				p2.measurer.disconnect()
				p2.measurer = nil
			end
		end
		
		local _ = function(p2)
			-- upvalues: reparentableHostModule (copy), canvasItemPlacerModule (copy)
			if p2.host ~= nil then
				reparentableHostModule.clearSelection(p2.host)
				canvasItemPlacerModule.detachForTransfer(p2.host, p2.placerState)
				p2.host = nil
			end
			if p2.measurer ~= nil then
				p2.measurer.disconnect()
				p2.measurer = nil
			end
			p2.measurementIdentity = nil
		end
		
		local function updateMeasurement(p2, p3)
			-- upvalues: t (write), measurerModule (copy), var1 (ref)
			p2.measurementIdentity = p3
			
			if p3 ~= nil and (t.selfSizing or p3.pinnedPosition ~= nil) then
				if p2.measurer == nil then
					p2.measurer = measurerModule.attach({
						instance = p2.host,
						axis = t.axis,
						getIdentity = function()
							-- upvalues: p2 (ref)
							return p2.measurementIdentity
						end,
						onItemMeasured = function(p4, p5)
							-- upvalues: var1 (copy)
							local cloned = table.clone(p4)
							cloned.length = p5
							var1.add(cloned)
						end
					})
				end
				p2.measurer.scheduleSettle()
				
				return
			elseif p2.measurer ~= nil then
				p2.measurer.disconnect()
				p2.measurer = nil
			end
		end
		
		local function getEntry(p2)
			-- upvalues: t_1 (ref), canvasItemPlacerModule (copy)
			local var3 = t_1[p2]
			
			if var3 == nil then
				var3 = {
					host = nil,
					hostState = nil,
					placementIntent = nil,
					presentedGeneration = nil,
					measurer = nil,
					measurementIdentity = nil,
					placerState = canvasItemPlacerModule.createState(),
					geometry = {}
				}
				t_1[p2] = var3
			end
			return var3
		end
		
		local function reportPresentation(p2, p3, p4)
			-- upvalues: p1 (ref)
			local var3 = if p4 == nil then nil else p4.generation
			
			if p3.presentedGeneration == var3 then return end
			local presentedGeneration = p3.presentedGeneration
			p3.presentedGeneration = var3
			local ok, status = pcall(p1.onItemViewPresentationChanged, p2, p4)
			
			if not ok then
				if p3.presentedGeneration == var3 then
					p3.presentedGeneration = presentedGeneration
				end
				error(status, 0)
			end
		end
		
		local function applyPhysical(p2, p3)
			-- upvalues: reparentableHostModule (copy), canvasItemPlacerModule (copy), p1 (ref), shallowTable (copy), frozen (copy), t (write), hostPresentationPhaseModule (copy), updateMeasurement (ref), reportPresentation (ref)
			local hostState = p3.hostState
			local placementIntent = p3.placementIntent
			
			if hostState == nil then
				if p3.host ~= nil then
					reparentableHostModule.clearSelection(p3.host)
					canvasItemPlacerModule.detachForTransfer(p3.host, p3.placerState)
					p3.host = nil
				end
				if p3.measurer ~= nil then
					p3.measurer.disconnect()
					p3.measurer = nil
				end
				p3.measurementIdentity = nil
				
				if p3.presentedGeneration == nil then return end
				local presentedGeneration = p3.presentedGeneration
				p3.presentedGeneration = nil
				local ok, status = pcall(p1.onItemViewPresentationChanged, p2, nil)
				
				if not ok then
					if p3.presentedGeneration == nil then
						p3.presentedGeneration = presentedGeneration
					end
					error(status, 0)
				end
				return
			else
				local assignment = hostState.assignment
				local host = hostState.host
				
				if assignment == nil or host == nil then
					if p3.host ~= nil then
						reparentableHostModule.clearSelection(p3.host)
						canvasItemPlacerModule.detachForTransfer(p3.host, p3.placerState)
						p3.host = nil
					end
					if p3.measurer ~= nil then
						p3.measurer.disconnect()
						p3.measurer = nil
					end
					p3.measurementIdentity = nil
					
					if p3.presentedGeneration == nil then return end
					local presentedGeneration = p3.presentedGeneration
					p3.presentedGeneration = nil
					local ok, status = pcall(p1.onItemViewPresentationChanged, p2, nil)
					
					if not ok then
						if p3.presentedGeneration == nil then
							p3.presentedGeneration = presentedGeneration
						end
						error(status, 0)
					end
					return
				elseif placementIntent == nil then return end
				if shallowTable.containsEqual(placementIntent.assignment, assignment, frozen) then
					if p3.host ~= nil and p3.host ~= host then
						if p3.host ~= nil then
							reparentableHostModule.clearSelection(p3.host)
							canvasItemPlacerModule.detachForTransfer(p3.host, p3.placerState)
							p3.host = nil
						end
						if p3.measurer ~= nil then
							p3.measurer.disconnect()
							p3.measurer = nil
						end
						p3.measurementIdentity = nil
					end
					local container = t.container
					local canvasPlacement = placementIntent.canvasPlacement
					local viewportPlacement = placementIntent.viewportPlacement
					local var3 = viewportPlacement ~= nil and t.viewportContainer ~= nil
					local var4 = if var3 then viewportPlacement else canvasPlacement
					
					if var3 then
						container = t.viewportContainer
					end
					if container == nil then
						if p3.host ~= nil then
							reparentableHostModule.clearSelection(p3.host)
							canvasItemPlacerModule.detachForTransfer(p3.host, p3.placerState)
							p3.host = nil
						end
						if p3.measurer ~= nil then
							p3.measurer.disconnect()
							p3.measurer = nil
						end
						p3.measurementIdentity = nil
						
						if p3.presentedGeneration == nil then return end
						local presentedGeneration = p3.presentedGeneration
						p3.presentedGeneration = nil
						local ok, status = pcall(p1.onItemViewPresentationChanged, p2, nil)
						
						if not ok then
							if p3.presentedGeneration == nil then
								p3.presentedGeneration = presentedGeneration
							end
							error(status, 0)
						end
						return
					else
						local geometry = canvasItemPlacerModule.getGeometry(placementIntent.itemLayout, var4, t.axis, t.selfSizing or assignment.index == nil, if var3 then 0 else placementIntent.contentStartOffset, p3.geometry)
						
						if not hostState.visible then
							reparentableHostModule.clearSelection(host)
						end
						canvasItemPlacerModule.place(host, container, geometry, p3.placerState, hostState.visible)
						p3.host = host
						local var5 = hostState.visible and hostState.phase == hostPresentationPhaseModule.Presented
						local measurementIdentity = placementIntent.measurementIdentity
						updateMeasurement(p3, if var5 and measurementIdentity ~= nil then table.clone(measurementIdentity) else nil)
						reportPresentation(p2, p3, if var5 then assignment else nil)
						
						return
					end
				elseif not hostState.visible and p3.host ~= nil then
					reparentableHostModule.clearSelection(p3.host)
					canvasItemPlacerModule.hide(p3.host, p3.placerState)
					
					if p3.measurer ~= nil then
						p3.measurer.disconnect()
						p3.measurer = nil
					end
					p3.measurementIdentity = nil
					
					if p3.presentedGeneration == nil then return end
					local presentedGeneration = p3.presentedGeneration
					p3.presentedGeneration = nil
					local ok, status = pcall(p1.onItemViewPresentationChanged, p2, nil)
					
					if not ok then
						if p3.presentedGeneration == nil then
							p3.presentedGeneration = presentedGeneration
						end
						error(status, 0)
					end
				end
			end
		end
		
		return {
			applyHostState = function(p2, p3)
				-- upvalues: var2 (write), getEntry (ref), applyPhysical (ref)
				assert(not var2, "HostPlacement: cannot apply Host state after destroy")
				local var3 = getEntry(p2)
				var3.hostState = p3
				applyPhysical(p2, var3)
			end,
			applyPlacementIntent = function(p2, p3)
				-- upvalues: var2 (write), getEntry (ref), applyPhysical (ref)
				assert(not var2, "HostPlacement: cannot apply Placement intent after destroy")
				local var3 = getEntry(p2)
				var3.placementIntent = p3
				applyPhysical(p2, var3)
			end,
			setConfiguration = function(value)
				-- upvalues: var2 (write), t (write), t_1 (ref), applyPhysical (ref)
				if not var2 then
					local var3 = t.axis ~= value.axis
					t = value
					
					for i, v in t_1 do
						if var3 and v.measurer ~= nil then
							v.measurer.disconnect()
							v.measurer = nil
						end
						applyPhysical(i, v)
					end
				end
			end,
			cancelPendingMeasurements = function()
				-- upvalues: var1 (ref)
				var1.cancelPending()
			end,
			destroy = function()
				-- upvalues: var2 (write), var1 (ref), t_1 (ref), reparentableHostModule (copy), canvasItemPlacerModule (copy)
				if var2 then return end
				var2 = true
				var1.destroy()
				
				for i, v in t_1 do
					if v.host ~= nil then
						reparentableHostModule.clearSelection(v.host)
						canvasItemPlacerModule.detachForTransfer(v.host, v.placerState)
						v.host = nil
					end
					if v.measurer ~= nil then
						v.measurer.disconnect()
						v.measurer = nil
					end
					v.measurementIdentity = nil
				end
				table.clear(t_1)
			end
		}
	end
}