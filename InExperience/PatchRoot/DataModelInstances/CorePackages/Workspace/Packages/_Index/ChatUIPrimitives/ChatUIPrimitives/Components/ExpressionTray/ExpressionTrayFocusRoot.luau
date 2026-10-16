local GuiService = game:GetService("GuiService")
local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local RestoreSelectionIfStrandedModule = require(ChatUIPrimitives.Hooks.restoreSelectionIfStranded)

return function(p1) --[[ Line: 29 | Named "ExpressionTrayFocusRoot" ]]
	-- upvalues: Parent (copy), ReactModule (copy), RestoreSelectionIfStrandedModule (copy), GuiService (copy), UseDefaultFocusBehaviorFunction (copy)
	local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
	local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
	local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: UseRefResult1 (copy), p1 (copy), RestoreSelectionIfStrandedModule (upval), GuiService (upval), UseRefResult (copy)
		if UseRefResult1.current and not p1.isOpen then
			RestoreSelectionIfStrandedModule(GuiService, UseRefResult.current)
		end
		UseRefResult1.current = p1.isOpen
		
		return nil
	end, { p1.isOpen })
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = p1.isOpen
	})))
	
	return p1.render({
		entryButtonRef = UseRefResult,
		defaultFocusRef = UseDefaultFocusBehaviorResult,
		containerRef = UseDefaultFocusBehaviorResult2
	})
end