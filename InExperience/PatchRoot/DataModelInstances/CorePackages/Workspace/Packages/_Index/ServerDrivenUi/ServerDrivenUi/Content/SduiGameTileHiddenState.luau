local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject

return ReactModule.memo(function(p1) --[[ Line: 33 | Named "SduiGameTileHiddenState" ]]
	-- upvalues: ReactModule (copy), UseFocusGuiObjectFunction (copy), GuiService (copy), GetSduiComponentWrapperFunction (copy), View (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 37 ]]
		-- upvalues: p1 (copy), GuiService (upval), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if not p1.onUndoActivated then return end
		local IsSelectedCoreObjectMatch = GuiService.SelectedCoreObject == UseRefResult.current
		p1.onUndoActivated()
		
		if IsSelectedCoreObjectMatch then
			task.defer(function() --[[ Line: 47 ]]
				-- upvalues: p1 (upval), UseFocusGuiObjectResult (upval)
				local Current = if p1.parentRef then p1.parentRef.current else nil
				
				if Current then
					UseFocusGuiObjectResult(Current)
				end
			end)
		end
	end, {
		UseFocusGuiObjectResult,
		p1.onUndoActivated,
		p1.parentRef
	})
	
	return ReactModule.createElement(View, {
		tag = p1.containerTag or "col align-x-center align-y-center gap-small size-full padding-medium radius-medium bg-surface-100"
	}, {
		Message = p1.messageComponent,
		UndoButton = if p1.undoButtonComponent and p1.onUndoActivated then ReactModule.createElement(GetSduiComponentWrapperFunction(p1.undoButtonComponent), {
			debugName = "SduiGameTileHiddenState.UndoButton",
			componentConfig = p1.undoButtonComponent,
			extraLocalProps = {
				testId = "--sdui-game-tile-undo",
				buttonRef = UseRefResult,
				onActivated = UseResult
			},
			sduiContext = p1.sduiContext
		}) else nil
	})
end)