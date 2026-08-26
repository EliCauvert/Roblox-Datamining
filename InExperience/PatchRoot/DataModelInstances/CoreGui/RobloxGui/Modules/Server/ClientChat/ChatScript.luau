local starterGuiService = game:GetService("StarterGui")
local guiService = game:GetService("GuiService")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))

local function DoEverything()
	-- upvalues: chatSettingsModule (ref)
	local chatMainModule = require(script:WaitForChild("ChatMain"))
	local t = { ChatWindow = {}, SetCore = {}, GetCore = {} }
	t.ChatWindow.ChatTypes = {}
	t.ChatWindow.ChatTypes.BubbleChatEnabled = chatSettingsModule.BubbleChatEnabled
	t.ChatWindow.ChatTypes.ClassicChatEnabled = chatSettingsModule.ClassicChatEnabled
	
	local function _(p1)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = p1
		t.ChatWindow[p1] = bindableEvent
		bindableEvent.Event:connect(function(...)
			-- upvalues: chatMainModule (copy), p1 (ref)
			chatMainModule[p1](chatMainModule, ...)
		end)
	end
	
	local _ = function(p1)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableFunction = Instance.new("BindableFunction")
		bindableFunction.Name = p1
		t.ChatWindow[p1] = bindableFunction
		
		function bindableFunction.OnInvoke(...)
			-- upvalues: chatMainModule (copy), p1 (ref)
			return chatMainModule[p1](chatMainModule, ...)
		end
	end
	
	local _ = function(p1)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = p1
		t.ChatWindow[p1] = bindableEvent
		chatMainModule[p1]:connect(function(...)
			-- upvalues: bindableEvent (ref)
			bindableEvent:Fire(...)
		end)
	end
	
	local _ = function(value)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = value
		t.ChatWindow[value] = bindableEvent
		bindableEvent.Event:connect(function(...)
			-- upvalues: chatMainModule (copy), value (ref)
			chatMainModule[value]:fire(...)
		end)
	end
	
	local _ = function(value)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = value
		t.SetCore[value] = bindableEvent
		bindableEvent.Event:connect(function(...)
			-- upvalues: chatMainModule (copy), value (ref)
			chatMainModule[value .. "Event"]:fire(...)
		end)
	end
	
	local _ = function(p1)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableFunction = Instance.new("BindableFunction")
		bindableFunction.Name = p1
		t.GetCore[p1] = bindableFunction
		
		function bindableFunction.OnInvoke(...)
			-- upvalues: chatMainModule (copy), p1 (ref)
			return chatMainModule["f" .. p3](...)
		end
	end
	
	local toggleVisibility = Instance.new("BindableEvent")
	toggleVisibility.Name = "ToggleVisibility"
	t.ChatWindow.ToggleVisibility = toggleVisibility
	local var1 = "ToggleVisibility"
	toggleVisibility.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var1 (ref)
		chatMainModule[var1](chatMainModule, ...)
	end)
	local setVisible = Instance.new("BindableEvent")
	setVisible.Name = "SetVisible"
	t.ChatWindow.SetVisible = setVisible
	local var2 = "SetVisible"
	setVisible.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var2 (ref)
		chatMainModule[var2](chatMainModule, ...)
	end)
	local focusChatBar = Instance.new("BindableEvent")
	focusChatBar.Name = "FocusChatBar"
	t.ChatWindow.FocusChatBar = focusChatBar
	local var3 = "FocusChatBar"
	focusChatBar.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var3 (ref)
		chatMainModule[var3](chatMainModule, ...)
	end)
	local enterWhisperState = Instance.new("BindableEvent")
	enterWhisperState.Name = "EnterWhisperState"
	t.ChatWindow.EnterWhisperState = enterWhisperState
	local var4 = "EnterWhisperState"
	enterWhisperState.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var4 (ref)
		chatMainModule[var4](chatMainModule, ...)
	end)
	local getVisibility = Instance.new("BindableFunction")
	getVisibility.Name = "GetVisibility"
	t.ChatWindow.GetVisibility = getVisibility
	local var5 = "GetVisibility"
	
	function getVisibility.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var5 (ref)
		return chatMainModule[var5](chatMainModule, ...)
	end
	
	local getMessageCount = Instance.new("BindableFunction")
	getMessageCount.Name = "GetMessageCount"
	t.ChatWindow.GetMessageCount = getMessageCount
	local var6 = "GetMessageCount"
	
	function getMessageCount.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var6 (ref)
		return chatMainModule[var6](chatMainModule, ...)
	end
	
	local topbarEnabledChanged = Instance.new("BindableEvent")
	topbarEnabledChanged.Name = "TopbarEnabledChanged"
	t.ChatWindow.TopbarEnabledChanged = topbarEnabledChanged
	local var7 = "TopbarEnabledChanged"
	topbarEnabledChanged.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var7 (ref)
		chatMainModule[var7](chatMainModule, ...)
	end)
	local isFocused = Instance.new("BindableFunction")
	isFocused.Name = "IsFocused"
	t.ChatWindow.IsFocused = isFocused
	local var8 = "IsFocused"
	
	function isFocused.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var8 (ref)
		return chatMainModule[var8](chatMainModule, ...)
	end
	
	local chatBarFocusChanged = Instance.new("BindableEvent")
	chatBarFocusChanged.Name = "ChatBarFocusChanged"
	t.ChatWindow.ChatBarFocusChanged = chatBarFocusChanged
	chatMainModule.ChatBarFocusChanged:connect(function(...)
		-- upvalues: chatBarFocusChanged (ref)
		chatBarFocusChanged:Fire(...)
	end)
	local visibilityStateChanged = Instance.new("BindableEvent")
	visibilityStateChanged.Name = "VisibilityStateChanged"
	t.ChatWindow.VisibilityStateChanged = visibilityStateChanged
	chatMainModule.VisibilityStateChanged:connect(function(...)
		-- upvalues: visibilityStateChanged (ref)
		visibilityStateChanged:Fire(...)
	end)
	local messagesChanged = Instance.new("BindableEvent")
	messagesChanged.Name = "MessagesChanged"
	t.ChatWindow.MessagesChanged = messagesChanged
	chatMainModule.MessagesChanged:connect(function(...)
		-- upvalues: messagesChanged (ref)
		messagesChanged:Fire(...)
	end)
	local messagePosted = Instance.new("BindableEvent")
	messagePosted.Name = "MessagePosted"
	t.ChatWindow.MessagePosted = messagePosted
	chatMainModule.MessagePosted:connect(function(...)
		-- upvalues: messagePosted (ref)
		messagePosted:Fire(...)
	end)
	local coreGuiEnabled = Instance.new("BindableEvent")
	coreGuiEnabled.Name = "CoreGuiEnabled"
	t.ChatWindow.CoreGuiEnabled = coreGuiEnabled
	local var9 = "CoreGuiEnabled"
	coreGuiEnabled.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var9 (ref)
		chatMainModule[var9]:fire(...)
	end)
	local chatMakeSystemMessage = Instance.new("BindableEvent")
	chatMakeSystemMessage.Name = "ChatMakeSystemMessage"
	t.SetCore.ChatMakeSystemMessage = chatMakeSystemMessage
	local var10 = "ChatMakeSystemMessage"
	chatMakeSystemMessage.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var10 (ref)
		chatMainModule[var10 .. "Event"]:fire(...)
	end)
	local chatWindowPosition = Instance.new("BindableEvent")
	chatWindowPosition.Name = "ChatWindowPosition"
	t.SetCore.ChatWindowPosition = chatWindowPosition
	local var11 = "ChatWindowPosition"
	chatWindowPosition.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var11 (ref)
		chatMainModule[var11 .. "Event"]:fire(...)
	end)
	local chatWindowSize = Instance.new("BindableEvent")
	chatWindowSize.Name = "ChatWindowSize"
	t.SetCore.ChatWindowSize = chatWindowSize
	local var12 = "ChatWindowSize"
	chatWindowSize.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var12 (ref)
		chatMainModule[var12 .. "Event"]:fire(...)
	end)
	local chatWindowPosition_1 = Instance.new("BindableFunction")
	chatWindowPosition_1.Name = "ChatWindowPosition"
	t.GetCore.ChatWindowPosition = chatWindowPosition_1
	local var13 = "ChatWindowPosition"
	
	function chatWindowPosition_1.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var13 (ref)
		return chatMainModule["f" .. var37](...)
	end
	
	local chatWindowSize_1 = Instance.new("BindableFunction")
	chatWindowSize_1.Name = "ChatWindowSize"
	t.GetCore.ChatWindowSize = chatWindowSize_1
	local var14 = "ChatWindowSize"
	
	function chatWindowSize_1.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var14 (ref)
		return chatMainModule["f" .. var39](...)
	end
	
	local chatBarDisabled = Instance.new("BindableEvent")
	chatBarDisabled.Name = "ChatBarDisabled"
	t.SetCore.ChatBarDisabled = chatBarDisabled
	local var15 = "ChatBarDisabled"
	chatBarDisabled.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var15 (ref)
		chatMainModule[var15 .. "Event"]:fire(...)
	end)
	local chatBarDisabled_1 = Instance.new("BindableFunction")
	chatBarDisabled_1.Name = "ChatBarDisabled"
	t.GetCore.ChatBarDisabled = chatBarDisabled_1
	local var16 = "ChatBarDisabled"
	
	function chatBarDisabled_1.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var16 (ref)
		return chatMainModule["f" .. var43](...)
	end
	
	local specialKeyPressed = Instance.new("BindableEvent")
	specialKeyPressed.Name = "SpecialKeyPressed"
	t.ChatWindow.SpecialKeyPressed = specialKeyPressed
	local var17 = "SpecialKeyPressed"
	specialKeyPressed.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var17 (ref)
		chatMainModule[var17](chatMainModule, ...)
	end)
	SetCoreGuiChatConnections(t)
