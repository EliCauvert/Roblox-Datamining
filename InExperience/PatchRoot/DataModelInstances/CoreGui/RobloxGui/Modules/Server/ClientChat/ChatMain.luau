local t = {
	Visible = nil,
	IsCoreGuiEnabled = nil,
	TopbarEnabled = nil,
	VisibilityStateChanged = nil
}
local var1 = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)

if ok then
	var1 = status
end
local _ = false
local ok_1, status_1 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local status_1_1 = ok_1 and status_1
local _ = nil
local ok_2, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAddBetterConsoleCheckForLegacyChat")
end)
local status_2_1 = ok_2 and status_2
local _ = game:GetService("RunService")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local chatService = game:GetService("Chat")
local starterGuiService = game:GetService("StarterGui")
local _ = game:GetService("ContextActionService")
local defaultChatSystemChatEvents = replicatedStorageService:WaitForChild("DefaultChatSystemChatEvents")
local defaultChatSystemChatEvents_1 = replicatedStorageService:WaitForChild("DefaultChatSystemChatEvents")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local utilModule = require(clientChatModules:WaitForChild("MessageCreatorModules"):WaitForChild("Util"))
local t_1 = nil
pcall(function()
	-- upvalues: t_1 (write)
	t_1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t_1 == nil then
	t_1 = {
		Get = function(_, _, p1)
			return p1
		end
	}
end
local childAddedConnection
local chatTranslationEnabled = nil

if status_1_1 then
	chatTranslationEnabled = script:FindFirstChild("ChatTranslationEnabled")
	
	if chatTranslationEnabled == nil then
		childAddedConnection = nil
		childAddedConnection = script.ChildAdded:Connect(function(p1)
			-- upvalues: chatTranslationEnabled (write), childAddedConnection (write)
			if p1.Name == "ChatTranslationEnabled" then
				chatTranslationEnabled = p1
				childAddedConnection:Disconnect()
			end
		end)
	end
end
childAddedConnection = 10
local t_2 = {
	OnNewMessage = "RemoteEvent",
	OnMessageDoneFiltering = "RemoteEvent",
	OnNewSystemMessage = "RemoteEvent",
	OnChannelJoined = "RemoteEvent",
	OnChannelLeft = "RemoteEvent",
	OnMuted = "RemoteEvent",
	OnUnmuted = "RemoteEvent",
	OnMainChannelSet = "RemoteEvent",
	SayMessageRequest = "RemoteEvent",
	GetInitDataRequest = "RemoteFunction"
}
local t_3 = {}
local bindableEvent = Instance.new("BindableEvent")

function TryRemoveChildWithVerifyingIsCorrectType(p1)
	-- upvalues: t_2 (ref), t_3 (ref), childAddedConnection (write)
	if t_2[p1.Name] and p1:IsA(t_2[p1.Name]) then
		t_2[p1.Name] = nil
		t_3[p1.Name] = p1
		childAddedConnection -= 1
	end
end

for i, v in pairs(defaultChatSystemChatEvents_1:GetChildren()) do
	TryRemoveChildWithVerifyingIsCorrectType(v)
end
if childAddedConnection > 0 then
	local childAddedConnection_1 = defaultChatSystemChatEvents_1.ChildAdded:connect(function(p1)
		-- upvalues: childAddedConnection (write), bindableEvent (ref)
		TryRemoveChildWithVerifyingIsCorrectType(p1)
		
		if childAddedConnection < 1 then
			bindableEvent:Fire()
		end
	end)
	bindableEvent.Event:wait()
	childAddedConnection_1:disconnect()
	bindableEvent:Destroy()
end
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local var2 = true
local var3 = if chatSettingsModule.ScreenGuiDisplayOrder ~= nil then chatSettingsModule.ScreenGuiDisplayOrder else 6
local playerGui = localPlayer:WaitForChild("PlayerGui")
local chat = Instance.new("ScreenGui")
chat.Name = "Chat"
chat.ResetOnSpawn = false
chat.DisplayOrder = var3
chat.Parent = playerGui

if status_2_1 and game:GetService("GuiService"):IsTenFootInterface() then
	chat.Enabled = false
end
local var4 = false
local _script = script
local chatWindowModule = require(_script:WaitForChild("ChatWindow"))
local chatBarModule = require(_script:WaitForChild("ChatBar"))
local channelsBarModule = require(_script:WaitForChild("ChannelsBar"))
local _ = require(_script:WaitForChild("MessageLabelCreator"))
local messageLogDisplayModule = require(_script:WaitForChild("MessageLogDisplay"))
local _ = require(_script:WaitForChild("ChatChannel"))
local commandProcessorModule = require(_script:WaitForChild("CommandProcessor"))
local var5 = chatWindowModule.new()
local var6 = channelsBarModule.new()
local var7 = messageLogDisplayModule.new()
local var8 = commandProcessorModule.new()
local var9 = chatBarModule.new(var8, var5)
var5:CreateGuiObjects(chat)
var5:RegisterChatBar(var9)
var5:RegisterChannelsBar(var6)
var5:RegisterMessageLogDisplay(var7)
utilModule:RegisterChatWindow(var5)
local messageSenderModule = require(_script:WaitForChild("MessageSender"))
messageSenderModule:RegisterSayMessageFunction(t_3.SayMessageRequest)

if userInputService.TouchEnabled then
	var9:SetTextLabelText(t_1:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"))
else
	var9:SetTextLabelText(t_1:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
end
spawn(function()
	-- upvalues: _script (ref), chatSettingsModule (ref), var5 (ref)
	local curveUtilModule = require(_script:WaitForChild("CurveUtil"))
	local var10 = 1 / (chatSettingsModule.ChatAnimationFPS or 20)
	local currentTime = tick()
	while true do
		local currentTime_1 = tick()
		local var11 = curveUtilModule:DeltaTimeToTimescale(currentTime_1 - currentTime)
		if var11 ~= 0 then
			var5:Update(var11)
		end
		currentTime = currentTime_1
		wait(var10)
	end
end)

function CheckIfPointIsInSquare(p1, p2, p3)
	return p2.X <= p1.X and (p1.X <= p3.X and (p2.Y <= p1.Y and p1.Y <= p3.Y))
end

local var12 = false
local var13 = false
local var14 = 0
local var15 = 0
local bindableEvent_1 = Instance.new("BindableEvent")
local bindableEvent_2 = Instance.new("BindableEvent")
local bindableEvent_3 = Instance.new("BindableEvent")

function DoBackgroundFadeIn(value)
	-- upvalues: var15 (write), var12 (write), bindableEvent_1 (ref), var5 (ref), chatSettingsModule (ref), var7 (ref), messageLogDisplayModule (ref)
	var15 = tick()
	var12 = false
	bindableEvent_1:Fire()
	var5:FadeInBackground(value or chatSettingsModule.ChatDefaultFadeDuration)
	
	if var5:GetCurrentChannel() then
		local scroller = var7.Scroller
		scroller.ScrollingEnabled = true
		scroller.ScrollBarThickness = messageLogDisplayModule.ScrollBarThickness
	end
end

function DoBackgroundFadeOut(value)
	-- upvalues: var15 (write), var12 (write), bindableEvent_1 (ref), var5 (ref), chatSettingsModule (ref), var7 (ref)
	var15 = tick()
	var12 = true
	bindableEvent_1:Fire()
	var5:FadeOutBackground(value or chatSettingsModule.ChatDefaultFadeDuration)
	
	if var5:GetCurrentChannel() then
		local scroller = var7.Scroller
		scroller.ScrollingEnabled = false
		scroller.ScrollBarThickness = 0
	end
end

function DoTextFadeIn(vectorA)
	-- upvalues: var14 (write), var13 (write), bindableEvent_1 (ref), var5 (ref), chatSettingsModule (ref)
	var14 = tick()
	var13 = false
	bindableEvent_1:Fire()
	var5:FadeInText((vectorA or chatSettingsModule.ChatDefaultFadeDuration) * 0)
end

function DoTextFadeOut(vectorA)
	-- upvalues: var14 (write), var13 (write), bindableEvent_1 (ref), var5 (ref), chatSettingsModule (ref)
	var14 = tick()
	var13 = true
	bindableEvent_1:Fire()
	var5:FadeOutText(vectorA or chatSettingsModule.ChatDefaultFadeDuration)
end

function DoFadeInFromNewInformation()
	-- upvalues: chatSettingsModule (ref)
	DoTextFadeIn()
	
	if chatSettingsModule.ChatShouldFadeInFromNewInformation then
		DoBackgroundFadeIn()
	end
end

function InstantFadeIn()
	DoBackgroundFadeIn(0)
	DoTextFadeIn(0)
end

function InstantFadeOut()
	DoBackgroundFadeOut(0)
	DoTextFadeOut(0)
end

local var16 = nil

function UpdateFadingForMouseState(p1)
	-- upvalues: var16 (write), bindableEvent_2 (ref), var9 (ref)
	var16 = p1
	bindableEvent_2:Fire()
	
	if var9:IsFocused() then return end
	if p1 then
		DoBackgroundFadeIn()
		DoTextFadeIn()
		
		return
	end
	DoBackgroundFadeIn()
end

spawn(function()
	-- upvalues: runService (ref), var16 (write), var9 (ref), bindableEvent_2 (ref), bindableEvent_3 (ref), var12 (write), var15 (write), chatSettingsModule (ref), var13 (write), var14 (write), bindableEvent_1 (ref)
	while true do
		runService.RenderStepped:wait()
		while var16 or var9:IsFocused() do
			if var16 then
				bindableEvent_2.Event:wait()
			end
			if var9:IsFocused() then
				bindableEvent_3.Event:wait()
			end
		end
		if var12 then
			if var13 then
				bindableEvent_1.Event:wait()
			elseif chatSettingsModule.ChatWindowTextFadeOutTime < tick() - var14 then
				DoTextFadeOut()
			end
		elseif chatSettingsModule.ChatWindowBackgroundFadeOutTime < tick() - var15 then
			DoBackgroundFadeOut()
		end
	end
end)

function getClassicChatEnabled()
	-- upvalues: chatSettingsModule (ref), playersService (ref)
	return if chatSettingsModule.ClassicChatEnabled == nil then playersService.ClassicChat else chatSettingsModule.ClassicChatEnabled
end

function getBubbleChatEnabled()
	-- upvalues: chatSettingsModule (ref), playersService (ref)
	return if chatSettingsModule.BubbleChatEnabled == nil then playersService.BubbleChat else chatSettingsModule.BubbleChatEnabled
end

function bubbleChatOnly()
	return not getClassicChatEnabled() and getBubbleChatEnabled()
end

function UpdateMousePosition(p1)
	-- upvalues: t (ref), chatSettingsModule (ref), var5 (ref), var16 (write)
	if not t.Visible or not t.IsCoreGuiEnabled or not t.TopbarEnabled and not chatSettingsModule.ChatOnWithTopBarOff then return end
	if bubbleChatOnly() then return end
	local absolutePosition = var5.GuiObject.AbsolutePosition
	local var17 = CheckIfPointIsInSquare(p1, absolutePosition, absolutePosition + var5.GuiObject.AbsoluteSize)
	
	if var17 ~= var16 then
		UpdateFadingForMouseState(var17)
	end
end

userInputService.InputChanged:connect(function(p1, _)
	if p1.UserInputType == Enum.UserInputType.MouseMovement then
		UpdateMousePosition(Vector2.new(p1.Position.X, p1.Position.Y))
	end
end)
userInputService.TouchTap:connect(function(p1, _)
	UpdateMousePosition(p1[1])
end)
userInputService.TouchMoved:connect(function(p1, _)
	UpdateMousePosition(Vector2.new(p1.Position.X, p1.Position.Y))
end)
userInputService.Changed:connect(function(p1)
	-- upvalues: userInputService (ref), var5 (ref), chat (ref)
	if p1 == "MouseBehavior" and userInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
		local absolutePosition = var5.GuiObject.AbsolutePosition
		
		if CheckIfPointIsInSquare(chat.AbsoluteSize / 2, absolutePosition, absolutePosition + var5.GuiObject.AbsoluteSize) then
			userInputService.MouseBehavior = Enum.MouseBehavior.Default
		end
	end
end)
UpdateFadingForMouseState(true)
UpdateFadingForMouseState(false)
local t_4 = {
	Signal = function()
		local t = {}
		local bindableEvent = Instance.new("BindableEvent")
		local var17 = nil
		local var18 = nil
		
		function t.fire(_, ...)
			-- upvalues: var17 (write), var18 (write), bindableEvent (ref)
			var17 = { ... }
			var18 = select("#", ...)
			bindableEvent:Fire()
		end
		
		function t.connect(_, p1)
			-- upvalues: bindableEvent (ref), var17 (write), var18 (write)
			if not p1 then
				error("connect(nil)", 2)
			end
			return bindableEvent.Event:connect(function()
				-- upvalues: p1 (ref), var17 (copy), var18 (copy)
				p1(unpack(var17, 1, var18))
			end)
		end
		
		function t.wait(_)
			-- upvalues: bindableEvent (ref), var17 (write), var18 (write)
			bindableEvent.Event:wait()
			assert(var17, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			
			return unpack(var17, 1, var18)
		end
		
		return t
	end
}

function SetVisibility(value)
	-- upvalues: var5 (ref), t (ref)
	var5:SetVisible(value)
	t.VisibilityStateChanged:fire(value)
	t.Visible = value
	
	if t.IsCoreGuiEnabled then
		if value then
			InstantFadeIn()
			
			return
		end
		InstantFadeOut()
	end
end

local DoChatBarFocus = nil
t.TopbarEnabled = true
t.MessageCount = 0
t.Visible = true
t.IsCoreGuiEnabled = true

function t.ToggleVisibility(_)
	-- upvalues: var5 (ref)
	SetVisibility(not var5:GetVisible())
end

function t.SetVisible(_, p1)
	-- upvalues: var5 (ref)
	if var5:GetVisible() ~= p1 then
		SetVisibility(p1)
	end
end

function t.FocusChatBar(_)
	-- upvalues: var9 (ref)
	var9:CaptureFocus()
end

function t.EnterWhisperState(_, p1)
	-- upvalues: var9 (ref)
	var9:EnterWhisperState(p1)
end

function t.GetVisibility(_)
	-- upvalues: var5 (ref)
	return var5:GetVisible()
end

function t.GetMessageCount(p1)
	return p1.MessageCount
end

function t.TopbarEnabledChanged(p1, p2)
	p1.TopbarEnabled = p2
	p1.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
end

function t.IsFocused(_, _)
	-- upvalues: var9 (ref)
	return var9:IsFocused()
end

t.ChatBarFocusChanged = t_4.Signal()
t.VisibilityStateChanged = t_4.Signal()
t.MessagesChanged = t_4.Signal()
t.MessagePosted = t_4.Signal()
t.CoreGuiEnabled = t_4.Signal()
t.ChatMakeSystemMessageEvent = t_4.Signal()
t.ChatWindowPositionEvent = t_4.Signal()
t.ChatWindowSizeEvent = t_4.Signal()
t.ChatBarDisabledEvent = t_4.Signal()

function t.fChatWindowPosition(_)
	-- upvalues: var5 (ref)
	return var5.GuiObject.Position
end

function t.fChatWindowSize(_)
	-- upvalues: var5 (ref)
	return var5.GuiObject.Size
end

function t.fChatBarDisabled(_)
	-- upvalues: var9 (ref)
	return not var9:GetEnabled()
end

function t.SpecialKeyPressed(_, p1, _)
	-- upvalues: var2 (write), DoChatBarFocus (write)
	if p1 == Enum.SpecialKey.ChatHotkey and var2 then
		DoChatBarFocus()
	end
end

t.CoreGuiEnabled:connect(function(p1)
	-- upvalues: t (ref), chatSettingsModule (ref), var5 (ref), var9 (ref)
	t.IsCoreGuiEnabled = p1
	local topbarEnabled = p1 and (t.TopbarEnabled or chatSettingsModule.ChatOnWithTopBarOff)
	var5:SetCoreGuiEnabled(topbarEnabled)
	
	if topbarEnabled then
		InstantFadeIn()
		
		return
	end
	var9:ReleaseFocus()
	InstantFadeOut()
end)

function trimTrailingSpaces(p1)
	local p21Count = #p1
	while p21Count > 0 and p1:find("^%s", p21Count) do
		p21Count -= 1
	end
	return p1:sub(1, p21Count)
end

t.ChatMakeSystemMessageEvent:connect(function(p2)
	-- upvalues: var4 (write), chatSettingsModule (ref), var5 (ref), chatConstantsModule (ref), var6 (ref), t (ref)
	if p2.Text and type(p2.Text) == "string" then
		while not var4 do
			wait()
		end
		local generalChannelName = chatSettingsModule.GeneralChannelName
		local var17 = var5:GetChannel(generalChannelName)
		
		if var17 then
			var17:AddMessageToChannel({
				ID = -1,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				OriginalChannel = generalChannelName,
				MessageLength = string.len(p2.Text),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p2.Text)),
				Message = trimTrailingSpaces(p2.Text),
				MessageType = chatConstantsModule.MessageTypeSetCore,
				Time = os.time(),
				ExtraData = p2
			})
			var6:UpdateMessagePostedInChannel(generalChannelName)
			t.MessageCount += 1
			t.MessagesChanged:fire(t.MessageCount)
		end
	end
end)
t.ChatBarDisabledEvent:connect(function(p3)
	-- upvalues: var2 (write), var9 (ref)
	if var2 then
		var9:SetEnabled(not p3)
		
		if p3 then
			var9:ReleaseFocus()
		end
	end
end)
t.ChatWindowSizeEvent:connect(function(p3)
	-- upvalues: var5 (ref)
	var5.GuiObject.Size = p3
end)
t.ChatWindowPositionEvent:connect(function(p3)
	-- upvalues: var5 (ref)
	var5.GuiObject.Position = p3
end)

DoChatBarFocus = function()
	-- upvalues: var5 (ref), var9 (ref), t (ref)
	if not var5:GetCoreGuiEnabled() then return end
	if not var9:GetEnabled() then return end
	if not var9:IsFocused() and var9:GetVisible() then
		t:SetVisible(true)
		InstantFadeIn()
		var9:CaptureFocus()
		t.ChatBarFocusChanged:fire(true)
	end
end

bindableEvent_3.Event:connect(function(p3)
	-- upvalues: t (ref)
	t.ChatBarFocusChanged:fire(p3)
end)

function DoSwitchCurrentChannel(p3)
	-- upvalues: var5 (ref)
	if var5:GetChannel(p3) then
		var5:SwitchCurrentChannel(p3)
	end
end

function SendMessageToSelfInTargetChannel(p3, p4, p5)
	-- upvalues: var5 (ref), chatConstantsModule (ref)
	local var18 = var5:GetChannel(p4)
	
	if var18 then
		var18:AddMessageToChannel({
			ID = -1,
			FromSpeaker = nil,
			SpeakerUserId = 0,
			IsFiltered = true,
			OriginalChannel = p4,
			MessageLength = string.len(p3),
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p3)),
			Message = trimTrailingSpaces(p3),
			MessageType = chatConstantsModule.MessageTypeSystem,
			Time = os.time(),
			ExtraData = p5
		})
	end
