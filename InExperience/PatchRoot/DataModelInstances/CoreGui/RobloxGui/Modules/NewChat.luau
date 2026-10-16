local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local IsChatVersionMatch = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
local Flag = false
local ClassicChat = Players.ClassicChat
local BubbleChat = Players.BubbleChat
local ChatUtilModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ChatUtil)
local CorePackages = game:GetService("CorePackages")
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagExpChatAlwaysRunTCSFunction = SharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagExpChatWindowSyncUnibar = SharedFlagsModule.FFlagExpChatWindowSyncUnibar
local TransparencyStore = ExpChatModule.Stores.GetTransparencyStore(false)

local function _(): boolean --[[ Line: 35 | Named "shouldForceLegacyChatToBeHidden" ]]
	-- upvalues: IsChatVersionMatch (ref), TextChatService (copy), GetFFlagExpChatAlwaysRunTCSFunction (copy)
	IsChatVersionMatch = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	return if GetFFlagExpChatAlwaysRunTCSFunction() then IsChatVersionMatch else false
end

local NewChatModule = {}
local config = {
	Visible = true,
	MessageCount = 0,
	TopbarEnabled = true,
	CoreGuiEnabled = true
}
local config1 = { ChatWindow = nil, GetCore = nil, SetCore = nil }
local EventConnections = {}
local t = {}

local _ = function(p1, p2, ClassName) --[[ Line: 62 | Named "FindInCollectionByKeyAndType" ]]
	return if p1 and p1[p2] and p1[p2]:IsA(ClassName) then p1[p2] else nil
end

local function DispatchEvent(p1, ...): boolean --[[ Line: 69 ]]
	-- upvalues: config1 (copy)
	local ChatWindow = config1.ChatWindow
	local ChatWindowEntry = if ChatWindow and ChatWindow[p1] and ChatWindow[p1]:IsA("BindableEvent") then ChatWindow[p1] else nil
	
	if ChatWindowEntry then
		ChatWindowEntry:Fire(...)
		
		return true
	else
		return false
	end
end

local function AttemptInvokeFunction(p1, ...) --[[ Line: 78 ]]
	-- upvalues: config1 (copy)
	local ChatWindow = config1.ChatWindow
	local ChatWindowEntry = if ChatWindow and ChatWindow[p1] and ChatWindow[p1]:IsA("BindableFunction") then ChatWindow[p1] else nil
	
	if ChatWindowEntry then
		return true, ChatWindowEntry:Invoke()
	else
		return false, nil
	end
end

local _ = function(ParameterName) --[[ Line: 87 | Named "DoConnectGetCore" ]]
	-- upvalues: StarterGui (copy), config1 (copy)
	StarterGui:RegisterGetCore(ParameterName, function(p1) --[[ Line: 88 ]]
		-- upvalues: config1 (upval), ParameterName (copy)
		local GetCore = config1.GetCore
		local GetCoreEntry = if GetCore and GetCore[ParameterName] and GetCore[ParameterName]:IsA("BindableFunction") then GetCore[ParameterName] else nil
		
		return if GetCoreEntry then GetCoreEntry:Invoke(p1) else nil
	end)
end

function NewChatModule:ToggleVisibility() --[[ Line: 99 ]]
	-- upvalues: config (copy), IsChatVersionMatch (ref), TextChatService (copy), GetFFlagExpChatAlwaysRunTCSFunction (copy), NewChatModule (copy), DispatchEvent (copy), FFlagExpChatWindowSyncUnibar (copy), ExpChatModule (copy), TransparencyStore (copy)
	config.Visible = not config.Visible
	IsChatVersionMatch = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if if GetFFlagExpChatAlwaysRunTCSFunction() then IsChatVersionMatch else false then
		NewChatModule.VisibilityStateChanged:fire(config.Visible)
	elseif not DispatchEvent("ToggleVisibility") then
		NewChatModule.VisibilityStateChanged:fire(config.Visible)
	end
	if not FFlagExpChatWindowSyncUnibar then
		ExpChatModule.Events.ChatTopBarButtonActivated(config.Visible)
	end
	if config.Visible then
		TransparencyStore.resetAllTransparency()
	end
	NewChatModule.ChatWindowToggled:fire(config.Visible)
