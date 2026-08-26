local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local starterGuiService = game:GetService("StarterGui")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local textChatService = game:GetService("TextChatService")
local var1 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
local var2 = false
local classicChat = playersService.ClassicChat
local bubbleChat = playersService.BubbleChat
local chatUtilModule = require(robloxGui.Modules.ChatUtil)
local corePackagesService = game:GetService("CorePackages")
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagExpChatAlwaysRunTCS = sharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagExpChatWindowSyncUnibar = sharedFlagsModule.FFlagExpChatWindowSyncUnibar
local transparencyStore = expChatModule.Stores.GetTransparencyStore(false)

local function _()
	-- upvalues: var1 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref)
	var1 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	return if getFFlagExpChatAlwaysRunTCS() then var1 else false
end

local t = {}
local t_1 = {
	Visible = true,
	MessageCount = 0,
	TopbarEnabled = true,
	CoreGuiEnabled = true
}
local t_2 = { ChatWindow = nil, GetCore = nil, SetCore = nil }
local t_3 = {}
local t_4 = {}

local _ = function(p1, p2, p3)
	return if p1 and p1[p2] and p1[p2]:IsA(p3) then p1[p2] else nil
end

local function DispatchEvent(p1, ...)
	-- upvalues: t_2 (ref)
	local chatWindow = t_2.ChatWindow
	local var3 = if chatWindow and chatWindow[p1] and chatWindow[p1]:IsA("BindableEvent") then chatWindow[p1] else nil
	
	if var3 then
		var3:Fire(...)
		
		return true
	end
	return false
end

local function AttemptInvokeFunction(p1, ...)
	-- upvalues: t_2 (ref)
	local chatWindow = t_2.ChatWindow
	local var3 = if chatWindow and chatWindow[p1] and chatWindow[p1]:IsA("BindableFunction") then chatWindow[p1] else nil
	
	if var3 then
		return true, var3:Invoke()
	end
	return false, nil
end

local _ = function(p1)
	-- upvalues: starterGuiService (ref), t_2 (ref)
	starterGuiService:RegisterGetCore(p1, function(p2)
		-- upvalues: t_2 (copy), p1 (ref)
		local getCore = t_2.GetCore
		local var3 = p1
		local var4 = if getCore and getCore[var3] and getCore[var3]:IsA("BindableFunction") then getCore[var3] else nil
		
		return if var4 then var4:Invoke(p2) else nil
	end)
end

function t.ToggleVisibility(_)
	-- upvalues: t_1 (ref), var1 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), t (ref), DispatchEvent (ref), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref), transparencyStore (ref)
	t_1.Visible = not t_1.Visible
	var1 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if if getFFlagExpChatAlwaysRunTCS() then var1 else false then
		t.VisibilityStateChanged:fire(t_1.Visible)
	elseif not DispatchEvent("ToggleVisibility") then
		t.VisibilityStateChanged:fire(t_1.Visible)
	end
	if not fFlagExpChatWindowSyncUnibar then
		expChatModule.Events.ChatTopBarButtonActivated(t_1.Visible)
	end
	if t_1.Visible then
		transparencyStore.resetAllTransparency()
	end
	t.ChatWindowToggled:fire(t_1.Visible)
end

function t.SetVisible(_, p1)
	-- upvalues: t_1 (ref), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref), transparencyStore (ref), t (ref), var1 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), DispatchEvent (ref)
	t_1.Visible = p1
	
	if not fFlagExpChatWindowSyncUnibar then
		expChatModule.Events.ChatTopBarButtonActivated(t_1.Visible)
	end
	if t_1.Visible then
		transparencyStore.resetAllTransparency()
	end
	t.ChatWindowToggled:fire(t_1.Visible)
	var1 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if if getFFlagExpChatAlwaysRunTCS() then var1 else false then
		DispatchEvent("SetVisible", false)
		t.VisibilityStateChanged:fire(false)
		
		return
	elseif not DispatchEvent("SetVisible", t_1.Visible) then
		t.VisibilityStateChanged:fire(t_1.Visible)
	end
