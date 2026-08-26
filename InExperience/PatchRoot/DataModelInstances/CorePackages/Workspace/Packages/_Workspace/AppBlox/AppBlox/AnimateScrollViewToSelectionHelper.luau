local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local gamepadService = game:GetService("GamepadService")
local tweenService = game:GetService("TweenService")

function AnimateScrollViewToSelectionHelper(p1, p2, p3)
	-- upvalues: gamepadService (ref), userGameSettingsService (ref), tweenService (ref)
	local t = {}
	local var1 = nil
	
	if p1 then
		local y = p1.AbsolutePosition.Y
		local y_1 = p1.AbsoluteWindowSize.Y
		table.insert(t, p1:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: y (write), p1 (ref)
			y = p1.AbsolutePosition.Y
		end))
		table.insert(t, p1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			-- upvalues: y_1 (write), p1 (ref)
			y_1 = p1.AbsoluteWindowSize.Y
		end))
		table.insert(t, p1.SelectionChanged:Connect(function(_, _, p4)
			-- upvalues: p1 (ref), gamepadService (copy), var1 (write), y_1 (write), y (write), userGameSettingsService (copy), p3 (ref), tweenService (copy), p2 (ref)
			if not p4 or not p4:IsDescendantOf(p1) or gamepadService.GamepadCursorEnabled then return end
			if var1 then
				var1:Cancel()
				var1 = nil
			end
			local canvasPosition = p1.CanvasPosition
			local vector2 = Vector2.new(canvasPosition.X, canvasPosition.Y + (p4.AbsolutePosition.Y - (y_1 * 0.5 - p4.AbsoluteSize.Y * 0.5 + y)))
			
			if userGameSettingsService.ReducedMotion or p3 and p3() then
				p1.CanvasPosition = vector2
				
				return
			end
			var1 = tweenService:Create(p1, TweenInfo.new(p2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { CanvasPosition = vector2 })
			
			if var1 then
				var1:Play()
			end
		end))
		
		return t, var1
	end
	return t
end

return AnimateScrollViewToSelectionHelper