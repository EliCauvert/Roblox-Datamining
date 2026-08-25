local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local starterGuiService = game:GetService("StarterGui")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local textChatService = game:GetService("TextChatService")
local var5 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
local var6 = false
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
	-- upvalues: var5 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref)
	var5 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	return if getFFlagExpChatAlwaysRunTCS() then var5 else false
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

local _ = function(p0, p1, p2)
	return if p0 and p0[p1] and p0[p1]:IsA(p2) then p0[p1] else nil
end

local function DispatchEvent(p3, ...)
	-- upvalues: t_2 (ref)
	local chatWindow = t_2.ChatWindow
	local var24 = if chatWindow and chatWindow[p3] and chatWindow[p3]:IsA("BindableEvent") then chatWindow[p3] else nil
	
	if var24 then
		var24:Fire(...)
		
		return true
	end
	return false
end

local function AttemptInvokeFunction(p4, ...)
	-- upvalues: t_2 (ref)
	local chatWindow = t_2.ChatWindow
	local var25 = if chatWindow and chatWindow[p4] and chatWindow[p4]:IsA("BindableFunction") then chatWindow[p4] else nil
	
	if var25 then
		return true, var25:Invoke()
	end
	return false, nil
end

local _ = function(p5)
	-- upvalues: starterGuiService (ref), t_2 (ref)
	starterGuiService:RegisterGetCore(p5, function(p6)
		-- upvalues: t_2 (copy), p5 (ref)
		local getCore = t_2.GetCore
		local var26 = p5
		local var27 = if getCore and getCore[var26] and getCore[var26]:IsA("BindableFunction") then getCore[var26] else nil
		
		return if var27 then var27:Invoke(p6) else nil
	end)
end

function t.ToggleVisibility(_)
	-- upvalues: t_1 (ref), var5 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), t (ref), DispatchEvent (ref), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref), transparencyStore (ref)
	t_1.Visible = not t_1.Visible
	var5 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if if getFFlagExpChatAlwaysRunTCS() then var5 else false then
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

function t.SetVisible(_, p7)
	-- upvalues: t_1 (ref), fFlagExpChatWindowSyncUnibar (ref), expChatModule (ref), transparencyStore (ref), t (ref), var5 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), DispatchEvent (ref)
	t_1.Visible = p7
	
	if not fFlagExpChatWindowSyncUnibar then
		expChatModule.Events.ChatTopBarButtonActivated(t_1.Visible)
	end
	if t_1.Visible then
		transparencyStore.resetAllTransparency()
	end
	t.ChatWindowToggled:fire(t_1.Visible)
	var5 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if if getFFlagExpChatAlwaysRunTCS() then var5 else false then
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

function t.FocusSelectChatBar(_, p8, p9)
	-- upvalues: fFlagEnableConsoleExpControls (ref), expChatModule (ref)
	if fFlagEnableConsoleExpControls then
		expChatModule.Events.ChatTopBarFocusSelect(p8, p9)
	end
end

function t.EnterWhisperState(_, p10)
	-- upvalues: DispatchEvent (ref)
	return DispatchEvent("EnterWhisperState", p10)
end

function t.GetVisibility(_)
	-- upvalues: AttemptInvokeFunction (ref), t_1 (ref)
	local var28, var29 = AttemptInvokeFunction("GetVisibility")
	
	return if var28 then var29 else t_1.Visible
end

function t.GetMessageCount(_)
	-- upvalues: AttemptInvokeFunction (ref), t_1 (ref)
	local var30, var31 = AttemptInvokeFunction("GetMessageCount")
	
	return if var30 then var31 else t_1.MessageCount
end

function t.TopbarEnabledChanged(_, p11)
	-- upvalues: t_1 (ref), DispatchEvent (ref)
	t_1.TopbarEnabled = p11
	DispatchEvent("TopbarEnabledChanged", t_1.TopbarEnabled)
end

function t.IsFocused(_, p12)
	-- upvalues: AttemptInvokeFunction (ref)
	local var32, var33 = AttemptInvokeFunction("IsFocused", p12)
	
	return if var32 then var33 else false
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
	-- upvalues: var6 (write), bubbleChat (write), classicChat (write), t (ref)
	if var6 then return end
	var6 = true
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
starterGuiService.CoreGuiChangedSignal:connect(function(p13, p14)
	-- upvalues: t_1 (ref), DispatchEvent (ref)
	if p13 == Enum.CoreGuiType.All or p13 == Enum.CoreGuiType.Chat then
		t_1.CoreGuiEnabled = p14
		DispatchEvent("CoreGuiEnabled", t_1.CoreGuiEnabled)
	end
end)
guiService:AddSpecialKey(Enum.SpecialKey.ChatHotkey)
guiService.SpecialKeyPressed:connect(function(p15, p16)
	-- upvalues: guiService (ref), var5 (write), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref), DispatchEvent (ref)
	if guiService.MenuIsOpen then return end
	var5 = textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if not (if getFFlagExpChatAlwaysRunTCS() then var5 else false) then
		DispatchEvent("SpecialKeyPressed", p15, p16)
	end
