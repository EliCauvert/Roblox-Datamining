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

local function _(p0)
	return if p0 == nil then nil elseif p0:IsA("ScrollingFrame") then p0 else p0:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(p1, p2)
	local var6 = p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y
	
	if p2 > 0 and var6 - 350 <= p1.CanvasPosition.Y then
		p1.CanvasPosition = Vector2.new(0, var6)
		
		return
	elseif p2 < 0 and p1.CanvasPosition.Y <= 350 then
		p1.CanvasPosition = Vector2.new(0, 0)
		
		return
	end
	p1.CanvasPosition += Vector2.new(0, p2)
end

local _ = function(p3, p4)
	return function(p5)
		-- upvalues: p3 (ref), p4 (ref)
		if type(p3) == "function" then
			p3(p5)
		elseif p3 ~= nil then
			p3.current = p5
		end
		if type(p4) == "function" then
			p4(p5)
			
			return
		elseif p4 ~= nil then
			p4.current = p5
		end
	end
end

return function(p6, p7)
	-- upvalues: useDefaultFocusBehavior (ref), inlineSurveyFocusRoot (ref), useFocusedGuiObject (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), t (ref), useAppFocusRoot (ref)
	local var10
	local var7 = useDefaultFocusBehavior()
	local _ = nil
	
	if inlineSurveyFocusRoot then
		local var8 = useFocusedGuiObject()
		local var9 = if var8 == nil then nil elseif var8:IsA("ScrollingFrame") then var8 else var8:FindFirstAncestorWhichIsA("ScrollingFrame")
		var10 = useFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = p6,
			eventHandlers = reactModule.useMemo(function()
				-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p7 (ref), var9 (ref)
				local t = {
					[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p7) }
				}
				
				if var9 then
					t[focusNavigationEventNameEnum.ScrollUp] = {
						handler = inputHandlersModule.onRelease(function()
							-- upvalues: var9 (copy)
							local _ = var9.AbsoluteCanvasSize.Y - var9.AbsoluteWindowSize.Y
							
							if var9.CanvasPosition.Y <= 350 then
								var9.CanvasPosition = Vector2.new(0, 0)
								
								return
							end
							var9.CanvasPosition += Vector2.new(0, -300)
						end)
					}
					t[focusNavigationEventNameEnum.ScrollDown] = {
						handler = inputHandlersModule.onRelease(function()
							-- upvalues: var9 (copy)
							local var12 = var9.AbsoluteCanvasSize.Y - var9.AbsoluteWindowSize.Y
							
							if var12 - 350 <= var9.CanvasPosition.Y then
								var9.CanvasPosition = Vector2.new(0, var12)
								
								return
							end
							var9.CanvasPosition += Vector2.new(0, 300)
						end)
					}
				end
				return t
			end, { var9, p7 }),
			eventMap = t
		})
	else
		var10 = useAppFocusRoot({
			isAutoFocusRoot = true,
			surfaceIdentifier = p6,
			customEventHandlers = {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(p7) }
			}
		})
	end
	return reactModule.useMemo(function()
		-- upvalues: var10 (write), var7 (ref)
		return function(p8)
			-- upvalues: var10 (ref), var7 (ref)
			if type(var10) == "function" then
				var10(p8)
			elseif var10 ~= nil then
				var10.current = p8
			end
			if type(var7) == "function" then
				var7(p8)
				
				return
			elseif var7 ~= nil then
				var7.current = p8
			end
		end
	end, { var10, var7 })
end