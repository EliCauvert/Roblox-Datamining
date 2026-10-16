local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local gamepadService = game:GetService("GamepadService")
local tweenService = game:GetService("TweenService")
local appBlox = script:FindFirstAncestor("AppBlox")
local centerOnFocusScrollModule = require(appBlox.CenterOnFocusScroll)
local fFlagLuaAppMediaGalleryGamepadSupport = require(appBlox.Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport

function AnimateScrollViewToSelectionHelper(p1, p2, p3, p4)
	-- upvalues: gamepadService (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), centerOnFocusScrollModule (ref), userGameSettingsService (ref), tweenService (ref)
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
		table.insert(t, p1.SelectionChanged:Connect(function(_, _, p5)
			-- upvalues: p1 (ref), gamepadService (copy), var1 (write), fFlagLuaAppMediaGalleryGamepadSupport (copy), p4 (ref), centerOnFocusScrollModule (copy), y (write), y_1 (write), userGameSettingsService (copy), p3 (ref), tweenService (copy), p2 (ref)
			if not p5 or not p5:IsDescendantOf(p1) or gamepadService.GamepadCursorEnabled then return end
			if var1 then
				var1:Cancel()
				var1 = nil
			end
			local vector2
			local y_2 = p5.AbsoluteSize.Y
			local y_3 = p5.AbsolutePosition.Y
			local canvasPosition = p1.CanvasPosition
			local _ = nil
			
			if fFlagLuaAppMediaGalleryGamepadSupport and p4 then
				local revealOnlyCanvasY = centerOnFocusScrollModule.getRevealOnlyCanvasY(y_3, y_2, canvasPosition, y, y_1)
				
				if revealOnlyCanvasY == nil then return end
				vector2 = Vector2.new(canvasPosition.X, revealOnlyCanvasY)
			else
				vector2 = Vector2.new(canvasPosition.X, canvasPosition.Y + (y_3 - (y_1 * 0.5 - y_2 * 0.5 + y)))
			end
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