end)

function DoConnectSetCore(value)
	-- upvalues: starterGuiService (ref), t_2 (ref), t_4 (ref)
	starterGuiService:RegisterSetCore(value, function(p17)
		-- upvalues: t_2 (copy), value (ref), t_4 (copy)
		local setCore = t_2.SetCore
		local var34 = if setCore and setCore[value] and setCore[value]:IsA("BindableEvent") then setCore[value] else nil
		
		if var34 then
			var34:Fire(p17)
			
			return
		elseif t_4[value] == nil then
			t_4[value] = {}
		end
		table.insert(t_4[value], p17)
	end)
end

DoConnectSetCore("ChatMakeSystemMessage")
DoConnectSetCore("ChatWindowPosition")
DoConnectSetCore("ChatWindowSize")
DoConnectSetCore("ChatBarDisabled")
local var20 = "ChatWindowPosition"
starterGuiService:RegisterGetCore("ChatWindowPosition", function(p18)
	-- upvalues: t_2 (ref), var20 (ref)
	local getCore = t_2.GetCore
	local var27 = if getCore and getCore[var20] and getCore[var20]:IsA("BindableFunction") then getCore[var20] else nil
	
	return if var27 then var27:Invoke(p18) else nil
end)
local var21 = "ChatWindowSize"
starterGuiService:RegisterGetCore("ChatWindowSize", function(p19)
	-- upvalues: t_2 (ref), var21 (ref)
	local getCore = t_2.GetCore
	local var27 = if getCore and getCore[var21] and getCore[var21]:IsA("BindableFunction") then getCore[var21] else nil
	
	return if var27 then var27:Invoke(p19) else nil
end)
local var22 = "ChatBarDisabled"
starterGuiService:RegisterGetCore("ChatBarDisabled", function(p20)
	-- upvalues: t_2 (ref), var22 (ref)
	local getCore = t_2.GetCore
	local var27 = if getCore and getCore[var22] and getCore[var22]:IsA("BindableFunction") then getCore[var22] else nil
	
	return if var27 then var27:Invoke(p20) else nil
end)

local function RegisterCoreGuiConnections(p21)
	-- upvalues: t_3 (write), t_2 (ref), t (ref), t_1 (ref), t_4 (ref)
	if type(p21) == "table" then
		local chatWindow = p21.ChatWindow
		local setCore = p21.SetCore
		local getCore = p21.GetCore
		
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
			
			local function DoConnect(p22)
				-- upvalues: t_2 (copy), chatWindow (ref), t (copy), t_3 (copy)
				local var38 = chatWindow
				t_2.ChatWindow[p22] = if var38 and var38[p22] and var38[p22]:IsA("BindableEvent") then var38[p22] else nil
				
				if t_2.ChatWindow[p22] then
					table.insert(t_3, t_2.ChatWindow[p22].Event:connect(function(...)
						-- upvalues: t (copy), p22 (ref)
						t[p22]:fire(...)
					end))
				end
			end
			
			DoConnect("ChatBarFocusChanged")
			DoConnect("VisibilityStateChanged")
			DoConnect("ChatWindowToggled")
			DoConnect("MessagesChanged")
			t_2.ChatWindow.MessagePosted = if chatWindow and chatWindow.MessagePosted and chatWindow.MessagePosted:IsA("BindableEvent") then chatWindow.MessagePosted else nil
			
			if t_2.ChatWindow.MessagePosted then
				table.insert(t_3, t_2.ChatWindow.MessagePosted.Event:connect(function(p23)
					game:GetService("Players"):Chat(p23)
				end))
			end
			t:SetVisible(t_1.Visible)
			t:TopbarEnabledChanged(t_1.TopbarEnabled)
			local var36 = if chatWindow and chatWindow.CoreGuiEnabled and chatWindow.CoreGuiEnabled:IsA("BindableEvent") then chatWindow.CoreGuiEnabled else nil
			
			if var36 then
				t_2.ChatWindow.CoreGuiEnabled = var36
				var36:Fire(t_1.CoreGuiEnabled)
			end
		else
			error("Table 'ChatWindow' must be provided!")
		end
		if type(setCore) == "table" and type(getCore) == "table" then
			t_2.SetCore = {}
			t_2.GetCore = {}
			
			local function addSetCore(value)
				-- upvalues: setCore (ref), t_2 (copy), t_4 (copy)
				local var39 = setCore
				local var40 = if var39 and var39[value] and var39[value]:IsA("BindableEvent") then var39[value] else nil
				
				if var40 then
					t_2.SetCore[value] = var40
					
					if t_4[value] then
						for i, v in pairs(t_4[value]) do
							var40:Fire(v)
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

expChatModule.listenToDispatch(function(p24)
	-- upvalues: t (ref)
	if p24.type == "FocusChatHotKeyActivated" then
		t:SetVisible(true)
	end
end)
starterGuiService:RegisterSetCore("CoreGuiChatConnections", RegisterCoreGuiConnections)

return t