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
		Get = function(_, _, p0)
			return p0
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

function TryRemoveChildWithVerifyingIsCorrectType(p2)
	-- upvalues: t_2 (ref), t_3 (ref), childAddedConnection (write)
	if t_2[p2.Name] and p2:IsA(t_2[p2.Name]) then
		t_2[p2.Name] = nil
		t_3[p2.Name] = p2
		childAddedConnection -= 1
	end
end

for i, v in pairs(defaultChatSystemChatEvents_1:GetChildren()) do
	TryRemoveChildWithVerifyingIsCorrectType(v)
end
if childAddedConnection > 0 then
	local childAddedConnection_1 = defaultChatSystemChatEvents_1.ChildAdded:connect(function(p3)
		-- upvalues: childAddedConnection (write), bindableEvent (ref)
		TryRemoveChildWithVerifyingIsCorrectType(p3)
		
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
local var23 = true
local var24 = if chatSettingsModule.ScreenGuiDisplayOrder ~= nil then chatSettingsModule.ScreenGuiDisplayOrder else 6
local playerGui = localPlayer:WaitForChild("PlayerGui")
local chat = Instance.new("ScreenGui")
chat.Name = "Chat"
chat.ResetOnSpawn = false
chat.DisplayOrder = var24
chat.Parent = playerGui

if status_2_1 and game:GetService("GuiService"):IsTenFootInterface() then
	chat.Enabled = false
end
local var27 = false
local _script = script
local chatWindowModule = require(_script:WaitForChild("ChatWindow"))
local chatBarModule = require(_script:WaitForChild("ChatBar"))
local channelsBarModule = require(_script:WaitForChild("ChannelsBar"))
local _ = require(_script:WaitForChild("MessageLabelCreator"))
local messageLogDisplayModule = require(_script:WaitForChild("MessageLogDisplay"))
local _ = require(_script:WaitForChild("ChatChannel"))
local commandProcessorModule = require(_script:WaitForChild("CommandProcessor"))
local var34 = chatWindowModule.new()
local var35 = channelsBarModule.new()
local var36 = messageLogDisplayModule.new()
local var37 = commandProcessorModule.new()
local var38 = chatBarModule.new(var37, var34)
var34:CreateGuiObjects(chat)
var34:RegisterChatBar(var38)
var34:RegisterChannelsBar(var35)
var34:RegisterMessageLogDisplay(var36)
utilModule:RegisterChatWindow(var34)
local messageSenderModule = require(_script:WaitForChild("MessageSender"))
messageSenderModule:RegisterSayMessageFunction(t_3.SayMessageRequest)

if userInputService.TouchEnabled then
	var38:SetTextLabelText(t_1:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"))
else
	var38:SetTextLabelText(t_1:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
end
spawn(function()
	-- upvalues: _script (ref), chatSettingsModule (ref), var34 (ref)
	local curveUtilModule = require(_script:WaitForChild("CurveUtil"))
	local var57 = 1 / (chatSettingsModule.ChatAnimationFPS or 20)
	local currentTime = tick()
	while true do
		local currentTime_1 = tick()
		local var60 = curveUtilModule:DeltaTimeToTimescale(currentTime_1 - currentTime)
		if var60 ~= 0 then
			var34:Update(var60)
		end
		currentTime = currentTime_1
		wait(var57)
	end
end)

function CheckIfPointIsInSquare(p4, p5, p6)
	return p5.X <= p4.X and (p4.X <= p6.X and (p5.Y <= p4.Y and p4.Y <= p6.Y))
end

local var40 = false
local var41 = false
local var42 = 0
local var43 = 0
local bindableEvent_1 = Instance.new("BindableEvent")
local bindableEvent_2 = Instance.new("BindableEvent")
local bindableEvent_3 = Instance.new("BindableEvent")

function DoBackgroundFadeIn(value)
	-- upvalues: var43 (write), var40 (write), bindableEvent_1 (ref), var34 (ref), chatSettingsModule (ref), var36 (ref), messageLogDisplayModule (ref)
	var43 = tick()
	var40 = false
	bindableEvent_1:Fire()
	var34:FadeInBackground(value or chatSettingsModule.ChatDefaultFadeDuration)
	
	if var34:GetCurrentChannel() then
		local scroller = var36.Scroller
		scroller.ScrollingEnabled = true
		scroller.ScrollBarThickness = messageLogDisplayModule.ScrollBarThickness
	end
end

function DoBackgroundFadeOut(value)
	-- upvalues: var43 (write), var40 (write), bindableEvent_1 (ref), var34 (ref), chatSettingsModule (ref), var36 (ref)
	var43 = tick()
	var40 = true
	bindableEvent_1:Fire()
	var34:FadeOutBackground(value or chatSettingsModule.ChatDefaultFadeDuration)
	
	if var34:GetCurrentChannel() then
		local scroller = var36.Scroller
		scroller.ScrollingEnabled = false
		scroller.ScrollBarThickness = 0
	end
end

function DoTextFadeIn(vectorA)
	-- upvalues: var42 (write), var41 (write), bindableEvent_1 (ref), var34 (ref), chatSettingsModule (ref)
	var42 = tick()
	var41 = false
	bindableEvent_1:Fire()
	var34:FadeInText((vectorA or chatSettingsModule.ChatDefaultFadeDuration) * 0)
end

function DoTextFadeOut(vectorA)
	-- upvalues: var42 (write), var41 (write), bindableEvent_1 (ref), var34 (ref), chatSettingsModule (ref)
	var42 = tick()
	var41 = true
	bindableEvent_1:Fire()
	var34:FadeOutText(vectorA or chatSettingsModule.ChatDefaultFadeDuration)
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

local var47 = nil

function UpdateFadingForMouseState(p7)
	-- upvalues: var47 (write), bindableEvent_2 (ref), var38 (ref)
	var47 = p7
	bindableEvent_2:Fire()
	
	if var38:IsFocused() then return end
	if p7 then
		DoBackgroundFadeIn()
		DoTextFadeIn()
		
		return
	end
	DoBackgroundFadeIn()
end

spawn(function()
	-- upvalues: runService (ref), var47 (write), var38 (ref), bindableEvent_2 (ref), bindableEvent_3 (ref), var40 (write), var43 (write), chatSettingsModule (ref), var41 (write), var42 (write), bindableEvent_1 (ref)
	while true do
		runService.RenderStepped:wait()
		while var47 or var38:IsFocused() do
			if var47 then
				bindableEvent_2.Event:wait()
			end
			if var38:IsFocused() then
				bindableEvent_3.Event:wait()
			end
		end
		if var40 then
			if var41 then
				bindableEvent_1.Event:wait()
			elseif chatSettingsModule.ChatWindowTextFadeOutTime < tick() - var42 then
				DoTextFadeOut()
			end
		elseif chatSettingsModule.ChatWindowBackgroundFadeOutTime < tick() - var43 then
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

function UpdateMousePosition(p8)
	-- upvalues: t (ref), chatSettingsModule (ref), var34 (ref), var47 (write)
	if not t.Visible or not t.IsCoreGuiEnabled or not t.TopbarEnabled and not chatSettingsModule.ChatOnWithTopBarOff then return end
	if bubbleChatOnly() then return end
	local absolutePosition = var34.GuiObject.AbsolutePosition
	local var61 = CheckIfPointIsInSquare(p8, absolutePosition, absolutePosition + var34.GuiObject.AbsoluteSize)
	
	if var61 ~= var47 then
		UpdateFadingForMouseState(var61)
	end
end

userInputService.InputChanged:connect(function(p9, _)
	if p9.UserInputType == Enum.UserInputType.MouseMovement then
		UpdateMousePosition(Vector2.new(p9.Position.X, p9.Position.Y))
	end
end)
userInputService.TouchTap:connect(function(p10, _)
	UpdateMousePosition(p10[1])
end)
userInputService.TouchMoved:connect(function(p11, _)
	UpdateMousePosition(Vector2.new(p11.Position.X, p11.Position.Y))
end)
userInputService.Changed:connect(function(p12)
	-- upvalues: userInputService (ref), var34 (ref), chat (ref)
	if p12 == "MouseBehavior" and userInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
		local absolutePosition = var34.GuiObject.AbsolutePosition
		
		if CheckIfPointIsInSquare(chat.AbsoluteSize / 2, absolutePosition, absolutePosition + var34.GuiObject.AbsoluteSize) then
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
		local var64 = nil
		local var65 = nil
		
		function t.fire(_, ...)
			-- upvalues: var64 (write), var65 (write), bindableEvent (ref)
			var64 = { ... }
			var65 = select("#", ...)
			bindableEvent:Fire()
		end
		
		function t.connect(_, p13)
			-- upvalues: bindableEvent (ref), var64 (write), var65 (write)
			if not p13 then
				error("connect(nil)", 2)
			end
			return bindableEvent.Event:connect(function()
				-- upvalues: p13 (ref), var64 (copy), var65 (copy)
				p13(unpack(var64, 1, var65))
			end)
		end
		
		function t.wait(_)
			-- upvalues: bindableEvent (ref), var64 (write), var65 (write)
			bindableEvent.Event:wait()
			assert(var64, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			
			return unpack(var64, 1, var65)
		end
		
		return t
	end
}

function SetVisibility(value)
	-- upvalues: var34 (ref), t (ref)
	var34:SetVisible(value)
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
	-- upvalues: var34 (ref)
	SetVisibility(not var34:GetVisible())
end

function t.SetVisible(_, p14)
	-- upvalues: var34 (ref)
	if var34:GetVisible() ~= p14 then
		SetVisibility(p14)
	end
end

function t.FocusChatBar(_)
	-- upvalues: var38 (ref)
	var38:CaptureFocus()
end

function t.EnterWhisperState(_, p15)
	-- upvalues: var38 (ref)
	var38:EnterWhisperState(p15)
end

function t.GetVisibility(_)
	-- upvalues: var34 (ref)
	return var34:GetVisible()
end

function t.GetMessageCount(p16)
	return p16.MessageCount
end

function t.TopbarEnabledChanged(p17, p18)
	p17.TopbarEnabled = p18
	p17.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
end

function t.IsFocused(_, _)
	-- upvalues: var38 (ref)
	return var38:IsFocused()
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
	-- upvalues: var34 (ref)
	return var34.GuiObject.Position
end

function t.fChatWindowSize(_)
	-- upvalues: var34 (ref)
	return var34.GuiObject.Size
end

function t.fChatBarDisabled(_)
	-- upvalues: var38 (ref)
	return not var38:GetEnabled()
end

function t.SpecialKeyPressed(_, p19, _)
	-- upvalues: var23 (write), DoChatBarFocus (write)
	if p19 == Enum.SpecialKey.ChatHotkey and var23 then
		DoChatBarFocus()
	end
end

t.CoreGuiEnabled:connect(function(p20)
	-- upvalues: t (ref), chatSettingsModule (ref), var34 (ref), var38 (ref)
	t.IsCoreGuiEnabled = p20
	local topbarEnabled = p20 and (t.TopbarEnabled or chatSettingsModule.ChatOnWithTopBarOff)
	var34:SetCoreGuiEnabled(topbarEnabled)
	
	if topbarEnabled then
		InstantFadeIn()
		
		return
	end
	var38:ReleaseFocus()
	InstantFadeOut()
end)

function trimTrailingSpaces(p21)
	local p21Count = #p21
	while p21Count > 0 and p21:find("^%s", p21Count) do
		p21Count -= 1
	end
	return p21:sub(1, p21Count)
end

t.ChatMakeSystemMessageEvent:connect(function(p22)
	-- upvalues: var27 (write), chatSettingsModule (ref), var34 (ref), chatConstantsModule (ref), var35 (ref), t (ref)
	if p22.Text and type(p22.Text) == "string" then
		while not var27 do
			wait()
		end
		local generalChannelName = chatSettingsModule.GeneralChannelName
		local var68 = var34:GetChannel(generalChannelName)
		
		if var68 then
			var68:AddMessageToChannel({
				ID = -1,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				OriginalChannel = generalChannelName,
				MessageLength = string.len(p22.Text),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p22.Text)),
				Message = trimTrailingSpaces(p22.Text),
				MessageType = chatConstantsModule.MessageTypeSetCore,
				Time = os.time(),
				ExtraData = p22
			})
			var35:UpdateMessagePostedInChannel(generalChannelName)
			t.MessageCount += 1
			t.MessagesChanged:fire(t.MessageCount)
		end
	end
end)
t.ChatBarDisabledEvent:connect(function(p23)
	-- upvalues: var23 (write), var38 (ref)
	if var23 then
		var38:SetEnabled(not p23)
		
		if p23 then
			var38:ReleaseFocus()
		end
	end
end)
t.ChatWindowSizeEvent:connect(function(p24)
	-- upvalues: var34 (ref)
	var34.GuiObject.Size = p24
end)
t.ChatWindowPositionEvent:connect(function(p25)
	-- upvalues: var34 (ref)
	var34.GuiObject.Position = p25
end)

DoChatBarFocus = function()
	-- upvalues: var34 (ref), var38 (ref), t (ref)
	if not var34:GetCoreGuiEnabled() then return end
	if not var38:GetEnabled() then return end
	if not var38:IsFocused() and var38:GetVisible() then
		t:SetVisible(true)
		InstantFadeIn()
		var38:CaptureFocus()
		t.ChatBarFocusChanged:fire(true)
	end
end

bindableEvent_3.Event:connect(function(p26)
	-- upvalues: t (ref)
	t.ChatBarFocusChanged:fire(p26)
end)

function DoSwitchCurrentChannel(p27)
	-- upvalues: var34 (ref)
	if var34:GetChannel(p27) then
		var34:SwitchCurrentChannel(p27)
	end
end

function SendMessageToSelfInTargetChannel(p28, p29, p30)
	-- upvalues: var34 (ref), chatConstantsModule (ref)
	local var69 = var34:GetChannel(p29)
	
	if var69 then
		var69:AddMessageToChannel({
			ID = -1,
			FromSpeaker = nil,
			SpeakerUserId = 0,
			IsFiltered = true,
			OriginalChannel = p29,
			MessageLength = string.len(p28),
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p28)),
			Message = trimTrailingSpaces(p28),
			MessageType = chatConstantsModule.MessageTypeSystem,
			Time = os.time(),
			ExtraData = p30
		})
	end
end

function chatBarFocused()
	-- upvalues: var47 (write), var41 (write), bindableEvent_3 (ref)
	if not var47 then
		DoBackgroundFadeIn()
		
		if var41 then
			DoTextFadeIn()
		end
	end
	bindableEvent_3:Fire(true)
end

function chatBarFocusLost(p31, _)
	-- upvalues: bindableEvent_3 (ref), var38 (ref), t (ref), var37 (ref), var34 (ref), chatSettingsModule (ref), messageSenderModule (ref)
	DoBackgroundFadeIn()
	bindableEvent_3:Fire(false)
	
	if p31 then
		local text = var38:GetTextBox().Text
		
		if var38:IsInCustomState() then
			local customMessage = var38:GetCustomMessage()
			
			if customMessage then
				text = customMessage
			end
			local var71 = var38:CustomStateProcessCompletedMessage(text)
			var38:ResetCustomState()
			
			if var71 then return end
		end
		var38:GetTextBox().Text = ""
		
		if text ~= "" then
			t.MessagePosted:fire(text)
			
			if not var37:ProcessCompletedChatMessage(text, var34) then
				if chatSettingsModule.DisallowedWhiteSpace then
					for i = 1, #chatSettingsModule.DisallowedWhiteSpace do
						text = if chatSettingsModule.DisallowedWhiteSpace[i] == "\t" then string.gsub(text, chatSettingsModule.DisallowedWhiteSpace[i], " ") else string.gsub(text, chatSettingsModule.DisallowedWhiteSpace[i], "")
					end
				end
				text = string.gsub(string.gsub(text, "\n", ""), "[ ]+", " ")
				local targetMessageChannel = var34:GetTargetMessageChannel()
				
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
	-- upvalues: t_5 (write), var38 (ref)
	for i = 1, #t_5 do
		t_5[i]:Disconnect()
	end
	t_5 = {}
	table.insert(t_5, var38:GetTextBox().FocusLost:connect(chatBarFocusLost))
	table.insert(t_5, var38:GetTextBox().Focused:connect(chatBarFocused))
end

setupChatBarConnections()
var38.GuiObjectsChanged:connect(setupChatBarConnections)

function getEchoMessagesInGeneral()
	-- upvalues: chatSettingsModule (ref)
	return chatSettingsModule.EchoMessagesInGeneralChannel == nil or chatSettingsModule.EchoMessagesInGeneralChannel
end

t_3.OnMessageDoneFiltering.OnClientEvent:connect(function(p32)
	-- upvalues: chatSettingsModule (ref), localPlayer (write), var34 (ref)
	if not chatSettingsModule.ShowUserOwnFilteredMessage and p32.FromSpeaker == localPlayer.Name then return end
	local originalChannel = p32.OriginalChannel
	local var73 = var34:GetChannel(originalChannel)
	
	if var73 then
		var73:UpdateMessageFiltered(p32)
	end
	if getEchoMessagesInGeneral() and chatSettingsModule.GeneralChannelName and originalChannel ~= chatSettingsModule.GeneralChannelName then
		local generalChannelNameChannel = var34:GetChannel(chatSettingsModule.GeneralChannelName)
		
		if generalChannelNameChannel then
			generalChannelNameChannel:UpdateMessageFiltered(p32)
		end
	end
end)
t_3.OnNewMessage.OnClientEvent:connect(function(p33, p34)
	-- upvalues: var34 (ref), localPlayer (write), var35 (ref), chatSettingsModule (ref), t (ref)
	local var75 = var34:GetChannel(p34)
	
	if var75 then
		var75:AddMessageToChannel(p33)
		
		if p33.FromSpeaker ~= localPlayer.Name then
			var35:UpdateMessagePostedInChannel(p34)
		end
		if getEchoMessagesInGeneral() and chatSettingsModule.GeneralChannelName and p34 ~= chatSettingsModule.GeneralChannelName then
			local generalChannelNameChannel = var34:GetChannel(chatSettingsModule.GeneralChannelName)
			
			if generalChannelNameChannel then
				generalChannelNameChannel:AddMessageToChannel(p33)
			end
		end
		t.MessageCount += 1
		t.MessagesChanged:fire(t.MessageCount)
		DoFadeInFromNewInformation()
	end
end)
t_3.OnNewSystemMessage.OnClientEvent:connect(function(p35, p36)
	-- upvalues: var34 (ref), var35 (ref), t (ref), chatSettingsModule (ref)
	p36 = p36 or "System"
	local var77 = var34:GetChannel(p36)
	
	if var77 then
		var77:AddMessageToChannel(p35)
		var35:UpdateMessagePostedInChannel(p36)
		t.MessageCount += 1
		t.MessagesChanged:fire(t.MessageCount)
		DoFadeInFromNewInformation()
		
		if getEchoMessagesInGeneral() and chatSettingsModule.GeneralChannelName and p36 ~= chatSettingsModule.GeneralChannelName then
			local generalChannelNameChannel = var34:GetChannel(chatSettingsModule.GeneralChannelName)
			
			if generalChannelNameChannel then
				generalChannelNameChannel:AddMessageToChannel(p35)
				
				return
			end
		end
	else
		warn(string.format("Just received system message for channel I'm not in [%s]", p36))
	end
end)

function HandleChannelJoined(p37, p38, p39, p40, p41, p42)
	-- upvalues: var34 (ref), chatSettingsModule (ref), var27 (write), var38 (ref), chatConstantsModule (ref), t_1 (write), status_1_1 (write), chatTranslationEnabled (write)
	if var34:GetChannel(p37) then
		var34:RemoveChannel(p37)
	end
	if p37 == chatSettingsModule.GeneralChannelName then
		var27 = true
	end
	if p40 then
		var38:SetChannelNameColor(p37, p40)
	end
	local var79 = var34:AddChannel(p37)
	
	if var79 then
		if p37 == chatSettingsModule.GeneralChannelName then
			DoSwitchCurrentChannel(p37)
		end
		if p39 then
			local var80 = if chatSettingsModule.MessageHistoryLengthPerChannel < #p39 then #p39 - chatSettingsModule.MessageHistoryLengthPerChannel else 1
			
			for i = var80, #p39 do
				var79:AddMessageToChannel(p39[i])
			end
			if getEchoMessagesInGeneral() and p41 and (chatSettingsModule.GeneralChannelName and p37 ~= chatSettingsModule.GeneralChannelName) then
				local generalChannelNameChannel = var34:GetChannel(chatSettingsModule.GeneralChannelName)
				
				if generalChannelNameChannel then
					generalChannelNameChannel:AddMessagesToChannelByTimeStamp(p39, var80)
				end
			end
		end
		if p38 ~= "" then
			local t = {
				ID = -1,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				ExtraData = nil,
				OriginalChannel = p37,
				MessageLength = string.len(p38),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p38)),
				Message = trimTrailingSpaces(p38),
				MessageType = chatConstantsModule.MessageTypeWelcome,
				Time = os.time()
			}
			var79:AddMessageToChannel(t)
			
			if getEchoMessagesInGeneral() and p42 and (not chatSettingsModule.ShowChannelsBar and p37 ~= chatSettingsModule.GeneralChannelName) then
				local generalChannelNameChannel = var34:GetChannel(chatSettingsModule.GeneralChannelName)
				
				if generalChannelNameChannel then
					generalChannelNameChannel:AddMessageToChannel(t)
				end
			end
		end
		local gameChatChatMainChatTranslationOnboarding = t_1:Get("GameChat_ChatMain_ChatTranslationOnboarding", "Text chat will be translated into your language. Tap the symbol in front of the message to see the original. You can turn off translations in the Settings menu.")
		
		if status_1_1 and gameChatChatMainChatTranslationOnboarding ~= "" and (p37 == chatSettingsModule.GeneralChannelName and chatTranslationEnabled ~= nil) and chatTranslationEnabled.Value then
			var79:AddMessageToChannel({
				ID = -2,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				ExtraData = nil,
				OriginalChannel = p37,
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

t_3.OnChannelJoined.OnClientEvent:connect(function(p43, p44, p45, p46)
	HandleChannelJoined(p43, p44, p45, p46, false, true)
end)
t_3.OnChannelLeft.OnClientEvent:connect(function(p47)
	-- upvalues: var34 (ref)
	var34:RemoveChannel(p47)
	DoFadeInFromNewInformation()
end)
t_3.OnMuted.OnClientEvent:connect(function(_) end)
t_3.OnUnmuted.OnClientEvent:connect(function(_) end)
t_3.OnMainChannelSet.OnClientEvent:connect(function(p48)
	DoSwitchCurrentChannel(p48)
end)
coroutine.wrap(function()
	-- upvalues: defaultChatSystemChatEvents (ref), var38 (ref)
	local channelNameColorUpdated = defaultChatSystemChatEvents:WaitForChild("ChannelNameColorUpdated", 5)
	
	if channelNameColorUpdated then
		channelNameColorUpdated.OnClientEvent:connect(function(p49, p50)
			-- upvalues: var38 (copy)
			var38:SetChannelNameColor(p49, p50)
		end)
	end
end)()
local var51 = nil
local var52 = nil
local var53 = nil
local var54 = nil
pcall(function()
	-- upvalues: var51 (write), starterGuiService (ref), var52 (write), var53 (write), var54 (write)
	var51 = starterGuiService:GetCore("PlayerBlockedEvent")
	var52 = starterGuiService:GetCore("PlayerMutedEvent")
	var53 = starterGuiService:GetCore("PlayerUnblockedEvent")
	var54 = starterGuiService:GetCore("PlayerUnmutedEvent")
end)

function SendSystemMessageToSelf(p51)
	-- upvalues: var34 (ref), chatConstantsModule (ref)
	local currentChannel = var34:GetCurrentChannel()
	
	if currentChannel then
		currentChannel:AddMessageToChannel({
			ID = -1,
			FromSpeaker = nil,
			SpeakerUserId = 0,
			IsFiltered = true,
			ExtraData = nil,
			OriginalChannel = currentChannel.Name,
			MessageLength = string.len(p51),
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p51)),
			Message = trimTrailingSpaces(p51),
			MessageType = chatConstantsModule.MessageTypeSystem,
			Time = os.time()
		})
	end
