local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler).Axis
local signalsExperimentalModule = require(viewRecyclerRoblox.Parent.SignalsExperimental)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)

local function _(p1)
	for i, v in p1 do
		v:Disconnect()
	end
	table.clear(p1)
end

return {
	new = function(p2)
		-- upvalues: axisMapModule (ref), signalsExperimentalModule (ref)
		local axis = p2.axis
		local activationMargin = p2.activationMargin or 0
		local retentionMargin = p2.retentionMargin or activationMargin
		assert(activationMargin >= 0, "activationMargin must be non-negative")
		assert(activationMargin <= retentionMargin, "retentionMargin must be at least activationMargin")
		local var1 = nil
		local t = {}
		local t_1 = {}
		local var2 = false
		
		local function updateTargetGeometry(p3)
			-- upvalues: var1 (write), axisMapModule (copy), axis (ref)
			if var1 == nil or not p3.target:IsDescendantOf(var1) then
				p3.contentStart = nil
				p3.contentEnd = nil
				
				return
			end
			local var3 = axisMapModule.mainOf(var1.CanvasPosition, axis) + axisMapModule.mainOf(p3.target.AbsolutePosition, axis) - axisMapModule.mainOf(var1.AbsolutePosition, axis)
			p3.contentStart = var3
			p3.contentEnd = var3 + axisMapModule.mainOf(p3.target.AbsoluteSize, axis)
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
			local var3 = nil
			
			for i, v in t_1 do
				if v.active then
					v.active = false
					var3 = var3 or {}
					table.insert(var3, v)
				end
			end
			if var3 == nil then
				return
			end
			local var4 = nil
			signalsExperimentalModule.batch(function()
				-- upvalues: var3 (ref), var4 (ref)
				if var3 ~= nil then
					for i, v in var3 do
						v.setActive(false)
					end
				end
				if var4 ~= nil then
					for i, v in var4 do
						v.setActive(true)
					end
				end
			end)
		end
		
		local function evaluate()
			-- upvalues: var2 (write), var1 (write), deactivateAll (ref), axisMapModule (copy), axis (ref), t_1 (ref), retentionMargin (ref), activationMargin (ref), signalsExperimentalModule (copy)
			if var2 then return end
			if var1 == nil then
				deactivateAll()
				
				return
			end
			local var5 = axisMapModule.mainOf(var1.CanvasPosition, axis)
			local var6 = var5 + axisMapModule.mainOf(var1.AbsoluteWindowSize, axis)
			local var7 = nil
			local var8 = nil
			
			for i, v in t_1 do
				local var9 = false
				local contentStart = v.contentStart
				local contentEnd = v.contentEnd
				
				if contentStart ~= nil and contentEnd ~= nil then
					local var10 = if v.active then retentionMargin else activationMargin
					var9 = var5 - var10 < contentEnd and contentStart < var6 + var10
				end
				if var9 ~= v.active then
					v.active = var9
					
					if var9 then
						var8 = var8 or {}
						table.insert(var8, v)
					else
						var7 = var7 or {}
						table.insert(var7, v)
					end
				end
			end
			if var7 == nil and var8 == nil then
				return
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: var7 (ref), var8 (ref)
				if var7 ~= nil then
					for i, v in var7 do
						v.setActive(false)
					end
				end
				if var8 ~= nil then
					for i, v in var8 do
						v.setActive(true)
					end
				end
			end)
		end
		
		local _ = nil
		
		local var11 = function(p5)
			-- upvalues: var2 (write), var1 (write), t (ref), deactivateAll (ref), evaluate (ref), var11 (write), t_1 (ref), updateTargetGeometry (ref)
			if var2 or p5 == var1 then return end
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			deactivateAll()
			var1 = p5
			
			if p5 == nil then return end
			table.insert(t, p5:GetPropertyChangedSignal("CanvasPosition"):Connect(evaluate))
			table.insert(t, p5:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(evaluate))
			table.insert(t, p5.Destroying:Connect(function()
				-- upvalues: var11 (copy)
				var11(nil)
			end))
			
			for i_1, v_1 in t_1 do
				updateTargetGeometry(v_1)
			end
			evaluate()
		end
		
		return {
			setViewport = var11,
			register = function(p6, p7)
				-- upvalues: var2 (write), t_1 (ref), signalsExperimentalModule (copy), updateTargetGeometry (ref), evaluate (ref)
				if var2 then
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
				local var12 = false
				
				local function unregister()
					-- upvalues: var12 (write), t_1 (copy), p6 (ref), t (ref), signalsExperimentalModule (copy)
					if var12 then return end
					var12 = true
					
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
						local var13 = nil
						signalsExperimentalModule.batch(function()
							-- upvalues: list (ref), var13 (ref)
							if list ~= nil then
								for i, v in list do
									v.setActive(false)
								end
							end
							if var13 ~= nil then
								for i, v in var13 do
									v.setActive(true)
								end
							end
						end)
					end
				end
				
				local function updateGeometry()
					-- upvalues: updateTargetGeometry (copy), t (ref), evaluate (copy)
					updateTargetGeometry(t)
					evaluate()
				end
				
				table.insert(t.connections, p6:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateGeometry))
				table.insert(t.connections, p6:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateGeometry))
				table.insert(t.connections, p6.Destroying:Connect(unregister))
				updateTargetGeometry(t)
				evaluate()
				
				return unregister
			end,
			destroy = function()
				-- upvalues: var2 (write), t (ref), t_1 (ref), var1 (write), signalsExperimentalModule (copy)
				if var2 then return end
				var2 = true
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				local var14 = nil
				
				for i_1, v_1 in t_1 do
					t_1[i_1] = nil
					local connections = v_1.connections
					
					for i_2, v_2 in connections do
						v_2:Disconnect()
					end
					table.clear(connections)
					
					if v_1.active then
						v_1.active = false
						var14 = var14 or {}
						table.insert(var14, v_1)
					end
				end
				var1 = nil
				
				if var14 == nil then
					return
				end
				local var15 = nil
				signalsExperimentalModule.batch(function()
					-- upvalues: var14 (ref), var15 (ref)
					if var14 ~= nil then
						for i, v in var14 do
							v.setActive(false)
						end
					end
					if var15 ~= nil then
						for i, v in var15 do
							v.setActive(true)
						end
					end
				end)
			end
		}
	end
}