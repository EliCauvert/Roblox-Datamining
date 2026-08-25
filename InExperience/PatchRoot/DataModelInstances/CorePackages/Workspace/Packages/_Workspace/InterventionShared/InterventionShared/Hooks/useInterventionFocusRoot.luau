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

local function _(p0)
	return if p0 == nil then nil elseif p0:IsA("ScrollingFrame") then p0 else p0:FindFirstAncestorWhichIsA("ScrollingFrame")
end

local _ = function(p1, p2)
	if p1 ~= nil then
		local var3 = p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y
		
		if p2 > 0 and var3 - 350 <= p1.CanvasPosition.Y then
			p1.CanvasPosition = Vector2.new(0, var3)
			
			return
		elseif p2 < 0 and p1.CanvasPosition.Y <= 350 then
			p1.CanvasPosition = Vector2.new(0, 0)
			
			return
		end
		p1.CanvasPosition += Vector2.new(0, p2)
	end
end

return function(p3)
	-- upvalues: useFocusedGuiObject (ref), useMemo (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), t (ref)
	local var4 = useFocusedGuiObject()
	local var5 = if var4 == nil then nil elseif var4:IsA("ScrollingFrame") then var4 else var4:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	return useFocusRoot({
		surfaceIdentifier = p3.surfaceIdentifier,
		isAutoFocusRoot = p3.isAutoFocusRoot == nil or p3.isAutoFocusRoot,
		eventMap = t,
		eventHandlers = useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var5 (ref)
			local t = {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onPress(function(p4)
						p4:cancel()
					end)
				}
			}
			
			if var5 then
				t[focusNavigationEventNameEnum.ScrollDown] = {
					handler = inputHandlersModule.onRelease(function(_)
						-- upvalues: var5 (copy)
						if var5 ~= nil then
							local var7 = var5.AbsoluteCanvasSize.Y - var5.AbsoluteWindowSize.Y
							
							if var7 - 350 <= var5.CanvasPosition.Y then
								var5.CanvasPosition = Vector2.new(0, var7)
								
								return
							end
							var5.CanvasPosition += Vector2.new(0, 300)
						end
					end)
				}
				t[focusNavigationEventNameEnum.ScrollUp] = {
					handler = inputHandlersModule.onRelease(function(_)
						-- upvalues: var5 (copy)
						if var5 ~= nil then
							local _ = var5.AbsoluteCanvasSize.Y - var5.AbsoluteWindowSize.Y
							
							if var5.CanvasPosition.Y <= 350 then
								var5.CanvasPosition = Vector2.new(0, 0)
								
								return
							end
							var5.CanvasPosition += Vector2.new(0, -300)
						end
					end)
				}
			end
			return t
		end, { var5 })
	})
end