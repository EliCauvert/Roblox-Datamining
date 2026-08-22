local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local canvasItemPlacerModule = require(viewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local measurementBatcherModule = require(viewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local measurerModule = require(viewRecyclerRoblox.RobloxAdapter.Measurer)
local reparentableHostModule = require(viewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local record = viewRecyclerModule.Adapter._Private.Record
local frozen = table.freeze({ "key", "generation" })

return {
	new = function(p0) --[[ line: 55 ]]
		-- upvalues: measurementBatcherModule (ref), reparentableHostModule (ref), canvasItemPlacerModule (ref), measurerModule (ref), record (ref), frozen (ref)
		local t = {
			container = p0.container,
			viewportContainer = p0.viewportContainer,
			axis = p0.axis,
			selfSizing = p0.selfSizing
		}
		local t_1 = {}
		local var9 = measurementBatcherModule.new(p0.onItemMeasurements)
		local var10 = false
		
		local function _(p1) --[[ line: 66 | named "disconnectMeasurer" ]]
			if p1.measurer ~= nil then
				p1.measurer.disconnect()
				p1.measurer = nil
			end
		end
		
		local _ = function(p2) --[[ line: 73 | named "detachHost" ]]
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
		
		local function updateMeasurement(p3, p4) --[[ line: 83 ]]
			-- upvalues: t (write), measurerModule (copy), var9 (ref)
			p3.measurementIdentity = p4
			
			if p4 ~= nil and (t.selfSizing or p4.pinnedPosition ~= nil) then
				if p3.measurer == nil then
					p3.measurer = measurerModule.attach({
						instance = p3.host,
						axis = t.axis,
						getIdentity = function() --[[ line: 95 ]]
							-- upvalues: p3 (ref)
							return p3.measurementIdentity
						end,
						onItemMeasured = function(p5, p6) --[[ line: 98 ]]
							-- upvalues: var9 (copy)
							local cloned = table.clone(p5)
							cloned.length = p6
							var9.add(cloned)
						end
					})
				end
				p3.measurer.scheduleSettle()
				
				return
			elseif p3.measurer ~= nil then
				p3.measurer.disconnect()
				p3.measurer = nil
			end
		end
		
		local function getEntry(p7) --[[ line: 108 ]]
			-- upvalues: t_1 (ref), canvasItemPlacerModule (copy)
			local var16 = t_1[p7]
			
			if var16 == nil then
				var16 = {
					host = nil,
					hostState = nil,
					placementIntent = nil,
					presentedGeneration = nil,
					measurer = nil,
					measurementIdentity = nil,
					placerState = canvasItemPlacerModule.createState(),
					geometry = {}
				}
				t_1[p7] = var16
			end
			return var16
		end
		
		local function reportPresentation(p8, p9, p10) --[[ line: 126 ]]
			-- upvalues: p0 (ref)
			local var17 = if p10 == nil then nil else p10.generation
			
			if p9.presentedGeneration == var17 then return end
			local presentedGeneration = p9.presentedGeneration
			p9.presentedGeneration = var17
			local ok, status = pcall(p0.onItemViewPresentationChanged, p8, p10)
			
			if not ok then
				if p9.presentedGeneration == var17 then
					p9.presentedGeneration = presentedGeneration
				end
				error(status, 0)
			end
		end
		
		local function applyPhysical(p11, p12) --[[ line: 142 ]]
			-- upvalues: reparentableHostModule (copy), canvasItemPlacerModule (copy), p0 (ref), record (copy), frozen (copy), t (write), updateMeasurement (ref), reportPresentation (ref)
			local hostState = p12.hostState
			local placementIntent = p12.placementIntent
			
			if hostState == nil then
				if p12.host ~= nil then
					reparentableHostModule.clearSelection(p12.host)
					canvasItemPlacerModule.detachForTransfer(p12.host, p12.placerState)
					p12.host = nil
				end
				if p12.measurer ~= nil then
					p12.measurer.disconnect()
					p12.measurer = nil
				end
				p12.measurementIdentity = nil
				
				if p12.presentedGeneration == nil then return end
				local presentedGeneration = p12.presentedGeneration
				p12.presentedGeneration = nil
				local ok, status = pcall(p0.onItemViewPresentationChanged, p11, nil)
				
				if not ok then
					if p12.presentedGeneration == nil then
						p12.presentedGeneration = presentedGeneration
					end
					error(status, 0)
				end
				return
			else
				local assignment = hostState.assignment
				local host = hostState.host
				
				if assignment == nil or host == nil then
					if p12.host ~= nil then
						reparentableHostModule.clearSelection(p12.host)
						canvasItemPlacerModule.detachForTransfer(p12.host, p12.placerState)
						p12.host = nil
					end
					if p12.measurer ~= nil then
						p12.measurer.disconnect()
						p12.measurer = nil
					end
					p12.measurementIdentity = nil
					
					if p12.presentedGeneration == nil then return end
					local presentedGeneration = p12.presentedGeneration
					p12.presentedGeneration = nil
					local ok, status = pcall(p0.onItemViewPresentationChanged, p11, nil)
					
					if not ok then
						if p12.presentedGeneration == nil then
							p12.presentedGeneration = presentedGeneration
						end
						error(status, 0)
					end
					return
				elseif placementIntent == nil then return end
				if record.containsEqual(placementIntent.assignment, assignment, frozen) then
					if p12.host ~= nil and p12.host ~= host then
						if p12.host ~= nil then
							reparentableHostModule.clearSelection(p12.host)
							canvasItemPlacerModule.detachForTransfer(p12.host, p12.placerState)
							p12.host = nil
						end
						if p12.measurer ~= nil then
							p12.measurer.disconnect()
							p12.measurer = nil
						end
						p12.measurementIdentity = nil
					end
					local container = t.container
					local canvasPlacement = placementIntent.canvasPlacement
					local viewportPlacement = placementIntent.viewportPlacement
					local var18 = viewportPlacement ~= nil and t.viewportContainer ~= nil
					local var19 = if var18 then viewportPlacement else canvasPlacement
					
					if var18 then
						container = t.viewportContainer
					end
					if container == nil then
						if p12.host ~= nil then
							reparentableHostModule.clearSelection(p12.host)
							canvasItemPlacerModule.detachForTransfer(p12.host, p12.placerState)
							p12.host = nil
						end
						if p12.measurer ~= nil then
							p12.measurer.disconnect()
							p12.measurer = nil
						end
						p12.measurementIdentity = nil
						
						if p12.presentedGeneration == nil then return end
						local presentedGeneration = p12.presentedGeneration
						p12.presentedGeneration = nil
						local ok, status = pcall(p0.onItemViewPresentationChanged, p11, nil)
						
						if not ok then
							if p12.presentedGeneration == nil then
								p12.presentedGeneration = presentedGeneration
							end
							error(status, 0)
						end
						return
					else
						local geometry = canvasItemPlacerModule.getGeometry(placementIntent.itemLayout, var19, t.axis, t.selfSizing or assignment.index == nil, if var18 then 0 else placementIntent.contentStartOffset, p12.geometry)
						
						if not hostState.visible then
							reparentableHostModule.clearSelection(host)
						end
						canvasItemPlacerModule.place(host, container, geometry, p12.placerState, hostState.visible)
						p12.host = host
						local var21 = hostState.visible and hostState.phase == "presented"
						local measurementIdentity = placementIntent.measurementIdentity
						updateMeasurement(p12, if var21 and measurementIdentity ~= nil then table.clone(measurementIdentity) else nil)
						reportPresentation(p11, p12, if var21 then assignment else nil)
						
						return
					end
				elseif not hostState.visible and p12.host ~= nil then
					reparentableHostModule.clearSelection(p12.host)
					canvasItemPlacerModule.hide(p12.host, p12.placerState)
					
					if p12.measurer ~= nil then
						p12.measurer.disconnect()
						p12.measurer = nil
					end
					p12.measurementIdentity = nil
					
					if p12.presentedGeneration == nil then return end
					local presentedGeneration = p12.presentedGeneration
					p12.presentedGeneration = nil
					local ok, status = pcall(p0.onItemViewPresentationChanged, p11, nil)
					
					if not ok then
						if p12.presentedGeneration == nil then
							p12.presentedGeneration = presentedGeneration
						end
						error(status, 0)
					end
				end
			end
		end
		
		return {
			applyHostState = function(p13, p14) --[[ line: 212 ]]
				-- upvalues: var10 (write), getEntry (ref), applyPhysical (ref)
				assert(not var10, "CanvasItemViewRuntime: cannot apply Host state after destroy")
				local var22 = getEntry(p13)
				var22.hostState = p14
				applyPhysical(p13, var22)
			end,
			applyPlacementIntent = function(p15, p16) --[[ line: 218 ]]
				-- upvalues: var10 (write), getEntry (ref), applyPhysical (ref)
				assert(not var10, "CanvasItemViewRuntime: cannot apply Placement intent after destroy")
				local var23 = getEntry(p15)
				var23.placementIntent = p16
				applyPhysical(p15, var23)
			end,
			setConfiguration = function(value) --[[ line: 224 ]]
				-- upvalues: var10 (write), t (write), t_1 (ref), applyPhysical (ref)
				if not var10 then
					local var24 = t.axis ~= value.axis
					t = value
					
					for i, v in t_1 do
						if var24 and v.measurer ~= nil then
							v.measurer.disconnect()
							v.measurer = nil
						end
						applyPhysical(i, v)
					end
				end
			end,
			cancelPendingMeasurements = function() --[[ line: 236 ]]
				-- upvalues: var9 (ref)
				var9.cancelPending()
			end,
			destroy = function() --[[ line: 239 ]]
				-- upvalues: var10 (write), var9 (ref), t_1 (ref), reparentableHostModule (copy), canvasItemPlacerModule (copy)
				if var10 then return end
				var10 = true
				var9.destroy()
				
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