end

function MutePlayer(p52)
	-- upvalues: defaultChatSystemChatEvents (ref)
	local mutePlayerRequest = defaultChatSystemChatEvents:FindFirstChild("MutePlayerRequest")
	
	return if mutePlayerRequest then mutePlayerRequest:InvokeServer(p52.Name) else false
end
if var1 then
	local function _()
		-- upvalues: chatSettingsModule (ref)
		return if chatSettingsModule.ShowFriendJoinNotification == nil then false else chatSettingsModule.ShowFriendJoinNotification
	end
	
	if if chatSettingsModule.ShowFriendJoinNotification ~= nil then false else chatSettingsModule.ShowFriendJoinNotification then
		playersService.PlayerAdded:Connect(function(p53)
			-- upvalues: localPlayer (write), chatSettingsModule (ref), t_1 (write)
			local ok, status = pcall(function()
				-- upvalues: p53 (ref), localPlayer (copy)
				return p53:IsFriendsWith(localPlayer.UserId)
			end)
			
			if ok and status then
				local var88 = if chatSettingsModule.PlayerDisplayNamesEnabled then p53.DisplayName else p53.Name
				SendSystemMessageToSelf(t_1:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", var88), "RBX_NAME", var88))
			end
		end)
	end
end
function UnmutePlayer(p54)
	-- upvalues: defaultChatSystemChatEvents (ref)
	local unMutePlayerRequest = defaultChatSystemChatEvents:FindFirstChild("UnMutePlayerRequest")
	
	return if unMutePlayerRequest then unMutePlayerRequest:InvokeServer(p54.Name) else false
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
	-- upvalues: chatService (ref), localPlayer (write), var23 (write), runService (ref)
	local ok, status = pcall(function()
		-- upvalues: chatService (copy), localPlayer (copy)
		return chatService:CanUserChatAsync(localPlayer.UserId)
	end)
	
	if ok then
		var23 = runService:IsStudio() or status
	end
end)
local var55 = t_3.GetInitDataRequest:InvokeServer()

for i_1, v_1 in pairs(var55.Channels) do
	if v_1[1] == chatSettingsModule.GeneralChannelName then
		HandleChannelJoined(v_1[1], v_1[2], v_1[3], v_1[4], true, false)
	end
end
for i_1, v_2 in pairs(var55.Channels) do
	if v_2[1] ~= chatSettingsModule.GeneralChannelName then
		HandleChannelJoined(v_2[1], v_2[2], v_2[3], v_2[4], true, false)
	end
end
return t