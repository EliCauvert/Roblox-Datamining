local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local inputModeStore = responsiveModule.GetInputModeStore(false)

return function(p1, p2)
	-- upvalues: useFocusGuiObject (ref), responsiveModule (ref), reactModule (ref), inputModeStore (ref), userInputService (ref), guiService (ref)
	local var1 = useFocusGuiObject()
	local var2 = responsiveModule.useIsSpatial()
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), inputModeStore (copy), responsiveModule (copy), userInputService (copy), p1 (ref), var1 (ref), var2 (ref), guiService (copy)
		local delayedThread = task.delay(p2 or 0, function()
			-- upvalues: inputModeStore (copy), responsiveModule (copy), userInputService (copy), p1 (copy), var1 (copy), var2 (copy), guiService (copy)
			if p1.current and (userInputService.PreferredInput == Enum.PreferredInput.Gamepad or inputModeStore.getLastInputType(false) == responsiveModule.Input.Directional) and (var1 and not var2) then
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if not (if selectedCoreObject ~= p1.current then selectedCoreObject and selectedCoreObject:IsDescendantOf(p1.current) else true) and p1.current:IsDescendantOf(game) then
					var1(p1.current)
				end
			end
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {})
end