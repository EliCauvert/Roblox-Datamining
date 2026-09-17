local parent = script.Parent.Parent
local reactModule = require(parent.React)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local useCoreActionBind = chatUIPrimitivesModule.Hooks.useCoreActionBind
local usePortalSelectionLinks = chatUIPrimitivesModule.Hooks.usePortalSelectionLinks

local function findFirstSelectable(p1)
	for i, v in p1:GetDescendants() do
		if not v:IsA("GuiButton") then
			if v:IsA("GuiObject") and v.Selectable then
				return v
			end
		end
		return v
	end
	return nil
end

return function(p2)
	-- upvalues: reactModule (ref), useCoreActionBind (ref), findFirstSelectable (ref), usePortalSelectionLinks (ref)
	local menuContentRef = p2.menuContentRef
	local triggerRef = p2.triggerRef
	local onClose = p2.onClose
	useCoreActionBind({
		actionNamePrefix = "TextChannelWindowReportMenuBack",
		enabled = p2.enabled,
		active = p2.isOpen,
		keyCode = Enum.KeyCode.ButtonB,
		onAction = reactModule.useCallback(function(p3)
			-- upvalues: onClose (ref)
			if p3 == Enum.UserInputState.End then
				onClose()
				
				return Enum.ContextActionResult.Sink
			end
			return Enum.ContextActionResult.Pass
		end, { onClose }),
		contextActionService = p2.contextActionService
	})
	local var1 = reactModule.useCallback(function()
		-- upvalues: menuContentRef (ref), findFirstSelectable (copy)
		local current = menuContentRef.current
		
		return if current then findFirstSelectable(current) else nil
	end, { menuContentRef })
	usePortalSelectionLinks({
		enabled = p2.enabled,
		active = p2.isOpen,
		edges = {
			{ direction = "Right", from = triggerRef, to = var1 },
			{ direction = "Left", from = var1, to = triggerRef }
		},
		restoreHome = triggerRef,
		guiService = p2.guiService
	})
end