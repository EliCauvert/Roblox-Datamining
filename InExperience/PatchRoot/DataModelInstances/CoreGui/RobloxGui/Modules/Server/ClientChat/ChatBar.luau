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
pcall(function() --[[ line: 35 ]]
	-- upvalues: t_1 (write)
	t_1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t_1 == nil then
	t_1 = {
		Get = function(_, _, p0) --[[ line: 36 ]]
			return p0
		end
	}
end
local t_2 = {}
t_2.__index = t_2

function t_2.CreateGuiObjects(p1, p2) --[[ line: 43 ]]
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

function t_2.DoLockChatBar(p3) --[[ line: 142 ]]
	-- upvalues: localPlayer (write), t_1 (write)
	if p3.TextLabel then
		if localPlayer.UserId > 0 then
			p3.TextLabel.Text = t_1:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.")
		else
			p3.TextLabel.Text = t_1:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.")
		end
		p3:CalculateSize()
	end
	if p3.TextBox then
		p3.TextBox.Active = false
		p3.TextBox.Focused:connect(function() --[[ line: 159 ]]
			-- upvalues: p3 (ref)
			p3.TextBox:ReleaseFocus()
		end)
	end
end

function t_2.SetUpTextBoxEvents(value, p4, p5, p6) --[[ line: 165 ]]
	-- upvalues: userInputService (ref), chatSettingsModule (ref)
	for i, v in pairs(value.TextBoxConnections) do
		v:disconnect()
		value.TextBoxConnections[i] = nil
	end
	value.TextBoxConnections.UserInputBegan = userInputService.InputBegan:connect(function(p7, _) --[[ line: 173 ]]
		-- upvalues: value (ref), p4 (ref), chatSettingsModule (copy)
		if p7.KeyCode == Enum.KeyCode.Backspace and value:IsFocused() and p4.Text == "" then
			value:SetChannelTarget(chatSettingsModule.GeneralChannelName)
		end
	end)
	value.TextBoxConnections.TextBoxChanged = p4.Changed:connect(function(p8) --[[ line: 181 ]]
		-- upvalues: value (ref), p4 (ref), chatSettingsModule (copy)
		if p8 == "AbsoluteSize" then
			value:CalculateSize()
			
			return
		elseif p8 ~= "Text" then return end
		value:CalculateSize()
		
		if chatSettingsModule.MaximumMessageLength < utf8.len(utf8.nfcnormalize(p4.Text)) then
			p4.Text = value.PreviousText
		else
			value.PreviousText = p4.Text
		end
		if value.InCustomState then
			value.CustomState:TextUpdated()
		else
			local text = value.CommandProcessor:ProcessInProgressChatMessage(p4.Text, value.ChatWindow, value)
			
			if text then
				value.InCustomState = true
				value.CustomState = text
				
				return
			end
		end
	end)
	
	local function _(p9) --[[ line: 210 | named "UpdateOnFocusStatusChanged" ]]
		-- upvalues: p4 (ref), p5 (ref)
		if p9 or p4.Text ~= "" then
			p5.Visible = false
			
			return
		end
		p5.Visible = true
	end
	
	value.TextBoxConnections.MessageModeClick = p6.MouseButton1Click:connect(function() --[[ line: 218 ]]
		-- upvalues: p6 (ref), value (ref), chatSettingsModule (copy)
		if p6.Text ~= "" then
			value:SetChannelTarget(chatSettingsModule.GeneralChannelName)
		end
	end)
	value.TextBoxConnections.TextBoxFocused = p4.Focused:connect(function() --[[ line: 224 ]]
		-- upvalues: value (ref), p5 (ref)
		if not value.UserHasChatOff then
			value:CalculateSize()
			p5.Visible = false
		end
	end)
	value.TextBoxConnections.TextBoxFocusLost = p4.FocusLost:connect(function(_, p10) --[[ line: 231 ]]
		-- upvalues: value (ref), p4 (ref), p5 (ref)
		value:CalculateSize()
		
		if p10 and p10.KeyCode == Enum.KeyCode.Escape then
			p4.Text = ""
		end
		if p4.Text == "" then
			p5.Visible = true
			
			return
		end
		p5.Visible = false
	end)
end

function t_2.GetTextBox(p11) --[[ line: 240 ]]
	return p11.TextBox
end

function t_2.GetMessageModeTextButton(p12) --[[ line: 244 ]]
	return p12.GuiObjects.MessageModeTextButton
end

function t_2.GetMessageModeTextLabel(p13) --[[ line: 250 ]]
	return p13:GetMessageModeTextButton()
end

function t_2.IsFocused(p14) --[[ line: 254 ]]
	return if p14.UserHasChatOff then false else p14:GetTextBox():IsFocused()
end

function t_2.GetVisible(p15) --[[ line: 262 ]]
	return p15.GuiObject.Visible
end

function t_2.CaptureFocus(p16) --[[ line: 266 ]]
	if not p16.UserHasChatOff then
		p16:GetTextBox():CaptureFocus()
	end
end

function t_2.ReleaseFocus(p17, p18) --[[ line: 272 ]]
	p17:GetTextBox():ReleaseFocus(p18)
end

function t_2.ResetText(value) --[[ line: 276 ]]
	value:GetTextBox().Text = ""
end

function t_2.SetText(value, p19) --[[ line: 280 ]]
	value:GetTextBox().Text = p19
end

function t_2.GetEnabled(p20) --[[ line: 284 ]]
	return p20.GuiObject.Visible
end

function t_2.SetEnabled(value, p21) --[[ line: 288 ]]
	if value.UserHasChatOff then
		value.GuiObject.Visible = true
		
		return
	end
	value.GuiObject.Visible = p21
end

function t_2.SetTextLabelText(value, p22) --[[ line: 298 ]]
	if not value.UserHasChatOff then
		value.TextLabel.Text = p22
	end
end

function t_2.SetTextBoxText(value, p23) --[[ line: 304 ]]
	value.TextBox.Text = p23
end

function t_2.GetTextBoxText(p24) --[[ line: 308 ]]
	return p24.TextBox.Text
end

function t_2.ResetSize(value) --[[ line: 312 ]]
	value.TargetYSize = 0
	value:TweenToTargetYSize()
end

local function _(p25) --[[ line: 317 | named "measureSize" ]]
	-- upvalues: textService (ref)
	return textService:GetTextSize(p25.Text, p25.TextSize, p25.Font, Vector2.new(p25.AbsoluteSize.X, 10000))
end

function t_2.CalculateSize(p26) --[[ line: 326 ]]
	-- upvalues: textService (ref)
	if p26.CalculatingSizeLock then return end
	local textSize, y
	p26.CalculatingSizeLock = true
	local _ = nil
	local _ = nil
	
	if p26:IsFocused() or p26.TextBox.Text ~= "" then
		textSize = p26.TextBox.TextSize
		local textBox = p26.TextBox
		y = textService:GetTextSize(textBox.Text, textBox.TextSize, textBox.Font, Vector2.new(textBox.AbsoluteSize.X, 10000)).Y
	else
		textSize = p26.TextLabel.TextSize
		local textLabel = p26.TextLabel
		y = textService:GetTextSize(textLabel.Text, textLabel.TextSize, textLabel.Font, Vector2.new(textLabel.AbsoluteSize.X, 10000)).Y
	end
	local var19 = y - textSize
	
	if p26.TargetYSize ~= var19 then
		p26.TargetYSize = var19
		p26:TweenToTargetYSize()
	end
	p26.CalculatingSizeLock = false
end

function t_2.TweenToTargetYSize(p27) --[[ line: 352 ]]
	local uDim2 = UDim2.new(1, 0, 1, p27.TargetYSize)
	local size = p27.GuiObject.Size
	local y = p27.GuiObject.AbsoluteSize.Y
	p27.GuiObject.Size = uDim2
	local y_1 = p27.GuiObject.AbsoluteSize.Y
	p27.GuiObject.Size = size
	local minValue = math.min(1, math.abs(y_1 - y) * (1 / p27.TweenPixelsPerSecond))
	
	if not pcall(function() --[[ line: 364 ]]
		-- upvalues: p27 (ref), uDim2 (ref), minValue (ref)
		p27.GuiObject:TweenSize(uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, minValue, true)
	end) then
		p27.GuiObject.Size = uDim2
	end
end

function t_2.SetTextSize(value, p28) --[[ line: 372 ]]
	if not value:IsInCustomState() then
		if value.TextBox then
			value.TextBox.TextSize = p28
		end
		if value.TextLabel then
			value.TextLabel.TextSize = p28
		end
	end
end

function t_2.GetDefaultChannelNameColor(_) --[[ line: 383 ]]
	-- upvalues: chatSettingsModule (ref)
	return if chatSettingsModule.DefaultChannelNameColor then chatSettingsModule.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
end

function t_2.SetChannelTarget(value, p29) --[[ line: 390 ]]
	-- upvalues: chatSettingsModule (ref), t_1 (write)
	local messageModeTextButton = value.GuiObjects.MessageModeTextButton
	local textBox = value.TextBox
	local textLabel = value.TextLabel
	value.TargetChannel = p29
	
	if not value:IsInCustomState() then
		if p29 == chatSettingsModule.GeneralChannelName then
			messageModeTextButton.Text = ""
			messageModeTextButton.Size = UDim2.new(0, 0, 0, 0)
			textBox.Size = UDim2.new(1, 0, 1, 0)
			textBox.Position = UDim2.new(0, 0, 0, 0)
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.Position = UDim2.new(0, 0, 0, 0)
		else
			messageModeTextButton.Size = UDim2.new(0, 1000, 1, 0)
			messageModeTextButton.Text = string.format("[%s] ", if t_1.tryLocalize then t_1:tryLocalize(p29) else p29)
			local var22 = value:GetChannelNameColor(p29)
			
			if var22 then
				messageModeTextButton.TextColor3 = var22
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

function t_2.IsInCustomState(p30) --[[ line: 430 ]]
	return p30.InCustomState
end

function t_2.ResetCustomState(value) --[[ line: 434 ]]
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

function t_2.EnterWhisperState(p31, p32) --[[ line: 451 ]]
	-- upvalues: whisperModule (ref), chatSettingsModule (ref)
	p31:ResetCustomState()
	
	if whisperModule.CustomStateCreator then
		p31.CustomState = whisperModule.CustomStateCreator(p32, p31.ChatWindow, p31, chatSettingsModule)
		p31.InCustomState = true
	else
		local _ = nil
		p31:SetText("/w " .. (if chatSettingsModule.PlayerDisplayNamesEnabled then p32.DisplayName else p32.Name))
	end
	p31:CaptureFocus()
end

function t_2.GetCustomMessage(p33) --[[ line: 475 ]]
	return if p33.InCustomState then p33.CustomState:GetMessage() else nil
end

function t_2.CustomStateProcessCompletedMessage(p34, _) --[[ line: 482 ]]
	return if p34.InCustomState then p34.CustomState:ProcessCompletedMessage() else false
end

function t_2.FadeOutBackground(value, p35) --[[ line: 489 ]]
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p35)
	value:FadeOutText(p35)