end

function chatBarFocused()
	-- upvalues: var16 (write), var13 (write), bindableEvent_3 (ref)
	if not var16 then
		DoBackgroundFadeIn()
		
		if var13 then
			DoTextFadeIn()
		end
	end
	bindableEvent_3:Fire(true)
end

function chatBarFocusLost(p3, _)
	-- upvalues: bindableEvent_3 (ref), var9 (ref), t (ref), var8 (ref), var5 (ref), chatSettingsModule (ref), messageSenderModule (ref)
	DoBackgroundFadeIn()
	bindableEvent_3:Fire(false)
	
	if p3 then
		local text = var9:GetTextBox().Text
		
		if var9:IsInCustomState() then
			local customMessage = var9:GetCustomMessage()
			
			if customMessage then
				text = customMessage
			end
			local var18 = var9:CustomStateProcessCompletedMessage(text)
			var9:ResetCustomState()
			
			if var18 then return end
		end
		var9:GetTextBox().Text = ""
		
		if text ~= "" then
			t.MessagePosted:fire(text)
			
			if not var8:ProcessCompletedChatMessage(text, var5) then
				if chatSettingsModule.DisallowedWhiteSpace then
					for i = 1, #chatSettingsModule.DisallowedWhiteSpace do
						text = if chatSettingsModule.DisallowedWhiteSpace[i] == "\t" then string.gsub(text, chatSettingsModule.DisallowedWhiteSpace[i], " ") else string.gsub(text, chatSettingsModule.DisallowedWhiteSpace[i], "")
					end
				end
				text = string.gsub(string.gsub(text, "\n", ""), "[ ]+", " ")
				local targetMessageChannel = var5:GetTargetMessageChannel()
				
				if targetMessageChannel then
					messageSenderModule:SendMessage(text, targetMessageChannel)
					
					return
				end
				messageSenderModule:SendMessage(text, nil)
			end
		end
	end