end

function NewChatModule:SetVisible(Visible) --[[ Line: 121 ]]
	-- upvalues: config (copy), FFlagExpChatWindowSyncUnibar (copy), ExpChatModule (copy), TransparencyStore (copy), NewChatModule (copy), IsChatVersionMatch (ref), TextChatService (copy), GetFFlagExpChatAlwaysRunTCSFunction (copy), DispatchEvent (copy)
	config.Visible = Visible
	
	if not FFlagExpChatWindowSyncUnibar then
		ExpChatModule.Events.ChatTopBarButtonActivated(config.Visible)
	end
	if config.Visible then
		TransparencyStore.resetAllTransparency()
	end
	NewChatModule.ChatWindowToggled:fire(config.Visible)
	IsChatVersionMatch = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if if GetFFlagExpChatAlwaysRunTCSFunction() then IsChatVersionMatch else false then
		DispatchEvent("SetVisible", false)
		NewChatModule.VisibilityStateChanged:fire(false)
		
		return
	end
	if not DispatchEvent("SetVisible", config.Visible) then
		NewChatModule.VisibilityStateChanged:fire(config.Visible)
	end
end

function NewChatModule:FocusChatBar() --[[ Line: 144 ]]
	-- upvalues: DispatchEvent (copy), ExpChatModule (copy)
	DispatchEvent("FocusChatBar")
	ExpChatModule.Events.ChatTopBarFocusActivated()
end

function NewChatModule:FocusSelectChatBar(p1, p2) --[[ Line: 150 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), ExpChatModule (copy)
	if FFlagEnableConsoleExpControls then
		ExpChatModule.Events.ChatTopBarFocusSelect(p1, p2)
	end
end

function NewChatModule:EnterWhisperState(p1) --[[ Line: 156 ]]
	-- upvalues: DispatchEvent (copy)
	return DispatchEvent("EnterWhisperState", p1)
end

function NewChatModule:GetVisibility() --[[ Line: 160 ]]
	-- upvalues: AttemptInvokeFunction (copy), config (copy)
	local GetVisibility, GetVisibility2 = AttemptInvokeFunction("GetVisibility")
	
	return if GetVisibility then GetVisibility2 else config.Visible
end

function NewChatModule:GetMessageCount() --[[ Line: 169 ]]
	-- upvalues: AttemptInvokeFunction (copy), config (copy)
	local GetMessageCount, GetMessageCount2 = AttemptInvokeFunction("GetMessageCount")
	
	return if GetMessageCount then GetMessageCount2 else config.MessageCount
end

function NewChatModule:TopbarEnabledChanged(TopbarEnabled) --[[ Line: 178 ]]
	-- upvalues: config (copy), DispatchEvent (copy)
	config.TopbarEnabled = TopbarEnabled
	DispatchEvent("TopbarEnabledChanged", config.TopbarEnabled)
end

function NewChatModule:IsFocused(p1) --[[ Line: 183 ]]
	-- upvalues: AttemptInvokeFunction (copy)
	local IsFocused, IsFocused2 = AttemptInvokeFunction("IsFocused", p1)
	
	return if IsFocused then IsFocused2 else false
end

function NewChatModule:ClassicChatEnabled() --[[ Line: 192 ]]
	-- upvalues: ClassicChat (ref)
	return ClassicChat
end

function NewChatModule:IsBubbleChatOnly(): boolean --[[ Line: 196 ]]
	-- upvalues: BubbleChat (ref), ClassicChat (ref)
	return BubbleChat and not ClassicChat
end

function NewChatModule:IsDisabled(): boolean --[[ Line: 200 ]]
	-- upvalues: BubbleChat (ref), ClassicChat (ref)
	return not (BubbleChat or ClassicChat)
end

function SetInitialChatTypes(p1) --[[ Line: 204 ]]
	-- upvalues: Flag (ref), BubbleChat (ref), ClassicChat (ref), NewChatModule (copy)
	if Flag then return end
	Flag = true
	local BubbleChatEnabled = p1.BubbleChatEnabled
	local ClassicChatEnabled = p1.ClassicChatEnabled
	
	if type(BubbleChatEnabled) == "boolean" then
		BubbleChat = BubbleChatEnabled
	end
	if type(ClassicChatEnabled) == "boolean" then
		ClassicChat = ClassicChatEnabled
	end
	if not ClassicChat and not BubbleChat then
		NewChatModule.ChatDisabled:fire()
	end
	if BubbleChat and not ClassicChat then
		NewChatModule.BubbleChatOnlySet:fire()
	end
end

NewChatModule.ChatBarFocusChanged = ChatUtilModule.Signal()
NewChatModule.VisibilityStateChanged = ChatUtilModule.Signal()
NewChatModule.ChatWindowToggled = ChatUtilModule.Signal()
NewChatModule.MessagesChanged = ChatUtilModule.Signal()
NewChatModule.BubbleChatOnlySet = ChatUtilModule.Signal()
NewChatModule.ChatDisabled = ChatUtilModule.Signal()
local Chat = game:GetService("Chat")
Chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ Line: 237 ]]
	-- upvalues: Chat (copy), DispatchEvent (copy), NewChatModule (copy)
	if Chat.IsAutoMigrated and not DispatchEvent("SetVisible", false) then
		NewChatModule.VisibilityStateChanged:fire(false)
	end
