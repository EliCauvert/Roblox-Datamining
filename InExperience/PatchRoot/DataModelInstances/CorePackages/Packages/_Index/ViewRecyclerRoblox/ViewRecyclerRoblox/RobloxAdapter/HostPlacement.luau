local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact08
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local AbsolutePlacementModule = require(ViewRecyclerRoblox.RobloxAdapter.AbsolutePlacement)
local CanvasItemPlacerModule = require(ViewRecyclerRoblox.RobloxAdapter.CanvasItemPlacer)
local HostMeasurementModule = require(ViewRecyclerRoblox.RobloxAdapter.HostMeasurement)
local HostPresentationPhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local ReparentableHostModule = require(ViewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local StackPlacementModule = require(ViewRecyclerRoblox.RobloxAdapter.StackPlacement)

local function zero(): number
	return 0
end

return {
	new = function(Configuration)
		-- upvalues: zero (copy), AbsolutePlacementModule (copy), HostMeasurementModule (copy), ReparentableHostModule (copy), CanvasItemPlacerModule (copy), FFlagViewRecyclerReact08 (copy), StackPlacementModule (copy), HostPresentationPhaseModule (copy)
		local Configuration1 = {
			container = Configuration.container,
			viewportContainer = Configuration.viewportContainer,
			axis = Configuration.axis,
			selfSizing = Configuration.selfSizing,
			stackedSpacing = Configuration.stackedSpacing
		}
		local Tbl = {}
		local v1 = nil
		local MountedWindow = nil
		local Flag = false
		local Count = 0
		local Flag1 = false
		local GetCanvasOriginOffset = Configuration.getCanvasOriginOffset or zero
		local NewAbsolutePlacement = AbsolutePlacementModule.new(Configuration1.axis, Configuration1.selfSizing, GetCanvasOriginOffset)
		
		local function _()
			-- upvalues: v1 (ref), Flag (ref)
			if v1 ~= nil and not Flag then
				v1.commit()
			end
		end
		
		local NewHostMeasurement = HostMeasurementModule.new({
			axis = Configuration1.axis,
			isUnchanged = function(): boolean
				-- upvalues: v1 (ref), Tbl (copy)
				local v2 = v1
				local Flag: boolean = v2 == nil or not v2.takeChanged()
				for _, value in Tbl do
					local Host = value.host
					
					if value.measuring and Host ~= nil and (v2 == nil or not v2.isStacked(Host)) then
						local AbsoluteSize = Host.AbsoluteSize
						
						if value.checkedSize ~= AbsoluteSize then
							value.checkedSize = AbsoluteSize
							Flag = false
						end
					end
				end
				return Flag
			end,
			onItemMeasurements = Configuration.onItemMeasurements
		})
		
		local _ = function(p1, p2)
			-- upvalues: NewHostMeasurement (copy)
			p2.checkedSize = nil
			
			if p2.measuring then
				p2.measuring = false
				NewHostMeasurement.measure(p1, nil, nil)
			end
		end
		
		local function detachHost(p1, p2)
			-- upvalues: v1 (ref), ReparentableHostModule (upval), CanvasItemPlacerModule (upval), NewAbsolutePlacement (copy), NewHostMeasurement (copy)
			local Host = p2.host
			
			if Host ~= nil then
				if v1 ~= nil then
					v1.remove(Host)
				end
				ReparentableHostModule.clearSelection(Host)
				CanvasItemPlacerModule.detachForTransfer(Host, p2.placerState)
				NewAbsolutePlacement.remove(Host)
				p2.host = nil
			end
			p2.checkedSize = nil
			
			if p2.measuring then
				p2.measuring = false
				NewHostMeasurement.measure(p1, nil, nil)
			end
		end
		
		local _ = function(Key)
			-- upvalues: Tbl (copy), CanvasItemPlacerModule (upval), Count (ref)
			local Entry = Tbl[Key]
			
			if Entry == nil then
				Entry = {
					host = nil,
					physicalState = nil,
					presentedAssignment = nil,
					measuring = false,
					checkedSize = nil,
					placerState = CanvasItemPlacerModule.createState()
				}
				Tbl[Key] = Entry
				Count += 1
			end
			return Entry
		end
		
		local _ = function(p1, p2, PresentedAssignment)
			-- upvalues: Configuration (copy)
			if p2.presentedAssignment == PresentedAssignment then return end
			p2.presentedAssignment = PresentedAssignment
			local OnItemViewPresentationChangedFunction: (any, any) -> () = Configuration.onItemViewPresentationChanged
			
			if OnItemViewPresentationChangedFunction ~= nil then
				OnItemViewPresentationChangedFunction(p1, PresentedAssignment)
			end
		end
		
		local function applyPhysical(Key, p1)
			-- upvalues: detachHost (copy), Configuration (copy), FFlagViewRecyclerReact08 (upval), Configuration1 (ref), v1 (ref), StackPlacementModule (upval), NewAbsolutePlacement (copy), ReparentableHostModule (upval), HostPresentationPhaseModule (upval), NewHostMeasurement (copy)
			local PhysicalState = p1.physicalState
			
			if PhysicalState == nil then
				detachHost(Key, p1)
				
				if p1.presentedAssignment == nil then return end
				p1.presentedAssignment = nil
				local OnItemViewPresentationChangedFunction: (any, any) -> () = Configuration.onItemViewPresentationChanged
				
				if OnItemViewPresentationChangedFunction ~= nil then
					OnItemViewPresentationChangedFunction(Key, nil)
				end
				return
			else
				local State = PhysicalState.state
				local Host = PhysicalState.host
				
				if p1.host ~= nil and p1.host ~= Host then
					detachHost(Key, p1)
				end
				local HasViewportPlacement: boolean = if FFlagViewRecyclerReact08 then State.viewportPlacement ~= nil else State.viewportPlacement ~= nil and Configuration1.viewportContainer ~= nil
				local ViewportContainer = if HasViewportPlacement then Configuration1.viewportContainer else Configuration1.container
				
				if ViewportContainer == nil then
					detachHost(Key, p1)
					
					if p1.presentedAssignment == nil then return end
					p1.presentedAssignment = nil
					local OnItemViewPresentationChangedFunction1: (any, any) -> () = Configuration.onItemViewPresentationChanged
					
					if OnItemViewPresentationChangedFunction1 ~= nil then
						OnItemViewPresentationChangedFunction1(Key, nil)
					end
					return
				else
					local v3 = v1
					local PlaceResult = nil
					
					if v3 == nil or HasViewportPlacement or not StackPlacementModule.isPlacedFromLayoutOffsets(State) then
						if v3 ~= nil then
							v3.remove(Host)
						end
						PlaceResult = NewAbsolutePlacement.place(Host, p1.placerState, ViewportContainer, State, not HasViewportPlacement, PhysicalState.phase)
					else
						PlaceResult = v3.place(Host, p1.placerState, State, PhysicalState.phase)
						NewAbsolutePlacement.remove(Host)
					end
					if not PlaceResult then
						ReparentableHostModule.clearSelection(Host)
					end
					p1.host = Host
					local IsPhaseMatch = PhysicalState.phase == HostPresentationPhaseModule.Presented
					local SelfSizing = Configuration1.selfSizing or State.pinnedPosition ~= nil
					local SelfSizing1 = IsPhaseMatch and SelfSizing
					p1.measuring = SelfSizing1
					
					if SelfSizing and not IsPhaseMatch then
						NewHostMeasurement.pause(Key, Host)
					else
						NewHostMeasurement.measure(Key, Host, if SelfSizing1 then State else nil)
					end
					local Assignment = if IsPhaseMatch then State.assignment else nil
					
					if p1.presentedAssignment == Assignment then return end
					p1.presentedAssignment = Assignment
					local OnItemViewPresentationChangedFunction2: (any, any) -> () = Configuration.onItemViewPresentationChanged
					
					if OnItemViewPresentationChangedFunction2 ~= nil then
						OnItemViewPresentationChangedFunction2(Key, Assignment)
					end
				end
			end
		end
		
		local function syncStack()
			-- upvalues: Configuration1 (ref), v1 (ref), Tbl (copy), detachHost (copy), StackPlacementModule (upval), MountedWindow (ref), GetCanvasOriginOffset (copy)
			local Container = Configuration1.container
			local StackedSpacing = Configuration1.stackedSpacing
			local v3 = v1
			local HasContainer: boolean = StackedSpacing ~= nil and Container ~= nil
			
			if v3 ~= nil and HasContainer and v3.matches(Container, Configuration1.axis, StackedSpacing, Configuration1.selfSizing) then return end
			if v3 ~= nil then
				for i, value in Tbl do
					if value.host ~= nil and v3.isStacked(value.host) then
						detachHost(i, value)
					end
				end
				v3.destroy()
				v1 = nil
			end
			if HasContainer then
				local NewStackPlacement = StackPlacementModule.new(Container, Configuration1.axis, StackedSpacing, Configuration1.selfSizing)
				
				if MountedWindow ~= nil then
					NewStackPlacement.setWindow(MountedWindow, GetCanvasOriginOffset())
				end
				v1 = NewStackPlacement
			end
		end
		
		local _ = function(Key, p1)
			-- upvalues: Tbl (copy), Count (ref)
			if p1.physicalState == nil and Tbl[Key] == p1 then
				Tbl[Key] = nil
				Count -= 1
			end
		end
		
		syncStack()
		
		return {
			apply = function(Key, PhysicalState)
				-- upvalues: Flag1 (ref), Tbl (copy), CanvasItemPlacerModule (upval), Count (ref), applyPhysical (copy), v1 (ref), Flag (ref)
				assert(not Flag1, "HostPlacement: cannot apply physical state after destroy")
				local Entry = Tbl[Key]
				
				if Entry == nil then
					Entry = {
						host = nil,
						physicalState = nil,
						presentedAssignment = nil,
						measuring = false,
						checkedSize = nil,
						placerState = CanvasItemPlacerModule.createState()
					}
					Tbl[Key] = Entry
					Count += 1
				end
				Entry.physicalState = PhysicalState
				applyPhysical(Key, Entry)
				
				if Entry.physicalState == nil and Tbl[Key] == Entry then
					Tbl[Key] = nil
					Count -= 1
				end
				if v1 ~= nil and not Flag then
					v1.commit()
				end
			end,
			setConfiguration = function(Value)
				-- upvalues: Flag1 (ref), Configuration1 (ref), NewHostMeasurement (copy), NewAbsolutePlacement (copy), syncStack (copy), Tbl (copy), applyPhysical (copy), v1 (ref), Flag (ref)
				if not Flag1 then
					Configuration1 = Value
					NewHostMeasurement.setAxis(Configuration1.axis)
					NewAbsolutePlacement.setConfiguration(Configuration1.axis, Configuration1.selfSizing)
					syncStack()
					
					for i, value in Tbl do
						applyPhysical(i, value)
					end
					if v1 ~= nil and not Flag then
						v1.commit()
					end
				end
			end,
			reposition = function()
				-- upvalues: Flag1 (ref), GetCanvasOriginOffset (copy), NewAbsolutePlacement (copy), v1 (ref)
				if Flag1 then return end
				local CanvasOriginOffset = GetCanvasOriginOffset()
				NewAbsolutePlacement.setOriginOffset(CanvasOriginOffset)
				
				if v1 ~= nil then
					v1.setOriginOffset(CanvasOriginOffset)
				end
			end,
			setMountedWindow = function(Value, Callback: () -> ())
				-- upvalues: Flag1 (ref), MountedWindow (ref), v1 (ref), GetCanvasOriginOffset (copy), Flag (ref), Tbl (copy), applyPhysical (copy)
				if Flag1 then
					Callback()
					
					return
				end
				MountedWindow = Value
				local v4 = v1
				
				if v4 == nil then
					Callback()
					
					return
				end
				v4.setWindow(Value, GetCanvasOriginOffset())
				Flag = true
				local Success, Result = pcall(Callback)
				Flag = false
				
				if v1 == v4 then
					local t = {}
					
					for i, value in v4.getStaleHosts() do
						t[value] = true
					end
					for i, value1 in Tbl do
						if value1.host ~= nil and t[value1.host] then
							applyPhysical(i, value1)
						end
					end
					v4.commit()
				end
				if not Success then
					error(Result, 0)
				end
			end,
			cancelPendingMeasurements = function()
				-- upvalues: NewHostMeasurement (copy)
				NewHostMeasurement.cancelPending()
			end,
			hasDestroyedHost = if FFlagViewRecyclerReact08 then function(): boolean
				-- upvalues: Tbl (copy)
				for _, value in Tbl do
					if value.host ~= nil and value.host.Parent == nil then
						return true
					end
				end
				return false
			end else nil,
			getTrackedItemViewCount = function()
				-- upvalues: Count (ref)
				return Count
			end,
			isPrePaintPassConnected = function()
				-- upvalues: NewHostMeasurement (copy)
				return NewHostMeasurement.isPassConnected()
			end,
			getPrePaintReadCount = function()
				-- upvalues: NewHostMeasurement (copy)
				return NewHostMeasurement.getPassReadCount()
			end,
			destroy = function()
				-- upvalues: Flag1 (ref), NewHostMeasurement (copy), Tbl (copy), detachHost (copy), NewAbsolutePlacement (copy), v1 (ref), Count (ref)
				if Flag1 then return end
				Flag1 = true
				NewHostMeasurement.destroy()
				
				for i, value in Tbl do
					detachHost(i, value)
				end
				NewAbsolutePlacement.destroy()
				
				if v1 ~= nil then
					v1.destroy()
					v1 = nil
				end
				table.clear(Tbl)
				Count = 0
			end
		}
	end
}