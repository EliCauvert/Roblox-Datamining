local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local scrollFrameUtilsModule = require(script.Parent.scrollFrameUtils)
local useThumbstickScrollModule = require(script.Parent.useThumbstickScroll)
local t = {}
local t_1 = {}
local t_2 = {
	[Enum.KeyCode.PageUp] = focusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.LeftBracket] = focusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.PageDown] = focusNavigationEventNameEnum.ScrollDown,
	[Enum.KeyCode.RightBracket] = focusNavigationEventNameEnum.ScrollDown
}

local function _(p1, p2)
	-- upvalues: scrollFrameUtilsModule (ref), guiService (ref)
	if p2 == nil then
		return
	end
	scrollFrameUtilsModule.scrollByIncrement(scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, p2), p1)
end

return function(p1)
	-- upvalues: reactModule (ref), t_2 (ref), t (ref), t_1 (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), scrollFrameUtilsModule (ref), guiService (ref), reactFocusNavigationModule (ref), useThumbstickScrollModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = p1 == nil or p1.includeDiscreteScroll == nil or p1.includeDiscreteScroll
	local var3 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: var2 (ref), t_1 (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), scrollFrameUtilsModule (copy), var1 (ref), guiService (copy)
		return if var2 then {
			[focusNavigationEventNameEnum.ScrollDown] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: scrollFrameUtilsModule (copy), var1 (copy), guiService (copy)
					local SCROLL_INCREMENT = scrollFrameUtilsModule.SCROLL_INCREMENT
					local current = var1.current
					
					if current == nil then
						return
					end
					scrollFrameUtilsModule.scrollByIncrement(scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, current), SCROLL_INCREMENT)
				end)
			},
			[focusNavigationEventNameEnum.ScrollUp] = {
				handler = inputHandlersModule.onRelease(function(_)
					-- upvalues: scrollFrameUtilsModule (copy), var1 (copy), guiService (copy)
					local var4 = -scrollFrameUtilsModule.SCROLL_INCREMENT
					local current = var1.current
					
					if current == nil then
						return
					end
					scrollFrameUtilsModule.scrollByIncrement(scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, current), var4)
				end)
			}
		} else t_1
	end, { var2 }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function()
		-- upvalues: var2 (ref), t_2 (copy), t (copy)
		return if var2 then t_2 else t
	end, { var2 }), var1))
	useThumbstickScrollModule({ enabled = true, containerRef = var1 })
	
	return var3
end