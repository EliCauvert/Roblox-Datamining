local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local CreateSignalFunction = require(ExpChat.Parent.Signals).createSignal
local IsSelectionWithinVisibleModule = require(script.Parent.isSelectionWithinVisible)
local ChatFocusRequestSignalModule = require(ExpChat.ShortcutNav.chatFocusRequestSignal)
local FFlagExpChatGenericChatFocusModule = require(ExpChat.Flags.FFlagExpChatGenericChatFocus)

return function()
	-- upvalues: CreateSignalFunction (copy), IsSelectionWithinVisibleModule (copy), GuiService (copy), FFlagExpChatGenericChatFocusModule (copy), ChatFocusRequestSignalModule (copy), UserInputService (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	local Signal5, Signal2_4 = CreateSignalFunction(nil)
	local ChatRoot = nil
	local TabBarRoot = nil
	
	return {
		getChatInputBarFocused = Signal,
		getIsChatFocused = function()
			-- upvalues: IsSelectionWithinVisibleModule (upval), GuiService (upval), ChatRoot (ref)
			return IsSelectionWithinVisibleModule(GuiService.SelectedCoreObject, ChatRoot)
		end,
		getIsTabBarFocused = function()
			-- upvalues: IsSelectionWithinVisibleModule (upval), GuiService (upval), TabBarRoot (ref)
			return IsSelectionWithinVisibleModule(GuiService.SelectedCoreObject, TabBarRoot)
		end,
		getIsTabBarVisible = Signal1,
		getTabNavFocusRequestTime = Signal3,
		getTabNavFocusTabName = Signal4,
		getChatInputBarFocusRequestTime = Signal5,
		focusChatInputBar = function()
			-- upvalues: Signal2 (copy), FFlagExpChatGenericChatFocusModule (upval), ChatFocusRequestSignalModule (upval)
			Signal2(true)
			
			if FFlagExpChatGenericChatFocusModule then
				ChatFocusRequestSignalModule:fire()
			end
		end,
		unfocusChatInputBar = function()
			-- upvalues: Signal2 (copy), FFlagExpChatGenericChatFocusModule (upval), UserInputService (upval), ChatRoot (ref), GuiService (upval)
			Signal2(false)
			
			if FFlagExpChatGenericChatFocusModule then
				local FocusedTextBox = UserInputService:GetFocusedTextBox()
				
				if FocusedTextBox ~= nil and ChatRoot ~= nil and FocusedTextBox:IsDescendantOf(ChatRoot) then
					FocusedTextBox:ReleaseFocus()
				end
				if GuiService.MenuIsOpen then
					GuiService:SetMenuIsOpen(false, "ExperienceChat")
				end
			end
		end,
		setChatRoot = function(Value)
			-- upvalues: ChatRoot (ref)
			ChatRoot = Value
		end,
		setTabBarRoot = function(Value)
			-- upvalues: TabBarRoot (ref)
			TabBarRoot = Value
		end,
		setTabBarVisible = Signal2_1,
		requestTabNavFocus = function(p1, p2)
			-- upvalues: Signal2_3 (copy), Signal2_2 (copy)
			Signal2_3(p1)
			Signal2_2(p2 or os.clock())
		end,
		clearTabNavFocusRequest = function()
			-- upvalues: Signal2_3 (copy), Signal2_2 (copy)
			Signal2_3(nil)
			Signal2_2(nil)
		end,
		requestChatInputBarFocus = function(p1)
			-- upvalues: Signal2_4 (copy)
			Signal2_4(p1 or os.clock())
		end,
		clearChatInputBarFocusRequest = function()
			-- upvalues: Signal2_4 (copy)
			Signal2_4(nil)
		end
	}
end