local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = RobloxGui:WaitForChild("Modules")
local StarterGui = game:GetService("StarterGui")
local _ = game:GetService("UserInputService")
local _ = game:GetService("GuiService")
local Players = game:GetService("Players")
local ChatUtilModule = require(RobloxGui.Modules.ChatUtil)
local ClassicChat = Players.ClassicChat
local BubbleChat = Players.BubbleChat
local SharedFlagsModule = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local _ = SharedFlagsModule.FFlagChromeChatGamepadSupportFix
local NewChatModule = nil
local Visibility = nil
local t = {}
local config = { Visible = not game:GetService("VRService").VREnabled }
local ChatSelectorModule = {
	ToggleVisibility = function(_) --[[ Line: 39 ]]
		-- upvalues: NewChatModule (ref), config (copy)
		if NewChatModule then
			NewChatModule:ToggleVisibility()
			
			return
		else
			config.Visible = not config.Visible
		end
	end,
	SetVisible = function(_, Visible) --[[ Line: 47 ]]
		-- upvalues: NewChatModule (ref), config (copy)
		if NewChatModule then
			NewChatModule:SetVisible(Visible)
			
			return
		else
			config.Visible = Visible
		end
	end,
	FocusChatBar = function(_) --[[ Line: 55 ]]
		-- upvalues: NewChatModule (ref)
		if NewChatModule then
			NewChatModule:FocusChatBar()
		end
	end,
	FocusSelectChatBar = function(_, p1, p2) --[[ Line: 61 ]]
		-- upvalues: NewChatModule (ref), FFlagEnableConsoleExpControls (copy)
		if NewChatModule and FFlagEnableConsoleExpControls then
			NewChatModule:FocusSelectChatBar(p1, p2)
		end
	end,
	EnterWhisperState = function(_, p1) --[[ Line: 69 ]]
		-- upvalues: NewChatModule (ref)
		if not NewChatModule then return end
		return NewChatModule:EnterWhisperState(p1)
	end,
	GetVisibility = function(_) --[[ Line: 75 ]]
		-- upvalues: NewChatModule (ref), config (copy)
		return if NewChatModule then NewChatModule:GetVisibility() else config.Visible
	end,
	GetMessageCount = function(_) --[[ Line: 83 ]]
		-- upvalues: NewChatModule (ref)
		return if NewChatModule then NewChatModule:GetMessageCount() else 0
	end,
	TopbarEnabledChanged = function(_, ...) --[[ Line: 91 ]]
		-- upvalues: NewChatModule (ref)
		if not NewChatModule then return end
		return NewChatModule:TopbarEnabledChanged(...)
	end,
	IsFocused = function(_, p1) --[[ Line: 97 ]]
		-- upvalues: NewChatModule (ref)
		return if NewChatModule then NewChatModule:IsFocused(p1) else false
	end,
	ClassicChatEnabled = function(_) --[[ Line: 105 ]]
		-- upvalues: NewChatModule (ref), ClassicChat (copy)
		return if NewChatModule then NewChatModule:ClassicChatEnabled() else ClassicChat
	end,
	IsBubbleChatOnly = function(_) --[[ Line: 113 ]]
		-- upvalues: NewChatModule (ref), BubbleChat (copy), ClassicChat (copy)
		return if NewChatModule then NewChatModule:IsBubbleChatOnly() else BubbleChat and not ClassicChat
	end,
	IsDisabled = function(_) --[[ Line: 120 ]]
		-- upvalues: NewChatModule (ref), BubbleChat (copy), ClassicChat (copy)
		return if NewChatModule then NewChatModule:IsDisabled() else not (BubbleChat or ClassicChat)
	end
}

function ChatSelectorModule:HideTemp(Key, p1) --[[ Line: 127 ]]
	-- upvalues: t (copy), Visibility (ref), ChatSelectorModule (copy)
	local function _(): boolean --[[ Line: 128 | Named "isHideTempKeysEmpty" ]]
		-- upvalues: t (upval)
		return next(t) == nil
	end
	
	if next(t) == nil then
		Visibility = ChatSelectorModule:GetVisibility()
	end
	if p1 then
		t[Key] = p1
	else
		t[Key] = nil
	end
	ChatSelectorModule:SetVisible(Visibility and next(t) == nil)
end

ChatSelectorModule.ChatBarFocusChanged = ChatUtilModule.Signal()
ChatSelectorModule.ChatWindowToggled = ChatUtilModule.Signal()
ChatSelectorModule.ChatActiveChanged = ChatUtilModule.Signal()
ChatSelectorModule.ChatActiveChanged:connect(function(Visible) --[[ Line: 149 ]]
	-- upvalues: ChatSelectorModule (copy)
	ChatSelectorModule:SetVisible(Visible)
end)
ChatSelectorModule.VisibilityStateChanged = ChatUtilModule.Signal()
ChatSelectorModule.MessagesChanged = ChatUtilModule.Signal()
ChatSelectorModule.BubbleChatOnlySet = ChatUtilModule.Signal()
ChatSelectorModule.ChatDisabled = ChatUtilModule.Signal()
local Flag = false
local List = {}

