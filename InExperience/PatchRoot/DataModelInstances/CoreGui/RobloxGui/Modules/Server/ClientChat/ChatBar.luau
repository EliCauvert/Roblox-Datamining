local t = {}
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local textService = game:GetService("TextService")
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.PlayerAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local chatService = game:GetService("Chat")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local parent = script.Parent
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local curveUtilModule = require(parent:WaitForChild("CurveUtil"))
local whisperModule = require(clientChatModules:WaitForChild("CommandModules"):WaitForChild("Whisper"))
local _ = require(parent:WaitForChild("MessageSender"))
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
local t_2 = {}
t_2.__index = t_2

function t_2.CreateGuiObjects(p1, p2)
	-- upvalues: chatSettingsModule (ref)
	p1.ChatBarParentFrame = p2
	local frame = Instance.new("Frame")
	frame.Selectable = false
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 0.6
	frame.BorderSizePixel = 0
	frame.BackgroundColor3 = chatSettingsModule.ChatBarBackGroundColor
	frame.Parent = p2
	local boxFrame = Instance.new("Frame")
	boxFrame.Selectable = false
	boxFrame.Name = "BoxFrame"
	boxFrame.BackgroundTransparency = 0.6
	boxFrame.BorderSizePixel = 0
	boxFrame.BackgroundColor3 = chatSettingsModule.ChatBarBoxColor
	boxFrame.Size = UDim2.new(1, -14, 1, -14)
	boxFrame.Position = UDim2.new(0, 7, 0, 7)
	boxFrame.Parent = frame
	local frame_2 = Instance.new("Frame")
	frame_2.BackgroundTransparency = 1
	frame_2.Size = UDim2.new(1, -10, 1, -10)
	frame_2.Position = UDim2.new(0, 5, 0, 5)
	frame_2.Parent = boxFrame
	local chatBar = Instance.new("TextBox")
	chatBar.Selectable = chatSettingsModule.GamepadNavigationEnabled
	chatBar.Name = "ChatBar"
	chatBar.BackgroundTransparency = 1
	chatBar.Size = UDim2.new(1, 0, 1, 0)
	chatBar.Position = UDim2.new(0, 0, 0, 0)
	chatBar.TextSize = chatSettingsModule.ChatBarTextSize
	chatBar.Font = chatSettingsModule.ChatBarFont
	chatBar.TextColor3 = chatSettingsModule.ChatBarTextColor
	chatBar.TextTransparency = 0.4
	chatBar.TextStrokeTransparency = 1
	chatBar.ClearTextOnFocus = false
	chatBar.TextXAlignment = Enum.TextXAlignment.Left
	chatBar.TextYAlignment = Enum.TextYAlignment.Top
	chatBar.TextWrapped = true
	chatBar.Text = ""
	chatBar.Parent = frame_2
	local messageMode = Instance.new("TextButton")
	messageMode.Selectable = false
	messageMode.Name = "MessageMode"
	messageMode.BackgroundTransparency = 1
	messageMode.Position = UDim2.new(0, 0, 0, 0)
	messageMode.TextSize = chatSettingsModule.ChatBarTextSize
	messageMode.Font = chatSettingsModule.ChatBarFont
	messageMode.TextXAlignment = Enum.TextXAlignment.Left
	messageMode.TextWrapped = true
	messageMode.Text = ""
	messageMode.Size = UDim2.new(0, 0, 0, 0)
	messageMode.TextYAlignment = Enum.TextYAlignment.Center
	messageMode.TextColor3 = p1:GetDefaultChannelNameColor()
	messageMode.Visible = true
	messageMode.Parent = frame_2
	local textLabel = Instance.new("TextLabel")
	textLabel.Selectable = false
	textLabel.TextWrapped = true
	textLabel.BackgroundTransparency = 1
	textLabel.Size = chatBar.Size
	textLabel.Position = chatBar.Position
	textLabel.TextSize = chatBar.TextSize
	textLabel.Font = chatBar.Font
	textLabel.TextColor3 = chatBar.TextColor3
	textLabel.TextTransparency = chatBar.TextTransparency
	textLabel.TextStrokeTransparency = chatBar.TextStrokeTransparency
	textLabel.TextXAlignment = chatBar.TextXAlignment
	textLabel.TextYAlignment = chatBar.TextYAlignment
	textLabel.Text = "..."
	textLabel.Parent = frame_2
	p1.GuiObject = frame
	p1.TextBox = chatBar
	p1.TextLabel = textLabel
	p1.GuiObjects.BaseFrame = frame
	p1.GuiObjects.TextBoxFrame = boxFrame
	p1.GuiObjects.TextBox = chatBar
	p1.GuiObjects.TextLabel = textLabel
	p1.GuiObjects.MessageModeTextButton = messageMode
	p1:AnimGuiObjects()
	p1:SetUpTextBoxEvents(chatBar, textLabel, messageMode)
	
	if p1.UserHasChatOff then
		p1:DoLockChatBar()
	end
	p1.eGuiObjectsChanged:Fire()
