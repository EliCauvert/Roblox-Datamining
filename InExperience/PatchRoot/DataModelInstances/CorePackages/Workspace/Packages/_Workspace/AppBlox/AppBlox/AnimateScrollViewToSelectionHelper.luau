local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local gamepadService = game:GetService("GamepadService")
local tweenService = game:GetService("TweenService")

function AnimateScrollViewToSelectionHelper(p0, p1, p2)
	-- upvalues: gamepadService (ref), userGameSettingsService (ref), tweenService (ref)
	local t = {}
	local var4 = nil
	
	if p0 then
		local y = p0.AbsolutePosition.Y
		local y_1 = p0.AbsoluteWindowSize.Y
		table.insert(t, p0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: y (write), p0 (ref)
			y = p0.AbsolutePosition.Y
		end))
		table.insert(t, p0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			-- upvalues: y_1 (write), p0 (ref)
			y_1 = p0.AbsoluteWindowSize.Y
		end))
		table.insert(t, p0.SelectionChanged:Connect(function(_, _, p3)
			-- upvalues: p0 (ref), gamepadService (copy), var4 (write), y_1 (write), y (write), userGameSettingsService (copy), p2 (ref), tweenService (copy), p1 (ref)
			if not p3 or not p3:IsDescendantOf(p0) or gamepadService.GamepadCursorEnabled then return end
			if var4 then
				var4:Cancel()
				var4 = nil
			end
			local canvasPosition = p0.CanvasPosition
			local vector2 = Vector2.new(canvasPosition.X, canvasPosition.Y + (p3.AbsolutePosition.Y - (y_1 * 0.5 - p3.AbsoluteSize.Y * 0.5 + y)))
			
			if userGameSettingsService.ReducedMotion or p2 and p2() then
				p0.CanvasPosition = vector2
				
				return
			end
			var4 = tweenService:Create(p0, TweenInfo.new(p1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { CanvasPosition = vector2 })
			
			if var4 then
				var4:Play()
			end
		end))
		
		return t, var4
	end
	return t
end

return AnimateScrollViewToSelectionHelper