local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler)
local measurementBatcherModule = require(viewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local measurerModule = require(viewRecyclerRoblox.RobloxAdapter.Measurer)
local runService = game:GetService("RunService")

local function noDependencies()
	return {}
end

local function noSubscription()
	return function() end
end

return {
	new = function(p1)
		-- upvalues: measurementBatcherModule (ref), runService (ref), measurerModule (ref), noDependencies (ref), noSubscription (ref)
		local axis = p1.axis
		local t = {}
		local var1 = 0
		local var2 = false
		local var3 = true
		local var4 = nil
		local var5 = 0
		local var6 = measurementBatcherModule.new(p1.onItemMeasurements)
		
		local function measureRounds()
			-- upvalues: var2 (write), p1 (ref), var3 (write), t (ref), var5 (write), var6 (ref)
			local var7
			for _ = 1, 4 do
				if not var2 then
					if not p1.isUnchanged() or var3 then
						var3 = false
						
						for i, v in t do
							var5 += 1
							v.measurer.measureNow()
						end
						var7 = false
						
						for i_1, v_1 in var6.flush() or {} do
							if v_1.length ~= v_1.state.itemLayout.length then
								var7 = true
								break
							end
						end
						if var7 then
							continue
						end
						return
					end
					return
				end
				return
			end
		end
		
		local function measureBeforePaint()
			-- upvalues: measureRounds (ref), var2 (write), t (ref), var3 (write)
			measureRounds()
			
			if var2 then return end
			for i, v in t do
				local assignment = v.state.assignment
				
				if v.renderedAssignment ~= assignment then
					v.renderedAssignment = assignment
					var3 = true
				end
			end
		end
		
		local function _()
			-- upvalues: var2 (write), var1 (write), var4 (write), var3 (write), runService (copy), measureBeforePaint (ref)
			local var8 = not var2 and var1 > 0
			
			if var8 and var4 == nil then
				var3 = true
				var4 = runService.PreRender:Connect(measureBeforePaint)
				
				return
			elseif not var8 and var4 ~= nil then
				var4:Disconnect()
				var4 = nil
			end
		end
		
		local _ = function(p2)
			-- upvalues: t (ref), var1 (write), var2 (write), var4 (write), var3 (write), runService (copy), measureBeforePaint (ref)
			local var8 = t[p2]
			
			if var8 ~= nil then
				t[p2] = nil
				var1 -= 1
				var8.measurer.disconnect()
				local var9 = not var2 and var1 > 0
				
				if var9 and var4 == nil then
					var3 = true
					var4 = runService.PreRender:Connect(measureBeforePaint)
					
					return
				elseif not var9 and var4 ~= nil then
					var4:Disconnect()
					var4 = nil
				end
			end
		end
		
		return {
			measure = function(p2, p3, p4, p5)
				-- upvalues: var2 (write), t (ref), var1 (write), var4 (write), var3 (write), runService (copy), measureBeforePaint (ref), measurerModule (copy), axis (write), noDependencies (copy), noSubscription (copy), var6 (ref)
				if var2 then return end
				local var8
				local var9 = t[p2]
				
				if var9 ~= nil and (p3 == nil or p4 == nil or (var9.host ~= p3 or var9.dependencies ~= p5)) then
					local var10 = t[p2]
					
					if var10 ~= nil then
						t[p2] = nil
						var1 -= 1
						var10.measurer.disconnect()
						var8 = not var2 and var1 > 0
						
						if var8 and var4 == nil then
							var3 = true
							var4 = runService.PreRender:Connect(measureBeforePaint)
						elseif not var8 and var4 ~= nil then
							var4:Disconnect()
							var4 = nil
						end
					end
					var9 = nil
				end
				if p3 == nil or p4 == nil then return end
				if var9 == nil then
					local t_1 = nil
					t_1 = {
						renderedAssignment = nil,
						host = p3,
						dependencies = p5,
						state = p4,
						measurer = measurerModule.attach({
							instance = p3,
							axis = axis,
							getState = function()
								-- upvalues: t (copy), p2 (ref), t_1 (write)
								return if t[p2] == t_1 then t_1.state else nil
							end,
							getMeasurementDependencies = if p5 == nil then noDependencies else p5.get,
							subscribeMeasurementDependencies = if p5 == nil then noSubscription else p5.subscribe,
							isRendered = function()
								-- upvalues: t_1 (write)
								return t_1.state.assignment == t_1.renderedAssignment
							end,
							onItemMeasured = function(p6, p7)
								-- upvalues: var6 (copy), p2 (ref)
								var6.add({ itemView = p2, state = p6, length = p7 })
							end
						})
					}
					t[p2] = t_1
					var1 += 1
					var3 = true
					var8 = not var2 and var1 > 0
					
					if var8 and var4 == nil then
						var3 = true
						var4 = runService.PreRender:Connect(measureBeforePaint)
					elseif not var8 and var4 ~= nil then
						var4:Disconnect()
						var4 = nil
					end
					t_1.measurer.scheduleSettle()
					
					return
				elseif var9.state ~= p4 then
					var9.state = p4
					var9.measurer.scheduleSettle()
				end
			end,
			setAxis = function(value)
				-- upvalues: axis (write), t (ref), var1 (write), var2 (write), var4 (write), var3 (write), runService (copy), measureBeforePaint (ref)
				if value == axis then return end
				axis = value
				local t_1 = {}
				
				for i in t do
					table.insert(t_1, i)
				end
				for i_1, v in t_1 do
					local var8 = t[v]
					
					if var8 ~= nil then
						t[v] = nil
						var1 -= 1
						var8.measurer.disconnect()
						local var9 = not var2 and var1 > 0
						
						if var9 and var4 == nil then
							var3 = true
							var4 = runService.PreRender:Connect(measureBeforePaint)
						elseif not var9 and var4 ~= nil then
							var4:Disconnect()
							var4 = nil
						end
					end
				end
			end,
			cancelPending = function()
				-- upvalues: var6 (ref)
				var6.cancelPending()
			end,
			isPassConnected = function()
				-- upvalues: var4 (write)
				return var4 ~= nil
			end,
			getPassReadCount = function()
				-- upvalues: var5 (write)
				return var5
			end,
			destroy = function()
				-- upvalues: var2 (write), var6 (ref), t (ref), var1 (write), var4 (write), var3 (write), runService (copy), measureBeforePaint (ref)
				if var2 then return end
				var2 = true
				var6.destroy()
				
				for i, v in t do
					v.measurer.disconnect()
				end
				table.clear(t)
				var1 = 0
				local var10 = not var2 and var1 > 0
				
				if var10 and var4 == nil then
					var3 = true
					var4 = runService.PreRender:Connect(measureBeforePaint)
					
					return
				elseif not var10 and var4 ~= nil then
					var4:Disconnect()
					var4 = nil
				end
			end
		}
	end
}