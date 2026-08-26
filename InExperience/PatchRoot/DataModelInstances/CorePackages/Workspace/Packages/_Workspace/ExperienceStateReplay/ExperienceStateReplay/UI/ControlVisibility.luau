local t = {}
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local tweenService = game:GetService("TweenService")

function t.setupControl(value)
	-- upvalues: mouse (ref), tweenService (ref)
	local timestamp = os.time()
	local var1 = false
	local var2 = false
	mouse.Move:Connect(function()
		-- upvalues: timestamp (write)
		timestamp = os.time()
	end)
	value.ControlBarContainer.MouseEnter:Connect(function()
		-- upvalues: var1 (write)
		var1 = true
	end)
	value.ControlBarContainer.MouseLeave:Connect(function()
		-- upvalues: var1 (write)
		var1 = false
	end)
	local var3 = nil
	
	local function createTween()
		-- upvalues: var3 (write), tweenService (copy), value (ref), createTween (ref)
		var3 = tweenService:Create(value.ControlBarContainer, TweenInfo.new(2), { Position = value.ControlBarContainerNonVisiblePosition })
		
		if var3 then
			var3.Completed:Connect(function()
				-- upvalues: createTween (copy)
				createTween()
			end)
			
			return
		end
		error("Failed to create tween for control visibility")
	end
	
	createTween()
	task.spawn(function()
		-- upvalues: var3 (write), var1 (write), timestamp (write), var2 (write), value (ref)
		while true do
			if not var3 then
				error("No current tween for control visibility")
			end
			if var1 or os.time() - timestamp <= 2 then
				if var2 then
					var2 = false
					var3:Cancel()
					value.ControlBarContainer.Position = value.ControlBarContainerVisiblePosition
				end
			elseif not var2 then
				var2 = true
				var3:Play()
			end
			task.wait(0.1)
		end
	end)
end

return t