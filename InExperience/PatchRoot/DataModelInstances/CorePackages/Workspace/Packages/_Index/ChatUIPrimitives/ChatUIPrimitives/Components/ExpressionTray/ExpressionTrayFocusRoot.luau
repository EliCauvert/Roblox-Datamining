local guiService = game:GetService("GuiService")
local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local useDefaultFocusBehavior = require(parent.ReactFocusNavigation).useDefaultFocusBehavior
local restoreSelectionIfStrandedModule = require(chatUIPrimitives.Hooks.restoreSelectionIfStranded)

return function(p1)
	-- upvalues: parent (ref), reactModule (ref), restoreSelectionIfStrandedModule (ref), guiService (ref), useDefaultFocusBehavior (ref)
	local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
	local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
	local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), restoreSelectionIfStrandedModule (copy), guiService (copy), var1 (ref)
		if var2.current and not p1.isOpen then
			restoreSelectionIfStrandedModule(guiService, var1.current)
		end
		var2.current = p1.isOpen
		
		return nil
	end, { p1.isOpen })
	local var3, var4 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = p1.isOpen
	}))
	
	return p1.render({
		entryButtonRef = var1,
		defaultFocusRef = var3,
		containerRef = var4
	})
end