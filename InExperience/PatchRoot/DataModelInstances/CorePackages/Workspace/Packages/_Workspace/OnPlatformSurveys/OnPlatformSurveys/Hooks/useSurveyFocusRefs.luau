local Parent = script:FindFirstAncestor("OnPlatformSurveys").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InlineSurveyFocusRoot = game:DefineFastFlag("InlineSurveyFocusRoot", false)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useDefaultFocusBehavior
local UseFocusedGuiObjectFunction = ReactFocusNavigationModule.useFocusedGuiObject
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.PageUp] = FocusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.LeftBracket] = FocusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.PageDown] = FocusNavigationEventNameEnum.ScrollDown,
	[Enum.KeyCode.RightBracket] = FocusNavigationEventNameEnum.ScrollDown
}

local function _(ScrollingFrame)
	return if ScrollingFrame == nil then nil elseif ScrollingFrame:IsA("ScrollingFrame") then ScrollingFrame else ScrollingFrame:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(ScrollFrame, Y: number)
	local YDelta = ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y
	
	if Y > 0 and YDelta - 350 <= ScrollFrame.CanvasPosition.Y then
		ScrollFrame.CanvasPosition = Vector2.new(0, YDelta)
		
		return
	end
	if Y < 0 and ScrollFrame.CanvasPosition.Y <= 350 then
		ScrollFrame.CanvasPosition = Vector2.new(0, 0)
		
		return
	else
		ScrollFrame.CanvasPosition += Vector2.new(0, Y)
	end
end

local _ = function(p1, p2)
	return function(Current)
		-- upvalues: p1 (copy), p2 (copy)
		if type(p1) == "function" then
			p1(Current)
		elseif p1 ~= nil then
			p1.current = Current
		end
		if type(p2) == "function" then
			p2(Current)
			
			return
		end
		if p2 ~= nil then
			p2.current = Current
		end
	end
end

return function(SurfaceIdentifier, p1)
	-- upvalues: UseDefaultFocusBehaviorFunction (copy), InlineSurveyFocusRoot (copy), UseFocusedGuiObjectFunction (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), EventMap (copy), UseAppFocusRootFunction (copy)
	local UseDefaultFocusBehaviorResult = UseDefaultFocusBehaviorFunction()
	local UseFocusRootResult = nil
	
	if InlineSurveyFocusRoot then
		local UseFocusedGuiObjectResult = UseFocusedGuiObjectFunction()
		local UseFocusedGuiObjectResult1 = if UseFocusedGuiObjectResult == nil then nil elseif UseFocusedGuiObjectResult:IsA("ScrollingFrame") then UseFocusedGuiObjectResult else UseFocusedGuiObjectResult:FindFirstAncestorWhichIsA("ScrollingFrame")
		UseFocusRootResult = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = SurfaceIdentifier,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy), UseFocusedGuiObjectResult1 (copy)
				local config = {
					[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(p1) }
				}
				
				if UseFocusedGuiObjectResult1 then
					config[FocusNavigationEventNameEnum.ScrollUp] = {
						handler = InputHandlersModule.onRelease(function()
							-- upvalues: UseFocusedGuiObjectResult1 (upval)
							local _ = UseFocusedGuiObjectResult1.AbsoluteCanvasSize.Y - UseFocusedGuiObjectResult1.AbsoluteWindowSize.Y
							
							if UseFocusedGuiObjectResult1.CanvasPosition.Y <= 350 then
								UseFocusedGuiObjectResult1.CanvasPosition = Vector2.new(0, 0)
								
								return
							else
								UseFocusedGuiObjectResult1.CanvasPosition += Vector2.new(0, -300)
							end
						end)
					}
					config[FocusNavigationEventNameEnum.ScrollDown] = {
						handler = InputHandlersModule.onRelease(function()
							-- upvalues: UseFocusedGuiObjectResult1 (upval)
							local YDelta = UseFocusedGuiObjectResult1.AbsoluteCanvasSize.Y - UseFocusedGuiObjectResult1.AbsoluteWindowSize.Y
							
							if YDelta - 350 <= UseFocusedGuiObjectResult1.CanvasPosition.Y then
								UseFocusedGuiObjectResult1.CanvasPosition = Vector2.new(0, YDelta)
								
								return
							else
								UseFocusedGuiObjectResult1.CanvasPosition += Vector2.new(0, 300)
							end
						end)
					}
				end
				return config
			end, { UseFocusedGuiObjectResult1, p1 }),
			eventMap = EventMap
		})
	else
		UseFocusRootResult = UseAppFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = SurfaceIdentifier,
			customEventHandlers = {
				[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(p1) }
			}
		})
	end
	return ReactModule.useMemo(function()
		-- upvalues: UseFocusRootResult (ref), UseDefaultFocusBehaviorResult (copy)
		local Callback = UseFocusRootResult
		
		return function(Current)
			-- upvalues: Callback (copy), UseDefaultFocusBehaviorResult (copy)
			if type(Callback) == "function" then
				Callback(Current)
			elseif Callback ~= nil then
				Callback.current = Current
			end
			if type(UseDefaultFocusBehaviorResult) == "function" then
				UseDefaultFocusBehaviorResult(Current)
				
				return
			end
			if UseDefaultFocusBehaviorResult ~= nil then
				UseDefaultFocusBehaviorResult.current = Current
			end
		end
	end, { UseFocusRootResult, UseDefaultFocusBehaviorResult })
end