local function NonFunc() --[[ Line: 168 ]] end

StarterGui:RegisterSetCore("ChatMakeSystemMessage", function(p1) --[[ Line: 163 | Named "MakeSystemMessageQueueingFunction" ]]
	-- upvalues: Flag (ref), List (copy)
	if not Flag then
		table.insert(List, p1)
		
		return
	end
end)
StarterGui:RegisterSetCore("ChatWindowPosition", NonFunc)
StarterGui:RegisterGetCore("ChatWindowPosition", NonFunc)
StarterGui:RegisterSetCore("ChatWindowSize", NonFunc)
StarterGui:RegisterGetCore("ChatWindowSize", NonFunc)
StarterGui:RegisterSetCore("ChatBarDisabled", NonFunc)
StarterGui:RegisterGetCore("ChatBarDisabled", NonFunc)
StarterGui:RegisterGetCore("ChatActive", function() --[[ Line: 178 ]]
	-- upvalues: ChatSelectorModule (copy)
	return ChatSelectorModule:GetVisibility()
end)
StarterGui:RegisterSetCore("ChatActive", function(p1) --[[ Line: 181 ]]
	-- upvalues: ChatSelectorModule (copy)
	ChatSelectorModule.ChatActiveChanged:fire(p1)
end)

local function _(p1, p2, p3) --[[ Line: 186 | Named "ConnectSignals" ]]
	if p1[p3] then
		p1[p3]:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: p2 (copy), p3 (copy)
			p2[p3]:fire(...)
		end)
	end
end

coroutine.wrap(function() --[[ Line: 193 ]]
	-- upvalues: NewChatModule (ref), RobloxGui (copy), ChatSelectorModule (copy), Players (copy), StarterGui (copy), config (copy), Flag (ref), List (copy)
	NewChatModule = require(RobloxGui.Modules.NewChat)
	local TextBox = NewChatModule
	
	if TextBox.ChatBarFocusChanged then
		local v1 = "ChatBarFocusChanged"
		TextBox.ChatBarFocusChanged:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: ChatSelectorModule (copy), v1 (copy)
			ChatSelectorModule[v1]:fire(...)
		end)
	end
	local TextBox1 = NewChatModule
	
	if TextBox1.VisibilityStateChanged then
		local v2 = "VisibilityStateChanged"
		TextBox1.VisibilityStateChanged:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: ChatSelectorModule (copy), v2 (copy)
			ChatSelectorModule[v2]:fire(...)
		end)
	end
	local TextBox2 = NewChatModule
	
	if TextBox2.ChatWindowToggled then
		local v3 = "ChatWindowToggled"
		TextBox2.ChatWindowToggled:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: ChatSelectorModule (copy), v3 (copy)
			ChatSelectorModule[v3]:fire(...)
		end)
	end
	local TextBox3 = NewChatModule
	
	if TextBox3.ChatActiveChanged then
		local v4 = "ChatActiveChanged"
		TextBox3.ChatActiveChanged:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: ChatSelectorModule (copy), v4 (copy)
			ChatSelectorModule[v4]:fire(...)
		end)
	end
	local TextBox4 = NewChatModule
	
	if TextBox4.BubbleChatOnlySet then
		local v5 = "BubbleChatOnlySet"
		TextBox4.BubbleChatOnlySet:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: ChatSelectorModule (copy), v5 (copy)
			ChatSelectorModule[v5]:fire(...)
		end)
	end
	local TextBox5 = NewChatModule
	
	if TextBox5.ChatDisabled then
		local v6 = "ChatDisabled"
		TextBox5.ChatDisabled:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: ChatSelectorModule (copy), v6 (copy)
			ChatSelectorModule[v6]:fire(...)
		end)
	end
	while Players.LocalPlayer == nil do
		Players.ChildAdded:wait()
	end
	local _ = Players.LocalPlayer
	local TextBox6 = NewChatModule
	
	if TextBox6.MessagesChanged then
		local v7 = "MessagesChanged"
		TextBox6.MessagesChanged:connect(function(...) --[[ Line: 189 ]]
			-- upvalues: ChatSelectorModule (copy), v7 (copy)
			ChatSelectorModule[v7]:fire(...)
		end)
	end
	StarterGui:RegisterGetCore("UseNewLuaChat", function(): boolean --[[ Line: 208 ]]
		return true
	end)
	NewChatModule:SetVisible(config.Visible)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
	Flag = true
	
	for _, value in pairs(List) do
		pcall(function() --[[ Line: 215 ]]
			-- upvalues: StarterGui (upval), value (copy)
			StarterGui:SetCore("ChatMakeSystemMessage", value)
		end)
	end
end)()

return ChatSelectorModule