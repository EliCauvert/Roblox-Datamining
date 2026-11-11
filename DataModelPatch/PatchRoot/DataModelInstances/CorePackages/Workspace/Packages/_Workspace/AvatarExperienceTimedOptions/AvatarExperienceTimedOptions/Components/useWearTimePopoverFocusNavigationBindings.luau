local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local PopoverFocusRestorationContextModule = require(script.Parent.PopoverFocusRestorationContext)
local FFlagAXFixIaBTimedOptionsPopoverFocus = AvatarExperienceFlagsModule.FFlagAXFixIaBTimedOptionsPopoverFocus
local FFlagAXTimedOptionsPopoverSkipFocusOnCursor = AvatarExperienceFlagsModule.FFlagAXTimedOptionsPopoverSkipFocusOnCursor
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local GetFirstFocusableDescendantFunction = FocusNavigationUtilsModule.getFirstFocusableDescendant
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack
}

return function(Callback, p1, p2)
	-- upvalues: ReactModule (copy), FFlagAXFixIaBTimedOptionsPopoverFocus (copy), PopoverFocusRestorationContextModule (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagAXTimedOptionsPopoverSkipFocusOnCursor (copy), UseLastInputModeFunction (copy), GetFirstFocusableDescendantFunction (copy), GuiService (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseContextResult = if FFlagAXFixIaBTimedOptionsPopoverFocus then ReactModule.useContext(PopoverFocusRestorationContextModule) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1)
	end, { p1 })
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult and UseRefResult.current, FocusNavigableSurfaceIdentifierEnum.PopUp, UseStateResult)
	local UseLastInputModeResult = if FFlagAXFixIaBTimedOptionsPopoverFocus and FFlagAXTimedOptionsPopoverSkipFocusOnCursor then UseLastInputModeFunction() else nil
	
	if FFlagAXFixIaBTimedOptionsPopoverFocus then
		local UseRefResult1 = ReactModule.useRef(false)
		ReactModule.useEffect(function()
			-- upvalues: FFlagAXTimedOptionsPopoverSkipFocusOnCursor (upval), UseLastInputModeResult (copy), UseStateResult (copy), UseRefResult1 (copy), UseRefResult (copy), GetFirstFocusableDescendantFunction (upval), GuiService (upval), UseContextResult (copy), p2 (copy)
			local NoFFlagAXTimedOptionsPopoverSkipFocusOnCursor: boolean = not FFlagAXTimedOptionsPopoverSkipFocusOnCursor or UseLastInputModeResult == "Focus"
			
			if UseStateResult and not UseRefResult1.current then
				if NoFFlagAXTimedOptionsPopoverSkipFocusOnCursor then
					local Current = UseRefResult.current
					
					if Current and Current:IsDescendantOf(game) then
						local FirstFocusableDescendant = GetFirstFocusableDescendantFunction(Current)
						
						if FirstFocusableDescendant then
							GuiService.SelectedCoreObject = FirstFocusableDescendant
						end
					end
				end
			elseif not UseStateResult and UseRefResult1.current and UseContextResult and NoFFlagAXTimedOptionsPopoverSkipFocusOnCursor then
				local Current = p2 and p2.current
				
				if Current and Current:IsDescendantOf(game) then
					GuiService.SelectedCoreObject = Current
				end
			end
			UseRefResult1.current = UseStateResult
		end, {
			UseStateResult,
			UseContextResult,
			p2,
			UseLastInputModeResult
		})
	end
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p3)
					-- upvalues: Callback (upval)
					p3.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
end