end

function t_2.DoLockChatBar(p1)
	-- upvalues: localPlayer (write), t_1 (write)
	if p1.TextLabel then
		if localPlayer.UserId > 0 then
			p1.TextLabel.Text = t_1:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.")
		else
			p1.TextLabel.Text = t_1:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.")
		end
		p1:CalculateSize()
	end
	if p1.TextBox then
		p1.TextBox.Active = false
		p1.TextBox.Focused:connect(function()
			-- upvalues: p1 (ref)
			p1.TextBox:ReleaseFocus()
		end)
	end
end

function t_2.SetUpTextBoxEvents(value, p1, p2, p3)
	-- upvalues: userInputService (ref), chatSettingsModule (ref)
	for i, v in pairs(value.TextBoxConnections) do
		v:disconnect()
		value.TextBoxConnections[i] = nil
	end
	value.TextBoxConnections.UserInputBegan = userInputService.InputBegan:connect(function(p4, _)
		-- upvalues: value (ref), p1 (ref), chatSettingsModule (copy)
		if p4.KeyCode == Enum.KeyCode.Backspace and value:IsFocused() and p1.Text == "" then
			value:SetChannelTarget(chatSettingsModule.GeneralChannelName)
		end
	end)
	value.TextBoxConnections.TextBoxChanged = p1.Changed:connect(function(p4)
		-- upvalues: value (ref), p1 (ref), chatSettingsModule (copy)
		if p4 == "AbsoluteSize" then
			value:CalculateSize()
			
			return
		elseif p4 ~= "Text" then return end
		value:CalculateSize()
		
		if chatSettingsModule.MaximumMessageLength < utf8.len(utf8.nfcnormalize(p1.Text)) then
			p1.Text = value.PreviousText
		else
			value.PreviousText = p1.Text
		end
		if value.InCustomState then
			value.CustomState:TextUpdated()
		else
			local text = value.CommandProcessor:ProcessInProgressChatMessage(p1.Text, value.ChatWindow, value)
			
			if text then
				value.InCustomState = true
				value.CustomState = text
				
				return
			end
		end
	end)
	
	local function _(p4)
		-- upvalues: p1 (ref), p2 (ref)
		if p4 or p1.Text ~= "" then
			p2.Visible = false
			
			return
		end
		p2.Visible = true
	end
	
	value.TextBoxConnections.MessageModeClick = p3.MouseButton1Click:connect(function()
		-- upvalues: p3 (ref), value (ref), chatSettingsModule (copy)
		if p3.Text ~= "" then
			value:SetChannelTarget(chatSettingsModule.GeneralChannelName)
		end
	end)
	value.TextBoxConnections.TextBoxFocused = p1.Focused:connect(function()
		-- upvalues: value (ref), p2 (ref)
		if not value.UserHasChatOff then
			value:CalculateSize()
			p2.Visible = false
		end
	end)
	value.TextBoxConnections.TextBoxFocusLost = p1.FocusLost:connect(function(_, p4)
		-- upvalues: value (ref), p1 (ref), p2 (ref)
		value:CalculateSize()
		
		if p4 and p4.KeyCode == Enum.KeyCode.Escape then
			p1.Text = ""
		end
		if p1.Text == "" then
			p2.Visible = true
			
			return
		end
		p2.Visible = false
	end)
