local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local tweenService = game:GetService("TweenService")
local appBlox = script:FindFirstAncestor("AppBlox")
local parent = appBlox.Parent
local reactModule = require(parent.React)
local gamepadService = game:GetService("GamepadService")
local fFlagUseAnimateScrollViewToSelectionHelper = require(parent.SharedFlags).FFlagUseAnimateScrollViewToSelectionHelper
local animateScrollViewToSelectionHelperModule = require(appBlox.AnimateScrollViewToSelectionHelper)

return function(p1, p2)
	-- upvalues: fFlagUseAnimateScrollViewToSelectionHelper (ref), reactModule (ref), animateScrollViewToSelectionHelperModule (ref), gamepadService (ref), userGameSettingsService (ref), tweenService (ref)
	if fFlagUseAnimateScrollViewToSelectionHelper then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), animateScrollViewToSelectionHelperModule (copy), p2 (ref)
			local var1 = nil
			local t = {}
			
			if p1 then
				local var2, var3 = animateScrollViewToSelectionHelperModule(p1.current, p2)
				t = var2
				var1 = var3
			end
			return function()
				-- upvalues: t (write), var1 (write)
				for i, v in t do
					v:Disconnect()
				end
				if var1 then
					var1:Cancel()
				end
			end
		end, { p1, p2 })
		
		return
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), gamepadService (copy), userGameSettingsService (copy), tweenService (copy), p2 (ref)
		local t = {}
		local var1 = nil
		local _ = 0
		local _ = 0
		
		if p1 and p1.current ~= nil then
			local current = p1.current
			local y = current.AbsolutePosition.Y
			local y_1 = current.AbsoluteWindowSize.Y
			table.insert(t, current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: y (write), current (ref)
				y = current.AbsolutePosition.Y
			end))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: y_1 (write), current (ref)
				y_1 = current.AbsoluteWindowSize.Y
			end))
			table.insert(t, current.SelectionChanged:Connect(function(_, _, p3)
				-- upvalues: current (ref), gamepadService (copy), var1 (write), y_1 (write), y (write), userGameSettingsService (copy), tweenService (copy), p2 (copy)
				if p3 == nil or not p3:IsDescendantOf(current) or gamepadService.GamepadCursorEnabled then return end
				if var1 then
					var1:Cancel()
					var1 = nil
				end
				local canvasPosition = current.CanvasPosition
				local vector2 = Vector2.new(canvasPosition.X, canvasPosition.Y + (p3.AbsolutePosition.Y - (y_1 * 0.5 - p3.AbsoluteSize.Y * 0.5 + y)))
				
				if userGameSettingsService.ReducedMotion then
					current.CanvasPosition = vector2
					
					return
				end
				var1 = tweenService:Create(current, TweenInfo.new(p2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { CanvasPosition = vector2 })
				
				if var1 then
					var1:Play()
				end
			end))
		end
		return function()
			-- upvalues: t (ref), var1 (write)
			for i, v in t do
				v:Disconnect()
			end
			if var1 then
				var1:Cancel()
			end
		end
	end, { p1, p2 })
end