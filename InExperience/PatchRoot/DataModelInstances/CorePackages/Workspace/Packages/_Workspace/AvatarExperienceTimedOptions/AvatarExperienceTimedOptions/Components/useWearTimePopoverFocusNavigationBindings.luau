local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local popoverFocusRestorationContextModule = require(script.Parent.PopoverFocusRestorationContext)
local fFlagAXFixIaBTimedOptionsPopoverFocus = avatarExperienceFlagsModule.FFlagAXFixIaBTimedOptionsPopoverFocus
local fFlagAXTimedOptionsPopoverSkipFocusOnCursor = avatarExperienceFlagsModule.FFlagAXTimedOptionsPopoverSkipFocusOnCursor
local useFocusNavigableSurfaceRegistryConnection = focusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local getFirstFocusableDescendant = focusNavigationUtilsModule.getFirstFocusableDescendant
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), popoverFocusRestorationContextModule (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), fFlagAXTimedOptionsPopoverSkipFocusOnCursor (ref), useLastInputMode (ref), getFirstFocusableDescendant (ref), guiService (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(false)
	local var4 = if fFlagAXFixIaBTimedOptionsPopoverFocus then reactModule.useContext(popoverFocusRestorationContextModule) else nil
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p2 (ref)
		var3(p2)
	end, { p2 })
	useFocusNavigableSurfaceRegistryConnection(var1 and var1.current, focusNavigableSurfaceIdentifierEnum.PopUp, var2)
	local var5 = if fFlagAXFixIaBTimedOptionsPopoverFocus and fFlagAXTimedOptionsPopoverSkipFocusOnCursor then useLastInputMode() else nil
	
	if fFlagAXFixIaBTimedOptionsPopoverFocus then
		local var6 = reactModule.useRef(false)
		reactModule.useEffect(function()
			-- upvalues: fFlagAXTimedOptionsPopoverSkipFocusOnCursor (copy), var5 (ref), var2 (ref), var6 (ref), var1 (ref), getFirstFocusableDescendant (copy), guiService (copy), var4 (ref), p3 (ref)
			local var7 = not fFlagAXTimedOptionsPopoverSkipFocusOnCursor or var5 == "Focus"
			
			if var2 and not var6.current then
				if var7 then
					local current = var1.current
					
					if current and current:IsDescendantOf(game) then
						local var8 = getFirstFocusableDescendant(current)
						
						if var8 then
							guiService.SelectedCoreObject = var8
						end
					end
				end
			elseif not var2 and var6.current and (var4 and var7) then
				local current = p3 and p3.current
				
				if current and current:IsDescendantOf(game) then
					guiService.SelectedCoreObject = current
				end
			end
			var6.current = var2
		end, { var2, var4, p3, var5 })
	end
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p1 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p4)
					-- upvalues: p1 (copy)
					p4.cancelled = true
					p1()
				end)
			}
		}
	end, { p1 }), reactFocusNavigationModule.useEventMap(t, var1))
end