end

function t_2.FadeInBackground(value, p36) --[[ line: 495 ]]
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p36)
	value:FadeInText(p36)
end

function t_2.FadeOutText(p37, p38) --[[ line: 501 ]]
	-- upvalues: curveUtilModule (ref)
	p37.AnimParams.Text_TargetTransparency = 1
	p37.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p38)
end

function t_2.FadeInText(p39, p40) --[[ line: 506 ]]
	-- upvalues: curveUtilModule (ref)
	p39.AnimParams.Text_TargetTransparency = 0.4
	p39.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p40)
end

function t_2.AnimGuiObjects(p41) --[[ line: 511 ]]
	p41.GuiObject.BackgroundTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.GuiObjects.TextBoxFrame.BackgroundTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.GuiObjects.TextLabel.TextTransparency = p41.AnimParams.Text_CurrentTransparency
	p41.GuiObjects.TextBox.TextTransparency = p41.AnimParams.Text_CurrentTransparency
	p41.GuiObjects.MessageModeTextButton.TextTransparency = p41.AnimParams.Text_CurrentTransparency
end

function t_2.InitializeAnimParams(p42) --[[ line: 520 ]]
	p42.AnimParams.Text_TargetTransparency = 0.4
	p42.AnimParams.Text_CurrentTransparency = 0.4
	p42.AnimParams.Text_NormalizedExptValue = 1
	p42.AnimParams.Background_TargetTransparency = 0.6
	p42.AnimParams.Background_CurrentTransparency = 0.6
	p42.AnimParams.Background_NormalizedExptValue = 1
