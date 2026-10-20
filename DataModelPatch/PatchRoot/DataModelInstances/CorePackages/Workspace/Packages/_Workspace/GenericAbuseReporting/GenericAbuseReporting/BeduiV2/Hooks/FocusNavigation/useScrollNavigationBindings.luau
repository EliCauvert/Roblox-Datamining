local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ScrollFrameUtilsModule = require(script.Parent.scrollFrameUtils)
local UseThumbstickScrollModule = require(script.Parent.useThumbstickScroll)
local t = {}
local t1 = {}
local config = {
	[Enum.KeyCode.PageUp] = FocusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.LeftBracket] = FocusNavigationEventNameEnum.ScrollUp,
	[Enum.KeyCode.PageDown] = FocusNavigationEventNameEnum.ScrollDown,
	[Enum.KeyCode.RightBracket] = FocusNavigationEventNameEnum.ScrollDown
}

local function _(p1, p2)
	-- upvalues: ScrollFrameUtilsModule (copy), GuiService (copy)
	if p2 ~= nil then
		ScrollFrameUtilsModule.scrollByIncrement(ScrollFrameUtilsModule.resolveScrollTarget(GuiService.SelectedCoreObject, p2), p1)
		
		return
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), config (copy), t (copy), t1 (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ScrollFrameUtilsModule (copy), GuiService (copy), ReactFocusNavigationModule (copy), UseThumbstickScrollModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local v1 = p1 == nil or p1.includeDiscreteScroll == nil or p1.includeDiscreteScroll
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: v1 (copy), t1 (upval), FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), ScrollFrameUtilsModule (upval), UseRefResult (copy), GuiService (upval)
		return if v1 then {
			[FocusNavigationEventNameEnum.ScrollDown] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: ScrollFrameUtilsModule (upval), UseRefResult (upval), GuiService (upval)
					local SCROLLINCREMENT = ScrollFrameUtilsModule.SCROLL_INCREMENT
					local Current = UseRefResult.current
					
					if Current ~= nil then
						ScrollFrameUtilsModule.scrollByIncrement(ScrollFrameUtilsModule.resolveScrollTarget(GuiService.SelectedCoreObject, Current), SCROLLINCREMENT)
						
						return
					end
				end)
			},
			[FocusNavigationEventNameEnum.ScrollUp] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: ScrollFrameUtilsModule (upval), UseRefResult (upval), GuiService (upval)
					local Negated = -ScrollFrameUtilsModule.SCROLL_INCREMENT
					local Current = UseRefResult.current
					
					if Current ~= nil then
						ScrollFrameUtilsModule.scrollByIncrement(ScrollFrameUtilsModule.resolveScrollTarget(GuiService.SelectedCoreObject, Current), Negated)
						
						return
					end
				end)
			}
		} else t1
	end, { v1 }), (ReactFocusNavigationModule.useEventMap(ReactModule.useMemo(function()
		-- upvalues: v1 (copy), config (upval), t (upval)
		return if v1 then config else t
	end, { v1 }), UseRefResult)))
	UseThumbstickScrollModule({ enabled = true, containerRef = UseRefResult })
	
	return UseEventHandlerMapResult
end