local function toScreenPoint(p1)
	return Vector2.new(p1.Position.X, p1.Position.Y)
end

local function raycast(p1, p2, p3)
	local x = p1:ScreenPointToRay(p3.X, p3.Y)
	local t = {}
	local terrain = p2:FindFirstChildWhichIsA("Terrain")
	
	if terrain ~= nil then
		table.insert(t, terrain)
	end
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.BruteForceAllSlow = true
	
	for _ = 1, 50 do
		raycastParams.FilterDescendantsInstances = t
		local origin = p2:Raycast(x.Origin, x.Direction * 1000, raycastParams)
		
		if origin ~= nil then
			local instance = origin.Instance
			
			if not instance:IsA("BasePart") or instance.Transparency >= 1 then
				table.insert(t, instance)
				continue
			end
			return instance
		end
		return nil
	end
	return nil
end

return function(p4)
	-- upvalues: raycast (ref), toScreenPoint (ref)
	local t = {}
	
	local function _(p5)
		-- upvalues: raycast (copy), p4 (ref), toScreenPoint (copy)
		local var1 = raycast(p4.camera, p4.world, toScreenPoint(p5))
		
		if var1 ~= nil then
			p4.onPick(var1)
			
			return
		elseif p4.onMiss ~= nil then
			p4.onMiss()
		end
	end
	
	local list = {
		p4.userInputService.InputBegan:Connect(function(p5, p6)
			-- upvalues: p4 (ref), raycast (copy), toScreenPoint (copy), t (ref)
			if p5.UserInputType == Enum.UserInputType.MouseButton1 then
				if not p6 and not p4.isBlocked() then
					local var1 = raycast(p4.camera, p4.world, toScreenPoint(p5))
					
					if var1 ~= nil then
						p4.onPick(var1)
						
						return
					elseif p4.onMiss == nil then
						return
					else
						p4.onMiss()
						
						return
					end
				end
			elseif p5.UserInputType == Enum.UserInputType.Touch then
				p6 = p6 or (p4.isBlocked() or next(t) ~= nil)
				
				for i, v in t do
					v.isGesture = true
				end
				t[p5] = {
					start = Vector2.new(p5.Position.X, p5.Position.Y),
					isGesture = p6
				}
			end
		end),
		p4.userInputService.InputChanged:Connect(function(p7)
			-- upvalues: t (ref)
			local var2 = t[p7]
			
			if var2 ~= nil and (Vector2.new(p7.Position.X, p7.Position.Y) - var2.start).Magnitude > 12 then
				var2.isGesture = true
			end
		end),
		p4.userInputService.InputEnded:Connect(function(p7, p8)
			-- upvalues: t (ref), p4 (ref), raycast (copy), toScreenPoint (copy)
			local var2 = t[p7]
			
			if var2 == nil then return end
			t[p7] = nil
			
			if var2.isGesture or p8 or (p7.UserInputState == Enum.UserInputState.Cancel or (Vector2.new(p7.Position.X, p7.Position.Y) - var2.start).Magnitude > 12) or p4.isBlocked() then return end
			local var3 = raycast(p4.camera, p4.world, toScreenPoint(p7))
			
			if var3 ~= nil then
				p4.onPick(var3)
				
				return
			elseif p4.onMiss ~= nil then
				p4.onMiss()
			end
		end)
	}
	
	return function()
		-- upvalues: list (ref), t (ref)
		for i, v in list do
			v:Disconnect()
		end
		table.clear(t)
	end
end