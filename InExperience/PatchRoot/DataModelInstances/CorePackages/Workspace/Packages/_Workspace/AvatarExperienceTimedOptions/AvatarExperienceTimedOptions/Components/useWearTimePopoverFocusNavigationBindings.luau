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

return function(p0, p1, p2) --[[ line: 27 | named "useWearTimePopoverFocusNavigationBindings" ]]
	-- upvalues: reactModule (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), popoverFocusRestorationContextModule (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), fFlagAXTimedOptionsPopoverSkipFocusOnCursor (ref), useLastInputMode (ref), getFirstFocusableDescendant (ref), guiService (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useState(false)
	local var11 = if fFlagAXFixIaBTimedOptionsPopoverFocus then reactModule.useContext(popoverFocusRestorationContextModule) else nil
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: var10 (ref), p1 (ref)
		var10(p1)
	end, { p1 })
	useFocusNavigableSurfaceRegistryConnection(var8 and var8.current, focusNavigableSurfaceIdentifierEnum.PopUp, var9)
	local var12 = if fFlagAXFixIaBTimedOptionsPopoverFocus and fFlagAXTimedOptionsPopoverSkipFocusOnCursor then useLastInputMode() else nil
	
	if fFlagAXFixIaBTimedOptionsPopoverFocus then
		local var13 = reactModule.useRef(false)
		reactModule.useEffect(function() --[[ line: 62 ]]
			-- upvalues: fFlagAXTimedOptionsPopoverSkipFocusOnCursor (copy), var12 (ref), var9 (ref), var13 (ref), var8 (ref), getFirstFocusableDescendant (copy), guiService (copy), var11 (ref), p2 (ref)
			local var14 = not fFlagAXTimedOptionsPopoverSkipFocusOnCursor or var12 == "Focus"
			
			if var9 and not var13.current then
				if var14 then
					local current = var8.current
					
					if current and current:IsDescendantOf(game) then
						local var16 = getFirstFocusableDescendant(current)
						
						if var16 then
							guiService.SelectedCoreObject = var16
						end
					end
				end
			elseif not var9 and var13.current and (var11 and var14) then
				local current = p2 and p2.current
				
				if current and current:IsDescendantOf(game) then
					guiService.SelectedCoreObject = current
				end
			end
			var13.current = var9
		end, { var9, var11, p2, var12 })
	end
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 90 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p0 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p3) --[[ line: 93 ]]
					-- upvalues: p0 (copy)
					p3.cancelled = true
					p0()
				end)
			}
		}
	end, { p0 }), reactFocusNavigationModule.useEventMap(t, var8))
end