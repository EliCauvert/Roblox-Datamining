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
	registerHumanoidReady = function(p1)
		-- upvalues: waitForFirst (ref), playersService (ref)
		local function characterAdded(p2, p3)
			-- upvalues: waitForFirst (copy), p1 (ref)
			if not p3.Parent then
				waitForFirst(p3.AncestryChanged, p2.CharacterAdded)
			end
			if p2.Character ~= p3 or not p3.Parent then return end
			local humanoid = p3:FindFirstChildOfClass("Humanoid")
			while p3:IsDescendantOf(game) and not humanoid do
				waitForFirst(p3.ChildAdded, p3.AncestryChanged, p2.CharacterAdded)
				humanoid = p3:FindFirstChildOfClass("Humanoid")
			end
			if p2.Character ~= p3 or not p3:IsDescendantOf(game) then return end
			local humanoidRootPart = p3:FindFirstChild("HumanoidRootPart")
			while p3:IsDescendantOf(game) and not humanoidRootPart do
				waitForFirst(p3.ChildAdded, p3.AncestryChanged, humanoid.AncestryChanged, p2.CharacterAdded)
				humanoidRootPart = p3:FindFirstChild("HumanoidRootPart")
			end
			if humanoidRootPart and humanoid:IsDescendantOf(game) and (p3:IsDescendantOf(game) and p2.Character == p3) then
				p1(p2, p3, humanoid)
			end
		end
		
		local function playerAdded(p4)
			-- upvalues: characterAdded (ref)
			local characterAddedConnection = p4.CharacterAdded:Connect(function(p5)
				-- upvalues: characterAdded (copy), p4 (ref)
				characterAdded(p4, p5)
			end)
			local ancestryChangedConnection = nil
			ancestryChangedConnection = p4.AncestryChanged:Connect(function(_, p5)
				-- upvalues: ancestryChangedConnection (write), characterAddedConnection (ref)
				if not game:IsAncestorOf(p5) then
					ancestryChangedConnection:Disconnect()
					characterAddedConnection:Disconnect()
				end
			end)
			local character = p4.Character
			
			if character then
				characterAdded(p4, character)
			end
		end
		
		playersService.PlayerAdded:Connect(playerAdded)
		
		for i, v in pairs(playersService:GetPlayers()) do
			playerAdded(v)
		end
	end
}