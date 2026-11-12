local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact08
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local MeasurementBatcherModule = require(ViewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local MeasurerModule = require(ViewRecyclerRoblox.RobloxAdapter.Measurer)
local AxisMapModule = require(ViewRecyclerRoblox.RobloxAdapter.axisMap)
local RunService = game:GetService("RunService")

return {
	new = function(OnItemMeasurements)
		-- upvalues: FFlagViewRecyclerReact084 (copy), AxisMapModule (copy), RunService (copy), FFlagViewRecyclerReact08 (copy), MeasurementBatcherModule (copy), MeasurerModule (copy)
		local Axis = OnItemMeasurements.axis
		local Tbl = {}
		local Count = 0
		local Flag = false
		local Flag1 = true
		local PreRenderConnection = nil
		local Count1 = 0
		local v1 = nil
		local deliver = nil
		local queue = nil
		local reportedState = nil
		local publish = nil
		local measureNow = nil
		local scheduleRead = nil
		local disconnect = nil
		local NewResult = nil
		
		if FFlagViewRecyclerReact084 then
			v1 = nil
			
			deliver = function()
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
				-- upvalues: v1 (ref), deliver (ref)
				local List = v1
				
				if List == nil then
					List = {}
					v1 = List
					task.defer(function()
						-- upvalues: v1 (upval), List (ref), deliver (upval)
						if v1 == List then
							deliver()
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
			
			measureNow = function(p1)
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
			
			disconnect = function(p1)
				p1.sizeConnection:Disconnect()
				
				for _, pendingRead in p1.pendingReads do
					pendingRead:Disconnect()
				end
				table.clear(p1.pendingReads)
			end
		else
			v1 = nil
			deliver = nil
			queue = nil
			reportedState = nil
			publish = nil
			measureNow = nil
			scheduleRead = nil
			disconnect = nil
			NewResult = nil
			
			if FFlagViewRecyclerReact08 then
				v1 = nil
				
				deliver = function()
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
				
				queue = function(p2)
					-- upvalues: v1 (ref), deliver (ref)
					local List = v1
					
					if List == nil then
						List = {}
						v1 = List
						task.defer(function()
							-- upvalues: v1 (upval), List (ref), deliver (upval)
							if v1 == List then
								deliver()
							end
						end)
					end
					table.insert(List, p2)
				end
				
				reportedState = function(p2)
					-- upvalues: Tbl (copy)
					return if Tbl[p2.itemView] == p2 and not p2.paused then p2.state else nil
				end
				
				publish = function(p2, LastPublishedState): boolean
					-- upvalues: AxisMapModule (upval), Axis (ref), queue (ref)
					if LastPublishedState.assignment ~= p2.renderedAssignment then
						return false
					end
					local Host = p2.host
					
					if AxisMapModule.crossOf(Host.AbsoluteSize, Axis) <= 0 then
						return true
					end
					local MainOfResult = AxisMapModule.mainOf(Host.AbsoluteSize, Axis)
					
					if p2.lastPublishedState ~= LastPublishedState or p2.lastPublishedLength ~= MainOfResult then
						p2.lastPublishedState = LastPublishedState
						p2.lastPublishedLength = MainOfResult
						queue({
							itemView = p2.itemView,
							state = LastPublishedState,
							length = MainOfResult
						})
					end
					return true
				end
				
				measureNow = function(p2)
					-- upvalues: reportedState (ref), publish (ref)
					local ReportedStateResult = reportedState(p2)
					
					if ReportedStateResult ~= nil then
						publish(p2, ReportedStateResult)
					end
				end
				
				scheduleRead = function(p2)
					-- upvalues: reportedState (ref), RunService (upval), publish (ref), scheduleRead (ref)
					local ReportedStateResult = reportedState(p2)
					
					if ReportedStateResult ~= nil and p2.pendingReads[ReportedStateResult] == nil then
						p2.pendingReads[ReportedStateResult] = RunService.Heartbeat:Once(function()
							-- upvalues: p2 (copy), ReportedStateResult (copy), reportedState (upval), publish (upval), scheduleRead (upval)
							p2.pendingReads[ReportedStateResult] = nil
							
							if reportedState(p2) == ReportedStateResult and not publish(p2, ReportedStateResult) then
								scheduleRead(p2)
							end
						end)
						
						return
					end
				end
				
				disconnect = function(p2)
					p2.sizeConnection:Disconnect()
					
					for _, pendingRead in p2.pendingReads do
						pendingRead:Disconnect()
					end
					table.clear(p2.pendingReads)
				end
			else
				NewResult = MeasurementBatcherModule.new(OnItemMeasurements.onItemMeasurements)
			end
		end
		local function measureRounds()
			-- upvalues: Flag (ref), OnItemMeasurements (copy), Flag1 (ref), Tbl (copy), Count1 (ref), FFlagViewRecyclerReact084 (upval), measureNow (ref), FFlagViewRecyclerReact08 (upval), deliver (ref), NewResult (ref)
			local Flag2 = nil
			for _ = 1, 4 do
				if Flag then break end
				if OnItemMeasurements.isUnchanged() and not Flag1 then break end
				Flag1 = false
				
				for _, value in Tbl do
					Count1 += 1
					
					if FFlagViewRecyclerReact084 then
						measureNow(value)
					elseif FFlagViewRecyclerReact08 then
						measureNow(value)
					else
						value.measurer.measureNow()
					end
				end
				Flag2 = false
				local v2 = (if FFlagViewRecyclerReact084 then deliver elseif FFlagViewRecyclerReact08 then deliver else NewResult.flush)() or {}
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
			-- upvalues: Tbl (copy), Count (ref), FFlagViewRecyclerReact084 (upval), disconnect (ref), FFlagViewRecyclerReact08 (upval), Flag (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
			local Entry = Tbl[Key]
			
			if Entry ~= nil then
				Tbl[Key] = nil
				Count -= 1
				
				if FFlagViewRecyclerReact084 then
					disconnect(Entry)
				elseif FFlagViewRecyclerReact08 then
					disconnect(Entry)
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
		
		local _ = function(p2, State)
			-- upvalues: FFlagViewRecyclerReact084 (upval), scheduleRead (ref), FFlagViewRecyclerReact08 (upval)
			p2.state = State
			
			if FFlagViewRecyclerReact084 then
				scheduleRead(p2)
				
				return
			end
			if FFlagViewRecyclerReact08 then
				scheduleRead(p2)
				
				return
			else
				p2.measurer.scheduleSettle()
			end
		end
		
		local function measure(ItemView, Host, State)
			-- upvalues: Flag (ref), Tbl (copy), Count (ref), FFlagViewRecyclerReact084 (upval), disconnect (ref), FFlagViewRecyclerReact08 (upval), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy), scheduleRead (ref), MeasurerModule (upval), Axis (ref), NewResult (ref)
			if Flag then return end
			local Entry = Tbl[ItemView]
			
			if Entry ~= nil and (Host == nil or State == nil or Entry.host ~= Host) then
				local Entry1 = Tbl[ItemView]
				
				if Entry1 ~= nil then
					Tbl[ItemView] = nil
					Count -= 1
					
					if FFlagViewRecyclerReact084 then
						disconnect(Entry1)
					elseif FFlagViewRecyclerReact08 then
						disconnect(Entry1)
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
					itemView = if FFlagViewRecyclerReact084 then ItemView elseif FFlagViewRecyclerReact08 then ItemView else nil,
					host = Host,
					state = State,
					sizeConnection = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else nil,
					pendingReads = if FFlagViewRecyclerReact084 then {} elseif FFlagViewRecyclerReact08 then {} else nil,
					lastPublishedState = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else nil,
					lastPublishedLength = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else nil,
					measurer = if FFlagViewRecyclerReact084 then nil else nil
				}
				
				if FFlagViewRecyclerReact084 then
					config.sizeConnection = Host:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
						-- upvalues: scheduleRead (upval), config (copy)
						scheduleRead(config)
					end)
				elseif FFlagViewRecyclerReact08 then
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
				if FFlagViewRecyclerReact084 then
					scheduleRead(config)
					
					return
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
				Entry.state = State
				
				if FFlagViewRecyclerReact084 then
					scheduleRead(Entry)
					
					return
				end
				if FFlagViewRecyclerReact08 then
					scheduleRead(Entry)
					
					return
				else
					Entry.measurer.scheduleSettle()
					
					return
				end
			elseif Entry.state ~= State then
				Entry.state = State
				
				if FFlagViewRecyclerReact084 then
					scheduleRead(Entry)
					
					return
				end
				if FFlagViewRecyclerReact08 then
					scheduleRead(Entry)
					
					return
				end
				Entry.measurer.scheduleSettle()
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
				-- upvalues: Axis (ref), Tbl (copy), Count (ref), FFlagViewRecyclerReact084 (upval), disconnect (ref), FFlagViewRecyclerReact08 (upval), Flag (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
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
						
						if FFlagViewRecyclerReact084 then
							disconnect(Entry)
						elseif FFlagViewRecyclerReact08 then
							disconnect(Entry)
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
				-- upvalues: FFlagViewRecyclerReact084 (upval), v1 (ref), FFlagViewRecyclerReact08 (upval), NewResult (ref)
				if FFlagViewRecyclerReact084 then
					v1 = nil
					
					return
				end
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
			getPendingReadCount = if FFlagViewRecyclerReact084 then function(): number
				-- upvalues: Tbl (copy)
				local Count = 0
				
				for _, value in Tbl do
					for _ in value.pendingReads do
						Count += 1
					end
				end
				return Count
			end elseif FFlagViewRecyclerReact08 then function(): number
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
				-- upvalues: Flag (ref), FFlagViewRecyclerReact084 (upval), v1 (ref), FFlagViewRecyclerReact08 (upval), NewResult (ref), Tbl (copy), disconnect (ref), Count (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
				if Flag then return end
				Flag = true
				
				if FFlagViewRecyclerReact084 then
					v1 = nil
				elseif FFlagViewRecyclerReact08 then
					v1 = nil
				else
					NewResult.destroy()
				end
				for _, value in Tbl do
					if FFlagViewRecyclerReact084 then
						disconnect(value)
					elseif FFlagViewRecyclerReact08 then
						disconnect(value)
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