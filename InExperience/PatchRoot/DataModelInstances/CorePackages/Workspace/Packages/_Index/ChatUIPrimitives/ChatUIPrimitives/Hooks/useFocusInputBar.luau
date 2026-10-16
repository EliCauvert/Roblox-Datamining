local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local focusNavigationContext = require(parent.ReactFocusNavigation).FocusNavigationContext
local fFlagFriendsChatConversationListFocusNav = require(parent.SharedFlags).FFlagFriendsChatConversationListFocusNav

return function(p1)
	-- upvalues: fFlagFriendsChatConversationListFocusNav (ref), reactModule (ref), focusNavigationContext (ref), playersService (ref)
	local var1 = if fFlagFriendsChatConversationListFocusNav then reactModule.useContext(focusNavigationContext) else nil
	p1 = p1 or reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var1 (write), var2 (ref)
		task.delay(0, function()
			-- upvalues: p1 (copy), var1 (copy), var2 (copy)
			local current = p1.current
			
			if current == nil then return end
			if var1 ~= nil and var1.focusedGuiObject:getValue() ~= nil then
				var1:focusGuiObject(current, false)
				
				return
			elseif not current:IsFocused() then
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