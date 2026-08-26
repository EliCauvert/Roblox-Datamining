local parent = script:FindFirstAncestor("OnPlatformSurveys").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inlineSurveyFocusRoot = game:DefineFastFlag("InlineSurveyFocusRoot", false)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local useDefaultFocusBehavior = reactFocusNavigationModule.useDefaultFocusBehavior
local useFocusedGuiObject = reactFocusNavigationModule.useFocusedGuiObject
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.PageUp] = focusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.LeftBracket] = focusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.PageDown] = focusNavigationEventNameEnum.ScrollDown,
	[Enum.KeyCode.RightBracket] = focusNavigationEventNameEnum.ScrollDown
}

local function _(p1)
	return if p1 == nil then nil elseif p1:IsA("ScrollingFrame") then p1 else p1:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(p1, p2)
	local var1 = p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y
	
	if p2 > 0 and var1 - 350 <= p1.CanvasPosition.Y then
		p1.CanvasPosition = Vector2.new(0, var1)
		
		return
	elseif p2 < 0 and p1.CanvasPosition.Y <= 350 then
		p1.CanvasPosition = Vector2.new(0, 0)
		
		return
	end
	p1.CanvasPosition += Vector2.new(0, p2)
end

local _ = function(p1, p2)
	return function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		if type(p1) == "function" then
			p1(p3)
		elseif p1 ~= nil then
			p1.current = p3
		end
		if type(p2) == "function" then
			p2(p3)
			
			return
		elseif p2 ~= nil then
			p2.current = p3
		end
	end
end

return function(p1, p2)
	-- upvalues: useDefaultFocusBehavior (ref), inlineSurveyFocusRoot (ref), useFocusedGuiObject (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), t (ref), useAppFocusRoot (ref)
	local var1
	local var2 = useDefaultFocusBehavior()
	local _ = nil
	
	if inlineSurveyFocusRoot then
		local var3 = useFocusedGuiObject()
		local var4 = if var3 == nil then nil elseif var3:IsA("ScrollingFrame") then var3 else var3:FindFirstAncestorWhichIsA("ScrollingFrame")
		var1 = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = p1,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p2 (ref), var4 (ref)
				local t = {
					[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p2) }
				}
				
				if var4 then
					t[focusNavigationEventNameEnum.ScrollUp] = {
						handler = inputHandlersModule.onRelease(function()
							-- upvalues: var4 (copy)
							local _ = var4.AbsoluteCanvasSize.Y - var4.AbsoluteWindowSize.Y
							
							if var4.CanvasPosition.Y <= 350 then
								var4.CanvasPosition = Vector2.new(0, 0)
								
								return
							end
							var4.CanvasPosition += Vector2.new(0, -300)
						end)
					}
					t[focusNavigationEventNameEnum.ScrollDown] = {
						handler = inputHandlersModule.onRelease(function()
							-- upvalues: var4 (copy)
							local var5 = var4.AbsoluteCanvasSize.Y - var4.AbsoluteWindowSize.Y
							
							if var5 - 350 <= var4.CanvasPosition.Y then
								var4.CanvasPosition = Vector2.new(0, var5)
								
								return
							end
							var4.CanvasPosition += Vector2.new(0, 300)
						end)
					}
				end
				return t
			end, { var4, p2 }),
			eventMap = t
		})
	else
		var1 = useAppFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = p1,
			customEventHandlers = {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p2) }
			}
		})
	end
	return reactModule.useMemo(function()
		-- upvalues: var1 (write), var2 (ref)
		return function(p3)
			-- upvalues: var1 (ref), var2 (ref)
			if type(var1) == "function" then
				var1(p3)
			elseif var1 ~= nil then
				var1.current = p3
			end
			if type(var2) == "function" then
				var2(p3)
				
				return
			elseif var2 ~= nil then
				var2.current = p3
			end
		end
	end, { var1, var2 })
end