end

function t_2.GetTextBox(p4)
	return p4.TextBox
end

function t_2.GetMessageModeTextButton(p4)
	return p4.GuiObjects.MessageModeTextButton
end

function t_2.GetMessageModeTextLabel(p4)
	return p4:GetMessageModeTextButton()
end

function t_2.IsFocused(p4)
	return if p4.UserHasChatOff then false else p4:GetTextBox():IsFocused()
end

function t_2.GetVisible(p4)
	return p4.GuiObject.Visible
end

function t_2.CaptureFocus(p4)
	if not p4.UserHasChatOff then
		p4:GetTextBox():CaptureFocus()
	end
end

function t_2.ReleaseFocus(p4, p5)
	p4:GetTextBox():ReleaseFocus(p5)
end

function t_2.ResetText(value)
	value:GetTextBox().Text = ""
end

function t_2.SetText(value, p4)
	value:GetTextBox().Text = p4
end

function t_2.GetEnabled(p4)
	return p4.GuiObject.Visible
end

function t_2.SetEnabled(value, p4)
	if value.UserHasChatOff then
		value.GuiObject.Visible = true
		
		return
	end
	value.GuiObject.Visible = p4
end

function t_2.SetTextLabelText(value, p4)
	if not value.UserHasChatOff then
		value.TextLabel.Text = p4
	end
end

function t_2.SetTextBoxText(value, p4)
	value.TextBox.Text = p4
end

function t_2.GetTextBoxText(p4)
	return p4.TextBox.Text
end

function t_2.ResetSize(value)
	value.TargetYSize = 0
	value:TweenToTargetYSize()
end

local function _(p4)
	-- upvalues: textService (ref)
	return textService:GetTextSize(p4.Text, p4.TextSize, p4.Font, Vector2.new(p4.AbsoluteSize.X, 10000))
end

function t_2.CalculateSize(p4)
	-- upvalues: textService (ref)
	if p4.CalculatingSizeLock then return end
	local textSize, y
	p4.CalculatingSizeLock = true
	local _ = nil
	local _ = nil
	
	if p4:IsFocused() or p4.TextBox.Text ~= "" then
		textSize = p4.TextBox.TextSize
		local textBox = p4.TextBox
		y = textService:GetTextSize(textBox.Text, textBox.TextSize, textBox.Font, Vector2.new(textBox.AbsoluteSize.X, 10000)).Y
	else
		textSize = p4.TextLabel.TextSize
		local textLabel = p4.TextLabel
		y = textService:GetTextSize(textLabel.Text, textLabel.TextSize, textLabel.Font, Vector2.new(textLabel.AbsoluteSize.X, 10000)).Y
	end
	local var1 = y - textSize
	
	if p4.TargetYSize ~= var1 then
		p4.TargetYSize = var1
		p4:TweenToTargetYSize()
	end
	p4.CalculatingSizeLock = false
end

function t_2.TweenToTargetYSize(p4)
	local uDim2 = UDim2.new(1, 0, 1, p4.TargetYSize)
	local size = p4.GuiObject.Size
	local y = p4.GuiObject.AbsoluteSize.Y
	p4.GuiObject.Size = uDim2
	local y_1 = p4.GuiObject.AbsoluteSize.Y
	p4.GuiObject.Size = size
	local minValue = math.min(1, math.abs(y_1 - y) * (1 / p4.TweenPixelsPerSecond))
	
	if not pcall(function()
		-- upvalues: p4 (ref), uDim2 (ref), minValue (ref)
		p4.GuiObject:TweenSize(uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, minValue, true)
	end) then
		p4.GuiObject.Size = uDim2
	end
