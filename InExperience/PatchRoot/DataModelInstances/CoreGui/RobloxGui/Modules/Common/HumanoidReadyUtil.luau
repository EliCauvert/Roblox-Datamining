local playersService = game:GetService("Players")

local function waitForFirst(...)
	local bindableEvent = Instance.new("BindableEvent")
	local list = { ... }
	
	local function fire(...)
		-- upvalues: list (ref), bindableEvent (ref)
		for i = 1, #list do
			list[i]:Disconnect()
		end
		return bindableEvent:Fire(...)
	end
	
	for i = 1, #list do
		list[i] = list[i]:Connect(fire)
	end
	return bindableEvent.Event:Wait()
end

return {
	registerHumanoidReady = function(p0)
		-- upvalues: waitForFirst (ref), playersService (ref)
		local function characterAdded(p1, p2)
			-- upvalues: waitForFirst (copy), p0 (ref)
			if not p2.Parent then
				waitForFirst(p2.AncestryChanged, p1.CharacterAdded)
			end
			if p1.Character ~= p2 or not p2.Parent then return end
			local humanoid = p2:FindFirstChildOfClass("Humanoid")
			while p2:IsDescendantOf(game) and not humanoid do
				waitForFirst(p2.ChildAdded, p2.AncestryChanged, p1.CharacterAdded)
				humanoid = p2:FindFirstChildOfClass("Humanoid")
			end
			if p1.Character ~= p2 or not p2:IsDescendantOf(game) then return end
			local humanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
			while p2:IsDescendantOf(game) and not humanoidRootPart do
				waitForFirst(p2.ChildAdded, p2.AncestryChanged, humanoid.AncestryChanged, p1.CharacterAdded)
				humanoidRootPart = p2:FindFirstChild("HumanoidRootPart")
			end
			if humanoidRootPart and humanoid:IsDescendantOf(game) and (p2:IsDescendantOf(game) and p1.Character == p2) then
				p0(p1, p2, humanoid)
			end
		end
		
		local function playerAdded(p3)
			-- upvalues: characterAdded (ref)
			local characterAddedConnection = p3.CharacterAdded:Connect(function(p4)
				-- upvalues: characterAdded (copy), p3 (ref)
				characterAdded(p3, p4)
			end)
			local ancestryChangedConnection = nil
			ancestryChangedConnection = p3.AncestryChanged:Connect(function(_, p5)
				-- upvalues: ancestryChangedConnection (write), characterAddedConnection (ref)
				if not game:IsAncestorOf(p5) then
					ancestryChangedConnection:Disconnect()
					characterAddedConnection:Disconnect()
				end
			end)
			local character = p3.Character
			
			if character then
				characterAdded(p3, character)
			end
		end
		
		playersService.PlayerAdded:Connect(playerAdded)
		
		for i, v in pairs(playersService:GetPlayers()) do
			playerAdded(v)
		end
	end
}