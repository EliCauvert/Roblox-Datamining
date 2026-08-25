local t = {}
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local tweenService = game:GetService("TweenService")

function t.setupControl(value)
	-- upvalues: mouse (ref), tweenService (ref)
	local timestamp = os.time()
	local var4 = false
	local var5 = false
	mouse.Move:Connect(function()
		-- upvalues: timestamp (write)
		timestamp = os.time()
	end)
	value.ControlBarContainer.MouseEnter:Connect(function()
		-- upvalues: var4 (write)
		var4 = true
	end)
	value.ControlBarContainer.MouseLeave:Connect(function()
		-- upvalues: var4 (write)
		var4 = false
	end)
	local var6 = nil
	
	local function createTween()
		-- upvalues: var6 (write), tweenService (copy), value (ref), createTween (ref)
		var6 = tweenService:Create(value.ControlBarContainer, TweenInfo.new(2), { Position = value.ControlBarContainerNonVisiblePosition })
		
		if var6 then
			var6.Completed:Connect(function()
				-- upvalues: createTween (copy)
				createTween()
			end)
			
			return
		end
		error("Failed to create tween for control visibility")
	end
	
	createTween()
	task.spawn(function()
		-- upvalues: var6 (write), var4 (write), timestamp (write), var5 (write), value (ref)
		while true do
			if not var6 then
				error("No current tween for control visibility")
			end
			if var4 or os.time() - timestamp <= 2 then
				if var5 then
					var5 = false
					var6:Cancel()
					value.ControlBarContainer.Position = value.ControlBarContainerVisiblePosition
				end
			elseif not var5 then
				var5 = true
				var6:Play()
			end
			task.wait(0.1)
		end
	end)
end

return t