end

function t_2.SetTextSize(value, p4)
	if not value:IsInCustomState() then
		if value.TextBox then
			value.TextBox.TextSize = p4
		end
		if value.TextLabel then
			value.TextLabel.TextSize = p4
		end
	end
end

function t_2.GetDefaultChannelNameColor(_)
	-- upvalues: chatSettingsModule (ref)
	return if chatSettingsModule.DefaultChannelNameColor then chatSettingsModule.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
end

function t_2.SetChannelTarget(value, p4)
	-- upvalues: chatSettingsModule (ref), t_1 (write)
	local messageModeTextButton = value.GuiObjects.MessageModeTextButton
	local textBox = value.TextBox
	local textLabel = value.TextLabel
	value.TargetChannel = p4
	
	if not value:IsInCustomState() then
		if p4 == chatSettingsModule.GeneralChannelName then
			messageModeTextButton.Text = ""
			messageModeTextButton.Size = UDim2.new(0, 0, 0, 0)
			textBox.Size = UDim2.new(1, 0, 1, 0)
			textBox.Position = UDim2.new(0, 0, 0, 0)
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.Position = UDim2.new(0, 0, 0, 0)
		else
			messageModeTextButton.Size = UDim2.new(0, 1000, 1, 0)
			messageModeTextButton.Text = string.format("[%s] ", if t_1.tryLocalize then t_1:tryLocalize(p4) else p4)
			local var1 = value:GetChannelNameColor(p4)
			
			if var1 then
				messageModeTextButton.TextColor3 = var1
			else
				messageModeTextButton.TextColor3 = value:GetDefaultChannelNameColor()
			end
			local x = messageModeTextButton.TextBounds.X
			messageModeTextButton.Size = UDim2.new(0, x, 1, 0)
			textBox.Size = UDim2.new(1, -x, 1, 0)
			textBox.Position = UDim2.new(0, x, 0, 0)
			textLabel.Size = UDim2.new(1, -x, 1, 0)
			textLabel.Position = UDim2.new(0, x, 0, 0)
			
			return
		end
	end
end

function t_2.IsInCustomState(p4)
	return p4.InCustomState
end

function t_2.ResetCustomState(value)
	-- upvalues: t_1 (write)
	if value.InCustomState then
		value.CustomState:Destroy()
		value.CustomState = nil
		value.InCustomState = false
		value.ChatBarParentFrame:ClearAllChildren()
		value:CreateGuiObjects(value.ChatBarParentFrame)
		value:SetTextLabelText(t_1:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
	end
end

function t_2.EnterWhisperState(p4, p5)
	-- upvalues: whisperModule (ref), chatSettingsModule (ref)
	p4:ResetCustomState()
	
	if whisperModule.CustomStateCreator then
		p4.CustomState = whisperModule.CustomStateCreator(p5, p4.ChatWindow, p4, chatSettingsModule)
		p4.InCustomState = true
	else
		local _ = nil
		p4:SetText("/w " .. (if chatSettingsModule.PlayerDisplayNamesEnabled then p5.DisplayName else p5.Name))
	end
	p4:CaptureFocus()
end

function t_2.GetCustomMessage(p4)
	return if p4.InCustomState then p4.CustomState:GetMessage() else nil
end

function t_2.CustomStateProcessCompletedMessage(p4, _)
	return if p4.InCustomState then p4.CustomState:ProcessCompletedMessage() else false
end

function t_2.FadeOutBackground(value, p4)
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p4)
	value:FadeOutText(p4)
end

function t_2.FadeInBackground(value, p4)
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p4)
	value:FadeInText(p4)
end

function t_2.FadeOutText(p4, p5)
	-- upvalues: curveUtilModule (ref)
	p4.AnimParams.Text_TargetTransparency = 1
	p4.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p5)
end

function t_2.FadeInText(p4, p5)
	-- upvalues: curveUtilModule (ref)
	p4.AnimParams.Text_TargetTransparency = 0.4
	p4.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p5)
