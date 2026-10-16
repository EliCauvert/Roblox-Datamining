local UserGameSettings = UserSettings():GetService("UserGameSettings")
local TweenService = game:GetService("TweenService")
local AppBlox = script:FindFirstAncestor("AppBlox")
local Parent = AppBlox.Parent
local ReactModule = require(Parent.React)
local GamepadService = game:GetService("GamepadService")
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseAnimateScrollViewToSelectionHelper = SharedFlagsModule.FFlagUseAnimateScrollViewToSelectionHelper
local FFlagLuaAppMediaGalleryGamepadSupport = SharedFlagsModule.FFlagLuaAppMediaGalleryGamepadSupport
local AnimateScrollViewToSelectionHelperModule = require(AppBlox.AnimateScrollViewToSelectionHelper)

return function(p1, Duration, p2) --[[ Line: 14 | Named "useAnimateScrollViewToSelection" ]]
	-- upvalues: FFlagUseAnimateScrollViewToSelectionHelper (copy), ReactModule (copy), AnimateScrollViewToSelectionHelperModule (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), GamepadService (copy), UserGameSettings (copy), TweenService (copy)
	if FFlagUseAnimateScrollViewToSelectionHelper then
		ReactModule.useEffect(function() --[[ Line: 21 ]]
			-- upvalues: p1 (copy), AnimateScrollViewToSelectionHelperModule (upval), Duration (copy), FFlagLuaAppMediaGalleryGamepadSupport (upval), p2 (copy)
			local v1 = nil
			local Connections = {}
			
			if p1 then
				Connections, v10 = AnimateScrollViewToSelectionHelperModule(p1.current, Duration, nil, if FFlagLuaAppMediaGalleryGamepadSupport then p2 else nil)
			end
			return function() --[[ Line: 33 ]]
				-- upvalues: Connections (ref), v1 (ref)
				for _, connection in Connections do
					connection:Disconnect()
				end
				if v1 then
					v1:Cancel()
				end
			end
		end, {
			p1,
			Duration,
			if FFlagLuaAppMediaGalleryGamepadSupport then p2 else nil
		})
		
		return
	else
		ReactModule.useEffect(function() --[[ Line: 49 ]]
			-- upvalues: p1 (copy), GamepadService (upval), UserGameSettings (upval), TweenService (upval), Duration (copy)
			local List = {}
			local CreateResult = nil
			local Y = 0
			local Y1 = 0
			
			if p1 and p1.current ~= nil then
				local Current = p1.current
				Y = Current.AbsolutePosition.Y
				Y1 = Current.AbsoluteWindowSize.Y
				table.insert(List, Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 61 ]]
					-- upvalues: Y (ref), Current (copy)
					Y = Current.AbsolutePosition.Y
				end))
				table.insert(List, Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 67 ]]
					-- upvalues: Y1 (ref), Current (copy)
					Y1 = Current.AbsoluteWindowSize.Y
				end))
				table.insert(List, Current.SelectionChanged:Connect(function(_, _, Frame: Frame) --[[ Line: 73 ]]
					-- upvalues: Current (copy), GamepadService (upval), CreateResult (ref), Y1 (ref), Y (ref), UserGameSettings (upval), TweenService (upval), Duration (upval)
					if Frame == nil or not Frame:IsDescendantOf(Current) or GamepadService.GamepadCursorEnabled then return end
					if CreateResult then
						CreateResult:Cancel()
						CreateResult = nil
					end
					local CanvasPosition = Current.CanvasPosition
					local _Vector2 = Vector2.new(CanvasPosition.X, CanvasPosition.Y + (Frame.AbsolutePosition.Y - (Y1 * 0.5 - Frame.AbsoluteSize.Y * 0.5 + Y)))
					
					if UserGameSettings.ReducedMotion then
						Current.CanvasPosition = _Vector2
						
						return
					end
					CreateResult = TweenService:Create(Current, TweenInfo.new(Duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { CanvasPosition = _Vector2 })
					
					if CreateResult then
						CreateResult:Play()
					end
				end))
			end
			return function() --[[ Line: 113 ]]
				-- upvalues: List (copy), CreateResult (ref)
				for _, Connection in List do
					Connection:Disconnect()
				end
				if CreateResult then
					CreateResult:Cancel()
				end
			end
		end, { p1, Duration })
	end
end