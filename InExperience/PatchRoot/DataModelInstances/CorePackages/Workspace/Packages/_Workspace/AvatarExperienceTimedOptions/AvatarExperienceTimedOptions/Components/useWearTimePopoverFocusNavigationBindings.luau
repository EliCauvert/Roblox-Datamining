local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local popoverFocusRestorationContextModule = require(script.Parent.PopoverFocusRestorationContext)
local fFlagAXFixIaBTimedOptionsPopoverFocus = require(parent.AvatarExperienceFlags).FFlagAXFixIaBTimedOptionsPopoverFocus
local useFocusNavigableSurfaceRegistryConnection = focusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local getFirstFocusableDescendant = focusNavigationUtilsModule.getFirstFocusableDescendant
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack
}

return function(p0, p1, p2) --[[ line: 25 | named "useWearTimePopoverFocusNavigationBindings" ]]
	-- upvalues: reactModule (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), popoverFocusRestorationContextModule (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), getFirstFocusableDescendant (ref), guiService (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useState(false)
	local var10 = if fFlagAXFixIaBTimedOptionsPopoverFocus then reactModule.useContext(popoverFocusRestorationContextModule) else nil
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: var9 (ref), p1 (ref)
		var9(p1)
	end, { p1 })
	useFocusNavigableSurfaceRegistryConnection(var7 and var7.current, focusNavigableSurfaceIdentifierEnum.PopUp, var8)
	
	if fFlagAXFixIaBTimedOptionsPopoverFocus then
		local var11 = reactModule.useRef(false)
		reactModule.useEffect(function() --[[ line: 53 ]]
			-- upvalues: var8 (ref), var11 (ref), var7 (ref), getFirstFocusableDescendant (copy), guiService (copy), fFlagAXFixIaBTimedOptionsPopoverFocus (copy), var10 (ref), p2 (ref)
			if var8 and not var11.current then
				local current = var7.current
				
				if current and current:IsDescendantOf(game) then
					local var13 = getFirstFocusableDescendant(current)
					
					if var13 then
						guiService.SelectedCoreObject = var13
					end
				end
			elseif not var8 and var11.current and (fFlagAXFixIaBTimedOptionsPopoverFocus and var10) then
				local current = p2 and p2.current
				
				if current and current:IsDescendantOf(game) then
					guiService.SelectedCoreObject = current
				end
			end
			var11.current = var8
		end, { var8, var10, p2 })
	end
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 77 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), p0 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p3) --[[ line: 80 ]]
					-- upvalues: p0 (copy)
					p3.cancelled = true
					p0()
				end)
			}
		}
	end, { p0 }), reactFocusNavigationModule.useEventMap(t, var7))
end