local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")

return {
	setupControl = function(p1)
		-- upvalues: Mouse (copy), TweenService (copy)
		local Timestamp = os.time()
		local Flag = false
		local Flag1 = false
		Mouse.Move:Connect(function()
			-- upvalues: Timestamp (ref)
			Timestamp = os.time()
		end)
		p1.ControlBarContainer.MouseEnter:Connect(function()
			-- upvalues: Flag (ref)
			Flag = true
		end)
		p1.ControlBarContainer.MouseLeave:Connect(function()
			-- upvalues: Flag (ref)
			Flag = false
		end)
		local CreateResult = nil
		
		local function createTween()
			-- upvalues: CreateResult (ref), TweenService (upval), p1 (copy), createTween (copy)
			CreateResult = TweenService:Create(p1.ControlBarContainer, TweenInfo.new(2), { Position = p1.ControlBarContainerNonVisiblePosition })
			
			if CreateResult then
				CreateResult.Completed:Connect(function()
					-- upvalues: createTween (upval)
					createTween()
				end)
				
				return
			else
				error("Failed to create tween for control visibility")
			end
		end
		
		createTween()
		task.spawn(function()
			-- upvalues: CreateResult (ref), Flag (ref), Timestamp (ref), Flag1 (ref), p1 (copy)
			while true do
				if not CreateResult then
					error("No current tween for control visibility")
				end
				if Flag or os.time() - Timestamp <= 2 then
					if Flag1 then
						Flag1 = false
						CreateResult:Cancel()
						p1.ControlBarContainer.Position = p1.ControlBarContainerVisiblePosition
					end
				elseif not Flag1 then
					Flag1 = true
					CreateResult:Play()
				end
				task.wait(0.1)
			end
		end)
	end
}