end

function t.FocusChatBar(_)
	-- upvalues: DispatchEvent (ref), expChatModule (ref)
	DispatchEvent("FocusChatBar")
	expChatModule.Events.ChatTopBarFocusActivated()
end

function t.FocusSelectChatBar(_, p1, p2)
	-- upvalues: fFlagEnableConsoleExpControls (ref), expChatModule (ref)
	if fFlagEnableConsoleExpControls then
		expChatModule.Events.ChatTopBarFocusSelect(p1, p2)
	end
end

function t.EnterWhisperState(_, p1)
	-- upvalues: DispatchEvent (ref)
	return DispatchEvent("EnterWhisperState", p1)
end

function t.GetVisibility(_)
	-- upvalues: AttemptInvokeFunction (ref), t_1 (ref)
	local var3, var4 = AttemptInvokeFunction("GetVisibility")
	
	return if var3 then var4 else t_1.Visible
end

function t.GetMessageCount(_)
	-- upvalues: AttemptInvokeFunction (ref), t_1 (ref)
	local var3, var4 = AttemptInvokeFunction("GetMessageCount")
	
	return if var3 then var4 else t_1.MessageCount
end

function t.TopbarEnabledChanged(_, p1)
	-- upvalues: t_1 (ref), DispatchEvent (ref)
	t_1.TopbarEnabled = p1
	DispatchEvent("TopbarEnabledChanged", t_1.TopbarEnabled)
end

function t.IsFocused(_, p1)
	-- upvalues: AttemptInvokeFunction (ref)
	local var3, var4 = AttemptInvokeFunction("IsFocused", p1)
	
	return if var3 then var4 else false
end

function t.ClassicChatEnabled(_)
	-- upvalues: classicChat (write)
	return classicChat
end

function t.IsBubbleChatOnly(_)
	-- upvalues: bubbleChat (write), classicChat (write)
	return bubbleChat and not classicChat
end

function t.IsDisabled(_)
	-- upvalues: bubbleChat (write), classicChat (write)
	return not (bubbleChat or classicChat)
end

function SetInitialChatTypes(value)
	-- upvalues: var2 (write), bubbleChat (write), classicChat (write), t (ref)
	if var2 then return end
	var2 = true
	local bubbleChatEnabled = value.BubbleChatEnabled
	local classicChatEnabled = value.ClassicChatEnabled
	
	if type(bubbleChatEnabled) == "boolean" then
		bubbleChat = bubbleChatEnabled
	end
	if type(classicChatEnabled) == "boolean" then
		classicChat = classicChatEnabled
	end
	if not classicChat and not bubbleChat then
		t.ChatDisabled:fire()
	end
	if bubbleChat and not classicChat then
		t.BubbleChatOnlySet:fire()
	end
end

t.ChatBarFocusChanged = chatUtilModule.Signal()
t.VisibilityStateChanged = chatUtilModule.Signal()
t.ChatWindowToggled = chatUtilModule.Signal()
t.MessagesChanged = chatUtilModule.Signal()
t.BubbleChatOnlySet = chatUtilModule.Signal()
t.ChatDisabled = chatUtilModule.Signal()
local chatService = game:GetService("Chat")
chatService:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function()
	-- upvalues: chatService (ref), DispatchEvent (ref), t (ref)
	if chatService.IsAutoMigrated and not DispatchEvent("SetVisible", false) then
		t.VisibilityStateChanged:fire(false)
	end
end)
starterGuiService.CoreGuiChangedSignal:connect(function(p1, p2)
	-- upvalues: t_1 (ref), DispatchEvent (ref)
	if p1 == Enum.CoreGuiType.All or p1 == Enum.CoreGuiType.Chat then
		t_1.CoreGuiEnabled = p2
		DispatchEvent("CoreGuiEnabled", t_1.CoreGuiEnabled)
	end
end)
guiService:AddSpecialKey(Enum.SpecialKey.ChatHotkey)
guiService.SpecialKeyPressed:connect(function(p1, p2)
	-- upvalues: guiService (ref), var1 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), DispatchEvent (ref)
	if guiService.MenuIsOpen then return end
	var1 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if not (if getFFlagExpChatAlwaysRunTCS() then var1 else false) then
		DispatchEvent("SpecialKeyPressed", p1, p2)
	end