end)
StarterGui.CoreGuiChangedSignal:connect(function(CoreGuiType, CoreGuiEnabled) --[[ Line: 246 ]]
	-- upvalues: config (copy), DispatchEvent (copy)
	if CoreGuiType == Enum.CoreGuiType.All or CoreGuiType == Enum.CoreGuiType.Chat then
		config.CoreGuiEnabled = CoreGuiEnabled
		DispatchEvent("CoreGuiEnabled", config.CoreGuiEnabled)
	end
end)
GuiService:AddSpecialKey(Enum.SpecialKey.ChatHotkey)
GuiService.SpecialKeyPressed:connect(function(Key, Modifiers) --[[ Line: 254 ]]
	-- upvalues: GuiService (copy), IsChatVersionMatch (ref), TextChatService (copy), GetFFlagExpChatAlwaysRunTCSFunction (copy), DispatchEvent (copy)
	if GuiService.MenuIsOpen then return end
	IsChatVersionMatch = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	
	if not (if GetFFlagExpChatAlwaysRunTCSFunction() then IsChatVersionMatch else false) then
		DispatchEvent("SpecialKeyPressed", Key, Modifiers)
	end
end)

function DoConnectSetCore(ParameterName) --[[ Line: 264 ]]
	-- upvalues: StarterGui (copy), config1 (copy), t (copy)
	StarterGui:RegisterSetCore(ParameterName, function(p1) --[[ Line: 265 ]]
		-- upvalues: config1 (upval), ParameterName (copy), t (upval)
		local SetCore = config1.SetCore
		local SetCoreEntry = if SetCore and SetCore[ParameterName] and SetCore[ParameterName]:IsA("BindableEvent") then SetCore[ParameterName] else nil
		
		if SetCoreEntry then
			SetCoreEntry:Fire(p1)
			
			return
		end
		if t[ParameterName] == nil then
			t[ParameterName] = {}
		end
		table.insert(t[ParameterName], p1)
	end)
end

