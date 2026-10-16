local ChatBarModule = {}
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TextService = game:GetService("TextService")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.PlayerAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local Chat = game:GetService("Chat")
local ClientChatModules = Chat:WaitForChild("ClientChatModules")
local Parent = script.Parent
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local CurveUtilModule = require(Parent:WaitForChild("CurveUtil"))
local WhisperModule = require(ClientChatModules:WaitForChild("CommandModules"):WaitForChild("Whisper"))
local _ = require(Parent:WaitForChild("MessageSender"))
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 35 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {
		Get = function(_, _, p1) --[[ Line: 36 ]]
			return p1
		end
	}
end
local Module = {}
Module.__index = Module

function Module.CreateGuiObjects(p1, ChatBarParentFrame) --[[ Line: 43 ]]
	-- upvalues: ChatSettingsModule (copy)
	p1.ChatBarParentFrame = ChatBarParentFrame
	local Frame = Instance.new("Frame")
	Frame.Selectable = false
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundTransparency = 0.6
	Frame.BorderSizePixel = 0
	Frame.BackgroundColor3 = ChatSettingsModule.ChatBarBackGroundColor
	Frame.Parent = ChatBarParentFrame
	local BoxFrame = Instance.new("Frame")
	BoxFrame.Selectable = false
	BoxFrame.Name = "BoxFrame"
	BoxFrame.BackgroundTransparency = 0.6
	BoxFrame.BorderSizePixel = 0
	BoxFrame.BackgroundColor3 = ChatSettingsModule.ChatBarBoxColor
	BoxFrame.Size = UDim2.new(1, -14, 1, -14)
	BoxFrame.Position = UDim2.new(0, 7, 0, 7)
	BoxFrame.Parent = Frame
	local Frame1 = Instance.new("Frame")
	Frame1.BackgroundTransparency = 1
	Frame1.Size = UDim2.new(1, -10, 1, -10)
	Frame1.Position = UDim2.new(0, 5, 0, 5)
	Frame1.Parent = BoxFrame
	local ChatBar = Instance.new("TextBox")
	ChatBar.Selectable = ChatSettingsModule.GamepadNavigationEnabled
	ChatBar.Name = "ChatBar"
	ChatBar.BackgroundTransparency = 1
	ChatBar.Size = UDim2.new(1, 0, 1, 0)
	ChatBar.Position = UDim2.new(0, 0, 0, 0)
	ChatBar.TextSize = ChatSettingsModule.ChatBarTextSize
	ChatBar.Font = ChatSettingsModule.ChatBarFont
	ChatBar.TextColor3 = ChatSettingsModule.ChatBarTextColor
	ChatBar.TextTransparency = 0.4
	ChatBar.TextStrokeTransparency = 1
	ChatBar.ClearTextOnFocus = false
	ChatBar.TextXAlignment = Enum.TextXAlignment.Left
	ChatBar.TextYAlignment = Enum.TextYAlignment.Top
	ChatBar.TextWrapped = true
	ChatBar.Text = ""
	ChatBar.Parent = Frame1
	local MessageMode = Instance.new("TextButton")
	MessageMode.Selectable = false
	MessageMode.Name = "MessageMode"
	MessageMode.BackgroundTransparency = 1
	MessageMode.Position = UDim2.new(0, 0, 0, 0)
	MessageMode.TextSize = ChatSettingsModule.ChatBarTextSize
	MessageMode.Font = ChatSettingsModule.ChatBarFont
	MessageMode.TextXAlignment = Enum.TextXAlignment.Left
	MessageMode.TextWrapped = true
	MessageMode.Text = ""
	MessageMode.Size = UDim2.new(0, 0, 0, 0)
	MessageMode.TextYAlignment = Enum.TextYAlignment.Center
	MessageMode.TextColor3 = p1:GetDefaultChannelNameColor()
	MessageMode.Visible = true
	MessageMode.Parent = Frame1
	local Label = Instance.new("TextLabel")
	Label.Selectable = false
	Label.TextWrapped = true
	Label.BackgroundTransparency = 1
	Label.Size = ChatBar.Size
	Label.Position = ChatBar.Position
	Label.TextSize = ChatBar.TextSize
	Label.Font = ChatBar.Font
	Label.TextColor3 = ChatBar.TextColor3
	Label.TextTransparency = ChatBar.TextTransparency
	Label.TextStrokeTransparency = ChatBar.TextStrokeTransparency
	Label.TextXAlignment = ChatBar.TextXAlignment
	Label.TextYAlignment = ChatBar.TextYAlignment
	Label.Text = "..."
	Label.Parent = Frame1
	p1.GuiObject = Frame
	p1.TextBox = ChatBar
	p1.TextLabel = Label
	p1.GuiObjects.BaseFrame = Frame
	p1.GuiObjects.TextBoxFrame = BoxFrame
	p1.GuiObjects.TextBox = ChatBar
	p1.GuiObjects.TextLabel = Label
	p1.GuiObjects.MessageModeTextButton = MessageMode
	p1:AnimGuiObjects()
	p1:SetUpTextBoxEvents(ChatBar, Label, MessageMode)
	
	if p1.UserHasChatOff then
		p1:DoLockChatBar()
	end
	p1.eGuiObjectsChanged:Fire()
