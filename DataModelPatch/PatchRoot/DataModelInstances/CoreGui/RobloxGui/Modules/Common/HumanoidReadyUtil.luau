local Players = game:GetService("Players")

local function waitForFirst(...)
	local BindableEvent = Instance.new("BindableEvent")
	local Connections = { ... }
	
	local function fire(...)
		-- upvalues: Connections (copy), BindableEvent (copy)
		for i = 1, #Connections do
			Connections[i]:Disconnect()
		end
		return BindableEvent:Fire(...)
	end
	
	for i = 1, #Connections do
		Connections[i] = Connections[i]:Connect(fire)
	end
	return BindableEvent.Event:Wait()
end

return {
	registerHumanoidReady = function(Callback)
		-- upvalues: waitForFirst (copy), Players (copy)
		local function characterAdded(Player: Player, Object)
			-- upvalues: waitForFirst (upval), Callback (copy)
			if not Object.Parent then
				waitForFirst(Object.AncestryChanged, Player.CharacterAdded)
			end
			if Player.Character ~= Object or not Object.Parent then return end
			local Humanoid = Object:FindFirstChildOfClass("Humanoid")
			while Object:IsDescendantOf(game) and not Humanoid do
				waitForFirst(Object.ChildAdded, Object.AncestryChanged, Player.CharacterAdded)
				Humanoid = Object:FindFirstChildOfClass("Humanoid")
			end
			if Player.Character ~= Object or not Object:IsDescendantOf(game) then return end
			local HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
			while Object:IsDescendantOf(game) and not HumanoidRootPart do
				waitForFirst(Object.ChildAdded, Object.AncestryChanged, Humanoid.AncestryChanged, Player.CharacterAdded)
				HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
			end
			if HumanoidRootPart and Humanoid:IsDescendantOf(game) and Object:IsDescendantOf(game) and Player.Character == Object then
				Callback(Player, Object, Humanoid)
			end
		end
		
		local function playerAdded(Player: Player)
			-- upvalues: characterAdded (copy)
			local CharacterAddedConnection = Player.CharacterAdded:Connect(function(Character)
				-- upvalues: characterAdded (upval), Player (copy)
				characterAdded(Player, Character)
			end)
			local Connection = nil
			Connection = Player.AncestryChanged:Connect(function(_, NewParent)
				-- upvalues: Connection (ref), CharacterAddedConnection (copy)
				if not game:IsAncestorOf(NewParent) then
					Connection:Disconnect()
					CharacterAddedConnection:Disconnect()
				end
			end)
			local Character = Player.Character
			
			if Character then
				characterAdded(Player, Character)
			end
		end
		
		Players.PlayerAdded:Connect(playerAdded)
		
		for _, player in pairs(Players:GetPlayers()) do
			playerAdded(player)
		end
	end
}