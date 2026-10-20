local RunService = game:GetService("RunService")
local AxisMapModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").RobloxAdapter.axisMap)

return {
	attach = function(p1)
		-- upvalues: AxisMapModule (copy), RunService (copy)
		local _Instance = p1.instance
		local Axis = p1.axis
		local GetStateFunction = p1.getState
		local GetMeasurementDependenciesFunction = p1.getMeasurementDependencies
		local OnItemMeasuredFunction = p1.onItemMeasured
		local IsRenderedFunction = p1.isRendered
		local Tbl = {}
		local Connections = {}
		local Callback = nil
		local v1 = nil
		local v2 = nil
		local HeartbeatConnections = {}
		local Callback1 = nil
		
		local function refreshMeasurementDependencies()
			-- upvalues: GetMeasurementDependenciesFunction (copy), Connections (copy), Callback1 (ref)
			local T = if GetMeasurementDependenciesFunction == nil then {} else GetMeasurementDependenciesFunction()
			local t = {}
			
			for i, value in T do
				if t[value] == nil then
					t[value] = true
					
					if Connections[value] == nil then
						Connections[value] = value:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback1)
					end
				end
			end
			for i, connection in Connections do
				if t[i] == nil then
					connection:Disconnect()
					Connections[i] = nil
				end
			end
			return T
		end
		
		local function publish(p2): boolean
			-- upvalues: IsRenderedFunction (copy), _Instance (copy), AxisMapModule (upval), Axis (copy), refreshMeasurementDependencies (copy), v1 (ref), v2 (ref), OnItemMeasuredFunction (copy)
			if IsRenderedFunction ~= nil and not IsRenderedFunction() then
				return false
			end
			if AxisMapModule.crossOf(_Instance.AbsoluteSize, Axis) <= 0 then
				return true
			end
			for _, Frame in refreshMeasurementDependencies() do
				if AxisMapModule.crossOf(Frame.AbsoluteSize, Axis) <= 0 then
					return true
				end
			end
			local MainOfResult = AxisMapModule.mainOf(_Instance.AbsoluteSize, Axis)
			
			if v1 ~= p2 or v2 ~= MainOfResult then
				OnItemMeasuredFunction(p2, MainOfResult)
				v1 = p2
				v2 = MainOfResult
			end
			return true
		end
		
		Callback1 = function()
			-- upvalues: GetStateFunction (copy), HeartbeatConnections (copy), RunService (upval), Tbl (copy), publish (copy), Callback1 (ref)
			local State = GetStateFunction()
			
			if State ~= nil and HeartbeatConnections[State] == nil then
				local HeartbeatConnection = nil
				HeartbeatConnection = RunService.Heartbeat:Once(function()
					-- upvalues: Tbl (upval), HeartbeatConnection (ref), HeartbeatConnections (upval), State (copy), GetStateFunction (upval), publish (upval), Callback1 (upval)
					Tbl[HeartbeatConnection] = nil
					
					if HeartbeatConnections[State] == HeartbeatConnection then
						HeartbeatConnections[State] = nil
					end
					local State1 = GetStateFunction()
					
					if State1 ~= State then return end
					if not publish(State1) then
						Callback1()
					end
				end)
				Tbl[HeartbeatConnection] = true
				HeartbeatConnections[State] = HeartbeatConnection
				
				return
			end
		end
		
		local Connection = _Instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback1)
		refreshMeasurementDependencies()
		
		if p1.subscribeMeasurementDependencies ~= nil then
			Callback = p1.subscribeMeasurementDependencies(function()
				-- upvalues: refreshMeasurementDependencies (copy), Callback1 (ref)
				refreshMeasurementDependencies()
				Callback1()
			end)
		end
		return {
			scheduleSettle = Callback1,
			measureNow = function()
				-- upvalues: GetStateFunction (copy), publish (copy)
				local State = GetStateFunction()
				
				if State ~= nil then
					publish(State)
				end
			end,
			getPendingCount = function(): number
				-- upvalues: Tbl (copy)
				local Count = 0
				
				for _ in Tbl do
					Count += 1
				end
				return Count
			end,
			disconnect = function()
				-- upvalues: Connection (copy), Callback (ref), Connections (copy), Tbl (copy), HeartbeatConnections (copy)
				Connection:Disconnect()
				
				if Callback ~= nil then
					Callback()
					Callback = nil
				end
				for i, connection in Connections do
					connection:Disconnect()
					Connections[i] = nil
				end
				for Connection1 in Tbl do
					Connection1:Disconnect()
				end
				table.clear(Tbl)
				table.clear(HeartbeatConnections)
			end
		}
	end
}