end

function Module.DoLockChatBar(p1) --[[ Line: 142 ]]
	-- upvalues: LocalPlayer (ref), ChatLocalizationModule (ref)
	if p1.TextLabel then
		if LocalPlayer.UserId > 0 then
			p1.TextLabel.Text = ChatLocalizationModule:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.")
		else
			p1.TextLabel.Text = ChatLocalizationModule:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.")
		end
		p1:CalculateSize()
	end
	if p1.TextBox then
		p1.TextBox.Active = false
		p1.TextBox.Focused:connect(function() --[[ Line: 159 ]]
			-- upvalues: p1 (copy)
			p1.TextBox:ReleaseFocus()
		end)
	end
end

function Module.SetUpTextBoxEvents(TextBox, TextBox1, Label, Button) --[[ Line: 165 ]]
	-- upvalues: UserInputService (copy), ChatSettingsModule (copy)
	for i, textBoxConnection in pairs(TextBox.TextBoxConnections) do
		textBoxConnection:disconnect()
		TextBox.TextBoxConnections[i] = nil
	end
	TextBox.TextBoxConnections.UserInputBegan = UserInputService.InputBegan:connect(function(Input, _) --[[ Line: 173 ]]
		-- upvalues: TextBox (copy), TextBox1 (copy), ChatSettingsModule (upval)
		if Input.KeyCode == Enum.KeyCode.Backspace and TextBox:IsFocused() and TextBox1.Text == "" then
			TextBox:SetChannelTarget(ChatSettingsModule.GeneralChannelName)
		end
	end)
	TextBox.TextBoxConnections.TextBoxChanged = TextBox1.Changed:connect(function(p1) --[[ Line: 181 ]]
		-- upvalues: TextBox (copy), TextBox1 (copy), ChatSettingsModule (upval)
		if p1 == "AbsoluteSize" then
			TextBox:CalculateSize()
			
			return
		end
		if p1 ~= "Text" then return end
		TextBox:CalculateSize()
		
		if ChatSettingsModule.MaximumMessageLength < utf8.len(utf8.nfcnormalize(TextBox1.Text)) then
			TextBox1.Text = TextBox.PreviousText
		else
			TextBox.PreviousText = TextBox1.Text
		end
		if TextBox.InCustomState then
			TextBox.CustomState:TextUpdated()
		else
			local ProcessInProgressChatMessageResult = TextBox.CommandProcessor:ProcessInProgressChatMessage(TextBox1.Text, TextBox.ChatWindow, TextBox)
			
			if ProcessInProgressChatMessageResult then
				TextBox.InCustomState = true
				TextBox.CustomState = ProcessInProgressChatMessageResult
				
				return
			end
		end
	end)
	
	local function _(p1) --[[ Line: 210 | Named "UpdateOnFocusStatusChanged" ]]
		-- upvalues: TextBox1 (copy), Label (copy)
		if p1 or TextBox1.Text ~= "" then
			Label.Visible = false
			
			return
		else
			Label.Visible = true
		end
	end
	
	TextBox.TextBoxConnections.MessageModeClick = Button.MouseButton1Click:connect(function() --[[ Line: 218 ]]
		-- upvalues: Button (copy), TextBox (copy), ChatSettingsModule (upval)
		if Button.Text ~= "" then
			TextBox:SetChannelTarget(ChatSettingsModule.GeneralChannelName)
		end
	end)
	TextBox.TextBoxConnections.TextBoxFocused = TextBox1.Focused:connect(function() --[[ Line: 224 ]]
		-- upvalues: TextBox (copy), Label (copy)
		if not TextBox.UserHasChatOff then
			TextBox:CalculateSize()
			Label.Visible = false
		end
	end)
	TextBox.TextBoxConnections.TextBoxFocusLost = TextBox1.FocusLost:connect(function(_, CauseInput) --[[ Line: 231 ]]
		-- upvalues: TextBox (copy), TextBox1 (copy), Label (copy)
		TextBox:CalculateSize()
		
		if CauseInput and CauseInput.KeyCode == Enum.KeyCode.Escape then
			TextBox1.Text = ""
		end
		if TextBox1.Text == "" then
			Label.Visible = true
			
			return
		else
			Label.Visible = false
		end
	end)
