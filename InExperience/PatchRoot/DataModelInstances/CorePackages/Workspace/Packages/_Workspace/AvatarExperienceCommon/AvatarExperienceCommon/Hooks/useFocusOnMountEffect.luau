local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local InputModeStore = ResponsiveModule.GetInputModeStore(false)
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

return function(p1, p2)
	-- upvalues: UseFocusGuiObjectFunction (copy), ResponsiveModule (copy), ReactModule (copy), InputModeStore (copy), UserInputService (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), GuiService (copy)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseIsSpatialResult = ResponsiveModule.useIsSpatial()
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), InputModeStore (upval), ResponsiveModule (upval), UserInputService (upval), FFlagLuaSupportMicroGamepadPreferredInput (upval), p1 (copy), UseFocusGuiObjectResult (copy), UseIsSpatialResult (copy), GuiService (upval)
		local DelayedThread = task.delay(if p2 then p2 else 0, function()
			-- upvalues: InputModeStore (upval), ResponsiveModule (upval), UserInputService (upval), FFlagLuaSupportMicroGamepadPreferredInput (upval), p1 (upval), UseFocusGuiObjectResult (upval), UseIsSpatialResult (upval), GuiService (upval)
			local IsLastInputTypeMatch = InputModeStore.getLastInputType(false) == ResponsiveModule.Input.Directional
			local IsPreferredInputMatch: boolean = UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad
			
			if p1.current and (IsPreferredInputMatch or IsLastInputTypeMatch) and UseFocusGuiObjectResult and not UseIsSpatialResult then
				local SelectedCoreObject = GuiService.SelectedCoreObject
				
				if SelectedCoreObject ~= p1.current and (not SelectedCoreObject or not SelectedCoreObject:IsDescendantOf(p1.current)) and p1.current:IsDescendantOf(game) then
					UseFocusGuiObjectResult(p1.current)
				end
			end
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, {})
end