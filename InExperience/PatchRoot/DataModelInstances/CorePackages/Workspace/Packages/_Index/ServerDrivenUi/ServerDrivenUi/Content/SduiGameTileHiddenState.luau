local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local view = foundationModule.View
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useFocusGuiObject (ref), guiService (ref), getSduiComponentWrapper (ref), view (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = useFocusGuiObject()
	
	return reactModule.createElement(view, {
		tag = p1.containerTag or "col align-x-center align-y-center gap-small size-full padding-medium radius-medium bg-surface-100"
	}, {
		Message = p1.messageComponent,
		UndoButton = if p1.undoButtonComponent and p1.onUndoActivated then reactModule.createElement(getSduiComponentWrapper(p1.undoButtonComponent), {
			debugName = "SduiGameTileHiddenState.UndoButton",
			componentConfig = p1.undoButtonComponent,
			extraLocalProps = {
				testId = "--sdui-game-tile-undo",
				buttonRef = var1,
				onActivated = reactModule.useCallback(function()
					-- upvalues: p1 (ref), guiService (copy), var1 (ref), var2 (ref)
					if not p1.onUndoActivated then return end
					local var3 = guiService.SelectedCoreObject == var1.current
					p1.onUndoActivated()
					
					if var3 then
						task.defer(function()
							-- upvalues: p1 (copy), var2 (copy)
							local var4 = if p1.parentRef then p1.parentRef.current else nil
							
							if var4 then
								var2(var4)
							end
						end)
					end
				end, { var2, p1.onUndoActivated, p1.parentRef })
			},
			sduiContext = p1.sduiContext
		}) else nil
	})
end)