end)

function DoConnectSetCore(value)
	-- upvalues: starterGuiService (ref), t_2 (ref), t_4 (ref)
	starterGuiService:RegisterSetCore(value, function(p1)
		-- upvalues: t_2 (copy), value (ref), t_4 (copy)
		local setCore = t_2.SetCore
		local var3 = if setCore and setCore[value] and setCore[value]:IsA("BindableEvent") then setCore[value] else nil
		
		if var3 then
			var3:Fire(p1)
			
			return
		elseif t_4[value] == nil then
			t_4[value] = {}
		end
		table.insert(t_4[value], p1)
	end)
end

DoConnectSetCore("ChatMakeSystemMessage")
DoConnectSetCore("ChatWindowPosition")
DoConnectSetCore("ChatWindowSize")
DoConnectSetCore("ChatBarDisabled")
local var3 = "ChatWindowPosition"
starterGuiService:RegisterGetCore("ChatWindowPosition", function(p1)
	-- upvalues: t_2 (ref), var3 (ref)
	local getCore = t_2.GetCore
	local var4 = if getCore and getCore[var3] and getCore[var3]:IsA("BindableFunction") then getCore[var3] else nil
	
	return if var4 then var4:Invoke(p1) else nil
end)
local var4 = "ChatWindowSize"
starterGuiService:RegisterGetCore("ChatWindowSize", function(p1)
	-- upvalues: t_2 (ref), var4 (ref)
	local getCore = t_2.GetCore
	local var5 = if getCore and getCore[var4] and getCore[var4]:IsA("BindableFunction") then getCore[var4] else nil
	
	return if var5 then var5:Invoke(p1) else nil
end)
local var5 = "ChatBarDisabled"
starterGuiService:RegisterGetCore("ChatBarDisabled", function(p1)
	-- upvalues: t_2 (ref), var5 (ref)
	local getCore = t_2.GetCore
	local var6 = if getCore and getCore[var5] and getCore[var5]:IsA("BindableFunction") then getCore[var5] else nil
	
	return if var6 then var6:Invoke(p1) else nil
end)

