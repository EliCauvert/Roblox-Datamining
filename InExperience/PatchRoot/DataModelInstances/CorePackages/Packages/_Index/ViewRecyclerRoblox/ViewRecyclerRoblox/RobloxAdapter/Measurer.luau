local RunService = game:GetService("RunService")
local AxisMapModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").RobloxAdapter.axisMap)

return {
	attach = function(p1)
		-- upvalues: AxisMapModule (copy), RunService (copy)
		local _Instance = p1.instance
		local Axis = p1.axis
		local GetStateFunction = p1.getState
		local OnItemMeasuredFunction = p1.onItemMeasured
		local IsRenderedFunction = p1.isRendered
		local Tbl = {}
		local v1 = nil
		local v2 = nil
		local HeartbeatConnections = {}
		local _ = nil
		
		local function publish(p2): boolean
			-- upvalues: IsRenderedFunction (copy), _Instance (copy), AxisMapModule (upval), Axis (copy), v1 (ref), v2 (ref), OnItemMeasuredFunction (copy)
			if IsRenderedFunction ~= nil and not IsRenderedFunction() then
				return false
			end
			if AxisMapModule.crossOf(_Instance.AbsoluteSize, Axis) <= 0 then
				return true
			end
			local MainOfResult = AxisMapModule.mainOf(_Instance.AbsoluteSize, Axis)
			
			if v1 ~= p2 or v2 ~= MainOfResult then
				OnItemMeasuredFunction(p2, MainOfResult)
				v1 = p2
				v2 = MainOfResult
			end
			return true
		end
		
		local function Callback()
			-- upvalues: GetStateFunction (copy), HeartbeatConnections (copy), RunService (upval), Tbl (copy), publish (copy), Callback (ref)
			local State = GetStateFunction()
			
			if State ~= nil and HeartbeatConnections[State] == nil then
				local HeartbeatConnection = nil
				HeartbeatConnection = RunService.Heartbeat:Once(function()
					-- upvalues: Tbl (upval), HeartbeatConnection (ref), HeartbeatConnections (upval), State (copy), GetStateFunction (upval), publish (upval), Callback (upval)
					Tbl[HeartbeatConnection] = nil
					
					if HeartbeatConnections[State] == HeartbeatConnection then
						HeartbeatConnections[State] = nil
					end
					local State1 = GetStateFunction()
					
					if State1 ~= State then return end
					if not publish(State1) then
						Callback()
					end
				end)
				Tbl[HeartbeatConnection] = true
				HeartbeatConnections[State] = HeartbeatConnection
				
				return
			end
		end
		
		local Connection = _Instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback)
		
		return {
			scheduleSettle = Callback,
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
				-- upvalues: Connection (copy), Tbl (copy), HeartbeatConnections (copy)
				Connection:Disconnect()
				
				for Connection1 in Tbl do
					Connection1:Disconnect()
				end
				table.clear(Tbl)
				table.clear(HeartbeatConnections)
			end
		}
	end
}