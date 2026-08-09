local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local tweenService = game:GetService("TweenService")
local reactModule = require(script:FindFirstAncestor("AppBlox").Parent.React)
local gamepadService = game:GetService("GamepadService")

return function(p0, p1) --[[ line: 11 | named "useAnimateScrollViewToSelection" ]]
	-- upvalues: reactModule (ref), gamepadService (ref), userGameSettingsService (ref), tweenService (ref)
	reactModule.useEffect(function() --[[ line: 15 ]]
		-- upvalues: p0 (ref), gamepadService (copy), userGameSettingsService (copy), tweenService (copy), p1 (ref)
		local t = {}
		local var5 = nil
		local _ = 0
		local _ = 0
		
		if p0 and p0.current ~= nil then
			local current = p0.current
			local y = current.AbsolutePosition.Y
			local y_1 = current.AbsoluteWindowSize.Y
			table.insert(t, current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 27 ]]
				-- upvalues: y (write), current (ref)
				y = current.AbsolutePosition.Y
			end))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ line: 33 ]]
				-- upvalues: y_1 (write), current (ref)
				y_1 = current.AbsoluteWindowSize.Y
			end))
			table.insert(t, current.SelectionChanged:Connect(function(_, _, p2) --[[ line: 39 ]]
				-- upvalues: current (ref), gamepadService (copy), var5 (write), y_1 (write), y (write), userGameSettingsService (copy), tweenService (copy), p1 (copy)
				if p2 == nil or not p2:IsDescendantOf(current) or gamepadService.GamepadCursorEnabled then return end
				if var5 then
					var5:Cancel()
					var5 = nil
				end
				local canvasPosition = current.CanvasPosition
				local vector2 = Vector2.new(canvasPosition.X, canvasPosition.Y + (p2.AbsolutePosition.Y - (y_1 * 0.5 - p2.AbsoluteSize.Y * 0.5 + y)))
				
				if userGameSettingsService.ReducedMotion then
					current.CanvasPosition = vector2
					
					return
				end
				var5 = tweenService:Create(current, TweenInfo.new(p1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { CanvasPosition = vector2 })
				
				if var5 then
					var5:Play()
				end
			end))
		end
		return function() --[[ line: 79 ]]
			-- upvalues: t (ref), var5 (write)
			for i, v in t do
				v:Disconnect()
			end
			if var5 then
				var5:Cancel()
			end
		end
	end, { p0, p1 })
end