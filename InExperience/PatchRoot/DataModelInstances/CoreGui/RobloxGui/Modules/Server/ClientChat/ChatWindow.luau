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

function mergeProps(p1, p2)
	if not p1 or not p2 then return end
	for i, v in pairs(p1) do
		if p2[i] ~= nil then
			p2[i] = v
		end
	end
end

function t_1.CreateGuiObjects(p3, p4)
	-- upvalues: chatService (ref), chatSettingsModule (ref), playerGui (ref)
	local var1 = nil
	pcall(function()
		-- upvalues: var1 (write), chatService (copy)
		var1 = chatService:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil)
	end)
	mergeProps(var1, chatSettingsModule)
	local frame = Instance.new("Frame")
	frame.BackgroundTransparency = 1
	frame.Active = chatSettingsModule.WindowDraggable
	frame.Parent = p4
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
		local var2 = frame
		while var2 and not var2:IsA("ScreenGui") do
			var2 = var2.Parent
		end
		return var2
	end
	
	local var3 = 3
	local var4 = frame
	while var4 and not var4:IsA("ScreenGui") do
		var4 = var4.Parent
	end
	local var5 = var4
	
	if var5.AbsoluteSize.X <= 640 then
		var3 = 1
	elseif var5.AbsoluteSize.X <= 1024 then
		var3 = 2
	end
	local var6 = false
	
	local function doCheckSizeBounds()
		-- upvalues: var6 (write), frame (ref), playerGui (copy), chatSettingsModule (copy), channelsBarParentFrame (ref), chatBarParentFrame (ref)
		if var6 then return end
		var6 = true
		
		if not frame:IsDescendantOf(playerGui) then return end
		local var7 = frame
		while var7 and not var7:IsA("ScreenGui") do
			var7 = var7.Parent
		end
		local minimumWindowSize = chatSettingsModule.MinimumWindowSize
		local maximumWindowSize = chatSettingsModule.MaximumWindowSize
		local var8 = minimumWindowSize.X.Scale * var7.AbsoluteSize.X + minimumWindowSize.X.Offset
		local maxValue = math.max(minimumWindowSize.Y.Scale * var7.AbsoluteSize.Y + minimumWindowSize.Y.Offset, channelsBarParentFrame.AbsoluteSize.Y + chatBarParentFrame.AbsoluteSize.Y)
		local var9 = maximumWindowSize.X.Scale * var7.AbsoluteSize.X + maximumWindowSize.X.Offset
		local var10 = maximumWindowSize.Y.Scale * var7.AbsoluteSize.Y + maximumWindowSize.Y.Offset
		local x = frame.AbsoluteSize.X
		local y = frame.AbsoluteSize.Y
		
		if x < var8 then
			frame.Size += UDim2.new(0, var8 - x, 0, 0)
		elseif var9 < x then
			frame.Size += UDim2.new(0, var9 - x, 0, 0)
		end
		if y < maxValue then
			frame.Size += UDim2.new(0, 0, 0, maxValue - y)
		elseif var10 < y then
			frame.Size += UDim2.new(0, 0, 0, var10 - y)
		end
		frame.Size = UDim2.new(frame.AbsoluteSize.X / var7.AbsoluteSize.X, 0, frame.AbsoluteSize.Y / var7.AbsoluteSize.Y, 0)
		var6 = false
	end
	
	frame.Changed:connect(function(p5)
		-- upvalues: doCheckSizeBounds (ref)
		if p5 == "AbsoluteSize" then
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
		local var11 = p5 - frame.AbsolutePosition + imageButton.AbsoluteSize
		frame.Size = UDim2.new(0, var11.X, 0, var11.Y)
		
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
	local var11 = false
	imageButton.Changed:connect(function(p5)
		-- upvalues: frame (ref), var11 (write), UpdatePositionFromDrag (ref), imageButton (ref)
		if p5 == "AbsolutePosition" and not frame.Draggable then
			if var11 then return end
			var11 = true
			UpdatePositionFromDrag(imageButton.AbsolutePosition)
			var11 = false
		end
	end)
	
	local _ = function(p5)
		-- upvalues: var3 (write), chatSettingsModule (copy)
		return math.max(32, (if var3 == 1 then p5 or chatSettingsModule.ChatChannelsTabTextSizePhone else p5 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2
	end
	
	local _ = function(p5)
		-- upvalues: var3 (write), chatSettingsModule (copy)
		return (if var3 == 1 then p5 or chatSettingsModule.ChatBarTextSizePhone else p5 or chatSettingsModule.ChatBarTextSize) + 14 + 10
	end
	
	if bubbleChatOnly() then
		chatBarParentFrame.Position = UDim2.new(0, 0, 0, 0)
		channelsBarParentFrame.Visible = false
		channelsBarParentFrame.Active = false
		chatChannelParentFrame.Visible = false
		chatChannelParentFrame.Active = false
		local _ = 0
		local _ = 0
		local var12 = frame
		while var12 and not var12:IsA("ScreenGui") do
			var12 = var12.Parent
		end
		local scale, offset
		local _ = var12
		
		if var3 == 1 then
			scale = chatSettingsModule.DefaultWindowSizePhone.X.Scale
			offset = chatSettingsModule.DefaultWindowSizePhone.X.Offset
		elseif var3 == 2 then
			scale = chatSettingsModule.DefaultWindowSizeTablet.X.Scale
			offset = chatSettingsModule.DefaultWindowSizeTablet.X.Offset
		else
			scale = chatSettingsModule.DefaultWindowSizeDesktop.X.Scale
			offset = chatSettingsModule.DefaultWindowSizeDesktop.X.Offset
		end
		local var13 = nil
		frame.Size = UDim2.new(scale, offset, 0, (if var3 == 1 then var13 or chatSettingsModule.ChatBarTextSizePhone else var13 or chatSettingsModule.ChatBarTextSize) + 14 + 10)
		frame.Position = chatSettingsModule.DefaultWindowPosition
	else
		local var14 = frame
		while var14 and not var14:IsA("ScreenGui") do
			var14 = var14.Parent
		end
		local _ = var14
		
		if var3 == 1 then
			frame.Size = chatSettingsModule.DefaultWindowSizePhone
		elseif var3 == 2 then
			frame.Size = chatSettingsModule.DefaultWindowSizeTablet
		else
			frame.Size = chatSettingsModule.DefaultWindowSizeDesktop
		end
		frame.Position = chatSettingsModule.DefaultWindowPosition
	end
	if var3 == 1 then
		chatSettingsModule.ChatWindowTextSize = chatSettingsModule.ChatWindowTextSizePhone
		chatSettingsModule.ChatChannelsTabTextSize = chatSettingsModule.ChatChannelsTabTextSizePhone
		chatSettingsModule.ChatBarTextSize = chatSettingsModule.ChatBarTextSizePhone
	end
	local _ = function(p5)
		-- upvalues: frame (ref)
		frame.Active = p5
		frame.Draggable = p5
	end
	
	local function UpdateResizable(p5)
		-- upvalues: imageButton (ref), chatBarParentFrame (ref)
		imageButton.Visible = p5
		imageButton.Draggable = p5
		local offset = chatBarParentFrame.Size.Y.Offset
		
		if p5 then
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
		-- upvalues: var3 (write), chatSettingsModule (copy), chatChannelParentFrame (ref)
		local var15 = nil
		local var16 = math.max(32, (if var3 == 1 then var15 or chatSettingsModule.ChatChannelsTabTextSizePhone else var15 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2
		local var17 = nil
		local var18 = (if var3 == 1 then var17 or chatSettingsModule.ChatBarTextSizePhone else var17 or chatSettingsModule.ChatBarTextSize) + 14 + 10
		
		if chatSettingsModule.ShowChannelsBar then
			chatChannelParentFrame.Size = UDim2.new(1, 0, 1, -(var16 + var18 + 2 + 2))
			chatChannelParentFrame.Position = UDim2.new(0, 0, 0, var16 + 2)
			
			return
		end
		chatChannelParentFrame.Size = UDim2.new(1, 0, 1, -(var18 + 2 + 2))
		chatChannelParentFrame.Position = UDim2.new(0, 0, 0, 2)
	end
	
	local _ = function(p5)
		-- upvalues: var3 (write), chatSettingsModule (copy), channelsBarParentFrame (ref), UpdateChatChannelParentFrameSize (ref)
		channelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if var3 == 1 then p5 or chatSettingsModule.ChatChannelsTabTextSizePhone else p5 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
		UpdateChatChannelParentFrameSize()
	end
	
	local function UpdateChatBarTextSize(p5)
		-- upvalues: var3 (write), chatSettingsModule (copy), chatBarParentFrame (ref), imageButton (ref), UpdateChatChannelParentFrameSize (ref), UpdateResizable (ref)
		local var15 = (if var3 == 1 then p5 or chatSettingsModule.ChatBarTextSizePhone else p5 or chatSettingsModule.ChatBarTextSize) + 14 + 10
		chatBarParentFrame.Size = UDim2.new(1, 0, 0, var15)
		
		if not bubbleChatOnly() then
			chatBarParentFrame.Position = UDim2.new(0, 0, 1, -var15)
		end
		imageButton.Size = UDim2.new(0, var15, 0, var15)
		imageButton.Position = UDim2.new(1, -var15, 1, -var15)
		UpdateChatChannelParentFrameSize()
		UpdateResizable(chatSettingsModule.WindowResizable)
	end
	
	local _ = function(p5)
		-- upvalues: channelsBarParentFrame (ref), UpdateChatChannelParentFrameSize (ref)
		channelsBarParentFrame.Visible = p5
		UpdateChatChannelParentFrameSize()
	end
	
	local chatChannelsTabTextSize = chatSettingsModule.ChatChannelsTabTextSize
	channelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if var3 == 1 then chatChannelsTabTextSize or chatSettingsModule.ChatChannelsTabTextSizePhone else chatChannelsTabTextSize or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
	UpdateChatChannelParentFrameSize()
	UpdateChatBarTextSize(chatSettingsModule.ChatBarTextSize)
	local windowDraggable = chatSettingsModule.WindowDraggable
	frame.Active = windowDraggable
	frame.Draggable = windowDraggable
	UpdateResizable(chatSettingsModule.WindowResizable)
	channelsBarParentFrame.Visible = chatSettingsModule.ShowChannelsBar
	UpdateChatChannelParentFrameSize()
	chatSettingsModule.SettingsChanged:connect(function(p5, p6)
		-- upvalues: frame (ref), UpdateResizable (ref), var3 (write), chatSettingsModule (copy), channelsBarParentFrame (ref), UpdateChatChannelParentFrameSize (ref), UpdateChatBarTextSize (ref)
		if p5 == "WindowDraggable" then
			frame.Active = p6
			frame.Draggable = p6
			
			return
		elseif p5 == "WindowResizable" then
			UpdateResizable(p6)
			
			return
		elseif p5 == "ChatChannelsTabTextSize" then
			channelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if var3 == 1 then p6 or chatSettingsModule.ChatChannelsTabTextSizePhone else p6 or chatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
			UpdateChatChannelParentFrameSize()
			
			return
		elseif p5 == "ChatBarTextSize" then
			UpdateChatBarTextSize(p6)
			
			return
		elseif p5 == "ShowChannelsBar" then
			channelsBarParentFrame.Visible = p6
			UpdateChatChannelParentFrameSize()
		end
	end)
	p3.GuiObject = frame
	p3.GuiObjects.BaseFrame = frame
	p3.GuiObjects.ChatBarParentFrame = chatBarParentFrame
	p3.GuiObjects.ChannelsBarParentFrame = channelsBarParentFrame
	p3.GuiObjects.ChatChannelParentFrame = chatChannelParentFrame
	p3.GuiObjects.ChatResizerFrame = imageButton
	p3.GuiObjects.ResizeIcon = imageLabel
	p3:AnimGuiObjects()
end

function t_1.GetChatBar(p5)
	return p5.ChatBar
end

function t_1.RegisterChatBar(p5, p6)
	p5.ChatBar = p6
	p5.ChatBar:CreateGuiObjects(p5.GuiObjects.ChatBarParentFrame)
end

function t_1.RegisterChannelsBar(p5, p6)
	p5.ChannelsBar = p6
	p5.ChannelsBar:CreateGuiObjects(p5.GuiObjects.ChannelsBarParentFrame)
end

function t_1.RegisterMessageLogDisplay(p5, p6)
	p5.MessageLogDisplay = p6
	p5.MessageLogDisplay.GuiObject.Parent = p5.GuiObjects.ChatChannelParentFrame
end

function t_1.AddChannel(p5, p6)
	-- upvalues: chatChannelModule (ref)
	if p5:GetChannel(p6) then
		error("Channel '" .. p24 .. "' already exists!")
		
		return
	end
	local var15 = chatChannelModule.new(p6, p5.MessageLogDisplay)
	p5.Channels[p6:lower()] = var15
	var15:SetActive(false)
	local var16 = p5.ChannelsBar:AddChannelTab(p6)
	var16.NameTag.MouseButton1Click:connect(function()
		-- upvalues: p5 (ref), p6 (ref)
		p5:SwitchCurrentChannel(p6)
	end)
	var15:RegisterChannelTab(var16)
	
	return var15
end

function t_1.GetFirstChannel(p5)
	for i, v in pairs(p5.Channels) do
		return v
	end
	return nil
end

function t_1.RemoveChannel(p6, p7)
	-- upvalues: chatSettingsModule (ref)
	if not p6:GetChannel(p7) then
		error("Channel '" .. p27 .. "' does not exist!")
	end
	local var15 = p7:lower()
	local var16 = false
	
	if p6.Channels[var15] == p6:GetCurrentChannel() then
		var16 = true
		p6:SwitchCurrentChannel(nil)
	end
	p6.Channels[var15]:Destroy()
	p6.Channels[var15] = nil
	p6.ChannelsBar:RemoveChannelTab(p7)
	
	if var16 then
		local var17
		local _ = nil
		
		if p6:GetChannel(chatSettingsModule.GeneralChannelName) ~= nil and not (var15 == chatSettingsModule.GeneralChannelName:lower()) then
			var17 = chatSettingsModule.GeneralChannelName
		else
			local firstChannel = p6:GetFirstChannel()
			var17 = if firstChannel then firstChannel.Name else nil
		end
		p6:SwitchCurrentChannel(var17)
	end
	if not chatSettingsModule.ShowChannelsBar and p6.ChatBar.TargetChannel == p7 then
		p6.ChatBar:SetChannelTarget(chatSettingsModule.GeneralChannelName)
	end
end

function t_1.GetChannel(p6, p7)
	return if p7 then p6.Channels[p7:lower()] else nil
end

function t_1.GetTargetMessageChannel(p6)
	-- upvalues: chatSettingsModule (ref)
	if chatSettingsModule.ShowChannelsBar then
		local currentChannel = p6:GetCurrentChannel()
		
		return currentChannel and currentChannel.Name
	end
	return p6.ChatBar.TargetChannel
end

function t_1.GetCurrentChannel(p6)
	return p6.CurrentChannel
end

function t_1.SwitchCurrentChannel(p6, p7)
	-- upvalues: chatSettingsModule (ref)
	if not chatSettingsModule.ShowChannelsBar then
		local var15 = p6:GetChannel(p7)
		
		if var15 then
			p6.ChatBar:SetChannelTarget(var15.Name)
		end
		p7 = chatSettingsModule.GeneralChannelName
	end
	local currentChannel = p6:GetCurrentChannel()
	local var16 = p6:GetChannel(p7)
	
	if var16 == nil then
		error(string.format("Channel '%s' does not exist.", p7))
	end
	if var16 ~= currentChannel then
		if currentChannel then
			currentChannel:SetActive(false)
			p6.ChannelsBar:GetChannelTab(currentChannel.Name):SetActive(false)
		end
		if var16 then
			var16:SetActive(true)
			p6.ChannelsBar:GetChannelTab(var16.Name):SetActive(true)
		end
		p6.CurrentChannel = var16
	end
end

function t_1.UpdateFrameVisibility(p6)
	p6.GuiObject.Visible = p6.Visible and p6.CoreGuiEnabled
end

function t_1.GetVisible(p6)
	return p6.Visible
end

function t_1.SetVisible(value, p6)
	value.Visible = p6
	value:UpdateFrameVisibility()
end

function t_1.GetCoreGuiEnabled(p6)
	return p6.CoreGuiEnabled
end

function t_1.SetCoreGuiEnabled(value, p6)
	value.CoreGuiEnabled = p6
	value:UpdateFrameVisibility()
end

function t_1.EnableResizable(p6)
	p6.GuiObjects.ChatResizerFrame.Active = true
end

function t_1.DisableResizable(p6)
	p6.GuiObjects.ChatResizerFrame.Active = false
end

function t_1.FadeOutBackground(value, p6)
	-- upvalues: curveUtilModule (ref)
	value.ChannelsBar:FadeOutBackground(p6)
	value.MessageLogDisplay:FadeOutBackground(p6)
	value.ChatBar:FadeOutBackground(p6)
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p6)
end

function t_1.FadeInBackground(value, p6)
	-- upvalues: curveUtilModule (ref)
	value.ChannelsBar:FadeInBackground(p6)
	value.MessageLogDisplay:FadeInBackground(p6)
	value.ChatBar:FadeInBackground(p6)
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p6)
end

function t_1.FadeOutText(p6, p7)
	p6.MessageLogDisplay:FadeOutText(p7)
	p6.ChannelsBar:FadeOutText(p7)
end

function t_1.FadeInText(p6, p7)
	p6.MessageLogDisplay:FadeInText(p7)
	p6.ChannelsBar:FadeInText(p7)
end

function t_1.AnimGuiObjects(p6)
	p6.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = p6.AnimParams.Background_CurrentTransparency
	p6.GuiObjects.ChatResizerFrame.BackgroundTransparency = p6.AnimParams.Background_CurrentTransparency
	p6.GuiObjects.ResizeIcon.ImageTransparency = p6.AnimParams.Background_CurrentTransparency
end

function t_1.InitializeAnimParams(p6)
	-- upvalues: curveUtilModule (ref)
	p6.AnimParams.Background_TargetTransparency = 0.6
	p6.AnimParams.Background_CurrentTransparency = 0.6
	p6.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function t_1.Update(p6, p7)
	-- upvalues: curveUtilModule (ref)
	p6.ChatBar:Update(p7)
	p6.ChannelsBar:Update(p7)
	p6.MessageLogDisplay:Update(p7)
	p6.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p6.AnimParams.Background_CurrentTransparency, p6.AnimParams.Background_TargetTransparency, p6.AnimParams.Background_NormalizedExptValue, p7)
	p6:AnimGuiObjects()
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