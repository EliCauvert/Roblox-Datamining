local t = {}
local playersService = game:GetService("Players")
local _ = game:GetService("Chat")
local playerGui = playersService.LocalPlayer:WaitForChild("PlayerGui")
local chatService = game:GetService("Chat")
local clientChatModules = chatService:WaitForChild("ClientChatModules")
local parent = script.Parent
local chatChannelModule = require(parent:WaitForChild("ChatChannel"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local curveUtilModule = require(parent:WaitForChild("CurveUtil"))
local t_1 = {}
t_1.__index = t_1

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

function mergeProps(p0, p1)
	if not p0 or not p1 then return end
	for i, v in pairs(p0) do
		if p1[i] ~= nil then
			p1[i] = v
		end
	end
end

function t_1.CreateGuiObjects(p2, p3)
	-- upvalues: chatService (ref), chatSettingsModule (ref), playerGui (ref)
	local var9 = nil
	pcall(function()
		-- upvalues: var9 (write), chatService (copy)
		var9 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil)
	end)
	mergeProps(var9, chatSettingsModule)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Active = chatSettingsModule.WindowDraggable
	frame.Parent = p3
	frame.AutoLocalize = false
	local chatBarParentFrame = Instance.new("Frame")
	chatBarParentFrame.Selectable = false
	chatBarParentFrame.Name = "ChatBarParentFrame"
	chatBarParentFrame.BackgroundTransparency = 1
	chatBarParentFrame.Parent = frame
	local channelsBarParentFrame = Instance.new("Frame")
	channelsBarParentFrame.Selectable = false
	channelsBarParentFrame.Name = "ChannelsBarParentFrame"
	channelsBarParentFrame.BackgroundTransparency = 1
	channelsBarParentFrame.Position = UDim2.new(0, 0, 0, 0)
	channelsBarParentFrame.Parent = frame
	local chatChannelParentFrame = Instance.new("Frame")
	chatChannelParentFrame.Selectable = false
	chatChannelParentFrame.Name = "ChatChannelParentFrame"
	chatChannelParentFrame.BackgroundTransparency = 1
	chatChannelParentFrame.BackgroundColor3 = chatSettingsModule.BackGroundColor
	chatChannelParentFrame.BackgroundTransparency = 0.6
	chatChannelParentFrame.BorderSizePixel = 0
	chatChannelParentFrame.Parent = frame
	local imageButton = Instance.new("ImageButton")
	imageButton.Selectable = false
	imageButton.Image = ""
	imageButton.BackgroundTransparency = 0.6
	imageButton.BorderSizePixel = 0
	imageButton.Visible = false
	imageButton.BackgroundColor3 = chatSettingsModule.BackGroundColor
	imageButton.Active = true
	
	if bubbleChatOnly() then
		imageButton.Position = UDim2.new(1, -imageButton.AbsoluteSize.X, 0, 0)
	else
		imageButton.Position = UDim2.new(1, -imageButton.AbsoluteSize.X, 1, -imageButton.AbsoluteSize.Y)
	end
	imageButton.Parent = frame
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Selectable = false
	imageLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
	imageLabel.Position = UDim2.new(0.2, 0, 0.2, 0)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = "rbxassetid://261880743"
	imageLabel.Parent = imageButton
	
	local function _()
		-- upvalues: frame (ref)
		local var29 = frame
		while var29 and not var29:IsA("ScreenGui") do
			var29 = var29.Parent
		end
		return var29
	end
	
	local var16 = 3
	local var17 = frame
	while var17 and not var17:IsA("ScreenGui") do
		var17 = var17.Parent
	end
	local var18 = var17
	
	if var18.AbsoluteSize.X <= 640 then
		var16 = 1
	elseif var18.AbsoluteSize.X <= 1024 then
		var16 = 2
	end
	local var19 = false
	
	local function doCheckSizeBounds()
		-- upvalues: var19 (write), frame (ref), playerGui (copy), chatSettingsModule (copy), channelsBarParentFrame (ref), chatBarParentFrame (ref)
		if var19 then return end
		var19 = true
		
		if not frame:IsDescendantOf(playerGui) then return end
		local var30 = frame
		while var30 and not var30:IsA("ScreenGui") do
			var30 = var30.Parent
		end
		local minimumWindowSize = chatSettingsModule.MinimumWindowSize
		local maximumWindowSize = chatSettingsModule.MaximumWindowSize
		local var31 = minimumWindowSize.X.Scale * var30.AbsoluteSize.X + minimumWindowSize.X.Offset
		local maxValue = math.max(minimumWindowSize.Y.Scale * var30.AbsoluteSize.Y + minimumWindowSize.Y.Offset, channelsBarParentFrame.AbsoluteSize.Y + chatBarParentFrame.AbsoluteSize.Y)
		local var33 = maximumWindowSize.X.Scale * var30.AbsoluteSize.X + maximumWindowSize.X.Offset
		local var34 = maximumWindowSize.Y.Scale * var30.AbsoluteSize.Y + maximumWindowSize.Y.Offset
		local x = frame.AbsoluteSize.X
		local y = frame.AbsoluteSize.Y
		
		if x < var31 then
			frame.Size += UDim2.new(0, var31 - x, 0, 0)
		elseif var33 < x then
			frame.Size += UDim2.new(0, var33 - x, 0, 0)
		end
		if y < maxValue then
			frame.Size += UDim2.new(0, 0, 0, maxValue - y)
		elseif var34 < y then
			frame.Size += UDim2.new(0, 0, 0, var34 - y)
		end
		frame.Size = UDim2.new(frame.AbsoluteSize.X / var30.AbsoluteSize.X, 0, frame.AbsoluteSize.Y / var30.AbsoluteSize.Y, 0)
		var19 = false
	end
	
	frame.Changed:connect(function(p4)
		-- upvalues: doCheckSizeBounds (ref)
		if p4 == "AbsoluteSize" then
			doCheckSizeBounds()
		end
	end)
	imageButton.DragBegin:connect(function(_)
		-- upvalues: frame (ref)
		frame.Draggable = false
	end)
	
	local function UpdatePositionFromDrag(p5)
		-- upvalues: chatSettingsModule (copy), frame (ref), imageButton (ref)
		if chatSettingsModule.WindowDraggable == false and chatSettingsModule.WindowResizable == false then return end
		local var35 = p5 - frame.AbsolutePosition + imageButton.AbsoluteSize
		frame.Size = UDim2.new(0, var35.X, 0, var35.Y)
		
		if bubbleChatOnly() then
			imageButton.Position = UDim2.new(1, -imageButton.AbsoluteSize.X, 0, 0)
			
			return
		end
		imageButton.Position = UDim2.new(1, -imageButton.AbsoluteSize.X, 1, -imageButton.AbsoluteSize.Y)
	end
	
	imageButton.DragStopped:connect(function(_, _)
		-- upvalues: frame (ref), chatSettingsModule (copy)
		frame.Draggable = chatSettingsModule.WindowDraggable
	end)
	local var22 = false
	imageButton.Changed:connect(function(p6)
		-- upvalues: frame (ref), var22 (write), UpdatePositionFromDrag (ref), imageButton (ref)
		if p6 == "AbsolutePosition" and not frame.Draggable then
			if var22 then return end
			var22 = true
			UpdatePositionFromDrag(imageButton.AbsolutePosition)
			var22 = false
		end
	end)
	
	local _ = function(p7)
		-- upvalues: var16 (write), chatSettingsModule (copy)
		return math.max(32, (if var16 == 1 then p7 or chatSettingsModule.ChatChannelsTabTextSizePhone else p7 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2
	end
	
	local _ = function(p8)
		-- upvalues: var16 (write), chatSettingsModule (copy)
		return (if var16 == 1 then p8 or chatSettingsModule.ChatBarTextSizePhone else p8 or chatSettingsModule.ChatBarTextSize) + 14 + 10
	end
	
	if bubbleChatOnly() then
		chatBarParentFrame.Position = UDim2.new(0, 0, 0, 0)
		channelsBarParentFrame.Visible = false
		channelsBarParentFrame.Active = false
		chatChannelParentFrame.Visible = false
		chatChannelParentFrame.Active = false
		local _ = 0
		local _ = 0
		local var23 = frame
		while var23 and not var23:IsA("ScreenGui") do
			var23 = var23.Parent
		end
		local scale, offset
		local _ = var23
		
		if var16 == 1 then
			scale = chatSettingsModule.DefaultWindowSizePhone.X.Scale
			offset = chatSettingsModule.DefaultWindowSizePhone.X.Offset
		elseif var16 == 2 then
			scale = chatSettingsModule.DefaultWindowSizeTablet.X.Scale
			offset = chatSettingsModule.DefaultWindowSizeTablet.X.Offset
		else
			scale = chatSettingsModule.DefaultWindowSizeDesktop.X.Scale
			offset = chatSettingsModule.DefaultWindowSizeDesktop.X.Offset
		end
		local var24 = nil
		frame.Size = UDim2.new(scale, offset, 0, (if var16 == 1 then var24 or chatSettingsModule.ChatBarTextSizePhone else var24 or chatSettingsModule.ChatBarTextSize) + 14 + 10)
		frame.Position = chatSettingsModule.DefaultWindowPosition
	else
		local var25 = frame
		while var25 and not var25:IsA("ScreenGui") do
			var25 = var25.Parent
		end
		local _ = var25
		
		if var16 == 1 then
			frame.Size = chatSettingsModule.DefaultWindowSizePhone
		elseif var16 == 2 then
			frame.Size = chatSettingsModule.DefaultWindowSizeTablet
		else
			frame.Size = chatSettingsModule.DefaultWindowSizeDesktop
		end
		frame.Position = chatSettingsModule.DefaultWindowPosition
	end
	if var16 == 1 then
		chatSettingsModule.ChatWindowTextSize = chatSettingsModule.ChatWindowTextSizePhone
		chatSettingsModule.ChatChannelsTabTextSize = chatSettingsModule.ChatChannelsTabTextSizePhone
		chatSettingsModule.ChatBarTextSize = chatSettingsModule.ChatBarTextSizePhone
	end
	local _ = function(p9)
		-- upvalues: frame (ref)
		frame.Active = p9
		frame.Draggable = p9
	end
	
	local function UpdateResizable(p10)
		-- upvalues: imageButton (ref), chatBarParentFrame (ref)
		imageButton.Visible = p10
		imageButton.Draggable = p10
		local offset = chatBarParentFrame.Size.Y.Offset
		
		if p10 then
			chatBarParentFrame.Size = UDim2.new(1, (-offset) - 2, 0, offset)
			
			if bubbleChatOnly() then
				return
			else
				chatBarParentFrame.Position = UDim2.new(0, 0, 1, -offset)
				
				return
			end
		else
			chatBarParentFrame.Size = UDim2.new(1, 0, 0, offset)
			
			if not bubbleChatOnly() then
				chatBarParentFrame.Position = UDim2.new(0, 0, 1, -offset)
			end
		end
	end
	
	local function UpdateChatChannelParentFrameSize()
		-- upvalues: var16 (write), chatSettingsModule (copy), chatChannelParentFrame (ref)
		local var36 = nil
		local var37 = math.max(32, (if var16 == 1 then var36 or chatSettingsModule.ChatChannelsTabTextSizePhone else var36 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2
		local var38 = nil
		local var39 = (if var16 == 1 then var38 or chatSettingsModule.ChatBarTextSizePhone else var38 or chatSettingsModule.ChatBarTextSize) + 14 + 10
		
		if chatSettingsModule.ShowChannelsBar then
			chatChannelParentFrame.Size = UDim2.new(1, 0, 1, -(var37 + var39 + 2 + 2))
			chatChannelParentFrame.Position = UDim2.new(0, 0, 0, var37 + 2)
			
			return
		end
		chatChannelParentFrame.Size = UDim2.new(1, 0, 1, -(var39 + 2 + 2))
		chatChannelParentFrame.Position = UDim2.new(0, 0, 0, 2)
	end
	
	local _ = function(p11)
		-- upvalues: var16 (write), chatSettingsModule (copy), channelsBarParentFrame (ref), UpdateChatChannelParentFrameSize (ref)
		channelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if var16 == 1 then p11 or chatSettingsModule.ChatChannelsTabTextSizePhone else p11 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
		UpdateChatChannelParentFrameSize()
	end
	
	local function UpdateChatBarTextSize(p12)
		-- upvalues: var16 (write), chatSettingsModule (copy), chatBarParentFrame (ref), imageButton (ref), UpdateChatChannelParentFrameSize (ref), UpdateResizable (ref)
		local var40 = (if var16 == 1 then p12 or chatSettingsModule.ChatBarTextSizePhone else p12 or chatSettingsModule.ChatBarTextSize) + 14 + 10
		chatBarParentFrame.Size = UDim2.new(1, 0, 0, var40)
		
		if not bubbleChatOnly() then
			chatBarParentFrame.Position = UDim2.new(0, 0, 1, -var40)
		end
		imageButton.Size = UDim2.new(0, var40, 0, var40)
		imageButton.Position = UDim2.new(1, -var40, 1, -var40)
		UpdateChatChannelParentFrameSize()
		UpdateResizable(chatSettingsModule.WindowResizable)
	end
	
	local _ = function(p13)
		-- upvalues: channelsBarParentFrame (ref), UpdateChatChannelParentFrameSize (ref)
		channelsBarParentFrame.Visible = p13
		UpdateChatChannelParentFrameSize()
	end
	
	local chatChannelsTabTextSize = chatSettingsModule.ChatChannelsTabTextSize
	channelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if var16 == 1 then chatChannelsTabTextSize or chatSettingsModule.ChatChannelsTabTextSizePhone else chatChannelsTabTextSize or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
	UpdateChatChannelParentFrameSize()
	UpdateChatBarTextSize(chatSettingsModule.ChatBarTextSize)
	local windowDraggable = chatSettingsModule.WindowDraggable
	frame.Active = windowDraggable
	frame.Draggable = windowDraggable
	UpdateResizable(chatSettingsModule.WindowResizable)
	channelsBarParentFrame.Visible = chatSettingsModule.ShowChannelsBar
	UpdateChatChannelParentFrameSize()
	chatSettingsModule.SettingsChanged:connect(function(p14, p15)
		-- upvalues: frame (ref), UpdateResizable (ref), var16 (write), chatSettingsModule (copy), channelsBarParentFrame (ref), UpdateChatChannelParentFrameSize (ref), UpdateChatBarTextSize (ref)
		if p14 == "WindowDraggable" then
			frame.Active = p15
			frame.Draggable = p15
			
			return
		elseif p14 == "WindowResizable" then
			UpdateResizable(p15)
			
			return
		elseif p14 == "ChatChannelsTabTextSize" then
			channelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if var16 == 1 then p15 or chatSettingsModule.ChatChannelsTabTextSizePhone else p15 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
			UpdateChatChannelParentFrameSize()
			
			return
		elseif p14 == "ChatBarTextSize" then
			UpdateChatBarTextSize(p15)
			
			return
		elseif p14 == "ShowChannelsBar" then
			channelsBarParentFrame.Visible = p15
			UpdateChatChannelParentFrameSize()
		end
	end)
	p2.GuiObject = frame
	p2.GuiObjects.BaseFrame = frame
	p2.GuiObjects.ChatBarParentFrame = chatBarParentFrame
	p2.GuiObjects.ChannelsBarParentFrame = channelsBarParentFrame
	p2.GuiObjects.ChatChannelParentFrame = chatChannelParentFrame
	p2.GuiObjects.ChatResizerFrame = imageButton
	p2.GuiObjects.ResizeIcon = imageLabel
	p2:AnimGuiObjects()
end

function t_1.GetChatBar(p16)
	return p16.ChatBar
end

function t_1.RegisterChatBar(p17, p18)
	p17.ChatBar = p18
	p17.ChatBar:CreateGuiObjects(p17.GuiObjects.ChatBarParentFrame)
end

function t_1.RegisterChannelsBar(p19, p20)
	p19.ChannelsBar = p20
	p19.ChannelsBar:CreateGuiObjects(p19.GuiObjects.ChannelsBarParentFrame)
end

function t_1.RegisterMessageLogDisplay(p21, p22)
	p21.MessageLogDisplay = p22
	p21.MessageLogDisplay.GuiObject.Parent = p21.GuiObjects.ChatChannelParentFrame
end

function t_1.AddChannel(p23, p24)
	-- upvalues: chatChannelModule (ref)
	if p23:GetChannel(p24) then
		error("Channel '" .. p24 .. "' already exists!")
		
		return
	end
	local var41 = chatChannelModule.new(p24, p23.MessageLogDisplay)
	p23.Channels[p24:lower()] = var41
	var41:SetActive(false)
	local var42 = p23.ChannelsBar:AddChannelTab(p24)
	var42.NameTag.MouseButton1Click:connect(function()
		-- upvalues: p23 (ref), p24 (ref)
		p23:SwitchCurrentChannel(p24)
	end)
	var41:RegisterChannelTab(var42)
	
	return var41
end

function t_1.GetFirstChannel(p25)
	for i, v in pairs(p25.Channels) do
		return v
	end
	return nil
end

function t_1.RemoveChannel(p26, p27)
	-- upvalues: chatSettingsModule (ref)
	if not p26:GetChannel(p27) then
		error("Channel '" .. p27 .. "' does not exist!")
	end
	local var43 = p27:lower()
	local var44 = false
	
	if p26.Channels[var43] == p26:GetCurrentChannel() then
		var44 = true
		p26:SwitchCurrentChannel(nil)
	end
	p26.Channels[var43]:Destroy()
	p26.Channels[var43] = nil
	p26.ChannelsBar:RemoveChannelTab(p27)
	
	if var44 then
		local var46
		local _ = nil
		
		if p26:GetChannel(chatSettingsModule.GeneralChannelName) ~= nil and not (var43 == chatSettingsModule.GeneralChannelName:lower()) then
			var46 = chatSettingsModule.GeneralChannelName
		else
			local firstChannel = p26:GetFirstChannel()
			var46 = if firstChannel then firstChannel.Name else nil
		end
		p26:SwitchCurrentChannel(var46)
	end
	if not chatSettingsModule.ShowChannelsBar and p26.ChatBar.TargetChannel == p27 then
		p26.ChatBar:SetChannelTarget(chatSettingsModule.GeneralChannelName)
	end
end

function t_1.GetChannel(p28, p29)
	return if p29 then p28.Channels[p29:lower()] else nil
end

function t_1.GetTargetMessageChannel(p30)
	-- upvalues: chatSettingsModule (ref)
	if chatSettingsModule.ShowChannelsBar then
		local currentChannel = p30:GetCurrentChannel()
		
		return currentChannel and currentChannel.Name
	end
	return p30.ChatBar.TargetChannel
end

function t_1.GetCurrentChannel(p31)
	return p31.CurrentChannel
end

function t_1.SwitchCurrentChannel(p32, p33)
	-- upvalues: chatSettingsModule (ref)
	if not chatSettingsModule.ShowChannelsBar then
		local var48 = p32:GetChannel(p33)
		
		if var48 then
			p32.ChatBar:SetChannelTarget(var48.Name)
		end
		p33 = chatSettingsModule.GeneralChannelName
	end
	local currentChannel = p32:GetCurrentChannel()
	local var50 = p32:GetChannel(p33)
	
	if var50 == nil then
		error(string.format("Channel '%s' does not exist.", p33))
	end
	if var50 ~= currentChannel then
		if currentChannel then
			currentChannel:SetActive(false)
			p32.ChannelsBar:GetChannelTab(currentChannel.Name):SetActive(false)
		end
		if var50 then
			var50:SetActive(true)
			p32.ChannelsBar:GetChannelTab(var50.Name):SetActive(true)
		end
		p32.CurrentChannel = var50
	end
end

function t_1.UpdateFrameVisibility(p34)
	p34.GuiObject.Visible = p34.Visible and p34.CoreGuiEnabled
end

function t_1.GetVisible(p35)
	return p35.Visible
end

function t_1.SetVisible(value, p36)
	value.Visible = p36
	value:UpdateFrameVisibility()
end

function t_1.GetCoreGuiEnabled(p37)
	return p37.CoreGuiEnabled
end

function t_1.SetCoreGuiEnabled(value, p38)
	value.CoreGuiEnabled = p38
	value:UpdateFrameVisibility()
end

function t_1.EnableResizable(p39)
	p39.GuiObjects.ChatResizerFrame.Active = true
end

function t_1.DisableResizable(p40)
	p40.GuiObjects.ChatResizerFrame.Active = false
end

function t_1.FadeOutBackground(value, p41)
	-- upvalues: curveUtilModule (ref)
	value.ChannelsBar:FadeOutBackground(p41)
	value.MessageLogDisplay:FadeOutBackground(p41)
	value.ChatBar:FadeOutBackground(p41)
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p41)
end

function t_1.FadeInBackground(value, p42)
	-- upvalues: curveUtilModule (ref)
	value.ChannelsBar:FadeInBackground(p42)
	value.MessageLogDisplay:FadeInBackground(p42)
	value.ChatBar:FadeInBackground(p42)
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p42)
end

function t_1.FadeOutText(p43, p44)
	p43.MessageLogDisplay:FadeOutText(p44)
	p43.ChannelsBar:FadeOutText(p44)
end

function t_1.FadeInText(p45, p46)
	p45.MessageLogDisplay:FadeInText(p46)
	p45.ChannelsBar:FadeInText(p46)
end

function t_1.AnimGuiObjects(p47)
	p47.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = p47.AnimParams.Background_CurrentTransparency
	p47.GuiObjects.ChatResizerFrame.BackgroundTransparency = p47.AnimParams.Background_CurrentTransparency
	p47.GuiObjects.ResizeIcon.ImageTransparency = p47.AnimParams.Background_CurrentTransparency
end

function t_1.InitializeAnimParams(p48)
	-- upvalues: curveUtilModule (ref)
	p48.AnimParams.Background_TargetTransparency = 0.6
	p48.AnimParams.Background_CurrentTransparency = 0.6
	p48.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function t_1.Update(p49, p50)
	-- upvalues: curveUtilModule (ref)
	p49.ChatBar:Update(p50)
	p49.ChannelsBar:Update(p50)
	p49.MessageLogDisplay:Update(p50)
	p49.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p49.AnimParams.Background_CurrentTransparency, p49.AnimParams.Background_TargetTransparency, p49.AnimParams.Background_NormalizedExptValue, p50)
	p49:AnimGuiObjects()
end

function t.new()
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.GuiObject = nil
	tbl.GuiObjects = {}
	tbl.ChatBar = nil
	tbl.ChannelsBar = nil
	tbl.MessageLogDisplay = nil
	tbl.Channels = {}
	tbl.CurrentChannel = nil
	tbl.Visible = true
	tbl.CoreGuiEnabled = true
	tbl.AnimParams = {}
	tbl:InitializeAnimParams()
	
	return tbl
end

return t