end

local t_5 = {}

function setupChatBarConnections()
	-- upvalues: t_5 (write), var9 (ref)
	for i = 1, #t_5 do
		t_5[i]:Disconnect()
	end
	t_5 = {}
	table.insert(t_5, var9:GetTextBox().FocusLost:connect(chatBarFocusLost))
	table.insert(t_5, var9:GetTextBox().Focused:connect(chatBarFocused))
end

setupChatBarConnections()
var9.GuiObjectsChanged:connect(setupChatBarConnections)

function getEchoMessagesInGeneral()
	-- upvalues: chatSettingsModule (ref)
	return chatSettingsModule.EchoMessagesInGeneralChannel == nil or chatSettingsModule.EchoMessagesInGeneralChannel
end

t_3.OnMessageDoneFiltering.OnClientEvent:connect(function(p4)
	-- upvalues: chatSettingsModule (ref), localPlayer (write), var5 (ref)
	if not chatSettingsModule.ShowUserOwnFilteredMessage and p4.FromSpeaker == localPlayer.Name then return end
	local originalChannel = p4.OriginalChannel
	local var19 = var5:GetChannel(originalChannel)
	
	if var19 then
		var19:UpdateMessageFiltered(p4)
	end
	if getEchoMessagesInGeneral() and chatSettingsModule.GeneralChannelName and originalChannel ~= chatSettingsModule.GeneralChannelName then
		local generalChannelNameChannel = var5:GetChannel(chatSettingsModule.GeneralChannelName)
		
		if generalChannelNameChannel then
			generalChannelNameChannel:UpdateMessageFiltered(p4)
		end
	end
end)
t_3.OnNewMessage.OnClientEvent:connect(function(p4, p5)
	-- upvalues: var5 (ref), localPlayer (write), var6 (ref), chatSettingsModule (ref), t (ref)
	local var19 = var5:GetChannel(p5)
	
	if var19 then
		var19:AddMessageToChannel(p4)
		
		if p4.FromSpeaker ~= localPlayer.Name then
			var6:UpdateMessagePostedInChannel(p5)
		end
		if getEchoMessagesInGeneral() and chatSettingsModule.GeneralChannelName and p5 ~= chatSettingsModule.GeneralChannelName then
			local generalChannelNameChannel = var5:GetChannel(chatSettingsModule.GeneralChannelName)
			
			if generalChannelNameChannel then
				generalChannelNameChannel:AddMessageToChannel(p4)
			end
		end
		t.MessageCount += 1
		t.MessagesChanged:fire(t.MessageCount)
		DoFadeInFromNewInformation()
	end
end)
t_3.OnNewSystemMessage.OnClientEvent:connect(function(p4, p5)
	-- upvalues: var5 (ref), var6 (ref), t (ref), chatSettingsModule (ref)
	p5 = p5 or "System"
	local var19 = var5:GetChannel(p5)
	
	if var19 then
		var19:AddMessageToChannel(p4)
		var6:UpdateMessagePostedInChannel(p5)
		t.MessageCount += 1
		t.MessagesChanged:fire(t.MessageCount)
		DoFadeInFromNewInformation()
		
		if getEchoMessagesInGeneral() and chatSettingsModule.GeneralChannelName and p5 ~= chatSettingsModule.GeneralChannelName then
			local generalChannelNameChannel = var5:GetChannel(chatSettingsModule.GeneralChannelName)
			
			if generalChannelNameChannel then
				generalChannelNameChannel:AddMessageToChannel(p4)
				
				return
			end
		end
	else
		warn(string.format("Just received system message for channel I'm not in [%s]", p5))
	end
end)