end

function Module.GetTextBox(p1) --[[ Line: 240 ]]
	return p1.TextBox
end

function Module.GetMessageModeTextButton(p1) --[[ Line: 244 ]]
	return p1.GuiObjects.MessageModeTextButton
end

function Module.GetMessageModeTextLabel(p1) --[[ Line: 250 ]]
	return p1:GetMessageModeTextButton()
end

function Module.IsFocused(p1) --[[ Line: 254 ]]
	return not p1.UserHasChatOff and p1:GetTextBox():IsFocused()
end

function Module.GetVisible(p1) --[[ Line: 262 ]]
	return p1.GuiObject.Visible
end

function Module.CaptureFocus(p1) --[[ Line: 266 ]]
	if not p1.UserHasChatOff then
		p1:GetTextBox():CaptureFocus()
	end
end

function Module.ReleaseFocus(p1, Submitted) --[[ Line: 272 ]]
	p1:GetTextBox():ReleaseFocus(Submitted)
end

function Module.ResetText(p1) --[[ Line: 276 ]]
	p1:GetTextBox().Text = ""
end

function Module.SetText(p1, Text) --[[ Line: 280 ]]
	p1:GetTextBox().Text = Text
end

function Module.GetEnabled(p1) --[[ Line: 284 ]]
	return p1.GuiObject.Visible
end

function Module.SetEnabled(p1, Visible) --[[ Line: 288 ]]
	if p1.UserHasChatOff then
		p1.GuiObject.Visible = true
		
		return
	else
		p1.GuiObject.Visible = Visible
	end
end

function Module.SetTextLabelText(p1, Text) --[[ Line: 298 ]]
	if not p1.UserHasChatOff then
		p1.TextLabel.Text = Text
	end
end

function Module.SetTextBoxText(p1, Text) --[[ Line: 304 ]]
	p1.TextBox.Text = Text
end

function Module.GetTextBoxText(p1) --[[ Line: 308 ]]
	return p1.TextBox.Text
end

function Module.ResetSize(p1) --[[ Line: 312 ]]
	p1.TargetYSize = 0
	p1:TweenToTargetYSize()
end

local function _(Frame) --[[ Line: 317 | Named "measureSize" ]]
	-- upvalues: TextService (copy)
	return TextService:GetTextSize(Frame.Text, Frame.TextSize, Frame.Font, Vector2.new(Frame.AbsoluteSize.X, 10000))
end

function Module.CalculateSize(TextBox) --[[ Line: 326 ]]
	-- upvalues: TextService (copy)
	if TextBox.CalculatingSizeLock then return end
	TextBox.CalculatingSizeLock = true
	local TextSize = nil
	local Y = nil
	
	if TextBox:IsFocused() or TextBox.TextBox.Text ~= "" then
		TextSize = TextBox.TextBox.TextSize
		local TextBox1 = TextBox.TextBox
		Y = TextService:GetTextSize(TextBox1.Text, TextBox1.TextSize, TextBox1.Font, Vector2.new(TextBox1.AbsoluteSize.X, 10000)).Y
	else
		TextSize = TextBox.TextLabel.TextSize
		local TextLabel = TextBox.TextLabel
		Y = TextService:GetTextSize(TextLabel.Text, TextLabel.TextSize, TextLabel.Font, Vector2.new(TextLabel.AbsoluteSize.X, 10000)).Y
	end
	local YDelta = Y - TextSize
	
	if TextBox.TargetYSize ~= YDelta then
		TextBox.TargetYSize = YDelta
		TextBox:TweenToTargetYSize()
	end
	TextBox.CalculatingSizeLock = false
end

function Module.TweenToTargetYSize(p1) --[[ Line: 352 ]]
	local _UDim2 = UDim2.new(1, 0, 1, p1.TargetYSize)
	local Y = p1.GuiObject.AbsoluteSize.Y
	p1.GuiObject.Size = _UDim2
	local Y1 = p1.GuiObject.AbsoluteSize.Y
	p1.GuiObject.Size = p1.GuiObject.Size
	local Smallest = math.min(1, math.abs(Y1 - Y) * (1 / p1.TweenPixelsPerSecond))
	
	if not pcall(function() --[[ Line: 364 ]]
		-- upvalues: p1 (copy), _UDim2 (copy), Smallest (copy)
		p1.GuiObject:TweenSize(_UDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, Smallest, true)
	end) then
		p1.GuiObject.Size = _UDim2
	end
