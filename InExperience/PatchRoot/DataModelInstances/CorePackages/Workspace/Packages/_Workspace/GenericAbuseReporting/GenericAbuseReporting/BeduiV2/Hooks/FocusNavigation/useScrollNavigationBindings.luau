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

local function _(p0, p1) --[[ line: 35 | named "scrollFocusedContainer" ]]
	-- upvalues: scrollFrameUtilsModule (ref), guiService (ref)
	if p1 == nil then
		return
	end
	scrollFrameUtilsModule.scrollByIncrement(scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, p1), p0)
end

return function(p2) --[[ line: 47 | named "useScrollNavigationBindings" ]]
	-- upvalues: reactModule (ref), t_2 (ref), t (ref), t_1 (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), scrollFrameUtilsModule (ref), guiService (ref), reactFocusNavigationModule (ref), useThumbstickScrollModule (ref)
	local var10 = reactModule.useRef(nil)
	local var11 = p2 == nil or p2.includeDiscreteScroll == nil or p2.includeDiscreteScroll
	local var12 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: var11 (ref), t_1 (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), scrollFrameUtilsModule (copy), var10 (ref), guiService (copy)
		return if var11 then {
			[focusNavigationEventNameEnum.ScrollDown] = {
				handler = inputHandlersModule.onRelease(function(_) --[[ line: 64 ]]
					-- upvalues: scrollFrameUtilsModule (copy), var10 (copy), guiService (copy)
					local SCROLL_INCREMENT = scrollFrameUtilsModule.SCROLL_INCREMENT
					local current = var10.current
					
					if current == nil then
						return
					end
					scrollFrameUtilsModule.scrollByIncrement(scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, current), SCROLL_INCREMENT)
				end)
			},
			[focusNavigationEventNameEnum.ScrollUp] = {
				handler = inputHandlersModule.onRelease(function(_) --[[ line: 69 ]]
					-- upvalues: scrollFrameUtilsModule (copy), var10 (copy), guiService (copy)
					local var13 = -scrollFrameUtilsModule.SCROLL_INCREMENT
					local current = var10.current
					
					if current == nil then
						return
					end
					scrollFrameUtilsModule.scrollByIncrement(scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, current), var13)
				end)
			}
		} else t_1
	end, { var11 }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function() --[[ line: 53 ]]
		-- upvalues: var11 (ref), t_2 (copy), t (copy)
		return if var11 then t_2 else t
	end, { var11 }), var10))
	useThumbstickScrollModule({ enabled = true, containerRef = var10 })
	
	return var12
end