local runService = game:GetService("RunService")
local axisMapModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").RobloxAdapter.axisMap)

return {
	attach = function(p1)
		-- upvalues: axisMapModule (ref), runService (ref)
		local instance = p1.instance
		local axis = p1.axis
		local getState = p1.getState
		local getMeasurementDependencies = p1.getMeasurementDependencies
		local onItemMeasured = p1.onItemMeasured
		local isRendered = p1.isRendered
		local t = {}
		local t_1 = {}
		local var1 = nil
		local var2 = nil
		local var3 = nil
		local t_2 = {}
		local var4 = nil
		
		local function refreshMeasurementDependencies()
			-- upvalues: getMeasurementDependencies (ref), t_1 (ref), var4 (write)
			local var5 = if getMeasurementDependencies == nil then {} else getMeasurementDependencies()
			local t = {}
			
			for i, v in var5 do
				if t[v] == nil then
					t[v] = true
					
					if t_1[v] == nil then
						t_1[v] = v:GetPropertyChangedSignal("AbsoluteSize"):Connect(var4)
					end
				end
			end
			for i_1, v_1 in t_1 do
				if t[i_1] == nil then
					v_1:Disconnect()
					t_1[i_1] = nil
				end
			end
			return var5
		end
		
		local function publish(p2)
			-- upvalues: isRendered (ref), instance (ref), axisMapModule (copy), axis (ref), refreshMeasurementDependencies (ref), var2 (write), var3 (write), onItemMeasured (ref)
			if isRendered ~= nil and not isRendered() then
				return false
			elseif axisMapModule.crossOf(instance.AbsoluteSize, axis) <= 0 then
				return true
			end
			for i, v in refreshMeasurementDependencies() do
				if axisMapModule.crossOf(v.AbsoluteSize, axis) <= 0 then
					return true
				end
			end
			local var6 = axisMapModule.mainOf(instance.AbsoluteSize, axis)
			
			if not (var2 == p2 and var3 == var6) then
				onItemMeasured(p2, var6)
				var2 = p2
				var3 = var6
			end
			return true
		end
		
		var4 = function()
			-- upvalues: getState (ref), t_2 (ref), runService (copy), t (ref), publish (ref), var4 (write)
			local var7 = getState()
			
			if var7 == nil or t_2[var7] ~= nil then
				return
			end
			local heartbeatConnection = nil
			heartbeatConnection = runService.Heartbeat:Once(function()
				-- upvalues: t (copy), heartbeatConnection (write), t_2 (copy), var7 (ref), getState (copy), publish (copy), var4 (copy)
				t[heartbeatConnection] = nil
				
				if t_2[var7] == heartbeatConnection then
					t_2[var7] = nil
				end
				local var8 = getState()
				
				if var8 ~= var7 then return end
				if not publish(var8) then
					var4()
				end
			end)
			t[heartbeatConnection] = true
			t_2[var7] = heartbeatConnection
		end
		
		local var7 = instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(var4)
		refreshMeasurementDependencies()
		
		if p1.subscribeMeasurementDependencies ~= nil then
			var1 = p1.subscribeMeasurementDependencies(function()
				-- upvalues: refreshMeasurementDependencies (ref), var4 (write)
				refreshMeasurementDependencies()
				var4()
			end)
		end
		return {
			scheduleSettle = var4,
			measureNow = function()
				-- upvalues: getState (ref), publish (ref)
				local var8 = getState()
				
				if var8 ~= nil then
					publish(var8)
				end
			end,
			getPendingCount = function()
				-- upvalues: t (ref)
				local var8 = 0
				
				for i in t do
					var8 += 1
				end
				return var8
			end,
			disconnect = function()
				-- upvalues: var7 (ref), var1 (write), t_1 (ref), t (ref), t_2 (ref)
				var7:Disconnect()
				
				if var1 ~= nil then
					var1()
					var1 = nil
				end
				for i, v in t_1 do
					v:Disconnect()
					t_1[i] = nil
				end
				for i_1 in t do
					i_1:Disconnect()
				end
				table.clear(t)
				table.clear(t_2)
			end
		}
	end
}