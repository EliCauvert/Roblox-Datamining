local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local createSignal = require(expChat.Parent.Signals).createSignal
local isSelectionWithinVisibleModule = require(script.Parent.isSelectionWithinVisible)
local chatFocusRequestSignalModule = require(expChat.ShortcutNav.chatFocusRequestSignal)
local fFlagExpChatGenericChatFocusModule = require(expChat.Flags.FFlagExpChatGenericChatFocus)

return function()
	-- upvalues: createSignal (ref), isSelectionWithinVisibleModule (ref), guiService (ref), fFlagExpChatGenericChatFocusModule (ref), chatFocusRequestSignalModule (ref), userInputService (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(false)
	local var5, var6 = createSignal(nil)
	local var7, var8 = createSignal(nil)
	local var9, var10 = createSignal(nil)
	local var11 = nil
	local var12 = nil
	
	return {
		getChatInputBarFocused = var1,
		getIsChatFocused = function()
			-- upvalues: isSelectionWithinVisibleModule (copy), guiService (copy), var11 (write)
			return isSelectionWithinVisibleModule(guiService.SelectedCoreObject, var11)
		end,
		getIsTabBarFocused = function()
			-- upvalues: isSelectionWithinVisibleModule (copy), guiService (copy), var12 (write)
			return isSelectionWithinVisibleModule(guiService.SelectedCoreObject, var12)
		end,
		getIsTabBarVisible = var3,
		getTabNavFocusRequestTime = var5,
		getTabNavFocusTabName = var7,
		getChatInputBarFocusRequestTime = var9,
		focusChatInputBar = function()
			-- upvalues: var2 (ref), fFlagExpChatGenericChatFocusModule (copy), chatFocusRequestSignalModule (copy)
			var2(true)
			
			if fFlagExpChatGenericChatFocusModule then
				chatFocusRequestSignalModule:fire()
			end
		end,
		unfocusChatInputBar = function()
			-- upvalues: var2 (ref), fFlagExpChatGenericChatFocusModule (copy), userInputService (copy), var11 (write), guiService (copy)
			var2(false)
			
			if fFlagExpChatGenericChatFocusModule then
				local focusedTextBox = userInputService:GetFocusedTextBox()
				
				if focusedTextBox ~= nil and var11 ~= nil and focusedTextBox:IsDescendantOf(var11) then
					focusedTextBox:ReleaseFocus()
				end
				if guiService.MenuIsOpen then
					guiService:SetMenuIsOpen(false, "ExperienceChat")
				end
			end
		end,
		setChatRoot = function(value)
			-- upvalues: var11 (write)
			var11 = value
		end,
		setTabBarRoot = function(value)
			-- upvalues: var12 (write)
			var12 = value
		end,
		setTabBarVisible = var4,
		requestTabNavFocus = function(p1, p2)
			-- upvalues: var8 (ref), var6 (ref)
			var8(p1)
			var6(p2 or os.clock())
		end,
		clearTabNavFocusRequest = function()
			-- upvalues: var8 (ref), var6 (ref)
			var8(nil)
			var6(nil)
		end,
		requestChatInputBarFocus = function(p1)
			-- upvalues: var10 (ref)
			var10(p1 or os.clock())
		end,
		clearChatInputBarFocusRequest = function()
			-- upvalues: var10 (ref)
			var10(nil)
		end
	}
end