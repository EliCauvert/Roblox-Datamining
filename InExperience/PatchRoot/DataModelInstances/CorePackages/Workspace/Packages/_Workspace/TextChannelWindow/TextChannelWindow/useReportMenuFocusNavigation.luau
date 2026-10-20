local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UsePortalSelectionLinksFunction = require(Parent.ChatUIPrimitives).Hooks.usePortalSelectionLinks
local UseSelectionBackActionModule = require(script.Parent.FocusNavigation.useSelectionBackAction)

local function findFirstSelectable(Current)
	for _, descendant in Current:GetDescendants() do
		if descendant:IsA("GuiButton") then
			return descendant
		elseif descendant:IsA("GuiObject") and descendant.Selectable then
			return descendant
		end
	end
	return nil
end

return function(p1)
	-- upvalues: ReactModule (copy), UseSelectionBackActionModule (copy), findFirstSelectable (copy), UsePortalSelectionLinksFunction (copy)
	local MenuContentRef = p1.menuContentRef
	local TriggerRef = p1.triggerRef
	local OnCloseFunction = p1.onClose
	UseSelectionBackActionModule({
		actionNamePrefix = "TextChannelWindowReportMenuBack",
		enabled = p1.enabled,
		active = p1.isOpen,
		onAction = ReactModule.useCallback(function(UserInputState)
			-- upvalues: OnCloseFunction (copy)
			if UserInputState == Enum.UserInputState.End then
				OnCloseFunction()
			end
			return Enum.ContextActionResult.Sink
		end, { OnCloseFunction }),
		contextActionService = p1.contextActionService
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: MenuContentRef (copy), findFirstSelectable (upval)
		local Current = MenuContentRef.current
		
		return if Current then findFirstSelectable(Current) else nil
	end, { MenuContentRef })
	UsePortalSelectionLinksFunction({
		enabled = p1.enabled,
		active = p1.isOpen,
		edges = {
			{ direction = "Right", from = TriggerRef, to = UseResult },
			{ direction = "Left", from = UseResult, to = TriggerRef }
		},
		restoreHome = TriggerRef,
		guiService = p1.guiService
	})
end