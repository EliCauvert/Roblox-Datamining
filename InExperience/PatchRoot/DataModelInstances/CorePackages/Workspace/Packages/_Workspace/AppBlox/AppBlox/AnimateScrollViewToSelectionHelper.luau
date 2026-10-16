local UserGameSettings = UserSettings():GetService("UserGameSettings")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local AppBlox = script:FindFirstAncestor("AppBlox")
local CenterOnFocusScrollModule = require(AppBlox.CenterOnFocusScroll)
local FFlagLuaAppMediaGalleryGamepadSupport = require(AppBlox.Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local AnimateScrollViewIgnoreStaleSelection = game:DefineFastFlag("AnimateScrollViewIgnoreStaleSelection", false)

function AnimateScrollViewToSelectionHelper(Frame: Frame, Duration, Callback, p1) --[[ Line: 12 ]]
	-- upvalues: GamepadService (copy), AnimateScrollViewIgnoreStaleSelection (copy), GuiService (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), CenterOnFocusScrollModule (copy), UserGameSettings (copy), TweenService (copy)
	local List = {}
	local CreateResult = nil
	
	if Frame then
		local Y = Frame.AbsolutePosition.Y
		local Y1 = Frame.AbsoluteWindowSize.Y
		table.insert(List, Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 29 ]]
			-- upvalues: Y (ref), Frame (copy)
			Y = Frame.AbsolutePosition.Y
		end))
		table.insert(List, Frame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 35 ]]
			-- upvalues: Y1 (ref), Frame (copy)
			Y1 = Frame.AbsoluteWindowSize.Y
		end))
		table.insert(List, Frame.SelectionChanged:Connect(function(_, _, Frame1: Frame) --[[ Line: 41 ]]
			-- upvalues: Frame (copy), GamepadService (upval), AnimateScrollViewIgnoreStaleSelection (upval), GuiService (upval), CreateResult (ref), FFlagLuaAppMediaGalleryGamepadSupport (upval), p1 (copy), CenterOnFocusScrollModule (upval), Y (ref), Y1 (ref), UserGameSettings (upval), Callback (copy), TweenService (upval), Duration (copy)
			if not Frame1 or not Frame1:IsDescendantOf(Frame) or GamepadService.GamepadCursorEnabled then return end
			if AnimateScrollViewIgnoreStaleSelection and Frame1 ~= GuiService.SelectedCoreObject and Frame1 ~= GuiService.SelectedObject then return end
			if CreateResult then
				CreateResult:Cancel()
				CreateResult = nil
			end
			local Y2: number = Frame1.AbsoluteSize.Y
			local Y3 = Frame1.AbsolutePosition.Y
			local CanvasPosition = Frame.CanvasPosition
			local _Vector2 = nil
			
			if FFlagLuaAppMediaGalleryGamepadSupport and p1 then
				local RevealOnlyCanvasY = CenterOnFocusScrollModule.getRevealOnlyCanvasY(Y3, Y2, CanvasPosition, Y, Y1)
				
				if RevealOnlyCanvasY == nil then return end
				_Vector2 = Vector2.new(CanvasPosition.X, RevealOnlyCanvasY)
			else
				_Vector2 = Vector2.new(CanvasPosition.X, CanvasPosition.Y + (Y3 - (Y1 * 0.5 - Y2 * 0.5 + Y)))
			end
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