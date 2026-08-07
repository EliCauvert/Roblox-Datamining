local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local inputModeStore = responsiveModule.GetInputModeStore(false)

return function(p0, p1) --[[ line: 20 | named "useFocusOnMountEffect" ]]
	-- upvalues: useFocusGuiObject (ref), responsiveModule (ref), reactModule (ref), inputModeStore (ref), userInputService (ref), guiService (ref)
	local var5 = useFocusGuiObject()
	local var6 = responsiveModule.useIsSpatial()
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: p1 (ref), inputModeStore (copy), responsiveModule (copy), userInputService (copy), p0 (ref), var5 (ref), var6 (ref), guiService (copy)
		local delayedThread = task.delay(p1 or 0, function() --[[ line: 26 ]]
			-- upvalues: inputModeStore (copy), responsiveModule (copy), userInputService (copy), p0 (copy), var5 (copy), var6 (copy), guiService (copy)
			if p0.current and (userInputService.PreferredInput == Enum.PreferredInput.Gamepad or inputModeStore.getLastInputType(false) == responsiveModule.Input.Directional) and (var5 and not var6) then
				local selectedCoreObject = guiService.SelectedCoreObject
				
				if not (if selectedCoreObject ~= p0.current then selectedCoreObject and selectedCoreObject:IsDescendantOf(p0.current) else true) and p0.current:IsDescendantOf(game) then
					var5(p0.current)
				end
			end
		end)
		
		return function() --[[ line: 42 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, {})
end