function HandleChannelJoined(p4, p5, p6, p7, p8, p9)
	-- upvalues: var5 (ref), chatSettingsModule (ref), var4 (write), var9 (ref), chatConstantsModule (ref), t_1 (write), status_1_1 (write), chatTranslationEnabled (write)
	if var5:GetChannel(p4) then
		var5:RemoveChannel(p4)
	end
	if p4 == chatSettingsModule.GeneralChannelName then
		var4 = true
	end
	if p7 then
		var9:SetChannelNameColor(p4, p7)
	end
	local var19 = var5:AddChannel(p4)
	
	if var19 then
		if p4 == chatSettingsModule.GeneralChannelName then
			DoSwitchCurrentChannel(p4)
		end
		if p6 then
			local var20 = if chatSettingsModule.MessageHistoryLengthPerChannel < #p6 then #p6 - chatSettingsModule.MessageHistoryLengthPerChannel else 1
			
			for i = var20, #p6 do
				var19:AddMessageToChannel(p6[i])
			end
			if getEchoMessagesInGeneral() and p8 and (chatSettingsModule.GeneralChannelName and p4 ~= chatSettingsModule.GeneralChannelName) then
				local generalChannelNameChannel = var5:GetChannel(chatSettingsModule.GeneralChannelName)
				
				if generalChannelNameChannel then
					generalChannelNameChannel:AddMessagesToChannelByTimeStamp(p6, var20)
				end
			end
		end
		if p5 ~= "" then
			local t = {
				ID = -1,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				ExtraData = nil,
				OriginalChannel = p4,
				MessageLength = string.len(p5),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p5)),
				Message = trimTrailingSpaces(p5),
				MessageType = chatConstantsModule.MessageTypeWelcome,
				Time = os.time()
			}
			var19:AddMessageToChannel(t)
			
			if getEchoMessagesInGeneral() and p9 and (not chatSettingsModule.ShowChannelsBar and p4 ~= chatSettingsModule.GeneralChannelName) then
				local generalChannelNameChannel = var5:GetChannel(chatSettingsModule.GeneralChannelName)
				
				if generalChannelNameChannel then
					generalChannelNameChannel:AddMessageToChannel(t)
				end
			end
		end
		local gameChatChatMainChatTranslationOnboarding = t_1:Get("GameChat_ChatMain_ChatTranslationOnboarding", "Text chat will be translated into your language. Tap the symbol in front of the message to see the original. You can turn off translations in the Settings menu.")
		
		if status_1_1 and gameChatChatMainChatTranslationOnboarding ~= "" and (p4 == chatSettingsModule.GeneralChannelName and chatTranslationEnabled ~= nil) and chatTranslationEnabled.Value then
			var19:AddMessageToChannel({
				ID = -2,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				ExtraData = nil,
				OriginalChannel = p4,
				MessageLength = string.len(gameChatChatMainChatTranslationOnboarding),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(gameChatChatMainChatTranslationOnboarding)),
				Message = trimTrailingSpaces(gameChatChatMainChatTranslationOnboarding),
				MessageType = chatConstantsModule.MessageTypeWelcome,
				Time = os.time()
			})
		end
		DoFadeInFromNewInformation()
	end
