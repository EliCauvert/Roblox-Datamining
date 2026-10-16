local function toScreenPoint(Input): Vector2 --[[ Line: 20 ]]
	return Vector2.new(Input.Position.X, Input.Position.Y)
end

local function raycast(Camera: Camera, World, Vector) --[[ Line: 24 ]]
	local v1 = Camera:ScreenPointToRay(Vector.X, Vector.Y)
	local List = {}
	local Terrain = World:FindFirstChildWhichIsA("Terrain")
	
	if Terrain ~= nil then
		table.insert(List, Terrain)
	end
	local RaycastParams1 = RaycastParams.new()
	RaycastParams1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams1.BruteForceAllSlow = true
	local Hit = nil
	
	for _ = 1, 50 do
		RaycastParams1.FilterDescendantsInstances = List
		local RaycastResult = World:Raycast(v1.Origin, v1.Direction * 1000, RaycastParams1)
		
		if RaycastResult == nil then
			return nil
		end
		Hit = RaycastResult.Instance
		
		if Hit:IsA("BasePart") and Hit.Transparency < 1 then
			return Hit
		end
		table.insert(List, Hit)
	end
	return nil
end

return function(p1) --[[ Line: 49 | Named "createViewerWorldPicker" ]]
	-- upvalues: raycast (copy), toScreenPoint (copy)
	local Tbl = {}
	
	local function _(p2) --[[ Line: 52 | Named "pick" ]]
		-- upvalues: raycast (upval), p1 (copy), toScreenPoint (upval)
		local RaycastResult = raycast(p1.camera, p1.world, toScreenPoint(p2))
		
		if RaycastResult ~= nil then
			p1.onPick(RaycastResult)
			
			return
		end
		if p1.onMiss ~= nil then
			p1.onMiss()
		end
	end
	
	local Connections = {
		p1.userInputService.InputBegan:Connect(function(Input, GameProcessed) --[[ Line: 62 ]]
			-- upvalues: p1 (copy), raycast (upval), toScreenPoint (upval), Tbl (copy)
			if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then
				if Input.UserInputType == Enum.UserInputType.Touch then
					local GameProcessed1 = GameProcessed or (p1.isBlocked() or next(Tbl) ~= nil)
					for _, value in Tbl do
						value.isGesture = true
					end
					Tbl[Input] = {
						start = Vector2.new(Input.Position.X, Input.Position.Y),
						isGesture = GameProcessed1
					}
				end
			elseif not GameProcessed and not p1.isBlocked() then
				local RaycastResult = raycast(p1.camera, p1.world, toScreenPoint(Input))
				
				if RaycastResult ~= nil then
					p1.onPick(RaycastResult)
					
					return
				end
				if p1.onMiss ~= nil then
					p1.onMiss()
					
					return
				end
			end
		end),
		p1.userInputService.InputChanged:Connect(function(Input) --[[ Line: 75 ]]
			-- upvalues: Tbl (copy)
			local Entry = Tbl[Input]
			
			if Entry ~= nil and (Vector2.new(Input.Position.X, Input.Position.Y) - Entry.start).Magnitude > 12 then
				Entry.isGesture = true
			end
		end),
		p1.userInputService.InputEnded:Connect(function(Input, GameProcessed) --[[ Line: 81 ]]
			-- upvalues: Tbl (copy), p1 (copy), raycast (upval), toScreenPoint (upval)
			local Entry = Tbl[Input]
			
			if Entry == nil then return end
			Tbl[Input] = nil
			
			if Entry.isGesture or GameProcessed or Input.UserInputState == Enum.UserInputState.Cancel or (Vector2.new(Input.Position.X, Input.Position.Y) - Entry.start).Magnitude > 12 or p1.isBlocked() then return end
			local RaycastResult = raycast(p1.camera, p1.world, toScreenPoint(Input))
			
			if RaycastResult ~= nil then
				p1.onPick(RaycastResult)
				
				return
			end
			if p1.onMiss ~= nil then
				p1.onMiss()
			end
		end)
	}
	
	return function() --[[ Line: 100 ]]
		-- upvalues: Connections (copy), Tbl (copy)
		for _, connection in Connections do
			connection:Disconnect()
		end
		table.clear(Tbl)
	end
end