end

function SetCoreGuiChatConnections(value)
	-- upvalues: starterGuiService (ref)
	local var1 = 0
	while var1 < 10 do
		var1 += 1
		local ok, status = pcall(function()
			-- upvalues: starterGuiService (copy), value (ref)
			starterGuiService:SetCore("CoreGuiChatConnections", value)
		end)
		
		if ok then break end
		if not ok and var1 == 10 then
			error("Error calling SetCore CoreGuiChatConnections: " .. status)
		end
		wait()
	end
end

function checkBothChatTypesDisabled()
	-- upvalues: chatSettingsModule (ref)
	return if chatSettingsModule.BubbleChatEnabled == nil or chatSettingsModule.ClassicChatEnabled == nil then false else not (chatSettingsModule.BubbleChatEnabled or chatSettingsModule.ClassicChatEnabled)
end

if guiService:IsTenFootInterface() then
	replicatedStorageService:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer()
	
	return
elseif checkBothChatTypesDisabled() then
	local t = { ChatWindow = {} }
	t.ChatWindow.ChatTypes = {}
	t.ChatWindow.ChatTypes.BubbleChatEnabled = false
	t.ChatWindow.ChatTypes.ClassicChatEnabled = false
	SetCoreGuiChatConnections(t)
	
	return
end
DoEverything()