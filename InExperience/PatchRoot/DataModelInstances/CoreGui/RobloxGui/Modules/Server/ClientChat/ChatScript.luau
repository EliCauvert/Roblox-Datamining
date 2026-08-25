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
	
	local function _(p0)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = p0
		t.ChatWindow[p0] = bindableEvent
		bindableEvent.Event:connect(function(...)
			-- upvalues: chatMainModule (copy), p0 (ref)
			chatMainModule[p0](chatMainModule, ...)
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
	
	local _ = function(p2)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableEvent = Instance.new("BindableEvent")
		bindableEvent.Name = p2
		t.ChatWindow[p2] = bindableEvent
		chatMainModule[p2]:connect(function(...)
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
	
	local _ = function(p3)
		-- upvalues: t (ref), chatMainModule (ref)
		local bindableFunction = Instance.new("BindableFunction")
		bindableFunction.Name = p3
		t.GetCore[p3] = bindableFunction
		
		function bindableFunction.OnInvoke(...)
			-- upvalues: chatMainModule (copy), p3 (ref)
			return chatMainModule["f" .. p3](...)
		end
	end
	
	local toggleVisibility = Instance.new("BindableEvent")
	toggleVisibility.Name = "ToggleVisibility"
	t.ChatWindow.ToggleVisibility = toggleVisibility
	local var9 = "ToggleVisibility"
	toggleVisibility.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var9 (ref)
		chatMainModule[var9](chatMainModule, ...)
	end)
	local setVisible = Instance.new("BindableEvent")
	setVisible.Name = "SetVisible"
	t.ChatWindow.SetVisible = setVisible
	local var11 = "SetVisible"
	setVisible.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var11 (ref)
		chatMainModule[var11](chatMainModule, ...)
	end)
	local focusChatBar = Instance.new("BindableEvent")
	focusChatBar.Name = "FocusChatBar"
	t.ChatWindow.FocusChatBar = focusChatBar
	local var13 = "FocusChatBar"
	focusChatBar.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var13 (ref)
		chatMainModule[var13](chatMainModule, ...)
	end)
	local enterWhisperState = Instance.new("BindableEvent")
	enterWhisperState.Name = "EnterWhisperState"
	t.ChatWindow.EnterWhisperState = enterWhisperState
	local var15 = "EnterWhisperState"
	enterWhisperState.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var15 (ref)
		chatMainModule[var15](chatMainModule, ...)
	end)
	local getVisibility = Instance.new("BindableFunction")
	getVisibility.Name = "GetVisibility"
	t.ChatWindow.GetVisibility = getVisibility
	local var17 = "GetVisibility"
	
	function getVisibility.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var17 (ref)
		return chatMainModule[var17](chatMainModule, ...)
	end
	
	local getMessageCount = Instance.new("BindableFunction")
	getMessageCount.Name = "GetMessageCount"
	t.ChatWindow.GetMessageCount = getMessageCount
	local var19 = "GetMessageCount"
	
	function getMessageCount.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var19 (ref)
		return chatMainModule[var19](chatMainModule, ...)
	end
	
	local topbarEnabledChanged = Instance.new("BindableEvent")
	topbarEnabledChanged.Name = "TopbarEnabledChanged"
	t.ChatWindow.TopbarEnabledChanged = topbarEnabledChanged
	local var21 = "TopbarEnabledChanged"
	topbarEnabledChanged.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var21 (ref)
		chatMainModule[var21](chatMainModule, ...)
	end)
	local isFocused = Instance.new("BindableFunction")
	isFocused.Name = "IsFocused"
	t.ChatWindow.IsFocused = isFocused
	local var23 = "IsFocused"
	
	function isFocused.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var23 (ref)
		return chatMainModule[var23](chatMainModule, ...)
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
	local var29 = "CoreGuiEnabled"
	coreGuiEnabled.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var29 (ref)
		chatMainModule[var29]:fire(...)
	end)
	local chatMakeSystemMessage = Instance.new("BindableEvent")
	chatMakeSystemMessage.Name = "ChatMakeSystemMessage"
	t.SetCore.ChatMakeSystemMessage = chatMakeSystemMessage
	local var31 = "ChatMakeSystemMessage"
	chatMakeSystemMessage.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var31 (ref)
		chatMainModule[var31 .. "Event"]:fire(...)
	end)
	local chatWindowPosition = Instance.new("BindableEvent")
	chatWindowPosition.Name = "ChatWindowPosition"
	t.SetCore.ChatWindowPosition = chatWindowPosition
	local var33 = "ChatWindowPosition"
	chatWindowPosition.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var33 (ref)
		chatMainModule[var33 .. "Event"]:fire(...)
	end)
	local chatWindowSize = Instance.new("BindableEvent")
	chatWindowSize.Name = "ChatWindowSize"
	t.SetCore.ChatWindowSize = chatWindowSize
	local var35 = "ChatWindowSize"
	chatWindowSize.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var35 (ref)
		chatMainModule[var35 .. "Event"]:fire(...)
	end)
	local chatWindowPosition_1 = Instance.new("BindableFunction")
	chatWindowPosition_1.Name = "ChatWindowPosition"
	t.GetCore.ChatWindowPosition = chatWindowPosition_1
	local var37 = "ChatWindowPosition"
	
	function chatWindowPosition_1.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var37 (ref)
		return chatMainModule["f" .. var37](...)
	end
	
	local chatWindowSize_1 = Instance.new("BindableFunction")
	chatWindowSize_1.Name = "ChatWindowSize"
	t.GetCore.ChatWindowSize = chatWindowSize_1
	local var39 = "ChatWindowSize"
	
	function chatWindowSize_1.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var39 (ref)
		return chatMainModule["f" .. var39](...)
	end
	
	local chatBarDisabled = Instance.new("BindableEvent")
	chatBarDisabled.Name = "ChatBarDisabled"
	t.SetCore.ChatBarDisabled = chatBarDisabled
	local var41 = "ChatBarDisabled"
	chatBarDisabled.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var41 (ref)
		chatMainModule[var41 .. "Event"]:fire(...)
	end)
	local chatBarDisabled_1 = Instance.new("BindableFunction")
	chatBarDisabled_1.Name = "ChatBarDisabled"
	t.GetCore.ChatBarDisabled = chatBarDisabled_1
	local var43 = "ChatBarDisabled"
	
	function chatBarDisabled_1.OnInvoke(...)
		-- upvalues: chatMainModule (ref), var43 (ref)
		return chatMainModule["f" .. var43](...)
	end
	
	local specialKeyPressed = Instance.new("BindableEvent")
	specialKeyPressed.Name = "SpecialKeyPressed"
	t.ChatWindow.SpecialKeyPressed = specialKeyPressed
	local var45 = "SpecialKeyPressed"
	specialKeyPressed.Event:connect(function(...)
		-- upvalues: chatMainModule (ref), var45 (ref)
		chatMainModule[var45](chatMainModule, ...)
	end)
	SetCoreGuiChatConnections(t)
end

function SetCoreGuiChatConnections(value)
	-- upvalues: starterGuiService (ref)
	local var52 = 0
	while var52 < 10 do
		var52 += 1
		local ok, status = pcall(function()
			-- upvalues: starterGuiService (copy), value (ref)
			starterGuiService:SetCore("CoreGuiChatConnections", value)
		end)
		
		if ok then break end
		if not ok and var52 == 10 then
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