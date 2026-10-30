local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact08
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local MeasurementBatcherModule = require(ViewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local MeasurerModule = require(ViewRecyclerRoblox.RobloxAdapter.Measurer)
local AxisMapModule = require(ViewRecyclerRoblox.RobloxAdapter.axisMap)
local RunService = game:GetService("RunService")

return {
	new = function(OnItemMeasurements)
		-- upvalues: FFlagViewRecyclerReact08 (copy), AxisMapModule (copy), RunService (copy), MeasurementBatcherModule (copy), MeasurerModule (copy)
		local Axis = OnItemMeasurements.axis
		local Tbl = {}
		local Count = 0
		local Flag = false
		local Flag1 = true
		local PreRenderConnection = nil
		local Count1 = 0
		local v1 = nil
		local Callback: (() -> any)? = nil
		local queue = nil
		local reportedState = nil
		local publish = nil
		local Callback2: ((any) -> ())? = nil
		local scheduleRead = nil
		local Callback1: ((any) -> ())? = nil
		local NewResult = nil
		
		if FFlagViewRecyclerReact08 then
			v1 = nil
			
			Callback = function()
				-- upvalues: v1 (ref), Flag (ref), OnItemMeasurements (copy)
				local v2 = v1
				
				if Flag or v2 == nil then
					return nil
				else
					v1 = nil
					OnItemMeasurements.onItemMeasurements(v2)
					
					return v2
				end
			end
			
			queue = function(p1)
				-- upvalues: v1 (ref), Callback (ref)
				local List = v1
				
				if List == nil then
					List = {}
					v1 = List
					task.defer(function()
						-- upvalues: v1 (upval), List (ref), Callback (upval)
						if v1 == List then
							Callback()
						end
					end)
				end
				table.insert(List, p1)
			end
			
			reportedState = function(p1)
				-- upvalues: Tbl (copy)
				return if Tbl[p1.itemView] == p1 and not p1.paused then p1.state else nil
			end
			
			publish = function(p1, LastPublishedState): boolean
				-- upvalues: AxisMapModule (upval), Axis (ref), queue (ref)
				if LastPublishedState.assignment ~= p1.renderedAssignment then
					return false
				end
				local Host = p1.host
				
				if AxisMapModule.crossOf(Host.AbsoluteSize, Axis) <= 0 then
					return true
				end
				local MainOfResult = AxisMapModule.mainOf(Host.AbsoluteSize, Axis)
				
				if p1.lastPublishedState ~= LastPublishedState or p1.lastPublishedLength ~= MainOfResult then
					p1.lastPublishedState = LastPublishedState
					p1.lastPublishedLength = MainOfResult
					queue({
						itemView = p1.itemView,
						state = LastPublishedState,
						length = MainOfResult
					})
				end
				return true
			end
			
			Callback2 = function(p1)
				-- upvalues: reportedState (ref), publish (ref)
				local ReportedStateResult = reportedState(p1)
				
				if ReportedStateResult ~= nil then
					publish(p1, ReportedStateResult)
				end
			end
			
			scheduleRead = function(p1)
				-- upvalues: reportedState (ref), RunService (upval), publish (ref), scheduleRead (ref)
				local ReportedStateResult = reportedState(p1)
				
				if ReportedStateResult ~= nil and p1.pendingReads[ReportedStateResult] == nil then
					p1.pendingReads[ReportedStateResult] = RunService.Heartbeat:Once(function()
						-- upvalues: p1 (copy), ReportedStateResult (copy), reportedState (upval), publish (upval), scheduleRead (upval)
						p1.pendingReads[ReportedStateResult] = nil
						
						if reportedState(p1) == ReportedStateResult and not publish(p1, ReportedStateResult) then
							scheduleRead(p1)
						end
					end)
					
					return
				end
			end
			
			Callback1 = function(p1)
				p1.sizeConnection:Disconnect()
				
				for _, pendingRead in p1.pendingReads do
					pendingRead:Disconnect()
				end
				table.clear(p1.pendingReads)
			end
		else
			NewResult = MeasurementBatcherModule.new(OnItemMeasurements.onItemMeasurements)
		end
		local function measureRounds()
			-- upvalues: Flag (ref), OnItemMeasurements (copy), Flag1 (ref), Tbl (copy), Count1 (ref), FFlagViewRecyclerReact08 (upval), Callback2 (ref), Callback (ref), NewResult (ref)
			local Flag2 = nil
			for _ = 1, 4 do
				if Flag then break end
				if OnItemMeasurements.isUnchanged() and not Flag1 then break end
				Flag1 = false
				
				for _, value in Tbl do
					Count1 += 1
					
					if FFlagViewRecyclerReact08 then
						Callback2(value)
					else
						value.measurer.measureNow()
					end
				end
				Flag2 = false
				local v2 = (if FFlagViewRecyclerReact08 then Callback else NewResult.flush)() or {}
				for _, value1 in v2 do
					if value1.length ~= value1.state.itemLayout.length then
						Flag2 = true
						break
					end
				end
				if not Flag2 then break end
			end
		end
		
		local function measureBeforePaint()
			-- upvalues: measureRounds (copy), Flag (ref), Tbl (copy), Flag1 (ref)
			measureRounds()
			
			if Flag then return end
			for _, value in Tbl do
				local Assignment = value.state.assignment
				
				if value.renderedAssignment ~= Assignment then
					value.renderedAssignment = Assignment
					Flag1 = true
				end
			end
		end
		
		local function _()
			-- upvalues: Flag (ref), Count (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
			local IsCountAbove: boolean = not Flag and Count > 0
			
			if IsCountAbove and PreRenderConnection == nil then
				Flag1 = true
				PreRenderConnection = RunService.PreRender:Connect(measureBeforePaint)
				
				return
			end
			if not IsCountAbove and PreRenderConnection ~= nil then
				PreRenderConnection:Disconnect()
				PreRenderConnection = nil
			end
		end
		
		local _ = function(Key)
			-- upvalues: Tbl (copy), Count (ref), FFlagViewRecyclerReact08 (upval), Callback1 (ref), Flag (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
			local Entry = Tbl[Key]
			
			if Entry ~= nil then
				Tbl[Key] = nil
				Count -= 1
				
				if FFlagViewRecyclerReact08 then
					Callback1(Entry)
				else
					Entry.measurer.disconnect()
				end
				local IsCountAbove: boolean = not Flag and Count > 0
				
				if IsCountAbove and PreRenderConnection == nil then
					Flag1 = true
					PreRenderConnection = RunService.PreRender:Connect(measureBeforePaint)
					
					return
				end
				if not IsCountAbove and PreRenderConnection ~= nil then
					PreRenderConnection:Disconnect()
					PreRenderConnection = nil
				end
			end
		end
		
		local _ = function(p1, State)
			-- upvalues: FFlagViewRecyclerReact08 (upval), scheduleRead (ref)
			p1.state = State
			
			if FFlagViewRecyclerReact08 then
				scheduleRead(p1)
				
				return
			else
				p1.measurer.scheduleSettle()
			end
		end
		
		local function measure(ItemView, Host, State)
			-- upvalues: Flag (ref), Tbl (copy), Count (ref), FFlagViewRecyclerReact08 (upval), Callback1 (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy), scheduleRead (ref), MeasurerModule (upval), Axis (ref), NewResult (ref)
			if Flag then return end
			local Entry = Tbl[ItemView]
			
			if Entry ~= nil and (Host == nil or State == nil or Entry.host ~= Host) then
				local Entry1 = Tbl[ItemView]
				
				if Entry1 ~= nil then
					Tbl[ItemView] = nil
					Count -= 1
					
					if FFlagViewRecyclerReact08 then
						Callback1(Entry1)
					else
						Entry1.measurer.disconnect()
					end
					local IsCountAbove: boolean = not Flag and Count > 0
					
					if IsCountAbove and PreRenderConnection == nil then
						Flag1 = true
						PreRenderConnection = RunService.PreRender:Connect(measureBeforePaint)
					elseif not IsCountAbove and PreRenderConnection ~= nil then
						PreRenderConnection:Disconnect()
						PreRenderConnection = nil
					end
				end
				Entry = nil
			end
			if Host == nil or State == nil then return end
			if Entry == nil then
				local config = {
					paused = false,
					renderedAssignment = nil,
					measurer = nil,
					itemView = if FFlagViewRecyclerReact08 then ItemView else nil,
					host = Host,
					state = State,
					sizeConnection = if FFlagViewRecyclerReact08 then nil else nil,
					pendingReads = if FFlagViewRecyclerReact08 then {} else nil,
					lastPublishedState = if FFlagViewRecyclerReact08 then nil else nil,
					lastPublishedLength = if FFlagViewRecyclerReact08 then nil else nil
				}
				
				if FFlagViewRecyclerReact08 then
					config.sizeConnection = Host:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
						-- upvalues: scheduleRead (upval), config (copy)
						scheduleRead(config)
					end)
				else
					config.measurer = MeasurerModule.attach({
						instance = Host,
						axis = Axis,
						getState = function()
							-- upvalues: Tbl (upval), ItemView (copy), config (copy)
							return if Tbl[ItemView] == config and not config.paused then config.state else nil
						end,
						isRendered = function(): boolean
							-- upvalues: config (copy)
							return config.state.assignment == config.renderedAssignment
						end,
						onItemMeasured = function(State, Length)
							-- upvalues: NewResult (upval), ItemView (copy)
							NewResult.add({ itemView = ItemView, state = State, length = Length })
						end
					})
				end
				Tbl[ItemView] = config
				Count += 1
				Flag1 = true
				local IsCountAbove: boolean = not Flag and Count > 0
				
				if IsCountAbove and PreRenderConnection == nil then
					Flag1 = true
					PreRenderConnection = RunService.PreRender:Connect(measureBeforePaint)
				elseif not IsCountAbove and PreRenderConnection ~= nil then
					PreRenderConnection:Disconnect()
					PreRenderConnection = nil
				end
				if FFlagViewRecyclerReact08 then
					scheduleRead(config)
					
					return
				else
					config.measurer.scheduleSettle()
					
					return
				end
			elseif Entry.paused then
				Entry.paused = false
				Flag1 = true
				local Entry2 = Entry
				Entry2.state = State
				
				if FFlagViewRecyclerReact08 then
					scheduleRead(Entry2)
					
					return
				else
					Entry2.measurer.scheduleSettle()
					
					return
				end
			elseif Entry.state ~= State then
				local Entry3 = Entry
				Entry3.state = State
				
				if FFlagViewRecyclerReact08 then
					scheduleRead(Entry3)
					
					return
				end
				Entry3.measurer.scheduleSettle()
			end
		end
		
		return {
			measure = measure,
			pause = function(ItemView, Host)
				-- upvalues: Tbl (copy), Flag (ref), measure (copy)
				local Entry = Tbl[ItemView]
				
				if Flag or Entry == nil or Entry.host ~= Host then
					measure(ItemView, Host, nil)
					
					return
				else
					Entry.paused = true
				end
			end,
			setAxis = function(Value)
				-- upvalues: Axis (ref), Tbl (copy), Count (ref), FFlagViewRecyclerReact08 (upval), Callback1 (ref), Flag (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
				if Value == Axis then return end
				Axis = Value
				local List = {}
				
				for i in Tbl do
					table.insert(List, i)
				end
				for _, value in List do
					local Entry = Tbl[value]
					
					if Entry ~= nil then
						Tbl[value] = nil
						Count -= 1
						
						if FFlagViewRecyclerReact08 then
							Callback1(Entry)
						else
							Entry.measurer.disconnect()
						end
						local IsCountAbove: boolean = not Flag and Count > 0
						
						if IsCountAbove and PreRenderConnection == nil then
							Flag1 = true
							PreRenderConnection = RunService.PreRender:Connect(measureBeforePaint)
						elseif not IsCountAbove and PreRenderConnection ~= nil then
							PreRenderConnection:Disconnect()
							PreRenderConnection = nil
						end
					end
				end
			end,
			cancelPending = function()
				-- upvalues: FFlagViewRecyclerReact08 (upval), v1 (ref), NewResult (ref)
				if FFlagViewRecyclerReact08 then
					v1 = nil
					
					return
				else
					NewResult.cancelPending()
				end
			end,
			isPassConnected = function(): boolean
				-- upvalues: PreRenderConnection (ref)
				return PreRenderConnection ~= nil
			end,
			getPassReadCount = function()
				-- upvalues: Count1 (ref)
				return Count1
			end,
			getPendingReadCount = if FFlagViewRecyclerReact08 then function(): number
				-- upvalues: Tbl (copy)
				local Count = 0
				
				for _, value in Tbl do
					for _ in value.pendingReads do
						Count += 1
					end
				end
				return Count
			end else nil,
			destroy = function()
				-- upvalues: Flag (ref), FFlagViewRecyclerReact08 (upval), v1 (ref), NewResult (ref), Tbl (copy), Callback1 (ref), Count (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
				if Flag then return end
				Flag = true
				
				if FFlagViewRecyclerReact08 then
					v1 = nil
				else
					NewResult.destroy()
				end
				for _, value in Tbl do
					if FFlagViewRecyclerReact08 then
						Callback1(value)
					else
						value.measurer.disconnect()
					end
				end
				table.clear(Tbl)
				Count = 0
				local IsCountAbove: boolean = not Flag and Count > 0
				
				if IsCountAbove and PreRenderConnection == nil then
					Flag1 = true
					PreRenderConnection = RunService.PreRender:Connect(measureBeforePaint)
					
					return
				end
				if not IsCountAbove and PreRenderConnection ~= nil then
					PreRenderConnection:Disconnect()
					PreRenderConnection = nil
				end
			end
		}
	end
}