DoConnectSetCore("ChatMakeSystemMessage")
DoConnectSetCore("ChatWindowPosition")
DoConnectSetCore("ChatWindowSize")
DoConnectSetCore("ChatBarDisabled")
local v1 = "ChatWindowPosition"
StarterGui:RegisterGetCore("ChatWindowPosition", function(p1) --[[ Line: 88 ]]
	-- upvalues: config1 (copy), v1 (copy)
	local GetCore = config1.GetCore
	local GetCoreEntry = if GetCore and GetCore[v1] and GetCore[v1]:IsA("BindableFunction") then GetCore[v1] else nil
	
	return if GetCoreEntry then GetCoreEntry:Invoke(p1) else nil
end)
local v2 = "ChatWindowSize"
StarterGui:RegisterGetCore("ChatWindowSize", function(p1) --[[ Line: 88 ]]
	-- upvalues: config1 (copy), v2 (copy)
	local GetCore = config1.GetCore
	local GetCoreEntry = if GetCore and GetCore[v2] and GetCore[v2]:IsA("BindableFunction") then GetCore[v2] else nil
	
	return if GetCoreEntry then GetCoreEntry:Invoke(p1) else nil
end)
local v3 = "ChatBarDisabled"
StarterGui:RegisterGetCore("ChatBarDisabled", function(p1) --[[ Line: 88 ]]
	-- upvalues: config1 (copy), v3 (copy)
	local GetCore = config1.GetCore
	local GetCoreEntry = if GetCore and GetCore[v3] and GetCore[v3]:IsA("BindableFunction") then GetCore[v3] else nil
	
	return if GetCoreEntry then GetCoreEntry:Invoke(p1) else nil
end)

