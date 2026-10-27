local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local MeasurementBatcherModule = require(ViewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local MeasurerModule = require(ViewRecyclerRoblox.RobloxAdapter.Measurer)
local RunService = game:GetService("RunService")

return {
	new = function(OnItemMeasurements)
		-- upvalues: MeasurementBatcherModule (copy), RunService (copy), MeasurerModule (copy)
		local Axis = OnItemMeasurements.axis
		local Tbl = {}
		local Count = 0
		local Flag = false
		local Flag1 = true
		local PreRenderConnection = nil
		local Count1 = 0
		local NewMeasurementBatcher = MeasurementBatcherModule.new(OnItemMeasurements.onItemMeasurements)
		
		local function measureRounds()
			-- upvalues: Flag (ref), OnItemMeasurements (copy), Flag1 (ref), Tbl (copy), Count1 (ref), NewMeasurementBatcher (copy)
			local Flag2 = nil
			for _ = 1, 4 do
				if Flag then break end
				if OnItemMeasurements.isUnchanged() and not Flag1 then break end
				Flag1 = false
				
				for _, value in Tbl do
					Count1 += 1
					value.measurer.measureNow()
				end
				Flag2 = false
				local FlushResult = NewMeasurementBatcher.flush() or {}
				for _, value1 in FlushResult do
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
			-- upvalues: Tbl (copy), Count (ref), Flag (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
			local Entry = Tbl[Key]
			
			if Entry ~= nil then
				Tbl[Key] = nil
				Count -= 1
				Entry.measurer.disconnect()
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
			p1.state = State
			p1.measurer.scheduleSettle()
		end
		
		local function measure(ItemView, Host, State)
			-- upvalues: Flag (ref), Tbl (copy), Count (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy), MeasurerModule (upval), Axis (ref), NewMeasurementBatcher (copy)
			if Flag then return end
			local Entry = Tbl[ItemView]
			
			if Entry ~= nil and (Host == nil or State == nil or Entry.host ~= Host) then
				local Entry1 = Tbl[ItemView]
				
				if Entry1 ~= nil then
					Tbl[ItemView] = nil
					Count -= 1
					Entry1.measurer.disconnect()
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
					host = Host,
					state = State
				}
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
						-- upvalues: NewMeasurementBatcher (upval), ItemView (copy)
						NewMeasurementBatcher.add({ itemView = ItemView, state = State, length = Length })
					end
				})
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
				config.measurer.scheduleSettle()
				
				return
			elseif Entry.paused then
				Entry.paused = false
				Flag1 = true
				Entry.state = State
				Entry.measurer.scheduleSettle()
				
				return
			elseif Entry.state ~= State then
				Entry.state = State
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
				-- upvalues: Axis (ref), Tbl (copy), Count (ref), Flag (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
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
						Entry.measurer.disconnect()
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
				-- upvalues: NewMeasurementBatcher (copy)
				NewMeasurementBatcher.cancelPending()
			end,
			isPassConnected = function(): boolean
				-- upvalues: PreRenderConnection (ref)
				return PreRenderConnection ~= nil
			end,
			getPassReadCount = function()
				-- upvalues: Count1 (ref)
				return Count1
			end,
			destroy = function()
				-- upvalues: Flag (ref), NewMeasurementBatcher (copy), Tbl (copy), Count (ref), PreRenderConnection (ref), Flag1 (ref), RunService (upval), measureBeforePaint (copy)
				if Flag then return end
				Flag = true
				NewMeasurementBatcher.destroy()
				
				for _, value in Tbl do
					value.measurer.disconnect()
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