end

t_3.OnChannelJoined.OnClientEvent:connect(function(p10, p11, p12, p13)
	HandleChannelJoined(p10, p11, p12, p13, false, true)
end)
t_3.OnChannelLeft.OnClientEvent:connect(function(p10)
	-- upvalues: var5 (ref)
	var5:RemoveChannel(p10)
	DoFadeInFromNewInformation()
end)
t_3.OnMuted.OnClientEvent:connect(function(_) end)
t_3.OnUnmuted.OnClientEvent:connect(function(_) end)
t_3.OnMainChannelSet.OnClientEvent:connect(function(p10)
	DoSwitchCurrentChannel(p10)
end)
coroutine.wrap(function()
	-- upvalues: defaultChatSystemChatEvents (ref), var9 (ref)
	local channelNameColorUpdated = defaultChatSystemChatEvents:WaitForChild("ChannelNameColorUpdated", 5)
	
	if channelNameColorUpdated then
		channelNameColorUpdated.OnClientEvent:connect(function(p10, p11)
			-- upvalues: var9 (copy)
			var9:SetChannelNameColor(p10, p11)
		end)
	end
end)()
local var21 = nil
local var22 = nil
local var23 = nil
local var24 = nil
pcall(function()
	-- upvalues: var21 (write), starterGuiService (ref), var22 (write), var23 (write), var24 (write)
	var21 = starterGuiService:GetCore("PlayerBlockedEvent")
	var22 = starterGuiService:GetCore("PlayerMutedEvent")
	var23 = starterGuiService:GetCore("PlayerUnblockedEvent")
	var24 = starterGuiService:GetCore("PlayerUnmutedEvent")
end)

