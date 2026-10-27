local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler).Axis
local SignalsExperimentalModule = require(ViewRecyclerRoblox.Parent.SignalsExperimental)
local AxisMapModule = require(ViewRecyclerRoblox.RobloxAdapter.axisMap)

local function _(Tbl)
	for _, Connection in Tbl do
		Connection:Disconnect()
	end
	table.clear(Tbl)
end

return {
	new = function(p1)
		-- upvalues: AxisMapModule (copy), SignalsExperimentalModule (copy)
		local Axis = p1.axis
		local ActivationMargin = p1.activationMargin or 0
		local RetentionMargin = p1.retentionMargin or ActivationMargin
		assert(ActivationMargin >= 0, "activationMargin must be non-negative")
		assert(ActivationMargin <= RetentionMargin, "retentionMargin must be at least activationMargin")
		local v1 = nil
		local List = {}
		local t = {}
		local Flag = false
		
		local function updateTargetGeometry(p2)
			-- upvalues: v1 (ref), AxisMapModule (upval), Axis (copy)
			local Frame = v1
			
			if Frame == nil or not p2.target:IsDescendantOf(Frame) then
				p2.contentStart = nil
				p2.contentEnd = nil
				
				return
			else
				local MainOfResultDelta = AxisMapModule.mainOf(Frame.CanvasPosition, Axis) + AxisMapModule.mainOf(p2.target.AbsolutePosition, Axis) - AxisMapModule.mainOf(Frame.AbsolutePosition, Axis)
				p2.contentStart = MainOfResultDelta
				p2.contentEnd = MainOfResultDelta + AxisMapModule.mainOf(p2.target.AbsoluteSize, Axis)
			end
		end
		
		local function _(p2, p3)
			-- upvalues: SignalsExperimentalModule (upval)
			if p2 ~= nil or p3 ~= nil then
				SignalsExperimentalModule.batch(function()
					-- upvalues: p2 (copy), p3 (copy)
					if p2 ~= nil then
						for _, value in p2 do
							value.setActive(false)
						end
					end
					if p3 ~= nil then
						for _, value1 in p3 do
							value1.setActive(true)
						end
					end
				end)
				
				return
			end
		end
		
		local function deactivateAll()
			-- upvalues: t (copy), SignalsExperimentalModule (upval)
			local List = nil
			
			for _, value in t do
				if value.active then
					value.active = false
					List = List or {}
					table.insert(List, value)
				end
			end
			local List1 = List
			
			if List1 ~= nil then
				local v2 = nil
				SignalsExperimentalModule.batch(function()
					-- upvalues: List1 (copy), v2 (copy)
					if List1 ~= nil then
						for _, value in List1 do
							value.setActive(false)
						end
					end
					if v2 ~= nil then
						for _, value1 in v2 do
							value1.setActive(true)
						end
					end
				end)
				
				return
			end
		end
		
		local function evaluate()
			-- upvalues: Flag (ref), v1 (ref), deactivateAll (copy), AxisMapModule (upval), Axis (copy), t (copy), RetentionMargin (copy), ActivationMargin (copy), SignalsExperimentalModule (upval)
			if Flag then return end
			local ScrollFrame = v1
			
			if ScrollFrame == nil then
				deactivateAll()
				
				return
			end
			local MainOfResult = AxisMapModule.mainOf(ScrollFrame.CanvasPosition, Axis)
			local NewMainOfResult = MainOfResult + AxisMapModule.mainOf(ScrollFrame.AbsoluteWindowSize, Axis)
			local List1 = nil
			local List = nil
			
			for _, value in t do
				local Active = false
				local ContentStart = value.contentStart
				local ContentEnd = value.contentEnd
				
				if ContentStart ~= nil and ContentEnd ~= nil then
					local RetentionMargin1 = if value.active then RetentionMargin else ActivationMargin
					Active = MainOfResult - RetentionMargin1 < ContentEnd and ContentStart < NewMainOfResult + RetentionMargin1
				end
				if Active ~= value.active then
					value.active = Active
					
					if Active then
						List = List or {}
						table.insert(List, value)
					else
						List1 = List1 or {}
						table.insert(List1, value)
					end
				end
			end
			local List2 = List1
			local List3 = List
			
			if List2 ~= nil or List3 ~= nil then
				SignalsExperimentalModule.batch(function()
					-- upvalues: List2 (copy), List3 (copy)
					if List2 ~= nil then
						for _, value in List2 do
							value.setActive(false)
						end
					end
					if List3 ~= nil then
						for _, value1 in List3 do
							value1.setActive(true)
						end
					end
				end)
				
				return
			end
		end
		
		local _ = nil
		
		local function SetViewport(Object)
			-- upvalues: Flag (ref), v1 (ref), List (copy), deactivateAll (copy), evaluate (copy), SetViewport (ref), t (copy), updateTargetGeometry (copy)
			if Flag or Object == v1 then return end
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			deactivateAll()
			v1 = Object
			
			if Object == nil then return end
			table.insert(List, Object:GetPropertyChangedSignal("CanvasPosition"):Connect(evaluate))
			table.insert(List, Object:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(evaluate))
			table.insert(List, Object.Destroying:Connect(function()
				-- upvalues: SetViewport (upval)
				SetViewport(nil)
			end))
			
			for _, value in t do
				updateTargetGeometry(value)
			end
			evaluate()
		end
		
		return {
			setViewport = SetViewport,
			register = function(Object, SetActive)
				-- upvalues: Flag (ref), t (copy), SignalsExperimentalModule (upval), updateTargetGeometry (copy), evaluate (copy)
				if Flag then
					return function() end
				else
					assert(t[Object] == nil, "target is already registered")
					local config = {
						active = false,
						contentStart = nil,
						contentEnd = nil,
						target = Object,
						setActive = SetActive,
						connections = {}
					}
					t[Object] = config
					local Flag1 = false
					
					local function unregister()
						-- upvalues: Flag1 (ref), t (upval), Object (copy), config (copy), SignalsExperimentalModule (upval)
						if Flag1 then return end
						Flag1 = true
						
						if t[Object] ~= config then return end
						t[Object] = nil
						local Connections = config.connections
						
						for _, connection in Connections do
							connection:Disconnect()
						end
						table.clear(Connections)
						
						if config.active then
							config.active = false
							local list = { config }
							
							if list == nil then return end
							local v3 = nil
							SignalsExperimentalModule.batch(function()
								-- upvalues: list (copy), v3 (copy)
								if list ~= nil then
									for _, value in list do
										value.setActive(false)
									end
								end
								if v3 ~= nil then
									for _, value1 in v3 do
										value1.setActive(true)
									end
								end
							end)
						end
					end
					
					local function updateGeometry()
						-- upvalues: updateTargetGeometry (upval), config (copy), evaluate (upval)
						updateTargetGeometry(config)
						evaluate()
					end
					
					table.insert(config.connections, Object:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateGeometry))
					table.insert(config.connections, Object:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateGeometry))
					table.insert(config.connections, Object.Destroying:Connect(unregister))
					updateTargetGeometry(config)
					evaluate()
					
					return unregister
				end
			end,
			destroy = function()
				-- upvalues: Flag (ref), List (copy), t (copy), v1 (ref), SignalsExperimentalModule (upval)
				if Flag then return end
				Flag = true
				
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				local List1 = nil
				
				for i, value in t do
					t[i] = nil
					local Connections = value.connections
					
					for _, connection in Connections do
						connection:Disconnect()
					end
					table.clear(Connections)
					
					if value.active then
						value.active = false
						List1 = List1 or {}
						table.insert(List1, value)
					end
				end
				v1 = nil
				local List2 = List1
				
				if List2 ~= nil then
					local v4 = nil
					SignalsExperimentalModule.batch(function()
						-- upvalues: List2 (copy), v4 (copy)
						if List2 ~= nil then
							for _, value in List2 do
								value.setActive(false)
							end
						end
						if v4 ~= nil then
							for _, value1 in v4 do
								value1.setActive(true)
							end
						end
					end)
					
					return
				end
			end
		}
	end
}