end

function Module.SetTextSize(p1, TextSize) --[[ Line: 372 ]]
	if not p1:IsInCustomState() then
		if p1.TextBox then
			p1.TextBox.TextSize = TextSize
		end
		if p1.TextLabel then
			p1.TextLabel.TextSize = TextSize
		end
	end
end

function Module:GetDefaultChannelNameColor() --[[ Line: 383 ]]
	-- upvalues: ChatSettingsModule (copy)
	return if ChatSettingsModule.DefaultChannelNameColor then ChatSettingsModule.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
end

function Module.SetChannelTarget(p1, GeneralChannelName) --[[ Line: 390 ]]
	-- upvalues: ChatSettingsModule (copy), ChatLocalizationModule (ref)
	local MessageModeTextButton = p1.GuiObjects.MessageModeTextButton
	local TextBox = p1.TextBox
	local TextLabel = p1.TextLabel
	p1.TargetChannel = GeneralChannelName
	
	if not p1:IsInCustomState() then
		if GeneralChannelName == ChatSettingsModule.GeneralChannelName then
			MessageModeTextButton.Text = ""
			MessageModeTextButton.Size = UDim2.new(0, 0, 0, 0)
			TextBox.Size = UDim2.new(1, 0, 1, 0)
			TextBox.Position = UDim2.new(0, 0, 0, 0)
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.Position = UDim2.new(0, 0, 0, 0)
		else
			MessageModeTextButton.Size = UDim2.new(0, 1000, 1, 0)
			MessageModeTextButton.Text = string.format("[%s] ", if ChatLocalizationModule.tryLocalize then ChatLocalizationModule:tryLocalize(GeneralChannelName) else GeneralChannelName)
			local ChannelNameColor = p1:GetChannelNameColor(GeneralChannelName)
			
			if ChannelNameColor then
				MessageModeTextButton.TextColor3 = ChannelNameColor
			else
				MessageModeTextButton.TextColor3 = p1:GetDefaultChannelNameColor()
			end
			local X = MessageModeTextButton.TextBounds.X
			MessageModeTextButton.Size = UDim2.new(0, X, 1, 0)
			TextBox.Size = UDim2.new(1, -X, 1, 0)
			TextBox.Position = UDim2.new(0, X, 0, 0)
			TextLabel.Size = UDim2.new(1, -X, 1, 0)
			TextLabel.Position = UDim2.new(0, X, 0, 0)
			
			return
		end
	end
end

function Module.IsInCustomState(p1) --[[ Line: 430 ]]
	return p1.InCustomState
end