local function RegisterCoreGuiConnections(p1) --[[ Line: 287 ]]
	-- upvalues: EventConnections (ref), config1 (copy), NewChatModule (copy), config (copy), t (copy)
	if type(p1) == "table" then
		local ChatWindow = p1.ChatWindow
		local SetCore = p1.SetCore
		local GetCore = p1.GetCore
		
		if type(ChatWindow) == "table" then
			for _, eventConnection in pairs(EventConnections) do
				eventConnection:disconnect()
			end
			if type(ChatWindow.ChatTypes) == "table" then
				SetInitialChatTypes(ChatWindow.ChatTypes)
			end
			EventConnections = {}
			config1.ChatWindow = {}
			config1.ChatWindow.ToggleVisibility = if ChatWindow and ChatWindow.ToggleVisibility and ChatWindow.ToggleVisibility:IsA("BindableEvent") then ChatWindow.ToggleVisibility else nil
			config1.ChatWindow.SetVisible = if ChatWindow and ChatWindow.SetVisible and ChatWindow.SetVisible:IsA("BindableEvent") then ChatWindow.SetVisible else nil
			config1.ChatWindow.FocusChatBar = if ChatWindow and ChatWindow.FocusChatBar and ChatWindow.FocusChatBar:IsA("BindableEvent") then ChatWindow.FocusChatBar else nil
			config1.ChatWindow.EnterWhisperState = if ChatWindow and ChatWindow.EnterWhisperState and ChatWindow.EnterWhisperState:IsA("BindableEvent") then ChatWindow.EnterWhisperState else nil
			config1.ChatWindow.TopbarEnabledChanged = if ChatWindow and ChatWindow.TopbarEnabledChanged and ChatWindow.TopbarEnabledChanged:IsA("BindableEvent") then ChatWindow.TopbarEnabledChanged else nil
			config1.ChatWindow.IsFocused = if ChatWindow and ChatWindow.IsFocused and ChatWindow.IsFocused:IsA("BindableFunction") then ChatWindow.IsFocused else nil
			config1.ChatWindow.SpecialKeyPressed = if ChatWindow and ChatWindow.SpecialKeyPressed and ChatWindow.SpecialKeyPressed:IsA("BindableEvent") then ChatWindow.SpecialKeyPressed else nil
			
			local function DoConnect(p2) --[[ Line: 320 ]]
				-- upvalues: config1 (upval), ChatWindow (copy), NewChatModule (upval), EventConnections (upval)
				config1.ChatWindow[p2] = if ChatWindow and ChatWindow[p2] and ChatWindow[p2]:IsA("BindableEvent") then ChatWindow[p2] else nil
				
				if config1.ChatWindow[p2] then
					table.insert(EventConnections, (config1.ChatWindow[p2].Event:connect(function(...) --[[ Line: 324 ]]
						-- upvalues: NewChatModule (upval), p2 (copy)
						NewChatModule[p2]:fire(...)
					end)))
				end
			end
			
			DoConnect("ChatBarFocusChanged")
			DoConnect("VisibilityStateChanged")
			DoConnect("ChatWindowToggled")
			DoConnect("MessagesChanged")
			config1.ChatWindow.MessagePosted = if ChatWindow and ChatWindow.MessagePosted and ChatWindow.MessagePosted:IsA("BindableEvent") then ChatWindow.MessagePosted else nil
			
			if config1.ChatWindow.MessagePosted then
				table.insert(EventConnections, (config1.ChatWindow.MessagePosted.Event:connect(function(Message) --[[ Line: 340 ]]
					game:GetService("Players"):Chat(Message)
				end)))
			end
			NewChatModule:SetVisible(config.Visible)
			NewChatModule:TopbarEnabledChanged(config.TopbarEnabled)
			local CoreGuiEnabled = if ChatWindow and (ChatWindow.CoreGuiEnabled and ChatWindow.CoreGuiEnabled:IsA("BindableEvent")) then ChatWindow.CoreGuiEnabled else nil
			
			if CoreGuiEnabled then
				config1.ChatWindow.CoreGuiEnabled = CoreGuiEnabled
				CoreGuiEnabled:Fire(config.CoreGuiEnabled)
			end
		else
			error("Table 'ChatWindow' must be provided!")
		end
		if type(SetCore) == "table" and type(GetCore) == "table" then
			config1.SetCore = {}
			config1.GetCore = {}
			
			local function addSetCore(Key) --[[ Line: 362 ]]
				-- upvalues: SetCore (copy), config1 (upval), t (upval)
				local SetCoreEntry = if SetCore and SetCore[Key] and SetCore[Key]:IsA("BindableEvent") then SetCore[Key] else nil
				
				if SetCoreEntry then
					config1.SetCore[Key] = SetCoreEntry
					
					if t[Key] then
						for _, value in pairs(t[Key]) do
							SetCoreEntry:Fire(value)
						end
						t[Key] = nil
					end
				end
			end
			
			addSetCore("ChatMakeSystemMessage")
			addSetCore("ChatWindowPosition")
			addSetCore("ChatWindowSize")
			addSetCore("ChatBarDisabled")
			config1.GetCore.ChatWindowPosition = if GetCore and GetCore.ChatWindowPosition and GetCore.ChatWindowPosition:IsA("BindableFunction") then GetCore.ChatWindowPosition else nil
			config1.GetCore.ChatWindowSize = if GetCore and GetCore.ChatWindowSize and GetCore.ChatWindowSize:IsA("BindableFunction") then GetCore.ChatWindowSize else nil
			config1.GetCore.ChatBarDisabled = if GetCore and GetCore.ChatBarDisabled and GetCore.ChatBarDisabled:IsA("BindableFunction") then GetCore.ChatBarDisabled else nil
			
			return
		elseif type(SetCore) ~= "nil" or type(GetCore) ~= "nil" then
			error("Both 'SetCore' and 'GetCore' must be tables if provided!")
		end
	end
end

ExpChatModule.listenToDispatch(function(p2) --[[ Line: 392 ]]
	-- upvalues: NewChatModule (copy)
	if p2.type == "FocusChatHotKeyActivated" then
		NewChatModule:SetVisible(true)
	end
end)
StarterGui:RegisterSetCore("CoreGuiChatConnections", RegisterCoreGuiConnections)

return NewChatModule