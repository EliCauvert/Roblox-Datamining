local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local tweenService = game:GetService("TweenService")
local appBlox = script:FindFirstAncestor("AppBlox")
local parent = appBlox.Parent
local reactModule = require(parent.React)
local gamepadService = game:GetService("GamepadService")
local fFlagUseAnimateScrollViewToSelectionHelper = require(parent.SharedFlags).FFlagUseAnimateScrollViewToSelectionHelper
local animateScrollViewToSelectionHelperModule = require(appBlox.AnimateScrollViewToSelectionHelper)

return function(p0, p1) --[[ line: 15 | named "useAnimateScrollViewToSelection" ]]
	-- upvalues: fFlagUseAnimateScrollViewToSelectionHelper (ref), reactModule (ref), animateScrollViewToSelectionHelperModule (ref), gamepadService (ref), userGameSettingsService (ref), tweenService (ref)
	if fFlagUseAnimateScrollViewToSelectionHelper then
		reactModule.useEffect(function() --[[ line: 20 ]]
			-- upvalues: p0 (ref), animateScrollViewToSelectionHelperModule (copy), p1 (ref)
			local var6 = nil
			local t = {}
			
			if p0 then
				local var8, var9 = animateScrollViewToSelectionHelperModule(p0.current, p1)
				t = var8
				var6 = var9
			end
			return function() --[[ line: 27 ]]
				-- upvalues: t (write), var6 (write)
				for i, v in t do
					v:Disconnect()
				end
				if var6 then
					var6:Cancel()
				end
			end
		end, { p0, p1 })
		
		return
	end
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: p0 (ref), gamepadService (copy), userGameSettingsService (copy), tweenService (copy), p1 (ref)
		local t = {}
		local var11 = nil
		local _ = 0
		local _ = 0
		
		if p0 and p0.current ~= nil then
			local current = p0.current
			local y = current.AbsolutePosition.Y
			local y_1 = current.AbsoluteWindowSize.Y
			table.insert(t, current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 49 ]]
				-- upvalues: y (write), current (ref)
				y = current.AbsolutePosition.Y
			end))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ line: 55 ]]
				-- upvalues: y_1 (write), current (ref)
				y_1 = current.AbsoluteWindowSize.Y
			end))
			table.insert(t, current.SelectionChanged:Connect(function(_, _, p2) --[[ line: 61 ]]
				-- upvalues: current (ref), gamepadService (copy), var11 (write), y_1 (write), y (write), userGameSettingsService (copy), tweenService (copy), p1 (copy)
				if p2 == nil or not p2:IsDescendantOf(current) or gamepadService.GamepadCursorEnabled then return end
				if var11 then
					var11:Cancel()
					var11 = nil
				end
				local canvasPosition = current.CanvasPosition
				local vector2 = Vector2.new(canvasPosition.X, canvasPosition.Y + (p2.AbsolutePosition.Y - (y_1 * 0.5 - p2.AbsoluteSize.Y * 0.5 + y)))
				
				if userGameSettingsService.ReducedMotion then
					current.CanvasPosition = vector2
					
					return
				end
				var11 = tweenService:Create(current, TweenInfo.new(p1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { CanvasPosition = vector2 })
				
				if var11 then
					var11:Play()
				end
			end))
		end
		return function() --[[ line: 101 ]]
			-- upvalues: t (ref), var11 (write)
			for i, v in t do
				v:Disconnect()
			end
			if var11 then
				var11:Cancel()
			end
		end
	end, { p0, p1 })
end