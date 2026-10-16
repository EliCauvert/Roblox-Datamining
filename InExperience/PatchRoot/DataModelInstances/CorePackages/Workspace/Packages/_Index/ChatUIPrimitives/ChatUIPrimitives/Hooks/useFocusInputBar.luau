local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FocusNavigationContext = require(Parent.ReactFocusNavigation).FocusNavigationContext
local InputTypeModule = require(Parent.InputType)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatTabShortcutNav = SharedFlagsModule.FFlagExpChatTabShortcutNav
local FFlagFriendsChatConversationListFocusNav = SharedFlagsModule.FFlagFriendsChatConversationListFocusNav or FFlagExpChatTabShortcutNav

return function(p1) --[[ Line: 44 | Named "useFocusInputBar" ]]
	-- upvalues: FFlagFriendsChatConversationListFocusNav (copy), ReactModule (copy), FocusNavigationContext (copy), InputTypeModule (copy), UserInputService (copy), GuiService (copy), Players (copy)
	local UseContextResult = if FFlagFriendsChatConversationListFocusNav then ReactModule.useContext(FocusNavigationContext) else nil
	local UseRefResult = ReactModule.useRef(nil)
	local P0 = p1 or UseRefResult
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 55 ]]
		-- upvalues: P0 (copy), FFlagFriendsChatConversationListFocusNav (upval), InputTypeModule (upval), UserInputService (upval), UseContextResult (ref), GuiService (upval), UseRefResult1 (copy)
		task.delay(0, function() --[[ Line: 59 ]]
			-- upvalues: P0 (upval), FFlagFriendsChatConversationListFocusNav (upval), InputTypeModule (upval), UserInputService (upval), UseContextResult (upval), GuiService (upval), UseRefResult1 (upval)
			local Current = P0.current
			
			if Current == nil then return end
			if FFlagFriendsChatConversationListFocusNav then
				if InputTypeModule.getInputGroup(UserInputService:GetLastInputType()) == InputTypeModule.InputTypeConstants.Gamepad then
					if UseContextResult ~= nil then
						UseContextResult:focusGuiObject(Current, false)
					end
				else
					GuiService.SelectedCoreObject = nil
				end
			end
			if not Current:IsFocused() then
				UseRefResult1.current = true
				Current:CaptureFocus()
			end
		end)
	end, { P0, UseContextResult })
	ReactModule.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: UseRefResult1 (copy), Players (upval)
		return function() --[[ Line: 85 ]]
			-- upvalues: UseRefResult1 (upval), Players (upval)
			if not UseRefResult1.current then return end
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				local TextBox = Instance.new("TextBox")
				TextBox.Visible = false
				TextBox.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui")
				TextBox:CaptureFocus()
				TextBox:ReleaseFocus()
				TextBox:Destroy()
			end
		end
	end, {})
	
	return { ref = P0, focus = UseResult }
end