end

function t_2.AnimGuiObjects(p4)
	p4.GuiObject.BackgroundTransparency = p4.AnimParams.Background_CurrentTransparency
	p4.GuiObjects.TextBoxFrame.BackgroundTransparency = p4.AnimParams.Background_CurrentTransparency
	p4.GuiObjects.TextLabel.TextTransparency = p4.AnimParams.Text_CurrentTransparency
	p4.GuiObjects.TextBox.TextTransparency = p4.AnimParams.Text_CurrentTransparency
	p4.GuiObjects.MessageModeTextButton.TextTransparency = p4.AnimParams.Text_CurrentTransparency
end

function t_2.InitializeAnimParams(p4)
	p4.AnimParams.Text_TargetTransparency = 0.4
	p4.AnimParams.Text_CurrentTransparency = 0.4
	p4.AnimParams.Text_NormalizedExptValue = 1
	p4.AnimParams.Background_TargetTransparency = 0.6
	p4.AnimParams.Background_CurrentTransparency = 0.6
	p4.AnimParams.Background_NormalizedExptValue = 1
end

function t_2.Update(p4, p5)
	-- upvalues: curveUtilModule (ref)
	p4.AnimParams.Text_CurrentTransparency = curveUtilModule:Expt(p4.AnimParams.Text_CurrentTransparency, p4.AnimParams.Text_TargetTransparency, p4.AnimParams.Text_NormalizedExptValue, p5)
	p4.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p4.AnimParams.Background_CurrentTransparency, p4.AnimParams.Background_TargetTransparency, p4.AnimParams.Background_NormalizedExptValue, p5)
	p4:AnimGuiObjects()
end

function t_2.SetChannelNameColor(value, p4, p5)
	value.ChannelNameColors[p4] = p5
	
	if value.GuiObjects.MessageModeTextButton.Text == p4 then
		value.GuiObjects.MessageModeTextButton.TextColor3 = p5
	end
end

function t_2.GetChannelNameColor(p4, p5)
	return p4.ChannelNameColors[p5]
end

function t.new(p4, p5)
	-- upvalues: t_2 (ref), chatSettingsModule (ref), chatService (ref), localPlayer (write), runService (ref)
	local tbl = setmetatable({}, t_2)
	tbl.GuiObject = nil
	tbl.ChatBarParentFrame = nil
	tbl.TextBox = nil
	tbl.TextLabel = nil
	tbl.GuiObjects = {}
	tbl.eGuiObjectsChanged = Instance.new("BindableEvent")
	tbl.GuiObjectsChanged = tbl.eGuiObjectsChanged.Event
	tbl.TextBoxConnections = {}
	tbl.PreviousText = ""
	tbl.InCustomState = false
	tbl.CustomState = nil
	tbl.TargetChannel = nil
	tbl.CommandProcessor = p4
	tbl.ChatWindow = p5
	tbl.TweenPixelsPerSecond = 500
	tbl.TargetYSize = 0
	tbl.AnimParams = {}
	tbl.CalculatingSizeLock = false
	tbl.ChannelNameColors = {}
	tbl.UserHasChatOff = false
	tbl:InitializeAnimParams()
	chatSettingsModule.SettingsChanged:connect(function(p6, p7)
		-- upvalues: tbl (ref)
		if p6 == "ChatBarTextSize" then
			tbl:SetTextSize(p7)
		end
	end)
	coroutine.wrap(function()
		-- upvalues: chatService (copy), localPlayer (copy), runService (copy), tbl (ref)
		local ok, status = pcall(function()
			-- upvalues: chatService (copy), localPlayer (copy)
			return chatService:CanUserChatAsync(localPlayer.UserId)
		end)
		
		if (ok and (runService:IsStudio() or status)) == false then
			tbl.UserHasChatOff = true
			tbl:DoLockChatBar()
		end
	end)()
	
	return tbl
end

return t