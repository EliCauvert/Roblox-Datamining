local ChatMainModule = {
	Visible = nil,
	IsCoreGuiEnabled = nil,
	TopbarEnabled = nil,
	VisibilityStateChanged = nil
}
local v1 = false
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)

if Success then
	v1 = Result
end
local Result1_1 = false
local Success1, Result1 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
Result1_1 = Success1 and Result1
local Success2, Result2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAddBetterConsoleCheckForLegacyChat")
end)
local Result2_1 = Success2 and Result2
local _ = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Chat = game:GetService("Chat")
local StarterGui = game:GetService("StarterGui")
local _ = game:GetService("ContextActionService")
local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
local DefaultChatSystemChatEvents1 = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local UtilModule = require(ClientChatModules:WaitForChild("MessageCreatorModules"):WaitForChild("Util"))
local ChatLocalizationModule = nil
pcall(function()
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {
		Get = function(_, _, Formatted)
			return Formatted
		end
	}
end
local ChatTranslationEnabled = nil

if Result1_1 then
	ChatTranslationEnabled = script:FindFirstChild("ChatTranslationEnabled")
	
	if ChatTranslationEnabled == nil then
		local Connection = nil
		Connection = script.ChildAdded:Connect(function(Child)
			-- upvalues: ChatTranslationEnabled (ref), Connection (ref)
			if Child.Name == "ChatTranslationEnabled" then
				ChatTranslationEnabled = Child
				Connection:Disconnect()
			end
		end)
	end
end
local Count = 10
local config = {
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
local t = {}
local BindableEvent = Instance.new("BindableEvent")

function TryRemoveChildWithVerifyingIsCorrectType(Object)
	-- upvalues: config (copy), t (copy), Count (ref)
	if config[Object.Name] and Object:IsA(config[Object.Name]) then
		config[Object.Name] = nil
		t[Object.Name] = Object
		Count -= 1
	end
end

for _, child in pairs(DefaultChatSystemChatEvents1:GetChildren()) do
	TryRemoveChildWithVerifyingIsCorrectType(child)
end
if Count > 0 then
	local ChildAddedConnection = DefaultChatSystemChatEvents1.ChildAdded:connect(function(Child)
		-- upvalues: Count (ref), BindableEvent (copy)
		TryRemoveChildWithVerifyingIsCorrectType(Child)
		
		if Count < 1 then
			BindableEvent:Fire()
		end
	end)
	BindableEvent.Event:wait()
	ChildAddedConnection:disconnect()
	BindableEvent:Destroy()
end
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local IsStudio = true
local Chat1 = Instance.new("ScreenGui")
Chat1.Name = "Chat"
Chat1.ResetOnSpawn = false
Chat1.DisplayOrder = if ChatSettingsModule.ScreenGuiDisplayOrder == nil then 6 else ChatSettingsModule.ScreenGuiDisplayOrder
Chat1.Parent = LocalPlayer:WaitForChild("PlayerGui")

if Result2_1 and game:GetService("GuiService"):IsTenFootInterface() then
	Chat1.Enabled = false
end
local Flag = false
local Object = script
local _ = require(Object:WaitForChild("MessageLabelCreator"))
local MessageLogDisplayModule = require(Object:WaitForChild("MessageLogDisplay"))
local _ = require(Object:WaitForChild("ChatChannel"))
local NewResult = require(Object:WaitForChild("ChatWindow")).new()
local NewResult1 = require(Object:WaitForChild("ChannelsBar")).new()
local NewMessageLogDisplay = MessageLogDisplayModule.new()
local NewResult2 = require(Object:WaitForChild("CommandProcessor")).new()
local NewResult3 = require(Object:WaitForChild("ChatBar")).new(NewResult2, NewResult)
NewResult:CreateGuiObjects(Chat1)
NewResult:RegisterChatBar(NewResult3)
NewResult:RegisterChannelsBar(NewResult1)
NewResult:RegisterMessageLogDisplay(NewMessageLogDisplay)
UtilModule:RegisterChatWindow(NewResult)
local MessageSenderModule = require(Object:WaitForChild("MessageSender"))
MessageSenderModule:RegisterSayMessageFunction(t.SayMessageRequest)

if UserInputService.TouchEnabled then
	NewResult3:SetTextLabelText(ChatLocalizationModule:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"))
else
	NewResult3:SetTextLabelText(ChatLocalizationModule:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
end
spawn(function()
	-- upvalues: Object (copy), ChatSettingsModule (copy), NewResult (copy)
	local CurveUtilModule = require(Object:WaitForChild("CurveUtil"))
	local v2 = 1 / (ChatSettingsModule.ChatAnimationFPS or 20)
	local CurrentTime = tick()
	while true do
		local CurrentTime1 = tick()
		local DeltaTimeToTimescaleResult = CurveUtilModule:DeltaTimeToTimescale(CurrentTime1 - CurrentTime)
		if DeltaTimeToTimescaleResult ~= 0 then
			NewResult:Update(DeltaTimeToTimescaleResult)
		end
		CurrentTime = CurrentTime1
		wait(v2)
	end
end)

function CheckIfPointIsInSquare(Vector, Vector1, Vector3): boolean
	return Vector1.X <= Vector.X and (Vector.X <= Vector3.X and Vector1.Y <= Vector.Y) and Vector.Y <= Vector3.Y
end

local Flag1 = false
local Flag2 = false
local CurrentTime = 0
local CurrentTime1 = 0
local BindableEvent1 = Instance.new("BindableEvent")
local BindableEvent2 = Instance.new("BindableEvent")
local BindableEvent3 = Instance.new("BindableEvent")

function DoBackgroundFadeIn(p1)
	-- upvalues: CurrentTime1 (ref), Flag1 (ref), BindableEvent1 (copy), NewResult (copy), ChatSettingsModule (copy), NewMessageLogDisplay (copy), MessageLogDisplayModule (copy)
	CurrentTime1 = tick()
	Flag1 = false
	BindableEvent1:Fire()
	NewResult:FadeInBackground(p1 or ChatSettingsModule.ChatDefaultFadeDuration)
	
	if NewResult:GetCurrentChannel() then
		local Scroller = NewMessageLogDisplay.Scroller
		Scroller.ScrollingEnabled = true
		Scroller.ScrollBarThickness = MessageLogDisplayModule.ScrollBarThickness
	end
end

function DoBackgroundFadeOut(p1)
	-- upvalues: CurrentTime1 (ref), Flag1 (ref), BindableEvent1 (copy), NewResult (copy), ChatSettingsModule (copy), NewMessageLogDisplay (copy)
	CurrentTime1 = tick()
	Flag1 = true
	BindableEvent1:Fire()
	NewResult:FadeOutBackground(p1 or ChatSettingsModule.ChatDefaultFadeDuration)
	
	if NewResult:GetCurrentChannel() then
		local Scroller = NewMessageLogDisplay.Scroller
		Scroller.ScrollingEnabled = false
		Scroller.ScrollBarThickness = 0
	end
end

function DoTextFadeIn(p1)
	-- upvalues: CurrentTime (ref), Flag2 (ref), BindableEvent1 (copy), NewResult (copy), ChatSettingsModule (copy)
	CurrentTime = tick()
	Flag2 = false
	BindableEvent1:Fire()
	NewResult:FadeInText((p1 or ChatSettingsModule.ChatDefaultFadeDuration) * 0)
end

function DoTextFadeOut(p1)
	-- upvalues: CurrentTime (ref), Flag2 (ref), BindableEvent1 (copy), NewResult (copy), ChatSettingsModule (copy)
	CurrentTime = tick()
	Flag2 = true
	BindableEvent1:Fire()
	NewResult:FadeOutText(p1 or ChatSettingsModule.ChatDefaultFadeDuration)
end

function DoFadeInFromNewInformation()
	-- upvalues: ChatSettingsModule (copy)
	DoTextFadeIn()
	
	if ChatSettingsModule.ChatShouldFadeInFromNewInformation then
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

local v3 = nil

function UpdateFadingForMouseState(p1)
	-- upvalues: v3 (ref), BindableEvent2 (copy), NewResult3 (copy)
	v3 = p1
	BindableEvent2:Fire()
	
	if NewResult3:IsFocused() then return end
	if p1 then
		DoBackgroundFadeIn()
		DoTextFadeIn()
		
		return
	else
		DoBackgroundFadeIn()
	end
end

spawn(function()
	-- upvalues: RunService (copy), v3 (ref), NewResult3 (copy), BindableEvent2 (copy), BindableEvent3 (copy), Flag1 (ref), CurrentTime1 (ref), ChatSettingsModule (copy), Flag2 (ref), CurrentTime (ref), BindableEvent1 (copy)
	while true do
		RunService.RenderStepped:wait()
		while v3 or NewResult3:IsFocused() do
			if v3 then
				BindableEvent2.Event:wait()
			end
			if NewResult3:IsFocused() then
				BindableEvent3.Event:wait()
			end
		end
		if Flag1 then
			if Flag2 then
				BindableEvent1.Event:wait()
			elseif ChatSettingsModule.ChatWindowTextFadeOutTime < tick() - CurrentTime then
				DoTextFadeOut()
			end
		elseif ChatSettingsModule.ChatWindowBackgroundFadeOutTime < tick() - CurrentTime1 then
			DoBackgroundFadeOut()
		end
	end
end)

function getClassicChatEnabled()
	-- upvalues: ChatSettingsModule (copy), Players (copy)
	return if ChatSettingsModule.ClassicChatEnabled == nil then Players.ClassicChat else ChatSettingsModule.ClassicChatEnabled
end

function getBubbleChatEnabled()
	-- upvalues: ChatSettingsModule (copy), Players (copy)
	return if ChatSettingsModule.BubbleChatEnabled == nil then Players.BubbleChat else ChatSettingsModule.BubbleChatEnabled
end

function bubbleChatOnly()
	return not getClassicChatEnabled() and getBubbleChatEnabled()
end

function UpdateMousePosition(p1)
	-- upvalues: ChatMainModule (copy), ChatSettingsModule (copy), NewResult (copy), v3 (ref)
	if not ChatMainModule.Visible or not ChatMainModule.IsCoreGuiEnabled or not ChatMainModule.TopbarEnabled and not ChatSettingsModule.ChatOnWithTopBarOff then return end
	if bubbleChatOnly() then return end
	local AbsolutePosition = NewResult.GuiObject.AbsolutePosition
	local CheckIfPointIsInSquareResult = CheckIfPointIsInSquare(p1, AbsolutePosition, AbsolutePosition + NewResult.GuiObject.AbsoluteSize)
	
	if CheckIfPointIsInSquareResult ~= v3 then
		UpdateFadingForMouseState(CheckIfPointIsInSquareResult)
	end
end

UserInputService.InputChanged:connect(function(Input, _)
	if Input.UserInputType == Enum.UserInputType.MouseMovement then
		UpdateMousePosition((Vector2.new(Input.Position.X, Input.Position.Y)))
	end
end)
UserInputService.TouchTap:connect(function(Entry, _)
	UpdateMousePosition(Entry[1])
end)
UserInputService.TouchMoved:connect(function(Touch, _)
	UpdateMousePosition((Vector2.new(Touch.Position.X, Touch.Position.Y)))
end)
UserInputService.Changed:connect(function(Property)
	-- upvalues: UserInputService (copy), NewResult (copy), Chat1 (copy)
	if Property == "MouseBehavior" and UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
		local AbsolutePosition = NewResult.GuiObject.AbsolutePosition
		
		if CheckIfPointIsInSquare(Chat1.AbsoluteSize / 2, AbsolutePosition, AbsolutePosition + NewResult.GuiObject.AbsoluteSize) then
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end
	end
end)
UpdateFadingForMouseState(true)
UpdateFadingForMouseState(false)
local config1 = {
	Signal = function()
		local BindableEvent = Instance.new("BindableEvent")
		local List = nil
		local Selected = nil
		
		return {
			fire = function(_, ...)
				-- upvalues: List (ref), Selected (ref), BindableEvent (copy)
				List = { ... }
				Selected = select("#", ...)
				BindableEvent:Fire()
			end,
			connect = function(_, Callback)
				-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
				if not Callback then
					error("connect(nil)", 2)
				end
				return BindableEvent.Event:connect(function()
					-- upvalues: Callback (copy), List (upval), Selected (upval)
					Callback(unpack(List, 1, Selected))
				end)
			end,
			wait = function(_)
				-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
				BindableEvent.Event:wait()
				assert(List, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
				
				return unpack(List, 1, Selected)
			end
		}
	end
}

function SetVisibility(Visible)
	-- upvalues: NewResult (copy), ChatMainModule (copy)
	NewResult:SetVisible(Visible)
	ChatMainModule.VisibilityStateChanged:fire(Visible)
	ChatMainModule.Visible = Visible
	
	if ChatMainModule.IsCoreGuiEnabled then
		if Visible then
			InstantFadeIn()
			
			return
		end
		InstantFadeOut()
	end
end

local Callback = nil
ChatMainModule.TopbarEnabled = true
ChatMainModule.MessageCount = 0
ChatMainModule.Visible = true
ChatMainModule.IsCoreGuiEnabled = true

function ChatMainModule:ToggleVisibility()
	-- upvalues: NewResult (copy)
	SetVisibility(not NewResult:GetVisible())
end

function ChatMainModule:SetVisible(Visible)
	-- upvalues: NewResult (copy)
	if NewResult:GetVisible() ~= Visible then
		SetVisibility(Visible)
	end
end

function ChatMainModule:FocusChatBar()
	-- upvalues: NewResult3 (copy)
	NewResult3:CaptureFocus()
end

function ChatMainModule:EnterWhisperState(p1)
	-- upvalues: NewResult3 (copy)
	NewResult3:EnterWhisperState(p1)
end

function ChatMainModule:GetVisibility()
	-- upvalues: NewResult (copy)
	return NewResult:GetVisible()
end

function ChatMainModule.GetMessageCount(p1)
	return p1.MessageCount
end

function ChatMainModule.TopbarEnabledChanged(p1, TopbarEnabled)
	p1.TopbarEnabled = TopbarEnabled
	p1.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
end

function ChatMainModule:IsFocused(_)
	-- upvalues: NewResult3 (copy)
	return NewResult3:IsFocused()
end

ChatMainModule.ChatBarFocusChanged = config1.Signal()
ChatMainModule.VisibilityStateChanged = config1.Signal()
ChatMainModule.MessagesChanged = config1.Signal()
ChatMainModule.MessagePosted = config1.Signal()
ChatMainModule.CoreGuiEnabled = config1.Signal()
ChatMainModule.ChatMakeSystemMessageEvent = config1.Signal()
ChatMainModule.ChatWindowPositionEvent = config1.Signal()
ChatMainModule.ChatWindowSizeEvent = config1.Signal()
ChatMainModule.ChatBarDisabledEvent = config1.Signal()

function ChatMainModule:fChatWindowPosition()
	-- upvalues: NewResult (copy)
	return NewResult.GuiObject.Position
end

function ChatMainModule:fChatWindowSize()
	-- upvalues: NewResult (copy)
	return NewResult.GuiObject.Size
end

function ChatMainModule:fChatBarDisabled(): boolean
	-- upvalues: NewResult3 (copy)
	return not NewResult3:GetEnabled()
end

function ChatMainModule:SpecialKeyPressed(SpecialKey, _)
	-- upvalues: IsStudio (ref), Callback (ref)
	if SpecialKey == Enum.SpecialKey.ChatHotkey and IsStudio then
		Callback()
	end
end

ChatMainModule.CoreGuiEnabled:connect(function(IsCoreGuiEnabled)
	-- upvalues: ChatMainModule (copy), ChatSettingsModule (copy), NewResult (copy), NewResult3 (copy)
	ChatMainModule.IsCoreGuiEnabled = IsCoreGuiEnabled
	local TopbarEnabled = IsCoreGuiEnabled and (ChatMainModule.TopbarEnabled or ChatSettingsModule.ChatOnWithTopBarOff)
	NewResult:SetCoreGuiEnabled(TopbarEnabled)
	
	if TopbarEnabled then
		InstantFadeIn()
		
		return
	else
		NewResult3:ReleaseFocus()
		InstantFadeOut()
	end
end)

function trimTrailingSpaces(Text: string): string
	local CountText = #Text
	while CountText > 0 and Text:find("^%s", CountText) do
		CountText -= 1
	end
	return Text:sub(1, CountText)
end

ChatMainModule.ChatMakeSystemMessageEvent:connect(function(ExtraData)
	-- upvalues: Flag (ref), ChatSettingsModule (copy), NewResult (copy), ChatConstantsModule (copy), NewResult1 (copy), ChatMainModule (copy)
	if ExtraData.Text and type(ExtraData.Text) == "string" then
		while not Flag do
			wait()
		end
		local GeneralChannelName = ChatSettingsModule.GeneralChannelName
		local Channel = NewResult:GetChannel(GeneralChannelName)
		
		if Channel then
			Channel:AddMessageToChannel({
				ID = -1,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				OriginalChannel = GeneralChannelName,
				MessageLength = string.len(ExtraData.Text),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(ExtraData.Text)),
				Message = trimTrailingSpaces(ExtraData.Text),
				MessageType = ChatConstantsModule.MessageTypeSetCore,
				Time = os.time(),
				ExtraData = ExtraData
			})
			NewResult1:UpdateMessagePostedInChannel(GeneralChannelName)
			ChatMainModule.MessageCount += 1
			ChatMainModule.MessagesChanged:fire(ChatMainModule.MessageCount)
		end
	end
end)
ChatMainModule.ChatBarDisabledEvent:connect(function(p1)
	-- upvalues: IsStudio (ref), NewResult3 (copy)
	if IsStudio then
		NewResult3:SetEnabled(not p1)
		
		if p1 then
			NewResult3:ReleaseFocus()
		end
	end
end)
ChatMainModule.ChatWindowSizeEvent:connect(function(Size)
	-- upvalues: NewResult (copy)
	NewResult.GuiObject.Size = Size
end)
ChatMainModule.ChatWindowPositionEvent:connect(function(Position)
	-- upvalues: NewResult (copy)
	NewResult.GuiObject.Position = Position
end)

Callback = function()
	-- upvalues: NewResult (copy), NewResult3 (copy), ChatMainModule (copy)
	if not NewResult:GetCoreGuiEnabled() then return end
	if not NewResult3:GetEnabled() then return end
	if not NewResult3:IsFocused() and NewResult3:GetVisible() then
		ChatMainModule:SetVisible(true)
		InstantFadeIn()
		NewResult3:CaptureFocus()
		ChatMainModule.ChatBarFocusChanged:fire(true)
	end
end

BindableEvent3.Event:connect(function(p1)
	-- upvalues: ChatMainModule (copy)
	ChatMainModule.ChatBarFocusChanged:fire(p1)
end)

function DoSwitchCurrentChannel(p1)
	-- upvalues: NewResult (copy)
	if NewResult:GetChannel(p1) then
		NewResult:SwitchCurrentChannel(p1)
	end
end

function SendMessageToSelfInTargetChannel(Text: string, OriginalChannel, ExtraData)
	-- upvalues: NewResult (copy), ChatConstantsModule (copy)
	local Channel = NewResult:GetChannel(OriginalChannel)
	
	if Channel then
		Channel:AddMessageToChannel({
			ID = -1,
			FromSpeaker = nil,
			SpeakerUserId = 0,
			IsFiltered = true,
			OriginalChannel = OriginalChannel,
			MessageLength = string.len(Text),
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(Text)),
			Message = trimTrailingSpaces(Text),
			MessageType = ChatConstantsModule.MessageTypeSystem,
			Time = os.time(),
			ExtraData = ExtraData
		})
	end
end

function chatBarFocused()
	-- upvalues: v3 (ref), Flag2 (ref), BindableEvent3 (copy)
	if not v3 then
		DoBackgroundFadeIn()
		
		if Flag2 then
			DoTextFadeIn()
		end
	end
	BindableEvent3:Fire(true)
end

function chatBarFocusLost(p1, _)
	-- upvalues: BindableEvent3 (copy), NewResult3 (copy), ChatMainModule (copy), NewResult2 (copy), NewResult (copy), ChatSettingsModule (copy), MessageSenderModule (copy)
	DoBackgroundFadeIn()
	BindableEvent3:Fire(false)
	
	if p1 then
		local Text = NewResult3:GetTextBox().Text
		
		if NewResult3:IsInCustomState() then
			local CustomMessage = NewResult3:GetCustomMessage()
			
			if CustomMessage then
				Text = CustomMessage
			end
			local CustomStateProcessCompletedMessageResult = NewResult3:CustomStateProcessCompletedMessage(Text)
			NewResult3:ResetCustomState()
			
			if CustomStateProcessCompletedMessageResult then return end
		end
		NewResult3:GetTextBox().Text = ""
		
		if Text ~= "" then
			ChatMainModule.MessagePosted:fire(Text)
			
			if not NewResult2:ProcessCompletedChatMessage(Text, NewResult) then
				if ChatSettingsModule.DisallowedWhiteSpace then
					for i = 1, #ChatSettingsModule.DisallowedWhiteSpace do
						if ChatSettingsModule.DisallowedWhiteSpace[i] == "\t" then
							Text = string.gsub(Text, ChatSettingsModule.DisallowedWhiteSpace[i], " ")
						else
							Text = string.gsub(Text, ChatSettingsModule.DisallowedWhiteSpace[i], "")
						end
					end
				end
				local Replaced = string.gsub(string.gsub(Text, "\n", ""), "[ ]+", " ")
				local TargetMessageChannel = NewResult:GetTargetMessageChannel()
				
				if TargetMessageChannel then
					MessageSenderModule:SendMessage(Replaced, TargetMessageChannel)
					
					return
				end
				MessageSenderModule:SendMessage(Replaced, nil)
			end
		end
	end
end

local List = {}

function setupChatBarConnections()
	-- upvalues: List (ref), NewResult3 (copy)
	for i = 1, #List do
		List[i]:Disconnect()
	end
	List = {}
	table.insert(List, (NewResult3:GetTextBox().FocusLost:connect(chatBarFocusLost)))
	table.insert(List, (NewResult3:GetTextBox().Focused:connect(chatBarFocused)))
end

setupChatBarConnections()
NewResult3.GuiObjectsChanged:connect(setupChatBarConnections)

function getEchoMessagesInGeneral()
	-- upvalues: ChatSettingsModule (copy)
	return ChatSettingsModule.EchoMessagesInGeneralChannel == nil or ChatSettingsModule.EchoMessagesInGeneralChannel
end

t.OnMessageDoneFiltering.OnClientEvent:connect(function(p2)
	-- upvalues: ChatSettingsModule (copy), LocalPlayer (ref), NewResult (copy)
	if not ChatSettingsModule.ShowUserOwnFilteredMessage and p2.FromSpeaker == LocalPlayer.Name then return end
	local OriginalChannel = p2.OriginalChannel
	local Channel = NewResult:GetChannel(OriginalChannel)
	
	if Channel then
		Channel:UpdateMessageFiltered(p2)
	end
	if getEchoMessagesInGeneral() and ChatSettingsModule.GeneralChannelName and OriginalChannel ~= ChatSettingsModule.GeneralChannelName then
		local Channel1 = NewResult:GetChannel(ChatSettingsModule.GeneralChannelName)
		
		if Channel1 then
			Channel1:UpdateMessageFiltered(p2)
		end
	end
end)
t.OnNewMessage.OnClientEvent:connect(function(p2, GeneralChannelName)
	-- upvalues: NewResult (copy), LocalPlayer (ref), NewResult1 (copy), ChatSettingsModule (copy), ChatMainModule (copy)
	local Channel = NewResult:GetChannel(GeneralChannelName)
	
	if Channel then
		Channel:AddMessageToChannel(p2)
		
		if p2.FromSpeaker ~= LocalPlayer.Name then
			NewResult1:UpdateMessagePostedInChannel(GeneralChannelName)
		end
		if getEchoMessagesInGeneral() and ChatSettingsModule.GeneralChannelName and GeneralChannelName ~= ChatSettingsModule.GeneralChannelName then
			local Channel1 = NewResult:GetChannel(ChatSettingsModule.GeneralChannelName)
			
			if Channel1 then
				Channel1:AddMessageToChannel(p2)
			end
		end
		ChatMainModule.MessageCount += 1
		ChatMainModule.MessagesChanged:fire(ChatMainModule.MessageCount)
		DoFadeInFromNewInformation()
	end
end)
t.OnNewSystemMessage.OnClientEvent:connect(function(p2, p3)
	-- upvalues: NewResult (copy), NewResult1 (copy), ChatMainModule (copy), ChatSettingsModule (copy)
	local P59 = p3 or "System"
	local Channel = NewResult:GetChannel(P59)
	
	if Channel then
		Channel:AddMessageToChannel(p2)
		NewResult1:UpdateMessagePostedInChannel(P59)
		ChatMainModule.MessageCount += 1
		ChatMainModule.MessagesChanged:fire(ChatMainModule.MessageCount)
		DoFadeInFromNewInformation()
		
		if getEchoMessagesInGeneral() and ChatSettingsModule.GeneralChannelName and P59 ~= ChatSettingsModule.GeneralChannelName then
			local Channel1 = NewResult:GetChannel(ChatSettingsModule.GeneralChannelName)
			
			if Channel1 then
				Channel1:AddMessageToChannel(p2)
				
				return
			end
		end
	else
		warn(string.format("Just received system message for channel I'm not in [%s]", P59))
	end
end)

function HandleChannelJoined(GeneralChannelName, Text: string, p2, p3, p4, p5)
	-- upvalues: NewResult (copy), ChatSettingsModule (copy), Flag (ref), NewResult3 (copy), ChatConstantsModule (copy), ChatLocalizationModule (ref), Result1_1 (ref), ChatTranslationEnabled (ref)
	if NewResult:GetChannel(GeneralChannelName) then
		NewResult:RemoveChannel(GeneralChannelName)
	end
	if GeneralChannelName == ChatSettingsModule.GeneralChannelName then
		Flag = true
	end
	if p3 then
		NewResult3:SetChannelNameColor(GeneralChannelName, p3)
	end
	local AddChannelResult = NewResult:AddChannel(GeneralChannelName)
	
	if AddChannelResult then
		if GeneralChannelName == ChatSettingsModule.GeneralChannelName then
			DoSwitchCurrentChannel(GeneralChannelName)
		end
		if p2 then
			local v4: number = if ChatSettingsModule.MessageHistoryLengthPerChannel < #p2 then #p2 - ChatSettingsModule.MessageHistoryLengthPerChannel else 1
			for i = v4, #p2 do
				AddChannelResult:AddMessageToChannel(p2[i])
			end
			if getEchoMessagesInGeneral() and p4 and ChatSettingsModule.GeneralChannelName and GeneralChannelName ~= ChatSettingsModule.GeneralChannelName then
				local Channel = NewResult:GetChannel(ChatSettingsModule.GeneralChannelName)
				
				if Channel then
					Channel:AddMessagesToChannelByTimeStamp(p2, v4)
				end
			end
		end
		if Text ~= "" then
			local config = {
				ID = -1,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				ExtraData = nil,
				OriginalChannel = GeneralChannelName,
				MessageLength = string.len(Text),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(Text)),
				Message = trimTrailingSpaces(Text),
				MessageType = ChatConstantsModule.MessageTypeWelcome,
				Time = os.time()
			}
			AddChannelResult:AddMessageToChannel(config)
			
			if getEchoMessagesInGeneral() and p5 and not ChatSettingsModule.ShowChannelsBar and GeneralChannelName ~= ChatSettingsModule.GeneralChannelName then
				local Channel = NewResult:GetChannel(ChatSettingsModule.GeneralChannelName)
				
				if Channel then
					Channel:AddMessageToChannel(config)
				end
			end
		end
		local GameChatChatMainChatTranslationOnboarding: string = ChatLocalizationModule:Get("GameChat_ChatMain_ChatTranslationOnboarding", "Text chat will be translated into your language. Tap the symbol in front of the message to see the original. You can turn off translations in the Settings menu.")
		
		if Result1_1 and GameChatChatMainChatTranslationOnboarding ~= "" and GeneralChannelName == ChatSettingsModule.GeneralChannelName and ChatTranslationEnabled ~= nil and ChatTranslationEnabled.Value then
			AddChannelResult:AddMessageToChannel({
				ID = -2,
				FromSpeaker = nil,
				SpeakerUserId = 0,
				IsFiltered = true,
				ExtraData = nil,
				OriginalChannel = GeneralChannelName,
				MessageLength = string.len(GameChatChatMainChatTranslationOnboarding),
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(GameChatChatMainChatTranslationOnboarding)),
				Message = trimTrailingSpaces(GameChatChatMainChatTranslationOnboarding),
				MessageType = ChatConstantsModule.MessageTypeWelcome,
				Time = os.time()
			})
		end
		DoFadeInFromNewInformation()
	end
end

t.OnChannelJoined.OnClientEvent:connect(function(p6, p7, p8, p9)
	HandleChannelJoined(p6, p7, p8, p9, false, true)
end)
t.OnChannelLeft.OnClientEvent:connect(function(p6)
	-- upvalues: NewResult (copy)
	NewResult:RemoveChannel(p6)
	DoFadeInFromNewInformation()
end)
t.OnMuted.OnClientEvent:connect(function(_) end)
t.OnUnmuted.OnClientEvent:connect(function(_) end)
t.OnMainChannelSet.OnClientEvent:connect(function(p6)
	DoSwitchCurrentChannel(p6)
end)
coroutine.wrap(function()
	-- upvalues: DefaultChatSystemChatEvents (copy), NewResult3 (copy)
	local ChannelNameColorUpdated = DefaultChatSystemChatEvents:WaitForChild("ChannelNameColorUpdated", 5)
	
	if ChannelNameColorUpdated then
		ChannelNameColorUpdated.OnClientEvent:connect(function(p6, p7)
			-- upvalues: NewResult3 (upval)
			NewResult3:SetChannelNameColor(p6, p7)
		end)
	end
end)()
local PlayerBlockedEventCore = nil
local PlayerMutedEventCore = nil
local PlayerUnblockedEventCore = nil
local PlayerUnmutedEventCore = nil
pcall(function()
	-- upvalues: PlayerBlockedEventCore (ref), StarterGui (copy), PlayerMutedEventCore (ref), PlayerUnblockedEventCore (ref), PlayerUnmutedEventCore (ref)
	PlayerBlockedEventCore = StarterGui:GetCore("PlayerBlockedEvent")
	PlayerMutedEventCore = StarterGui:GetCore("PlayerMutedEvent")
	PlayerUnblockedEventCore = StarterGui:GetCore("PlayerUnblockedEvent")
	PlayerUnmutedEventCore = StarterGui:GetCore("PlayerUnmutedEvent")
end)

function SendSystemMessageToSelf(Text: string)
	-- upvalues: NewResult (copy), ChatConstantsModule (copy)
	local CurrentChannel = NewResult:GetCurrentChannel()
	
	if CurrentChannel then
		CurrentChannel:AddMessageToChannel({
			ID = -1,
			FromSpeaker = nil,
			SpeakerUserId = 0,
			IsFiltered = true,
			ExtraData = nil,
			OriginalChannel = CurrentChannel.Name,
			MessageLength = string.len(Text),
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(Text)),
			Message = trimTrailingSpaces(Text),
			MessageType = ChatConstantsModule.MessageTypeSystem,
			Time = os.time()
		})
	end