function SendSystemMessageToSelf(p10)
	-- upvalues: var5 (ref), chatConstantsModule (ref)
	local currentChannel = var5:GetCurrentChannel()
	
	if currentChannel then
		currentChannel:AddMessageToChannel({
			ID = -1,
			FromSpeaker = nil,
			SpeakerUserId = 0,
			IsFiltered = true,
			ExtraData = nil,
			OriginalChannel = currentChannel.Name,
			MessageLength = string.len(p10),
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p10)),
			Message = trimTrailingSpaces(p10),
			MessageType = chatConstantsModule.MessageTypeSystem,
			Time = os.time()
		})
	end
end

function MutePlayer(p10)
	-- upvalues: defaultChatSystemChatEvents (ref)
	local mutePlayerRequest = defaultChatSystemChatEvents:FindFirstChild("MutePlayerRequest")
	
	return if mutePlayerRequest then mutePlayerRequest:InvokeServer(p10.Name) else false
end
if var1 then
	local function _()
		-- upvalues: chatSettingsModule (ref)
		return if chatSettingsModule.ShowFriendJoinNotification == nil then false else chatSettingsModule.ShowFriendJoinNotification
	end
	
	if if chatSettingsModule.ShowFriendJoinNotification ~= nil then false else chatSettingsModule.ShowFriendJoinNotification then
		playersService.PlayerAdded:Connect(function(p10)
			-- upvalues: localPlayer (write), chatSettingsModule (ref), t_1 (write)
			local ok, status = pcall(function()
				-- upvalues: p10 (ref), localPlayer (copy)
				return p10:IsFriendsWith(localPlayer.UserId)
			end)
			
			if ok and status then
				local var25 = if chatSettingsModule.PlayerDisplayNamesEnabled then p10.DisplayName else p10.Name
				SendSystemMessageToSelf(t_1:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", var25), "RBX_NAME", var25))
			end
		end)
	end
end
function UnmutePlayer(p10)
	-- upvalues: defaultChatSystemChatEvents (ref)
	local unMutePlayerRequest = defaultChatSystemChatEvents:FindFirstChild("UnMutePlayerRequest")
	
	return if unMutePlayerRequest then unMutePlayerRequest:InvokeServer(p10.Name) else false
end
spawn(function()
	-- upvalues: localPlayer (write), starterGuiService (ref), defaultChatSystemChatEvents (ref)
	if localPlayer.UserId > 0 then
		pcall(function()
			-- upvalues: starterGuiService (copy), defaultChatSystemChatEvents (copy)
			local getBlockedUserIdsCore = starterGuiService:GetCore("GetBlockedUserIds")
			
			if #getBlockedUserIdsCore > 0 then
				local setBlockedUserIdsRequest = defaultChatSystemChatEvents:FindFirstChild("SetBlockedUserIdsRequest")
				
				if setBlockedUserIdsRequest then
					setBlockedUserIdsRequest:FireServer(getBlockedUserIdsCore)
				end
			end
		end)
	end
end)
spawn(function()
	-- upvalues: chatService (ref), localPlayer (write), var2 (write), runService (ref)
	local ok, status = pcall(function()
		-- upvalues: chatService (copy), localPlayer (copy)
		return chatService:CanUserChatAsync(localPlayer.UserId)
	end)
	
	if ok then
		var2 = runService:IsStudio() or status
	end
end)
local var25 = t_3.GetInitDataRequest:InvokeServer()

for i_1, v_1 in pairs(var25.Channels) do
	if v_1[1] == chatSettingsModule.GeneralChannelName then
		HandleChannelJoined(v_1[1], v_1[2], v_1[3], v_1[4], true, false)
	end
end
for i_1, v_2 in pairs(var25.Channels) do
	if v_2[1] ~= chatSettingsModule.GeneralChannelName then
		HandleChannelJoined(v_2[1], v_2[2], v_2[3], v_2[4], true, false)
	end
end
return t