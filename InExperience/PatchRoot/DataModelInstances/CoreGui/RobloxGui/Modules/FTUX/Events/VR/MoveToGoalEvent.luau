local _ = require(script.Parent.Parent.EventType)
local t = { Name = "MoveToGoalEvent" }
local var1 = nil

local function _(p1, p2)
	local part = Instance.new("Part")
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = 1
	part.Size = Vector3.new(math.abs(p2.X - p1.X), 1, math.abs(p2.Z - p1.Z))
	part.Position = Vector3.new((p2.X + p1.X) / 2, 6.3, (p2.Z + p1.Z) / 2)
	part.Parent = workspace
	
	return part
end

function t.StartEvent(p1)
	-- upvalues: var1 (write)
	local part = Instance.new("Part")
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = 1
	part.Size = Vector3.new(17, 1, 18)
	part.Position = Vector3.new(0.5, 6.300000190735, -40)
	part.Parent = workspace
	task.wait(1)
	var1 = part.Touched:Connect(function(p2)
		-- upvalues: part (ref), p1 (ref), var1 (copy)
		if game.Players:GetPlayerFromCharacter(p2.Parent) then
			part:Destroy()
			task.wait(0.2)
			p1()
			
			if var1 then
				var1:Disconnect()
				var1 = nil
			end
		end
	end)
end

function t.StopEvent()
	-- upvalues: var1 (write)
	if var1 then
		var1:Disconnect()
		var1 = nil
	end
end

return t