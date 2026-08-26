local parent = script:FindFirstAncestor("InterventionShared").Parent
local useMemo = require(parent.React).useMemo
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local useFocusedGuiObject = require(parent.ReactFocusNavigation).useFocusedGuiObject
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
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
	if p1 ~= nil then
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
end

return function(p1)
	-- upvalues: useFocusedGuiObject (ref), useMemo (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), t (ref)
	local var1 = useFocusedGuiObject()
	local var2 = if var1 == nil then nil elseif var1:IsA("ScrollingFrame") then var1 else var1:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	return useFocusRoot({
		surfaceIdentifier = p1.surfaceIdentifier,
		isAutoFocusRoot = p1.isAutoFocusRoot == nil or p1.isAutoFocusRoot,
		eventMap = t,
		eventHandlers = useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var2 (ref)
			local t = {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onPress(function(p2)
						p2:cancel()
					end)
				}
			}
			
			if var2 then
				t[focusNavigationEventNameEnum.ScrollDown] = {
					handler = inputHandlersModule.onRelease(function(_)
						-- upvalues: var2 (copy)
						if var2 ~= nil then
							local var3 = var2.AbsoluteCanvasSize.Y - var2.AbsoluteWindowSize.Y
							
							if var3 - 350 <= var2.CanvasPosition.Y then
								var2.CanvasPosition = Vector2.new(0, var3)
								
								return
							end
							var2.CanvasPosition += Vector2.new(0, 300)
						end
					end)
				}
				t[focusNavigationEventNameEnum.ScrollUp] = {
					handler = inputHandlersModule.onRelease(function(_)
						-- upvalues: var2 (copy)
						if var2 ~= nil then
							local _ = var2.AbsoluteCanvasSize.Y - var2.AbsoluteWindowSize.Y
							
							if var2.CanvasPosition.Y <= 350 then
								var2.CanvasPosition = Vector2.new(0, 0)
								
								return
							end
							var2.CanvasPosition += Vector2.new(0, -300)
						end
					end)
				}
			end
			return t
		end, { var2 })
	})
end