function Module.ResetCustomState(p1) --[[ Line: 434 ]]
	-- upvalues: ChatLocalizationModule (ref)
	if p1.InCustomState then
		p1.CustomState:Destroy()
		p1.CustomState = nil
		p1.InCustomState = false
		p1.ChatBarParentFrame:ClearAllChildren()
		p1:CreateGuiObjects(p1.ChatBarParentFrame)
		p1:SetTextLabelText(ChatLocalizationModule:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
	end
end

function Module.EnterWhisperState(TextBox, Player) --[[ Line: 451 ]]
	-- upvalues: WhisperModule (copy), ChatSettingsModule (copy)
	TextBox:ResetCustomState()
	
	if WhisperModule.CustomStateCreator then
		TextBox.CustomState = WhisperModule.CustomStateCreator(Player, TextBox.ChatWindow, TextBox, ChatSettingsModule)
		TextBox.InCustomState = true
	else
		TextBox:SetText("/w " .. (if ChatSettingsModule.PlayerDisplayNamesEnabled then Player.DisplayName else Player.Name))
	end
	TextBox:CaptureFocus()
end

function Module.GetCustomMessage(p1) --[[ Line: 475 ]]
	return if p1.InCustomState then p1.CustomState:GetMessage() else nil
end

function Module.CustomStateProcessCompletedMessage(p1, _) --[[ Line: 482 ]]
	return if p1.InCustomState then p1.CustomState:ProcessCompletedMessage() else false
end

function Module.FadeOutBackground(p1, p2) --[[ Line: 489 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Background_TargetTransparency = 1
	p1.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
	p1:FadeOutText(p2)
end

function Module.FadeInBackground(p1, p2) --[[ Line: 495 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Background_TargetTransparency = 0.6
	p1.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
	p1:FadeInText(p2)
end

function Module.FadeOutText(p1, p2) --[[ Line: 501 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Text_TargetTransparency = 1
	p1.AnimParams.Text_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function Module.FadeInText(p1, p2) --[[ Line: 506 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Text_TargetTransparency = 0.4
	p1.AnimParams.Text_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function Module.AnimGuiObjects(p1) --[[ Line: 511 ]]
	p1.GuiObject.BackgroundTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.GuiObjects.TextBoxFrame.BackgroundTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.GuiObjects.TextLabel.TextTransparency = p1.AnimParams.Text_CurrentTransparency
	p1.GuiObjects.TextBox.TextTransparency = p1.AnimParams.Text_CurrentTransparency
	p1.GuiObjects.MessageModeTextButton.TextTransparency = p1.AnimParams.Text_CurrentTransparency
end

function Module.InitializeAnimParams(p1) --[[ Line: 520 ]]
	p1.AnimParams.Text_TargetTransparency = 0.4
	p1.AnimParams.Text_CurrentTransparency = 0.4
	p1.AnimParams.Text_NormalizedExptValue = 1
	p1.AnimParams.Background_TargetTransparency = 0.6
	p1.AnimParams.Background_CurrentTransparency = 0.6
	p1.AnimParams.Background_NormalizedExptValue = 1
end

function Module.Update(p1, p2) --[[ Line: 530 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Text_CurrentTransparency = CurveUtilModule:Expt(p1.AnimParams.Text_CurrentTransparency, p1.AnimParams.Text_TargetTransparency, p1.AnimParams.Text_NormalizedExptValue, p2)
	p1.AnimParams.Background_CurrentTransparency = CurveUtilModule:Expt(p1.AnimParams.Background_CurrentTransparency, p1.AnimParams.Background_TargetTransparency, p1.AnimParams.Background_NormalizedExptValue, p2)
	p1:AnimGuiObjects()
end

function Module.SetChannelNameColor(p1, p2, TextColor3) --[[ Line: 547 ]]
	p1.ChannelNameColors[p2] = TextColor3
	
	if p1.GuiObjects.MessageModeTextButton.Text == p2 then
		p1.GuiObjects.MessageModeTextButton.TextColor3 = TextColor3
	end
end

function Module.GetChannelNameColor(p1, TargetChannel) --[[ Line: 554 ]]
	return p1.ChannelNameColors[TargetChannel]
end

function ChatBarModule.new(CommandProcessor, ChatWindow) --[[ Line: 561 ]]
	-- upvalues: Module (copy), ChatSettingsModule (copy), Chat (copy), LocalPlayer (ref), RunService (copy)
	local self = setmetatable({}, Module)
	self.GuiObject = nil
	self.ChatBarParentFrame = nil
	self.TextBox = nil
	self.TextLabel = nil
	self.GuiObjects = {}
	self.eGuiObjectsChanged = Instance.new("BindableEvent")
	self.GuiObjectsChanged = self.eGuiObjectsChanged.Event
	self.TextBoxConnections = {}
	self.PreviousText = ""
	self.InCustomState = false
	self.CustomState = nil
	self.TargetChannel = nil
	self.CommandProcessor = CommandProcessor
	self.ChatWindow = ChatWindow
	self.TweenPixelsPerSecond = 500
	self.TargetYSize = 0
	self.AnimParams = {}
	self.CalculatingSizeLock = false
	self.ChannelNameColors = {}
	self.UserHasChatOff = false
	self:InitializeAnimParams()
	ChatSettingsModule.SettingsChanged:connect(function(p1, TextSize) --[[ Line: 593 ]]
		-- upvalues: self (copy)
		if p1 == "ChatBarTextSize" then
			self:SetTextSize(TextSize)
		end
	end)
	coroutine.wrap(function() --[[ Line: 599 ]]
		-- upvalues: Chat (upval), LocalPlayer (upval), RunService (upval), self (copy)
		local Success, Result = pcall(function() --[[ Line: 600 ]]
			-- upvalues: Chat (upval), LocalPlayer (upval)
			return Chat:CanUserChatAsync(LocalPlayer.UserId)
		end)
		
		if Success then
			Success = RunService:IsStudio() or Result
		end
		if Success == false then
			self.UserHasChatOff = true
			self:DoLockChatBar()
		end
	end)()
	
	return self
end

return ChatBarModule