local function RegisterCoreGuiConnections(p1)
	-- upvalues: t_3 (write), t_2 (ref), t (ref), t_1 (ref), t_4 (ref)
	if type(p1) == "table" then
		local chatWindow = p1.ChatWindow
		local setCore = p1.SetCore
		local getCore = p1.GetCore
		
		if type(chatWindow) == "table" then
			for i, v in pairs(t_3) do
				v:disconnect()
			end
			if type(chatWindow.ChatTypes) == "table" then
				SetInitialChatTypes(chatWindow.ChatTypes)
			end
			t_3 = {}
			t_2.ChatWindow = {}
			t_2.ChatWindow.ToggleVisibility = if chatWindow and chatWindow.ToggleVisibility and chatWindow.ToggleVisibility:IsA("BindableEvent") then chatWindow.ToggleVisibility else nil
			t_2.ChatWindow.SetVisible = if chatWindow and chatWindow.SetVisible and chatWindow.SetVisible:IsA("BindableEvent") then chatWindow.SetVisible else nil
			t_2.ChatWindow.FocusChatBar = if chatWindow and chatWindow.FocusChatBar and chatWindow.FocusChatBar:IsA("BindableEvent") then chatWindow.FocusChatBar else nil
			t_2.ChatWindow.EnterWhisperState = if chatWindow and chatWindow.EnterWhisperState and chatWindow.EnterWhisperState:IsA("BindableEvent") then chatWindow.EnterWhisperState else nil
			t_2.ChatWindow.TopbarEnabledChanged = if chatWindow and chatWindow.TopbarEnabledChanged and chatWindow.TopbarEnabledChanged:IsA("BindableEvent") then chatWindow.TopbarEnabledChanged else nil
			t_2.ChatWindow.IsFocused = if chatWindow and chatWindow.IsFocused and chatWindow.IsFocused:IsA("BindableFunction") then chatWindow.IsFocused else nil
			t_2.ChatWindow.SpecialKeyPressed = if chatWindow and chatWindow.SpecialKeyPressed and chatWindow.SpecialKeyPressed:IsA("BindableEvent") then chatWindow.SpecialKeyPressed else nil
			
			local function DoConnect(p2)
				-- upvalues: t_2 (copy), chatWindow (ref), t (copy), t_3 (copy)
				local var6 = chatWindow
				t_2.ChatWindow[p2] = if var6 and var6[p2] and var6[p2]:IsA("BindableEvent") then var6[p2] else nil
				
				if t_2.ChatWindow[p2] then
					table.insert(t_3, t_2.ChatWindow[p2].Event:connect(function(...)
						-- upvalues: t (copy), p2 (ref)
						t[p2]:fire(...)
					end))
				end
			end
			
			DoConnect("ChatBarFocusChanged")
			DoConnect("VisibilityStateChanged")
			DoConnect("ChatWindowToggled")
			DoConnect("MessagesChanged")
			t_2.ChatWindow.MessagePosted = if chatWindow and chatWindow.MessagePosted and chatWindow.MessagePosted:IsA("BindableEvent") then chatWindow.MessagePosted else nil
			
			if t_2.ChatWindow.MessagePosted then
				table.insert(t_3, t_2.ChatWindow.MessagePosted.Event:connect(function(p2)
					game:GetService("Players"):Chat(p2)
				end))
			end
			t:SetVisible(t_1.Visible)
			t:TopbarEnabledChanged(t_1.TopbarEnabled)
			local var6 = if chatWindow and chatWindow.CoreGuiEnabled and chatWindow.CoreGuiEnabled:IsA("BindableEvent") then chatWindow.CoreGuiEnabled else nil
			
			if var6 then
				t_2.ChatWindow.CoreGuiEnabled = var6
				var6:Fire(t_1.CoreGuiEnabled)
			end
		else
			error("Table 'ChatWindow' must be provided!")
		end
		if type(setCore) == "table" and type(getCore) == "table" then
			t_2.SetCore = {}
			t_2.GetCore = {}
			
			local function addSetCore(value)
				-- upvalues: setCore (ref), t_2 (copy), t_4 (copy)
				local var7 = setCore
				local var8 = if var7 and var7[value] and var7[value]:IsA("BindableEvent") then var7[value] else nil
				
				if var8 then
					t_2.SetCore[value] = var8
					
					if t_4[value] then
						for i, v in pairs(t_4[value]) do
							var8:Fire(v)
						end
						t_4[value] = nil
					end
				end
			end
			
			addSetCore("ChatMakeSystemMessage")
			addSetCore("ChatWindowPosition")
			addSetCore("ChatWindowSize")
			addSetCore("ChatBarDisabled")
			t_2.GetCore.ChatWindowPosition = if getCore and getCore.ChatWindowPosition and getCore.ChatWindowPosition:IsA("BindableFunction") then getCore.ChatWindowPosition else nil
			t_2.GetCore.ChatWindowSize = if getCore and getCore.ChatWindowSize and getCore.ChatWindowSize:IsA("BindableFunction") then getCore.ChatWindowSize else nil
			t_2.GetCore.ChatBarDisabled = if getCore and getCore.ChatBarDisabled and getCore.ChatBarDisabled:IsA("BindableFunction") then getCore.ChatBarDisabled else nil
			
			return
		elseif type(setCore) ~= "nil" or type(getCore) ~= "nil" then
			error("Both 'SetCore' and 'GetCore' must be tables if provided!")
		end
	end
end

expChatModule.listenToDispatch(function(p2)
	-- upvalues: t (ref)
	if p2.type == "FocusChatHotKeyActivated" then
		t:SetVisible(true)
	end
end)
starterGuiService:RegisterSetCore("CoreGuiChatConnections", RegisterCoreGuiConnections)

return t