end

function MutePlayer(p6)
	-- upvalues: DefaultChatSystemChatEvents (copy)
	local MutePlayerRequest = DefaultChatSystemChatEvents:FindFirstChild("MutePlayerRequest")
	
	return if MutePlayerRequest then MutePlayerRequest:InvokeServer(p6.Name) else false
end

if PlayerBlockedEventCore then
	PlayerBlockedEventCore.Event:connect(function(Player)
		-- upvalues: ChatSettingsModule (copy), ChatLocalizationModule (ref)
		if MutePlayer(Player) then
			local DisplayName = if ChatSettingsModule.PlayerDisplayNamesEnabled then Player.DisplayName else Player.Name
			SendSystemMessageToSelf(ChatLocalizationModule:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker '%s' has been blocked.", DisplayName), { RBX_NAME = DisplayName }))
		end
	end)
end
if v1 then
	local function _()
		-- upvalues: ChatSettingsModule (copy)
		return ChatSettingsModule.ShowFriendJoinNotification ~= nil and ChatSettingsModule.ShowFriendJoinNotification
	end
	
	if ChatSettingsModule.ShowFriendJoinNotification ~= nil and ChatSettingsModule.ShowFriendJoinNotification then
		Players.PlayerAdded:Connect(function(Player: Player)
			-- upvalues: LocalPlayer (ref), ChatSettingsModule (copy), ChatLocalizationModule (ref)
			local Success, Result = pcall(function()
				-- upvalues: Player (copy), LocalPlayer (upval)
				return Player:IsFriendsWith(LocalPlayer.UserId)
			end)
			
			if Success and Result then
				local DisplayName = if ChatSettingsModule.PlayerDisplayNamesEnabled then Player.DisplayName else Player.Name
				SendSystemMessageToSelf((ChatLocalizationModule:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", DisplayName), "RBX_NAME", DisplayName)))
			end
		end)
	end
end
if PlayerMutedEventCore then
	PlayerMutedEventCore.Event:connect(function(Player)
		-- upvalues: ChatSettingsModule (copy), ChatLocalizationModule (ref)
		if MutePlayer(Player) then
			local DisplayName = if ChatSettingsModule.PlayerDisplayNamesEnabled then Player.DisplayName else Player.Name
			SendSystemMessageToSelf(ChatLocalizationModule:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", DisplayName), { RBX_NAME = DisplayName }))
		end
	end)
end
function UnmutePlayer(p6)
	-- upvalues: DefaultChatSystemChatEvents (copy)
	local UnMutePlayerRequest = DefaultChatSystemChatEvents:FindFirstChild("UnMutePlayerRequest")
	
	return if UnMutePlayerRequest then UnMutePlayerRequest:InvokeServer(p6.Name) else false
end

if PlayerUnblockedEventCore then
	PlayerUnblockedEventCore.Event:connect(function(Player)
		-- upvalues: ChatSettingsModule (copy), ChatLocalizationModule (ref)
		if UnmutePlayer(Player) then
			local DisplayName = if ChatSettingsModule.PlayerDisplayNamesEnabled then Player.DisplayName else Player.Name
			SendSystemMessageToSelf(ChatLocalizationModule:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker '%s' has been unblocked.", DisplayName), { RBX_NAME = DisplayName }))
		end
	end)
end
if PlayerUnmutedEventCore then
	PlayerUnmutedEventCore.Event:connect(function(Player)
		-- upvalues: ChatSettingsModule (copy), ChatLocalizationModule (ref)
		if UnmutePlayer(Player) then
			local DisplayName = if ChatSettingsModule.PlayerDisplayNamesEnabled then Player.DisplayName else Player.Name
			SendSystemMessageToSelf(ChatLocalizationModule:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", DisplayName), { RBX_NAME = DisplayName }))
		end
	end)
end
spawn(function()
	-- upvalues: LocalPlayer (ref), StarterGui (copy), DefaultChatSystemChatEvents (copy)
	if LocalPlayer.UserId > 0 then
		pcall(function()
			-- upvalues: StarterGui (upval), DefaultChatSystemChatEvents (upval)
			local GetBlockedUserIdsCore = StarterGui:GetCore("GetBlockedUserIds")
			
			if #GetBlockedUserIdsCore > 0 then
				local SetBlockedUserIdsRequest = DefaultChatSystemChatEvents:FindFirstChild("SetBlockedUserIdsRequest")
				
				if SetBlockedUserIdsRequest then
					SetBlockedUserIdsRequest:FireServer(GetBlockedUserIdsCore)
				end
			end
		end)
	end
end)
spawn(function()
	-- upvalues: Chat (copy), LocalPlayer (ref), IsStudio (ref), RunService (copy)
	local Success, Result = pcall(function()
		-- upvalues: Chat (upval), LocalPlayer (upval)
		return Chat:CanUserChatAsync(LocalPlayer.UserId)
	end)
	
	if Success then
		IsStudio = RunService:IsStudio() or Result
	end
end)
local ServerResult = t.GetInitDataRequest:InvokeServer()

for _, channel in pairs(ServerResult.Channels) do
	if channel[1] == ChatSettingsModule.GeneralChannelName then
		HandleChannelJoined(channel[1], channel[2], channel[3], channel[4], true, false)
	end
end
for _, channel1 in pairs(ServerResult.Channels) do
	if channel1[1] ~= ChatSettingsModule.GeneralChannelName then
		HandleChannelJoined(channel1[1], channel1[2], channel1[3], channel1[4], true, false)
	end
end
return ChatMainModule