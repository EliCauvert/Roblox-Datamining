local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local RestoreSelectionIfStrandedFunction = require(Parent.ChatUIPrimitives).Hooks.restoreSelectionIfStranded

return function(p1)
	-- upvalues: Parent (copy), ReactModule (copy), RestoreSelectionIfStrandedFunction (copy), GuiService (copy)
	local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
	local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
	local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(p1.isOpen)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), p1 (copy), RestoreSelectionIfStrandedFunction (upval), GuiService (upval), UseRefResult (copy)
		if UseRefResult1.current and not p1.isOpen then
			RestoreSelectionIfStrandedFunction(GuiService, UseRefResult.current)
		end
		UseRefResult1.current = p1.isOpen
		
		return nil
	end, { p1.isOpen })
	
	return p1.render({
		triggerRef = UseRefResult,
		containerRef = UseFocusRootFunction({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = p1.isOpen
		})
	})
end