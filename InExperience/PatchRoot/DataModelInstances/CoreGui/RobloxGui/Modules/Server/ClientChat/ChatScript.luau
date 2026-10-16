local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))

local function DoEverything() --[[ Line: 16 ]]
	-- upvalues: ChatSettingsModule (copy)
	local ChatMainModule = require(script:WaitForChild("ChatMain"))
	local config = { ChatWindow = {}, SetCore = {}, GetCore = {} }
	config.ChatWindow.ChatTypes = {}
	config.ChatWindow.ChatTypes.BubbleChatEnabled = ChatSettingsModule.BubbleChatEnabled
	config.ChatWindow.ChatTypes.ClassicChatEnabled = ChatSettingsModule.ClassicChatEnabled
	
	local function _(Name) --[[ Line: 29 | Named "ConnectEvent" ]]
		-- upvalues: config (copy), ChatMainModule (copy)
		local BindableEvent = Instance.new("BindableEvent")
		BindableEvent.Name = Name
		config.ChatWindow[Name] = BindableEvent
		BindableEvent.Event:connect(function(...) --[[ Line: 34 ]]
			-- upvalues: ChatMainModule (upval), Name (copy)
			ChatMainModule[Name](ChatMainModule, ...)
		end)
	end
	
	local _ = function(Name) --[[ Line: 37 | Named "ConnectFunction" ]]
		-- upvalues: config (copy), ChatMainModule (copy)
		local BindableFunction = Instance.new("BindableFunction")
		BindableFunction.Name = Name
		config.ChatWindow[Name] = BindableFunction
		
		function BindableFunction.OnInvoke(...) --[[ Line: 42 ]]
			-- upvalues: ChatMainModule (upval), Name (copy)
			return ChatMainModule[Name](ChatMainModule, ...)
		end
	end
	
	local _ = function(Name) --[[ Line: 45 | Named "ReverseConnectEvent" ]]
		-- upvalues: config (copy), ChatMainModule (copy)
		local BindableEvent = Instance.new("BindableEvent")
		BindableEvent.Name = Name
		config.ChatWindow[Name] = BindableEvent
		ChatMainModule[Name]:connect(function(...) --[[ Line: 50 ]]
			-- upvalues: BindableEvent (copy)
			BindableEvent:Fire(...)
		end)
	end
	
	local _ = function(Name) --[[ Line: 53 | Named "ConnectSignal" ]]
		-- upvalues: config (copy), ChatMainModule (copy)
		local BindableEvent = Instance.new("BindableEvent")
		BindableEvent.Name = Name
		config.ChatWindow[Name] = BindableEvent
		BindableEvent.Event:connect(function(...) --[[ Line: 58 ]]
			-- upvalues: ChatMainModule (upval), Name (copy)
			ChatMainModule[Name]:fire(...)
		end)
	end
	
	local _ = function(Name) --[[ Line: 61 | Named "ConnectSetCore" ]]
		-- upvalues: config (copy), ChatMainModule (copy)
		local BindableEvent = Instance.new("BindableEvent")
		BindableEvent.Name = Name
		config.SetCore[Name] = BindableEvent
		BindableEvent.Event:connect(function(...) --[[ Line: 66 ]]
			-- upvalues: ChatMainModule (upval), Name (copy)
			ChatMainModule[Name .. "Event"]:fire(...)
		end)
	end
	
	local _ = function(Name) --[[ Line: 69 | Named "ConnectGetCore" ]]
		-- upvalues: config (copy), ChatMainModule (copy)
		local BindableFunction = Instance.new("BindableFunction")
		BindableFunction.Name = Name
		config.GetCore[Name] = BindableFunction
		
		function BindableFunction.OnInvoke(...) --[[ Line: 74 ]]
			-- upvalues: ChatMainModule (upval), Name (copy)
			return ChatMainModule["f" .. Name](...)
		end
	end
	
	local ToggleVisibility = Instance.new("BindableEvent")
	ToggleVisibility.Name = "ToggleVisibility"
	config.ChatWindow.ToggleVisibility = ToggleVisibility
	local Name = "ToggleVisibility"
	ToggleVisibility.Event:connect(function(...) --[[ Line: 34 ]]
		-- upvalues: ChatMainModule (copy), Name (copy)
		ChatMainModule[Name](ChatMainModule, ...)
	end)
	local SetVisible = Instance.new("BindableEvent")
	SetVisible.Name = "SetVisible"
	config.ChatWindow.SetVisible = SetVisible
	local Name1 = "SetVisible"
	SetVisible.Event:connect(function(...) --[[ Line: 34 ]]
		-- upvalues: ChatMainModule (copy), Name1 (copy)
		ChatMainModule[Name1](ChatMainModule, ...)
	end)
	local FocusChatBar = Instance.new("BindableEvent")
	FocusChatBar.Name = "FocusChatBar"
	config.ChatWindow.FocusChatBar = FocusChatBar
	local Name2 = "FocusChatBar"
	FocusChatBar.Event:connect(function(...) --[[ Line: 34 ]]
		-- upvalues: ChatMainModule (copy), Name2 (copy)
		ChatMainModule[Name2](ChatMainModule, ...)
	end)
	local EnterWhisperState = Instance.new("BindableEvent")
	EnterWhisperState.Name = "EnterWhisperState"
	config.ChatWindow.EnterWhisperState = EnterWhisperState
	local Name3 = "EnterWhisperState"
	EnterWhisperState.Event:connect(function(...) --[[ Line: 34 ]]
		-- upvalues: ChatMainModule (copy), Name3 (copy)
		ChatMainModule[Name3](ChatMainModule, ...)
	end)
	local GetVisibility = Instance.new("BindableFunction")
	GetVisibility.Name = "GetVisibility"
	config.ChatWindow.GetVisibility = GetVisibility
	local Name4 = "GetVisibility"
	
	function GetVisibility.OnInvoke(...) --[[ Line: 42 ]]
		-- upvalues: ChatMainModule (copy), Name4 (copy)
		return ChatMainModule[Name4](ChatMainModule, ...)
	end
	
	local GetMessageCount = Instance.new("BindableFunction")
	GetMessageCount.Name = "GetMessageCount"
	config.ChatWindow.GetMessageCount = GetMessageCount
	local Name5 = "GetMessageCount"
	
	function GetMessageCount.OnInvoke(...) --[[ Line: 42 ]]
		-- upvalues: ChatMainModule (copy), Name5 (copy)
		return ChatMainModule[Name5](ChatMainModule, ...)
	end
	
	local TopbarEnabledChanged = Instance.new("BindableEvent")
	TopbarEnabledChanged.Name = "TopbarEnabledChanged"
	config.ChatWindow.TopbarEnabledChanged = TopbarEnabledChanged
	local Name6 = "TopbarEnabledChanged"
	TopbarEnabledChanged.Event:connect(function(...) --[[ Line: 34 ]]
		-- upvalues: ChatMainModule (copy), Name6 (copy)
		ChatMainModule[Name6](ChatMainModule, ...)
	end)
	local IsFocused = Instance.new("BindableFunction")
	IsFocused.Name = "IsFocused"
	config.ChatWindow.IsFocused = IsFocused
	local Name7 = "IsFocused"
	
	function IsFocused.OnInvoke(...) --[[ Line: 42 ]]
		-- upvalues: ChatMainModule (copy), Name7 (copy)
		return ChatMainModule[Name7](ChatMainModule, ...)
	end
	
	local ChatBarFocusChanged = Instance.new("BindableEvent")
	ChatBarFocusChanged.Name = "ChatBarFocusChanged"
	config.ChatWindow.ChatBarFocusChanged = ChatBarFocusChanged
	ChatMainModule.ChatBarFocusChanged:connect(function(...) --[[ Line: 50 ]]
		-- upvalues: ChatBarFocusChanged (copy)
		ChatBarFocusChanged:Fire(...)
	end)
	local VisibilityStateChanged = Instance.new("BindableEvent")
	VisibilityStateChanged.Name = "VisibilityStateChanged"
	config.ChatWindow.VisibilityStateChanged = VisibilityStateChanged
	ChatMainModule.VisibilityStateChanged:connect(function(...) --[[ Line: 50 ]]
		-- upvalues: VisibilityStateChanged (copy)
		VisibilityStateChanged:Fire(...)
	end)
	local MessagesChanged = Instance.new("BindableEvent")
	MessagesChanged.Name = "MessagesChanged"
	config.ChatWindow.MessagesChanged = MessagesChanged
	ChatMainModule.MessagesChanged:connect(function(...) --[[ Line: 50 ]]
		-- upvalues: MessagesChanged (copy)
		MessagesChanged:Fire(...)
	end)
	local MessagePosted = Instance.new("BindableEvent")
	MessagePosted.Name = "MessagePosted"
	config.ChatWindow.MessagePosted = MessagePosted
	ChatMainModule.MessagePosted:connect(function(...) --[[ Line: 50 ]]
		-- upvalues: MessagePosted (copy)
		MessagePosted:Fire(...)
	end)
	local CoreGuiEnabled = Instance.new("BindableEvent")
	CoreGuiEnabled.Name = "CoreGuiEnabled"
	config.ChatWindow.CoreGuiEnabled = CoreGuiEnabled
	local Name8 = "CoreGuiEnabled"
	CoreGuiEnabled.Event:connect(function(...) --[[ Line: 58 ]]
		-- upvalues: ChatMainModule (copy), Name8 (copy)
		ChatMainModule[Name8]:fire(...)
	end)
	local ChatMakeSystemMessage = Instance.new("BindableEvent")
	ChatMakeSystemMessage.Name = "ChatMakeSystemMessage"
	config.SetCore.ChatMakeSystemMessage = ChatMakeSystemMessage
	local Name9 = "ChatMakeSystemMessage"
	ChatMakeSystemMessage.Event:connect(function(...) --[[ Line: 66 ]]
		-- upvalues: ChatMainModule (copy), Name9 (copy)
		ChatMainModule[Name9 .. "Event"]:fire(...)
	end)
	local ChatWindowPosition = Instance.new("BindableEvent")
	ChatWindowPosition.Name = "ChatWindowPosition"
	config.SetCore.ChatWindowPosition = ChatWindowPosition
	local Name10 = "ChatWindowPosition"
	ChatWindowPosition.Event:connect(function(...) --[[ Line: 66 ]]
		-- upvalues: ChatMainModule (copy), Name10 (copy)
		ChatMainModule[Name10 .. "Event"]:fire(...)
	end)
	local ChatWindowSize = Instance.new("BindableEvent")
	ChatWindowSize.Name = "ChatWindowSize"
	config.SetCore.ChatWindowSize = ChatWindowSize
	local Name11 = "ChatWindowSize"
	ChatWindowSize.Event:connect(function(...) --[[ Line: 66 ]]
		-- upvalues: ChatMainModule (copy), Name11 (copy)
		ChatMainModule[Name11 .. "Event"]:fire(...)
	end)
	local ChatWindowPosition1 = Instance.new("BindableFunction")
	ChatWindowPosition1.Name = "ChatWindowPosition"
	config.GetCore.ChatWindowPosition = ChatWindowPosition1
	local Name12 = "ChatWindowPosition"
	
	function ChatWindowPosition1.OnInvoke(...) --[[ Line: 74 ]]
		-- upvalues: ChatMainModule (copy), Name12 (copy)
		return ChatMainModule["f" .. Name12](...)
	end
	
	local ChatWindowSize1 = Instance.new("BindableFunction")
	ChatWindowSize1.Name = "ChatWindowSize"
	config.GetCore.ChatWindowSize = ChatWindowSize1
	local Name13 = "ChatWindowSize"
	
	function ChatWindowSize1.OnInvoke(...) --[[ Line: 74 ]]
		-- upvalues: ChatMainModule (copy), Name13 (copy)
		return ChatMainModule["f" .. Name13](...)
	end
	
	local ChatBarDisabled = Instance.new("BindableEvent")
	ChatBarDisabled.Name = "ChatBarDisabled"
	config.SetCore.ChatBarDisabled = ChatBarDisabled
	local Name14 = "ChatBarDisabled"
	ChatBarDisabled.Event:connect(function(...) --[[ Line: 66 ]]
		-- upvalues: ChatMainModule (copy), Name14 (copy)
		ChatMainModule[Name14 .. "Event"]:fire(...)
	end)
	local ChatBarDisabled1 = Instance.new("BindableFunction")
	ChatBarDisabled1.Name = "ChatBarDisabled"
	config.GetCore.ChatBarDisabled = ChatBarDisabled1
	local Name15 = "ChatBarDisabled"
	
	function ChatBarDisabled1.OnInvoke(...) --[[ Line: 74 ]]
		-- upvalues: ChatMainModule (copy), Name15 (copy)
		return ChatMainModule["f" .. Name15](...)
	end
	
	local SpecialKeyPressed = Instance.new("BindableEvent")
	SpecialKeyPressed.Name = "SpecialKeyPressed"
	config.ChatWindow.SpecialKeyPressed = SpecialKeyPressed
	local Name16 = "SpecialKeyPressed"
	SpecialKeyPressed.Event:connect(function(...) --[[ Line: 34 ]]
		-- upvalues: ChatMainModule (copy), Name16 (copy)
		ChatMainModule[Name16](ChatMainModule, ...)
	end)
	SetCoreGuiChatConnections(config)
