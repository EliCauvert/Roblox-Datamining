local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local CanvasItemPlacerModule = require(ViewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local HostPresentationPhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local MeasurementBatcherModule = require(ViewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local MeasurerModule = require(ViewRecyclerRoblox.RobloxAdapter.Measurer)
local ReparentableHostModule = require(ViewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local ShallowTable = require(ViewRecyclerRoblox.Parent.ViewRecycler).Adapter._Private.ShallowTable
local Frozen = table.freeze({ "key", "generation" })

return {
	new = function(Configuration) --[[ Line: 56 ]]
		-- upvalues: MeasurementBatcherModule (copy), ReparentableHostModule (copy), CanvasItemPlacerModule (copy), MeasurerModule (copy), ShallowTable (copy), Frozen (copy), HostPresentationPhaseModule (copy)
		local Configuration1 = {
			container = Configuration.container,
			viewportContainer = Configuration.viewportContainer,
			axis = Configuration.axis,
			selfSizing = Configuration.selfSizing
		}
		local Tbl = {}
		local NewMeasurementBatcher = MeasurementBatcherModule.new(Configuration.onItemMeasurements)
		local Flag = false
		
		local function _(p1) --[[ Line: 67 | Named "disconnectMeasurer" ]]
			if p1.measurer ~= nil then
				p1.measurer.disconnect()
				p1.measurer = nil
			end
		end
		
		local _ = function(p1) --[[ Line: 74 | Named "detachHost" ]]
			-- upvalues: ReparentableHostModule (upval), CanvasItemPlacerModule (upval)
			if p1.host ~= nil then
				ReparentableHostModule.clearSelection(p1.host)
				CanvasItemPlacerModule.detachForTransfer(p1.host, p1.placerState)
				p1.host = nil
			end
			if p1.measurer ~= nil then
				p1.measurer.disconnect()
				p1.measurer = nil
			end
			p1.measurementIdentity = nil
		end
		
		local function updateMeasurement(p1, MeasurementIdentity) --[[ Line: 84 ]]
			-- upvalues: Configuration1 (ref), MeasurerModule (upval), NewMeasurementBatcher (copy)
			p1.measurementIdentity = MeasurementIdentity
			
			if MeasurementIdentity ~= nil and (Configuration1.selfSizing or MeasurementIdentity.pinnedPosition ~= nil) then
				if p1.measurer == nil then
					p1.measurer = MeasurerModule.attach({
						instance = p1.host,
						axis = Configuration1.axis,
						getIdentity = function() --[[ Line: 96 ]]
							-- upvalues: p1 (copy)
							return p1.measurementIdentity
						end,
						onItemMeasured = function(Tbl, Length) --[[ Line: 99 ]]
							-- upvalues: NewMeasurementBatcher (upval)
							local Copy = table.clone(Tbl)
							Copy.length = Length
							NewMeasurementBatcher.add(Copy)
						end
					})
				end
				p1.measurer.scheduleSettle()
				
				return
			elseif p1.measurer ~= nil then
				p1.measurer.disconnect()
				p1.measurer = nil
			end
		end
		
		local function getEntry(Key) --[[ Line: 109 ]]
			-- upvalues: Tbl (copy), CanvasItemPlacerModule (upval)
			local Entry = Tbl[Key]
			
			if Entry == nil then
				Entry = {
					host = nil,
					hostState = nil,
					placementIntent = nil,
					presentedGeneration = nil,
					measurer = nil,
					measurementIdentity = nil,
					placerState = CanvasItemPlacerModule.createState(),
					geometry = {}
				}
				Tbl[Key] = Entry
			end
			return Entry
		end
		
		local function reportPresentation(p1, p2, p3) --[[ Line: 127 ]]
			-- upvalues: Configuration (copy)
			local Generation = if p3 == nil then nil else p3.generation
			
			if p2.presentedGeneration == Generation then return end
			local PresentedGeneration = p2.presentedGeneration
			p2.presentedGeneration = Generation
			local Success, Result = pcall(Configuration.onItemViewPresentationChanged, p1, p3)
			
			if not Success then
				if p2.presentedGeneration == Generation then
					p2.presentedGeneration = PresentedGeneration
				end
				error(Result, 0)
			end
		end
		
		local function applyPhysical(p1, p2) --[[ Line: 143 ]]
			-- upvalues: ReparentableHostModule (upval), CanvasItemPlacerModule (upval), Configuration (copy), ShallowTable (upval), Frozen (upval), Configuration1 (ref), HostPresentationPhaseModule (upval), updateMeasurement (copy), reportPresentation (copy)
			local HostState = p2.hostState
			local PlacementIntent = p2.placementIntent
			
			if HostState == nil then
				if p2.host ~= nil then
					ReparentableHostModule.clearSelection(p2.host)
					CanvasItemPlacerModule.detachForTransfer(p2.host, p2.placerState)
					p2.host = nil
				end
				if p2.measurer ~= nil then
					p2.measurer.disconnect()
					p2.measurer = nil
				end
				p2.measurementIdentity = nil
				
				if p2.presentedGeneration == nil then return end
				local PresentedGeneration = p2.presentedGeneration
				p2.presentedGeneration = nil
				local Success, Result = pcall(Configuration.onItemViewPresentationChanged, p1, nil)
				
				if not Success then
					if p2.presentedGeneration == nil then
						p2.presentedGeneration = PresentedGeneration
					end
					error(Result, 0)
				end
				return
			else
				local Assignment = HostState.assignment
				local Host = HostState.host
				
				if Assignment == nil or Host == nil then
					if p2.host ~= nil then
						ReparentableHostModule.clearSelection(p2.host)
						CanvasItemPlacerModule.detachForTransfer(p2.host, p2.placerState)
						p2.host = nil
					end
					if p2.measurer ~= nil then
						p2.measurer.disconnect()
						p2.measurer = nil
					end
					p2.measurementIdentity = nil
					
					if p2.presentedGeneration == nil then return end
					local PresentedGeneration = p2.presentedGeneration
					p2.presentedGeneration = nil
					local Success1, Result1 = pcall(Configuration.onItemViewPresentationChanged, p1, nil)
					
					if not Success1 then
						if p2.presentedGeneration == nil then
							p2.presentedGeneration = PresentedGeneration
						end
						error(Result1, 0)
					end
					return
				else
					if PlacementIntent == nil then return end
					if ShallowTable.containsEqual(PlacementIntent.assignment, Assignment, Frozen) then
						if p2.host ~= nil and p2.host ~= Host then
							if p2.host ~= nil then
								ReparentableHostModule.clearSelection(p2.host)
								CanvasItemPlacerModule.detachForTransfer(p2.host, p2.placerState)
								p2.host = nil
							end
							if p2.measurer ~= nil then
								p2.measurer.disconnect()
								p2.measurer = nil
							end
							p2.measurementIdentity = nil
						end
						local Container = Configuration1.container
						local CanvasPlacement = PlacementIntent.canvasPlacement
						local ViewportPlacement = PlacementIntent.viewportPlacement
						local HasViewportContainer: boolean = ViewportPlacement ~= nil and Configuration1.viewportContainer ~= nil
						local ViewportPlacement1 = if HasViewportContainer then ViewportPlacement else CanvasPlacement
						
						if HasViewportContainer then
							Container = Configuration1.viewportContainer
						end
						if Container == nil then
							if p2.host ~= nil then
								ReparentableHostModule.clearSelection(p2.host)
								CanvasItemPlacerModule.detachForTransfer(p2.host, p2.placerState)
								p2.host = nil
							end
							if p2.measurer ~= nil then
								p2.measurer.disconnect()
								p2.measurer = nil
							end
							p2.measurementIdentity = nil
							
							if p2.presentedGeneration == nil then return end
							local PresentedGeneration = p2.presentedGeneration
							p2.presentedGeneration = nil
							local Success3, Result3 = pcall(Configuration.onItemViewPresentationChanged, p1, nil)
							
							if not Success3 then
								if p2.presentedGeneration == nil then
									p2.presentedGeneration = PresentedGeneration
								end
								error(Result3, 0)
							end
							return
						else
							local Geometry = CanvasItemPlacerModule.getGeometry(PlacementIntent.itemLayout, ViewportPlacement1, Configuration1.axis, Configuration1.selfSizing or Assignment.index == nil, if HasViewportContainer then 0 else PlacementIntent.contentStartOffset, p2.geometry)
							
							if not HostState.visible then
								ReparentableHostModule.clearSelection(Host)
							end
							CanvasItemPlacerModule.place(Host, Container, Geometry, p2.placerState, HostState.visible)
							p2.host = Host
							local IsPhaseMatch: boolean = HostState.visible and HostState.phase == HostPresentationPhaseModule.Presented
							local MeasurementIdentity = PlacementIntent.measurementIdentity
							updateMeasurement(p2, if IsPhaseMatch and MeasurementIdentity ~= nil then table.clone(MeasurementIdentity) else nil)
							reportPresentation(p1, p2, if IsPhaseMatch then Assignment else nil)
							
							return
						end
					else
						if not HostState.visible and p2.host ~= nil then
							ReparentableHostModule.clearSelection(p2.host)
							CanvasItemPlacerModule.hide(p2.host, p2.placerState)
							
							if p2.measurer ~= nil then
								p2.measurer.disconnect()
								p2.measurer = nil
							end
							p2.measurementIdentity = nil
							
							if p2.presentedGeneration == nil then return end
							local PresentedGeneration = p2.presentedGeneration
							p2.presentedGeneration = nil
							local Success2, Result2 = pcall(Configuration.onItemViewPresentationChanged, p1, nil)
							
							if not Success2 then
								if p2.presentedGeneration == nil then
									p2.presentedGeneration = PresentedGeneration
								end
								error(Result2, 0)
							end
						end
					end
				end
			end
		end
		
		return {
			applyHostState = function(p1, HostState) --[[ Line: 213 ]]
				-- upvalues: Flag (ref), getEntry (copy), applyPhysical (copy)
				assert(not Flag, "HostPlacement: cannot apply Host state after destroy")
				local Entry = getEntry(p1)
				Entry.hostState = HostState
				applyPhysical(p1, Entry)
			end,
			applyPlacementIntent = function(p1, PlacementIntent) --[[ Line: 219 ]]
				-- upvalues: Flag (ref), getEntry (copy), applyPhysical (copy)
				assert(not Flag, "HostPlacement: cannot apply Placement intent after destroy")
				local Entry = getEntry(p1)
				Entry.placementIntent = PlacementIntent
				applyPhysical(p1, Entry)
			end,
			setConfiguration = function(Value) --[[ Line: 225 ]]
				-- upvalues: Flag (ref), Configuration1 (ref), Tbl (copy), applyPhysical (copy)
				if not Flag then
					local IsNotAxisMatch = Configuration1.axis ~= Value.axis
					Configuration1 = Value
					
					for i, value in Tbl do
						if IsNotAxisMatch and value.measurer ~= nil then
							value.measurer.disconnect()
							value.measurer = nil
						end
						applyPhysical(i, value)
					end
				end
			end,
			cancelPendingMeasurements = function() --[[ Line: 237 ]]
				-- upvalues: NewMeasurementBatcher (copy)
				NewMeasurementBatcher.cancelPending()
			end,
			destroy = function() --[[ Line: 240 ]]
				-- upvalues: Flag (ref), NewMeasurementBatcher (copy), Tbl (copy), ReparentableHostModule (upval), CanvasItemPlacerModule (upval)
				if Flag then return end
				Flag = true
				NewMeasurementBatcher.destroy()
				
				for _, value in Tbl do
					if value.host ~= nil then
						ReparentableHostModule.clearSelection(value.host)
						CanvasItemPlacerModule.detachForTransfer(value.host, value.placerState)
						value.host = nil
					end
					if value.measurer ~= nil then
						value.measurer.disconnect()
						value.measurer = nil
					end
					value.measurementIdentity = nil
				end
				table.clear(Tbl)
			end
		}
	end
}