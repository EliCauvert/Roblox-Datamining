local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler).Axis
local signalsExperimentalModule = require(viewRecyclerRoblox.Parent.SignalsExperimental)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)
local runService = game:GetService("RunService")

local function _(p1)
	for i, v in p1 do
		v:Disconnect()
	end
	table.clear(p1)
end

return {
	new = function(p2)
		-- upvalues: axisMapModule (ref), signalsExperimentalModule (ref), runService (ref)
		local axis = p2.axis
		local activationMargin = p2.activationMargin or 0
		local retentionMargin = p2.retentionMargin or activationMargin
		assert(activationMargin >= 0, "activationMargin must be non-negative")
		assert(activationMargin <= retentionMargin, "retentionMargin must be at least activationMargin")
		local var1 = nil
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local var2 = nil
		local var3 = false
		
		local function updateTargetGeometry(p3)
			-- upvalues: var1 (write), axisMapModule (copy), axis (ref)
			if var1 == nil or not p3.target:IsDescendantOf(var1) then
				p3.contentStart = nil
				p3.contentEnd = nil
				
				return
			end
			local var4 = axisMapModule.mainOf(var1.CanvasPosition, axis) + axisMapModule.mainOf(p3.target.AbsolutePosition, axis) - axisMapModule.mainOf(var1.AbsolutePosition, axis)
			p3.contentStart = var4
			p3.contentEnd = var4 + axisMapModule.mainOf(p3.target.AbsoluteSize, axis)
		end
		
		local function _(p3, p4)
			-- upvalues: signalsExperimentalModule (copy)
			if p3 == nil and p4 == nil then
				return
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: p3 (ref), p4 (ref)
				if p3 ~= nil then
					for i, v in p3 do
						v.setActive(false)
					end
				end
				if p4 ~= nil then
					for i, v in p4 do
						v.setActive(true)
					end
				end
			end)
		end
		
		local function deactivateAll()
			-- upvalues: t_1 (ref), signalsExperimentalModule (copy)
			local var4 = nil
			
			for i, v in t_1 do
				if v.active then
					v.active = false
					var4 = var4 or {}
					table.insert(var4, v)
				end
			end
			if var4 == nil then
				return
			end
			local var5 = nil
			signalsExperimentalModule.batch(function()
				-- upvalues: var4 (ref), var5 (ref)
				if var4 ~= nil then
					for i, v in var4 do
						v.setActive(false)
					end
				end
				if var5 ~= nil then
					for i, v in var5 do
						v.setActive(true)
					end
				end
			end)
		end
		
		local function evaluate()
			-- upvalues: var3 (write), var1 (write), deactivateAll (ref), axisMapModule (copy), axis (ref), t_1 (ref), retentionMargin (ref), activationMargin (ref), signalsExperimentalModule (copy)
			if var3 then return end
			if var1 == nil then
				deactivateAll()
				
				return
			end
			local var6 = axisMapModule.mainOf(var1.CanvasPosition, axis)
			local var7 = var6 + axisMapModule.mainOf(var1.AbsoluteWindowSize, axis)
			local var8 = nil
			local var9 = nil
			
			for i, v in t_1 do
				local var10 = false
				local contentStart = v.contentStart
				local contentEnd = v.contentEnd
				
				if contentStart ~= nil and contentEnd ~= nil then
					local var11 = if v.active then retentionMargin else activationMargin
					var10 = var6 - var11 < contentEnd and contentStart < var7 + var11
				end
				if var10 ~= v.active then
					v.active = var10
					
					if var10 then
						var9 = var9 or {}
						table.insert(var9, v)
					else
						var8 = var8 or {}
						table.insert(var8, v)
					end
				end
			end
			if var8 == nil and var9 == nil then
				return
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: var8 (ref), var9 (ref)
				if var8 ~= nil then
					for i, v in var8 do
						v.setActive(false)
					end
				end
				if var9 ~= nil then
					for i, v in var9 do
						v.setActive(true)
					end
				end
			end)
		end
		
		local function scheduleSettledEvaluation(value)
			-- upvalues: var3 (write), t_2 (ref), var2 (write), runService (copy), t_1 (ref), updateTargetGeometry (ref), evaluate (ref)
			if var3 then return end
			if value ~= nil then
				t_2[value] = true
			end
			if var2 == nil then
				var2 = runService.Heartbeat:Connect(function()
					-- upvalues: var2 (copy), var3 (copy), t_2 (copy), t_1 (copy), updateTargetGeometry (copy), evaluate (copy)
					var2 = nil
					
					if var2 ~= nil then
						var2:Disconnect()
					end
					if var3 then return end
					for i in t_2 do
						t_2[i] = nil
						
						if t_1[i.target] == i then
							updateTargetGeometry(i)
						end
					end
					evaluate()
				end)
				
				return
			end
		end
		
		local _ = nil
		
		local var12 = function(p5)
			-- upvalues: var3 (write), var1 (write), t (ref), deactivateAll (ref), evaluate (ref), scheduleSettledEvaluation (ref), var12 (write), t_1 (ref), updateTargetGeometry (ref)
			if var3 or p5 == var1 then return end
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			deactivateAll()
			var1 = p5
			
			if p5 == nil then return end
			table.insert(t, p5:GetPropertyChangedSignal("CanvasPosition"):Connect(evaluate))
			table.insert(t, p5:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(scheduleSettledEvaluation))
			table.insert(t, p5.Destroying:Connect(function()
				-- upvalues: var12 (copy)
				var12(nil)
			end))
			
			for i_1, v_1 in t_1 do
				updateTargetGeometry(v_1)
			end
			evaluate()
		end
		
		return {
			setViewport = var12,
			register = function(p6, p7)
				-- upvalues: var3 (write), t_1 (ref), signalsExperimentalModule (copy), t_2 (ref), var2 (write), runService (copy), updateTargetGeometry (ref), evaluate (ref)
				if var3 then
					return function() end
				end
				assert(t_1[p6] == nil, "target is already registered")
				local t = {
					active = false,
					contentStart = nil,
					contentEnd = nil,
					target = p6,
					setActive = p7,
					connections = {}
				}
				t_1[p6] = t
				local var13 = false
				
				local function unregister()
					-- upvalues: var13 (write), t_1 (copy), p6 (ref), t (ref), signalsExperimentalModule (copy)
					if var13 then return end
					var13 = true
					
					if t_1[p6] ~= t then return end
					t_1[p6] = nil
					local connections = t.connections
					
					for i, v in connections do
						v:Disconnect()
					end
					table.clear(connections)
					
					if t.active then
						t.active = false
						local list = { t }
						
						if list == nil then return end
						local var14 = nil
						signalsExperimentalModule.batch(function()
							-- upvalues: list (ref), var14 (ref)
							if list ~= nil then
								for i, v in list do
									v.setActive(false)
								end
							end
							if var14 ~= nil then
								for i, v in var14 do
									v.setActive(true)
								end
							end
						end)
					end
				end
				
				local function updateGeometry()
					-- upvalues: t (ref), var3 (copy), t_2 (copy), var2 (copy), runService (copy), t_1 (copy), updateTargetGeometry (copy), evaluate (copy)
					if var3 then return end
					if t ~= nil then
						t_2[t] = true
					end
					if var2 == nil then
						var2 = runService.Heartbeat:Connect(function()
							-- upvalues: var2 (copy), var3 (copy), t_2 (copy), t_1 (copy), updateTargetGeometry (copy), evaluate (copy)
							var2 = nil
							
							if var2 ~= nil then
								var2:Disconnect()
							end
							if var3 then return end
							for i in t_2 do
								t_2[i] = nil
								
								if t_1[i.target] == i then
									updateTargetGeometry(i)
								end
							end
							evaluate()
						end)
						
						return
					end
				end
				
				table.insert(t.connections, p6:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateGeometry))
				table.insert(t.connections, p6:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateGeometry))
				table.insert(t.connections, p6.Destroying:Connect(unregister))
				updateTargetGeometry(t)
				evaluate()
				
				return unregister
			end,
			destroy = function()
				-- upvalues: var3 (write), var2 (write), t_2 (ref), t (ref), t_1 (ref), var1 (write), signalsExperimentalModule (copy)
				if var3 then return end
				var3 = true
				
				if var2 ~= nil then
					var2:Disconnect()
					var2 = nil
				end
				table.clear(t_2)
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				local var15 = nil
				
				for i_1, v_1 in t_1 do
					t_1[i_1] = nil
					local connections = v_1.connections
					
					for i_2, v_2 in connections do
						v_2:Disconnect()
					end
					table.clear(connections)
					
					if v_1.active then
						v_1.active = false
						var15 = var15 or {}
						table.insert(var15, v_1)
					end
				end
				var1 = nil
				
				if var15 == nil then
					return
				end
				local var16 = nil
				signalsExperimentalModule.batch(function()
					-- upvalues: var15 (ref), var16 (ref)
					if var15 ~= nil then
						for i, v in var15 do
							v.setActive(false)
						end
					end
					if var16 ~= nil then
						for i, v in var16 do
							v.setActive(true)
						end
					end
				end)
			end
		}
	end
}