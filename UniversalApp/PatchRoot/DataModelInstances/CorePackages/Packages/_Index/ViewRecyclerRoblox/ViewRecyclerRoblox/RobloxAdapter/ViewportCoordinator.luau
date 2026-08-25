local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler).Axis
local signalsExperimentalModule = require(viewRecyclerRoblox.Parent.SignalsExperimental)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)

local function _(p0)
	for i, v in p0 do
		v:Disconnect()
	end
	table.clear(p0)
end

return {
	new = function(p1)
		-- upvalues: axisMapModule (ref), signalsExperimentalModule (ref)
		local axis = p1.axis
		local activationMargin = p1.activationMargin or 0
		local retentionMargin = p1.retentionMargin or activationMargin
		assert(activationMargin >= 0, "activationMargin must be non-negative")
		assert(activationMargin <= retentionMargin, "retentionMargin must be at least activationMargin")
		local var5 = nil
		local t = {}
		local t_1 = {}
		local var8 = false
		
		local function updateTargetGeometry(p2)
			-- upvalues: var5 (write), axisMapModule (copy), axis (ref)
			if var5 == nil or not p2.target:IsDescendantOf(var5) then
				p2.contentStart = nil
				p2.contentEnd = nil
				
				return
			end
			local var13 = axisMapModule.mainOf(var5.CanvasPosition, axis) + axisMapModule.mainOf(p2.target.AbsolutePosition, axis) - axisMapModule.mainOf(var5.AbsolutePosition, axis)
			p2.contentStart = var13
			p2.contentEnd = var13 + axisMapModule.mainOf(p2.target.AbsoluteSize, axis)
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
			local var14 = nil
			
			for i, v in t_1 do
				if v.active then
					v.active = false
					var14 = var14 or {}
					table.insert(var14, v)
				end
			end
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
		
		local function evaluate()
			-- upvalues: var8 (write), var5 (write), deactivateAll (ref), axisMapModule (copy), axis (ref), t_1 (ref), retentionMargin (ref), activationMargin (ref), signalsExperimentalModule (copy)
			if var8 then return end
			if var5 == nil then
				deactivateAll()
				
				return
			end
			local var16 = axisMapModule.mainOf(var5.CanvasPosition, axis)
			local var17 = var16 + axisMapModule.mainOf(var5.AbsoluteWindowSize, axis)
			local var18 = nil
			local var19 = nil
			
			for i, v in t_1 do
				local var20 = false
				local contentStart = v.contentStart
				local contentEnd = v.contentEnd
				
				if contentStart ~= nil and contentEnd ~= nil then
					local var21 = if v.active then retentionMargin else activationMargin
					var20 = var16 - var21 < contentEnd and contentStart < var17 + var21
				end
				if var20 ~= v.active then
					v.active = var20
					
					if var20 then
						var19 = var19 or {}
						table.insert(var19, v)
					else
						var18 = var18 or {}
						table.insert(var18, v)
					end
				end
			end
			if var18 == nil and var19 == nil then
				return
			end
			signalsExperimentalModule.batch(function()
				-- upvalues: var18 (ref), var19 (ref)
				if var18 ~= nil then
					for i, v in var18 do
						v.setActive(false)
					end
				end
				if var19 ~= nil then
					for i, v in var19 do
						v.setActive(true)
					end
				end
			end)
		end
		
		local _ = nil
		
		local var12 = function(p5)
			-- upvalues: var8 (write), var5 (write), t (ref), deactivateAll (ref), evaluate (ref), var12 (write), t_1 (ref), updateTargetGeometry (ref)
			if var8 or p5 == var5 then return end
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			deactivateAll()
			var5 = p5
			
			if p5 == nil then return end
			table.insert(t, p5:GetPropertyChangedSignal("CanvasPosition"):Connect(evaluate))
			table.insert(t, p5:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(evaluate))
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
				-- upvalues: var8 (write), t_1 (ref), signalsExperimentalModule (copy), updateTargetGeometry (ref), evaluate (ref)
				if var8 then
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
				local var23 = false
				
				local function unregister()
					-- upvalues: var23 (write), t_1 (copy), p6 (ref), t (ref), signalsExperimentalModule (copy)
					if var23 then return end
					var23 = true
					
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
						local var27 = nil
						signalsExperimentalModule.batch(function()
							-- upvalues: list (ref), var27 (ref)
							if list ~= nil then
								for i, v in list do
									v.setActive(false)
								end
							end
							if var27 ~= nil then
								for i, v in var27 do
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
				-- upvalues: var8 (write), t (ref), t_1 (ref), var5 (write), signalsExperimentalModule (copy)
				if var8 then return end
				var8 = true
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				local var28 = nil
				
				for i_1, v_1 in t_1 do
					t_1[i_1] = nil
					local connections = v_1.connections
					
					for i_2, v_2 in connections do
						v_2:Disconnect()
					end
					table.clear(connections)
					
					if v_1.active then
						v_1.active = false
						var28 = var28 or {}
						table.insert(var28, v_1)
					end
				end
				var5 = nil
				
				if var28 == nil then
					return
				end
				local var29 = nil
				signalsExperimentalModule.batch(function()
					-- upvalues: var28 (ref), var29 (ref)
					if var28 ~= nil then
						for i, v in var28 do
							v.setActive(false)
						end
					end
					if var29 ~= nil then
						for i, v in var29 do
							v.setActive(true)
						end
					end
				end)
			end
		}
	end
}