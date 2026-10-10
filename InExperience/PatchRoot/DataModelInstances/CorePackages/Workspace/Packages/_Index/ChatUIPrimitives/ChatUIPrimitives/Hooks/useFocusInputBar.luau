local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local focusNavigationContext = require(parent.ReactFocusNavigation).FocusNavigationContext
local inputTypeModule = require(parent.InputType)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagFriendsChatConversationListFocusNav = sharedFlagsModule.FFlagFriendsChatConversationListFocusNav or sharedFlagsModule.FFlagExpChatTabShortcutNav

return function(p1)
	-- upvalues: fFlagFriendsChatConversationListFocusNav (ref), reactModule (ref), focusNavigationContext (ref), inputTypeModule (ref), userInputService (ref), guiService (ref), playersService (ref)
	local var1 = if fFlagFriendsChatConversationListFocusNav then reactModule.useContext(focusNavigationContext) else nil
	p1 = p1 or reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagFriendsChatConversationListFocusNav (copy), inputTypeModule (copy), userInputService (copy), var1 (write), guiService (copy), var2 (ref)
		task.delay(0, function()
			-- upvalues: p1 (copy), fFlagFriendsChatConversationListFocusNav (copy), inputTypeModule (copy), userInputService (copy), var1 (copy), guiService (copy), var2 (copy)
			local current = p1.current
			
			if current == nil then return end
			if fFlagFriendsChatConversationListFocusNav then
				if inputTypeModule.getInputGroup(userInputService:GetLastInputType()) ~= inputTypeModule.InputTypeConstants.Gamepad then
					guiService.SelectedCoreObject = nil
				elseif var1 ~= nil then
					var1:focusGuiObject(current, false)
				end
			end
			if not current:IsFocused() then
				var2.current = true
				current:CaptureFocus()
			end
		end)
	end, { p1, var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), playersService (copy)
		return function()
			-- upvalues: var2 (copy), playersService (copy)
			if not var2.current then return end
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer then
				local textBox = Instance.new("TextBox")
				textBox.Visible = false
				textBox.Parent = localPlayer:FindFirstChildOfClass("PlayerGui")
				textBox:CaptureFocus()
				textBox:ReleaseFocus()
				textBox:Destroy()
			end
		end
	end, {})
	
	return { ref = p1, focus = var3 }
end