end

function SetCoreGuiChatConnections(Value) --[[ Line: 107 ]]
	-- upvalues: StarterGui (copy)
	local Count = 0
	while Count < 10 do
		Count += 1
		local Success, Result = pcall(function() --[[ Line: 111 ]]
			-- upvalues: StarterGui (upval), Value (copy)
			StarterGui:SetCore("CoreGuiChatConnections", Value)
		end)
		
		if Success then break end
		if not Success and Count == 10 then
			error("Error calling SetCore CoreGuiChatConnections: " .. Result)
		end
		wait()
	end
end

function checkBothChatTypesDisabled(): boolean --[[ Line: 122 ]]
	-- upvalues: ChatSettingsModule (copy)
	return ChatSettingsModule.BubbleChatEnabled ~= nil and ChatSettingsModule.ClassicChatEnabled ~= nil and not (ChatSettingsModule.BubbleChatEnabled or ChatSettingsModule.ClassicChatEnabled)
end

if GuiService:IsTenFootInterface() then
	ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer()
	
	return
end
if checkBothChatTypesDisabled() then
	local config = { ChatWindow = {} }
	config.ChatWindow.ChatTypes = {}
	config.ChatWindow.ChatTypes.BubbleChatEnabled = false
	config.ChatWindow.ChatTypes.ClassicChatEnabled = false
	SetCoreGuiChatConnections(config)
	
	return
else
	DoEverything()
end