end

function t_2.Update(p43, p44) --[[ line: 530 ]]
	-- upvalues: curveUtilModule (ref)
	p43.AnimParams.Text_CurrentTransparency = curveUtilModule:Expt(p43.AnimParams.Text_CurrentTransparency, p43.AnimParams.Text_TargetTransparency, p43.AnimParams.Text_NormalizedExptValue, p44)
	p43.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p43.AnimParams.Background_CurrentTransparency, p43.AnimParams.Background_TargetTransparency, p43.AnimParams.Background_NormalizedExptValue, p44)
	p43:AnimGuiObjects()
end

function t_2.SetChannelNameColor(value, p45, p46) --[[ line: 547 ]]
	value.ChannelNameColors[p45] = p46
	
	if value.GuiObjects.MessageModeTextButton.Text == p45 then
		value.GuiObjects.MessageModeTextButton.TextColor3 = p46
	end
end

function t_2.GetChannelNameColor(p47, p48) --[[ line: 554 ]]
	return p47.ChannelNameColors[p48]
end

function t.new(p49, p50) --[[ line: 561 ]]
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
	tbl.CommandProcessor = p49
	tbl.ChatWindow = p50
	tbl.TweenPixelsPerSecond = 500
	tbl.TargetYSize = 0
	tbl.AnimParams = {}
	tbl.CalculatingSizeLock = false
	tbl.ChannelNameColors = {}
	tbl.UserHasChatOff = false
	tbl:InitializeAnimParams()
	chatSettingsModule.SettingsChanged:connect(function(p51, p52) --[[ line: 593 ]]
		-- upvalues: tbl (ref)
		if p51 == "ChatBarTextSize" then
			tbl:SetTextSize(p52)
		end
	end)
	coroutine.wrap(function() --[[ line: 599 ]]
		-- upvalues: chatService (copy), localPlayer (copy), runService (copy), tbl (ref)
		local ok, status = pcall(function() --[[ line: 600 ]]
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