local _ = require(script.Parent.Parent.EventType)
local TouchedConnection = nil

local function _(Vector, Vector1)
	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.CanCollide = false
	Part.Transparency = 1
	Part.Size = Vector3.new(math.abs(Vector1.X - Vector.X), 1, (math.abs(Vector1.Z - Vector.Z)))
	Part.Position = Vector3.new((Vector1.X + Vector.X) / 2, 6.3, (Vector1.Z + Vector.Z) / 2)
	Part.Parent = workspace
	
	return Part
end

return {
	Name = "MoveToGoalEvent",
	StartEvent = function(Callback)
		-- upvalues: TouchedConnection (ref)
		local Part = Instance.new("Part")
		Part.Anchored = true
		Part.CanCollide = false
		Part.Transparency = 1
		Part.Size = vector.create(17, 1, 18)
		Part.Position = vector.create(0.5, 6.300000190734863, -40)
		Part.Parent = workspace
		task.wait(1)
		TouchedConnection = Part.Touched:Connect(function(Hit)
			-- upvalues: Part (copy), Callback (copy), TouchedConnection (upval)
			if game.Players:GetPlayerFromCharacter(Hit.Parent) then
				Part:Destroy()
				task.wait(0.2)
				Callback()
				
				if TouchedConnection then
					TouchedConnection:Disconnect()
					TouchedConnection = nil
				end
			end
		end)
	end,
	StopEvent = function()
		-- upvalues: TouchedConnection (ref)
		if TouchedConnection then
			TouchedConnection:Disconnect()
			TouchedConnection = nil
		end
	end
}