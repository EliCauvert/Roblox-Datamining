local Parent = script:FindFirstAncestor("InterventionShared").Parent
local UseMemoFunction = require(Parent.React).useMemo
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local UseFocusedGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusedGuiObject
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.PageUp] = FocusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.LeftBracket] = FocusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.PageDown] = FocusNavigationEventNameEnum.ScrollDown,
	[Enum.KeyCode.RightBracket] = FocusNavigationEventNameEnum.ScrollDown
}

local function _(ScrollingFrame) --[[ Line: 31 | Named "getScrollableAncestor" ]]
	return if ScrollingFrame == nil then nil elseif ScrollingFrame:IsA("ScrollingFrame") then ScrollingFrame else ScrollingFrame:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(ScrollFrame, Y: number) --[[ Line: 44 | Named "scrollTo" ]]
	if ScrollFrame ~= nil then
		local YDelta = ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y
		
		if Y > 0 and YDelta - 350 <= ScrollFrame.CanvasPosition.Y then
			ScrollFrame.CanvasPosition = Vector2.new(0, YDelta)
			
			return
		end
		if Y < 0 and ScrollFrame.CanvasPosition.Y <= 350 then
			ScrollFrame.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		ScrollFrame.CanvasPosition += Vector2.new(0, Y)
	end
end

return function(p1) --[[ Line: 73 | Named "useInterventionFocusRoot" ]]
	-- upvalues: UseFocusedGuiObjectFunction (copy), UseMemoFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), EventMap (copy)
	local UseFocusedGuiObjectResult = UseFocusedGuiObjectFunction()
	local UseFocusedGuiObjectResult1 = if UseFocusedGuiObjectResult == nil then nil elseif UseFocusedGuiObjectResult:IsA("ScrollingFrame") then UseFocusedGuiObjectResult else UseFocusedGuiObjectResult:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	return UseFocusRootFunction({
		surfaceIdentifier = p1.surfaceIdentifier,
		isAutoFocusRoot = p1.isAutoFocusRoot == nil or p1.isAutoFocusRoot,
		eventMap = EventMap,
		eventHandlers = UseMemoFunction(function() --[[ Line: 77 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseFocusedGuiObjectResult1 (copy)
			local config = {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onPress(function(p2) --[[ Line: 80 ]]
						p2:cancel()
					end)
				}
			}
			
			if UseFocusedGuiObjectResult1 then
				config[FocusNavigationEventNameEnum.ScrollDown] = {
					handler = InputHandlersModule.onRelease(function(_) --[[ Line: 88 ]]
						-- upvalues: UseFocusedGuiObjectResult1 (upval)
						if UseFocusedGuiObjectResult1 ~= nil then
							local YDelta = UseFocusedGuiObjectResult1.AbsoluteCanvasSize.Y - UseFocusedGuiObjectResult1.AbsoluteWindowSize.Y
							
							if YDelta - 350 <= UseFocusedGuiObjectResult1.CanvasPosition.Y then
								UseFocusedGuiObjectResult1.CanvasPosition = Vector2.new(0, YDelta)
								
								return
							end
							UseFocusedGuiObjectResult1.CanvasPosition += Vector2.new(0, 300)
						end
					end)
				}
				config[FocusNavigationEventNameEnum.ScrollUp] = {
					handler = InputHandlersModule.onRelease(function(_) --[[ Line: 93 ]]
						-- upvalues: UseFocusedGuiObjectResult1 (upval)
						if UseFocusedGuiObjectResult1 ~= nil then
							local _ = UseFocusedGuiObjectResult1.AbsoluteCanvasSize.Y - UseFocusedGuiObjectResult1.AbsoluteWindowSize.Y
							
							if UseFocusedGuiObjectResult1.CanvasPosition.Y <= 350 then
								UseFocusedGuiObjectResult1.CanvasPosition = Vector2.new(0, 0)
								
								return
							end
							UseFocusedGuiObjectResult1.CanvasPosition += Vector2.new(0, -300)
						end
					end)
				}
			end
			return config
		end, { UseFocusedGuiObjectResult1 })
	})
end