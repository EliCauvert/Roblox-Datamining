local UserGameSettings = UserSettings():GetService("UserGameSettings")
local GamepadService = game:GetService("GamepadService")
local TweenService = game:GetService("TweenService")

function AnimateScrollViewToSelectionHelper(Frame: Frame, Duration, Callback)
	-- upvalues: GamepadService (copy), UserGameSettings (copy), TweenService (copy)
	local List = {}
	local CreateResult = nil
	
	if Frame then
		local Y = Frame.AbsolutePosition.Y
		local Y1 = Frame.AbsoluteWindowSize.Y
		table.insert(List, Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: Y (ref), Frame (copy)
			Y = Frame.AbsolutePosition.Y
		end))
		table.insert(List, Frame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			-- upvalues: Y1 (ref), Frame (copy)
			Y1 = Frame.AbsoluteWindowSize.Y
		end))
		table.insert(List, Frame.SelectionChanged:Connect(function(_, _, Frame1: Frame)
			-- upvalues: Frame (copy), GamepadService (upval), CreateResult (ref), Y1 (ref), Y (ref), UserGameSettings (upval), Callback (copy), TweenService (upval), Duration (copy)
			if not Frame1 or not Frame1:IsDescendantOf(Frame) or GamepadService.GamepadCursorEnabled then return end
			if CreateResult then
				CreateResult:Cancel()
				CreateResult = nil
			end
			local CanvasPosition = Frame.CanvasPosition
			local _Vector2 = Vector2.new(CanvasPosition.X, CanvasPosition.Y + (Frame1.AbsolutePosition.Y - (Y1 * 0.5 - Frame1.AbsoluteSize.Y * 0.5 + Y)))
			
			if UserGameSettings.ReducedMotion or Callback and Callback() then
				Frame.CanvasPosition = _Vector2
				
				return
			end
			CreateResult = TweenService:Create(Frame, TweenInfo.new(Duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { CanvasPosition = _Vector2 })
			
			if CreateResult then
				CreateResult:Play()
			end
		end))
		
		return List, CreateResult
	else
		return List
	end
end

return AnimateScrollViewToSelectionHelper