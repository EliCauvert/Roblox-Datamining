local ChatWindowModule = {}
local Players = game:GetService("Players")
local _ = game:GetService("Chat")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local Chat = game:GetService("Chat")
local Parent = script.Parent
local ChatChannelModule = require(Parent:WaitForChild("ChatChannel"))
local ChatSettingsModule = require(Chat:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local CurveUtilModule = require(Parent:WaitForChild("CurveUtil"))
local Module = {}
Module.__index = Module

function getClassicChatEnabled() --[[ Line: 34 ]]
	-- upvalues: ChatSettingsModule (copy), Players (copy)
	return if ChatSettingsModule.ClassicChatEnabled == nil then Players.ClassicChat else ChatSettingsModule.ClassicChatEnabled
end

function getBubbleChatEnabled() --[[ Line: 41 ]]
	-- upvalues: ChatSettingsModule (copy), Players (copy)
	return if ChatSettingsModule.BubbleChatEnabled == nil then Players.BubbleChat else ChatSettingsModule.BubbleChatEnabled
end

function bubbleChatOnly() --[[ Line: 48 ]]
	return not getClassicChatEnabled() and getBubbleChatEnabled()
end

function mergeProps(List, p1) --[[ Line: 53 ]]
	if not List or not p1 then return end
	for i, value in pairs(List) do
		if p1[i] ~= nil then
			p1[i] = value
		end
	end
end

function Module.CreateGuiObjects(p2, Parent) --[[ Line: 62 ]]
	-- upvalues: Chat (copy), ChatSettingsModule (copy), PlayerGui (copy)
	local InvokeChatResult = nil
	pcall(function() --[[ Line: 64 ]]
		-- upvalues: InvokeChatResult (ref), Chat (upval)
		InvokeChatResult = Chat:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil)
	end)
	mergeProps(InvokeChatResult, ChatSettingsModule)
	local Frame = Instance.new("Frame")
	Frame.BackgroundTransparency = 1
	Frame.Active = ChatSettingsModule.WindowDraggable
	Frame.Parent = Parent
	Frame.AutoLocalize = false
	local ChatBarParentFrame = Instance.new("Frame")
	ChatBarParentFrame.Selectable = false
	ChatBarParentFrame.Name = "ChatBarParentFrame"
	ChatBarParentFrame.BackgroundTransparency = 1
	ChatBarParentFrame.Parent = Frame
	local ChannelsBarParentFrame = Instance.new("Frame")
	ChannelsBarParentFrame.Selectable = false
	ChannelsBarParentFrame.Name = "ChannelsBarParentFrame"
	ChannelsBarParentFrame.BackgroundTransparency = 1
	ChannelsBarParentFrame.Position = UDim2.new(0, 0, 0, 0)
	ChannelsBarParentFrame.Parent = Frame
	local ChatChannelParentFrame = Instance.new("Frame")
	ChatChannelParentFrame.Selectable = false
	ChatChannelParentFrame.Name = "ChatChannelParentFrame"
	ChatChannelParentFrame.BackgroundTransparency = 1
	ChatChannelParentFrame.BackgroundColor3 = ChatSettingsModule.BackGroundColor
	ChatChannelParentFrame.BackgroundTransparency = 0.6
	ChatChannelParentFrame.BorderSizePixel = 0
	ChatChannelParentFrame.Parent = Frame
	local ImageButton = Instance.new("ImageButton")
	ImageButton.Selectable = false
	ImageButton.Image = ""
	ImageButton.BackgroundTransparency = 0.6
	ImageButton.BorderSizePixel = 0
	ImageButton.Visible = false
	ImageButton.BackgroundColor3 = ChatSettingsModule.BackGroundColor
	ImageButton.Active = true
	
	if bubbleChatOnly() then
		ImageButton.Position = UDim2.new(1, -ImageButton.AbsoluteSize.X, 0, 0)
	else
		ImageButton.Position = UDim2.new(1, -ImageButton.AbsoluteSize.X, 1, -ImageButton.AbsoluteSize.Y)
	end
	ImageButton.Parent = Frame
	local Image = Instance.new("ImageLabel")
	Image.Selectable = false
	Image.Size = UDim2.new(0.8, 0, 0.8, 0)
	Image.Position = UDim2.new(0.2, 0, 0.2, 0)
	Image.BackgroundTransparency = 1
	Image.Image = "rbxassetid://261880743"
	Image.Parent = ImageButton
	
	local function _() --[[ Line: 122 | Named "GetScreenGuiParent" ]]
		-- upvalues: Frame (copy)
		local Parent = Frame
		while Parent and not Parent:IsA("ScreenGui") do
			Parent = Parent.Parent
		end
		return Parent
	end
	
	local v1 = 3
	local Frame3 = Frame
	while Frame3 and not Frame3:IsA("ScreenGui") do
		Frame3 = Frame3.Parent
	end
	local Frame2 = Frame3
	
	if Frame2.AbsoluteSize.X <= 640 then
		v1 = 1
	elseif Frame2.AbsoluteSize.X <= 1024 then
		v1 = 2
	end
	Frame3 = false
	
	local function doCheckSizeBounds() --[[ Line: 145 ]]
		-- upvalues: Frame3 (ref), Frame (copy), PlayerGui (upval), ChatSettingsModule (upval), ChannelsBarParentFrame (copy), ChatBarParentFrame (copy)
		if Frame3 then return end
		Frame3 = true
		
		if not Frame:IsDescendantOf(PlayerGui) then return end
		local Parent = Frame
		while Parent and not Parent:IsA("ScreenGui") do
			Parent = Parent.Parent
		end
		local Frame1 = Parent
		local MinimumWindowSize = ChatSettingsModule.MinimumWindowSize
		local MaximumWindowSize = ChatSettingsModule.MaximumWindowSize
		local NewScale = MinimumWindowSize.X.Scale * Frame1.AbsoluteSize.X + MinimumWindowSize.X.Offset
		local Largest = math.max(MinimumWindowSize.Y.Scale * Frame1.AbsoluteSize.Y + MinimumWindowSize.Y.Offset, ChannelsBarParentFrame.AbsoluteSize.Y + ChatBarParentFrame.AbsoluteSize.Y)
		local NewScale1 = MaximumWindowSize.X.Scale * Frame1.AbsoluteSize.X + MaximumWindowSize.X.Offset
		local NewScale2 = MaximumWindowSize.Y.Scale * Frame1.AbsoluteSize.Y + MaximumWindowSize.Y.Offset
		local X = Frame.AbsoluteSize.X
		local Y: number = Frame.AbsoluteSize.Y
		
		if X < NewScale then
			Frame.Size += UDim2.new(0, NewScale - X, 0, 0)
		elseif NewScale1 < X then
			Frame.Size += UDim2.new(0, NewScale1 - X, 0, 0)
		end
		if Y < Largest then
			Frame.Size += UDim2.new(0, 0, 0, Largest - Y)
		elseif NewScale2 < Y then
			Frame.Size += UDim2.new(0, 0, 0, NewScale2 - Y)
		end
		Frame.Size = UDim2.new(Frame.AbsoluteSize.X / Frame1.AbsoluteSize.X, 0, Frame.AbsoluteSize.Y / Frame1.AbsoluteSize.Y, 0)
		Frame3 = false
	end
	
	Frame.Changed:connect(function(Property) --[[ Line: 196 ]]
		-- upvalues: doCheckSizeBounds (copy)
		if Property == "AbsoluteSize" then
			doCheckSizeBounds()
		end
	end)
	ImageButton.DragBegin:connect(function(_) --[[ Line: 202 ]]
		-- upvalues: Frame (copy)
		Frame.Draggable = false
	end)
	
	local function UpdatePositionFromDrag(AbsolutePosition) --[[ Line: 206 ]]
		-- upvalues: ChatSettingsModule (upval), Frame (copy), ImageButton (copy)
		if ChatSettingsModule.WindowDraggable == false and ChatSettingsModule.WindowResizable == false then return end
		local NewAbsolutePosition = AbsolutePosition - Frame.AbsolutePosition + ImageButton.AbsoluteSize
		Frame.Size = UDim2.new(0, NewAbsolutePosition.X, 0, NewAbsolutePosition.Y)
		
		if bubbleChatOnly() then
			ImageButton.Position = UDim2.new(1, -ImageButton.AbsoluteSize.X, 0, 0)
			
			return
		else
			ImageButton.Position = UDim2.new(1, -ImageButton.AbsoluteSize.X, 1, -ImageButton.AbsoluteSize.Y)
		end
	end
	
	ImageButton.DragStopped:connect(function(_, _) --[[ Line: 219 ]]
		-- upvalues: Frame (copy), ChatSettingsModule (upval)
		Frame.Draggable = ChatSettingsModule.WindowDraggable
	end)
	local Flag = false
	ImageButton.Changed:connect(function(Property) --[[ Line: 225 ]]
		-- upvalues: Frame (copy), Flag (ref), UpdatePositionFromDrag (copy), ImageButton (copy)
		if Property == "AbsolutePosition" and not Frame.Draggable then
			if Flag then return end
			Flag = true
			UpdatePositionFromDrag(ImageButton.AbsolutePosition)
			Flag = false
		end
	end)
	
	local _ = function(p3): number --[[ Line: 236 | Named "CalculateChannelsBarPixelSize" ]]
		-- upvalues: v1 (ref), ChatSettingsModule (upval)
		return math.max(32, (if v1 == 1 then p3 or ChatSettingsModule.ChatChannelsTabTextSizePhone else p3 or ChatSettingsModule.ChatChannelsTabTextSize) + 8) + 2
	end
	
	local _ = function(p3): number --[[ Line: 249 | Named "CalculateChatBarPixelSize" ]]
		-- upvalues: v1 (ref), ChatSettingsModule (upval)
		return (if v1 == 1 then p3 or ChatSettingsModule.ChatBarTextSizePhone else p3 or ChatSettingsModule.ChatBarTextSize) + 14 + 10
	end
	
	if bubbleChatOnly() then
		ChatBarParentFrame.Position = UDim2.new(0, 0, 0, 0)
		ChannelsBarParentFrame.Visible = false
		ChannelsBarParentFrame.Active = false
		ChatChannelParentFrame.Visible = false
		ChatChannelParentFrame.Active = false
		local Frame4 = Frame
		while Frame4 and not Frame4:IsA("ScreenGui") do
			Frame4 = Frame4.Parent
		end
		local Scale = nil
		local Offset = nil
		if v1 == 1 then
			Scale = ChatSettingsModule.DefaultWindowSizePhone.X.Scale
			Offset = ChatSettingsModule.DefaultWindowSizePhone.X.Offset
		elseif v1 == 2 then
			Scale = ChatSettingsModule.DefaultWindowSizeTablet.X.Scale
			Offset = ChatSettingsModule.DefaultWindowSizeTablet.X.Offset
		else
			Scale = ChatSettingsModule.DefaultWindowSizeDesktop.X.Scale
			Offset = ChatSettingsModule.DefaultWindowSizeDesktop.X.Offset
		end
		local v2 = nil
		Frame.Size = UDim2.new(Scale, Offset, 0, (if v1 == 1 then v2 or ChatSettingsModule.ChatBarTextSizePhone else v2 or ChatSettingsModule.ChatBarTextSize) + 14 + 10)
		Frame.Position = ChatSettingsModule.DefaultWindowPosition
	else
		local Frame5 = Frame
		while Frame5 and not Frame5:IsA("ScreenGui") do
			Frame5 = Frame5.Parent
		end
		if v1 == 1 then
			Frame.Size = ChatSettingsModule.DefaultWindowSizePhone
		elseif v1 == 2 then
			Frame.Size = ChatSettingsModule.DefaultWindowSizeTablet
		else
			Frame.Size = ChatSettingsModule.DefaultWindowSizeDesktop
		end
		Frame.Position = ChatSettingsModule.DefaultWindowPosition
	end
	if v1 == 1 then
		ChatSettingsModule.ChatWindowTextSize = ChatSettingsModule.ChatWindowTextSizePhone
		ChatSettingsModule.ChatChannelsTabTextSize = ChatSettingsModule.ChatChannelsTabTextSizePhone
		ChatSettingsModule.ChatBarTextSize = ChatSettingsModule.ChatBarTextSizePhone
	end
	local _ = function(Active) --[[ Line: 318 | Named "UpdateDraggable" ]]
		-- upvalues: Frame (copy)
		Frame.Active = Active
		Frame.Draggable = Active
	end
	
	local function UpdateResizable(Draggable) --[[ Line: 323 ]]
		-- upvalues: ImageButton (copy), ChatBarParentFrame (copy)
		ImageButton.Visible = Draggable
		ImageButton.Draggable = Draggable
		local Offset = ChatBarParentFrame.Size.Y.Offset
		
		if Draggable then
			ChatBarParentFrame.Size = UDim2.new(1, -Offset - 2, 0, Offset)
			
			if not bubbleChatOnly() then
				ChatBarParentFrame.Position = UDim2.new(0, 0, 1, -Offset)
				
				return
			end
		else
			ChatBarParentFrame.Size = UDim2.new(1, 0, 0, Offset)
			
			if not bubbleChatOnly() then
				ChatBarParentFrame.Position = UDim2.new(0, 0, 1, -Offset)
			end
		end
	end
	
	local function UpdateChatChannelParentFrameSize() --[[ Line: 342 ]]
		-- upvalues: v1 (ref), ChatSettingsModule (upval), ChatChannelParentFrame (copy)
		local v3 = nil
		local NewLargest = math.max(32, (if v1 == 1 then v3 or ChatSettingsModule.ChatChannelsTabTextSizePhone else v3 or ChatSettingsModule.ChatChannelsTabTextSize) + 8) + 2
		local v4 = nil
		local v5 = (if v1 == 1 then v4 or ChatSettingsModule.ChatBarTextSizePhone else v4 or ChatSettingsModule.ChatBarTextSize) + 14 + 10
		
		if ChatSettingsModule.ShowChannelsBar then
			ChatChannelParentFrame.Size = UDim2.new(1, 0, 1, -(NewLargest + v5 + 2 + 2))
			ChatChannelParentFrame.Position = UDim2.new(0, 0, 0, NewLargest + 2)
			
			return
		else
			ChatChannelParentFrame.Size = UDim2.new(1, 0, 1, -(v5 + 2 + 2))
			ChatChannelParentFrame.Position = UDim2.new(0, 0, 0, 2)
		end
	end
	
	local _ = function(p3) --[[ Line: 357 | Named "UpdateChatChannelsTabTextSize" ]]
		-- upvalues: v1 (ref), ChatSettingsModule (upval), ChannelsBarParentFrame (copy), UpdateChatChannelParentFrameSize (copy)
		ChannelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if v1 == 1 then p3 or ChatSettingsModule.ChatChannelsTabTextSizePhone else p3 or ChatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
		UpdateChatChannelParentFrameSize()
	end
	
	local function UpdateChatBarTextSize(ChatBarTextSize) --[[ Line: 364 ]]
		-- upvalues: v1 (ref), ChatSettingsModule (upval), ChatBarParentFrame (copy), ImageButton (copy), UpdateChatChannelParentFrameSize (copy), UpdateResizable (copy)
		local YOffset = (if v1 == 1 then ChatBarTextSize or ChatSettingsModule.ChatBarTextSizePhone else ChatBarTextSize or ChatSettingsModule.ChatBarTextSize) + 14 + 10
		ChatBarParentFrame.Size = UDim2.new(1, 0, 0, YOffset)
		
		if not bubbleChatOnly() then
			ChatBarParentFrame.Position = UDim2.new(0, 0, 1, -YOffset)
		end
		ImageButton.Size = UDim2.new(0, YOffset, 0, YOffset)
		ImageButton.Position = UDim2.new(1, -YOffset, 1, -YOffset)
		UpdateChatChannelParentFrameSize()
		UpdateResizable(ChatSettingsModule.WindowResizable)
	end
	
	local _ = function(Visible) --[[ Line: 379 | Named "UpdateShowChannelsBar" ]]
		-- upvalues: ChannelsBarParentFrame (copy), UpdateChatChannelParentFrameSize (copy)
		ChannelsBarParentFrame.Visible = Visible
		UpdateChatChannelParentFrameSize()
	end
	
	local ChatChannelsTabTextSize = ChatSettingsModule.ChatChannelsTabTextSize
	ChannelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if v1 == 1 then ChatChannelsTabTextSize or ChatSettingsModule.ChatChannelsTabTextSizePhone else ChatChannelsTabTextSize or ChatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
	UpdateChatChannelParentFrameSize()
	UpdateChatBarTextSize(ChatSettingsModule.ChatBarTextSize)
	local WindowDraggable = ChatSettingsModule.WindowDraggable
	Frame.Active = WindowDraggable
	Frame.Draggable = WindowDraggable
	UpdateResizable(ChatSettingsModule.WindowResizable)
	ChannelsBarParentFrame.Visible = ChatSettingsModule.ShowChannelsBar
	UpdateChatChannelParentFrameSize()
	ChatSettingsModule.SettingsChanged:connect(function(p3, Draggable) --[[ Line: 390 ]]
		-- upvalues: Frame (copy), UpdateResizable (copy), v1 (ref), ChatSettingsModule (upval), ChannelsBarParentFrame (copy), UpdateChatChannelParentFrameSize (copy), UpdateChatBarTextSize (copy)
		if p3 == "WindowDraggable" then
			Frame.Active = Draggable
			Frame.Draggable = Draggable
			
			return
		end
		if p3 == "WindowResizable" then
			UpdateResizable(Draggable)
			
			return
		end
		if p3 == "ChatChannelsTabTextSize" then
			ChannelsBarParentFrame.Size = UDim2.new(1, 0, 0, math.max(32, (if v1 == 1 then Draggable or ChatSettingsModule.ChatChannelsTabTextSizePhone else Draggable or ChatSettingsModule.ChatChannelsTabTextSize) + 8) + 2)
			UpdateChatChannelParentFrameSize()
			
			return
		end
		if p3 == "ChatBarTextSize" then
			UpdateChatBarTextSize(Draggable)
			
			return
		end
		if p3 == "ShowChannelsBar" then
			ChannelsBarParentFrame.Visible = Draggable
			UpdateChatChannelParentFrameSize()
		end
	end)
	p2.GuiObject = Frame
	p2.GuiObjects.BaseFrame = Frame
	p2.GuiObjects.ChatBarParentFrame = ChatBarParentFrame
	p2.GuiObjects.ChannelsBarParentFrame = ChannelsBarParentFrame
	p2.GuiObjects.ChatChannelParentFrame = ChatChannelParentFrame
	p2.GuiObjects.ChatResizerFrame = ImageButton
	p2.GuiObjects.ResizeIcon = Image
	p2:AnimGuiObjects()
end

function Module.GetChatBar(p3) --[[ Line: 420 ]]
	return p3.ChatBar
end

function Module.RegisterChatBar(p3, ChatBar) --[[ Line: 424 ]]
	p3.ChatBar = ChatBar
	p3.ChatBar:CreateGuiObjects(p3.GuiObjects.ChatBarParentFrame)
end

function Module.RegisterChannelsBar(p3, ChannelsBar) --[[ Line: 429 ]]
	p3.ChannelsBar = ChannelsBar
	p3.ChannelsBar:CreateGuiObjects(p3.GuiObjects.ChannelsBarParentFrame)
end

function Module.RegisterMessageLogDisplay(p3, MessageLogDisplay) --[[ Line: 434 ]]
	p3.MessageLogDisplay = MessageLogDisplay
	p3.MessageLogDisplay.GuiObject.Parent = p3.GuiObjects.ChatChannelParentFrame
end

function Module.AddChannel(p3, Text: string) --[[ Line: 439 ]]
	-- upvalues: ChatChannelModule (copy)
	if p3:GetChannel(Text) then
		error("Channel '" .. Text .. "' already exists!")
		
		return
	end
	local NewChatChannel = ChatChannelModule.new(Text, p3.MessageLogDisplay)
	p3.Channels[Text:lower()] = NewChatChannel
	NewChatChannel:SetActive(false)
	local AddChannelTabResult = p3.ChannelsBar:AddChannelTab(Text)
	AddChannelTabResult.NameTag.MouseButton1Click:connect(function() --[[ Line: 451 ]]
		-- upvalues: p3 (copy), Text (copy)
		p3:SwitchCurrentChannel(Text)
	end)
	NewChatChannel:RegisterChannelTab(AddChannelTabResult)
	
	return NewChatChannel
end

function Module.GetFirstChannel(p3) --[[ Line: 460 ]]
	for _, channel in pairs(p3.Channels) do
		return channel
	end
	return nil
end

function Module.RemoveChannel(p4, Text: string) --[[ Line: 469 ]]
	-- upvalues: ChatSettingsModule (copy)
	if not p4:GetChannel(Text) then
		error("Channel '" .. Text .. "' does not exist!")
	end
	local Lowered = Text:lower()
	local Flag = false
	
	if p4.Channels[Lowered] == p4:GetCurrentChannel() then
		Flag = true
		p4:SwitchCurrentChannel(nil)
	end
	p4.Channels[Lowered]:Destroy()
	p4.Channels[Lowered] = nil
	p4.ChannelsBar:RemoveChannelTab(Text)
	
	if Flag then
		local IsLoweredMatch = Lowered == ChatSettingsModule.GeneralChannelName:lower()
		local Name = nil
		
		if p4:GetChannel(ChatSettingsModule.GeneralChannelName) ~= nil and not IsLoweredMatch then
			Name = ChatSettingsModule.GeneralChannelName
		else
			local FirstChannel = p4:GetFirstChannel()
			Name = FirstChannel and FirstChannel.Name or nil
		end
		p4:SwitchCurrentChannel(Name)
	end
	if not ChatSettingsModule.ShowChannelsBar and p4.ChatBar.TargetChannel == Text then
		p4.ChatBar:SetChannelTarget(ChatSettingsModule.GeneralChannelName)
	end
end

function Module.GetChannel(p4, GeneralChannelName: string) --[[ Line: 511 ]]
	return GeneralChannelName and p4.Channels[GeneralChannelName:lower()] or nil
end

function Module.GetTargetMessageChannel(p4) --[[ Line: 515 ]]
	-- upvalues: ChatSettingsModule (copy)
	if ChatSettingsModule.ShowChannelsBar then
		local CurrentChannel = p4:GetCurrentChannel()
		
		return CurrentChannel and CurrentChannel.Name
	else
		return p4.ChatBar.TargetChannel
	end
end

function Module.GetCurrentChannel(p4) --[[ Line: 524 ]]
	return p4.CurrentChannel
end

function Module.SwitchCurrentChannel(p4, Name) --[[ Line: 528 ]]
	-- upvalues: ChatSettingsModule (copy)
	if not ChatSettingsModule.ShowChannelsBar then
		local Channel = p4:GetChannel(Name)
		
		if Channel then
			p4.ChatBar:SetChannelTarget(Channel.Name)
		end
		Name = ChatSettingsModule.GeneralChannelName
	end
	local CurrentChannel = p4:GetCurrentChannel()
	local Channel1 = p4:GetChannel(Name)
	
	if Channel1 == nil then
		error(string.format("Channel '%s' does not exist.", Name))
	end
	if Channel1 ~= CurrentChannel then
		if CurrentChannel then
			CurrentChannel:SetActive(false)
			p4.ChannelsBar:GetChannelTab(CurrentChannel.Name):SetActive(false)
		end
		if Channel1 then
			Channel1:SetActive(true)
			p4.ChannelsBar:GetChannelTab(Channel1.Name):SetActive(true)
		end
		p4.CurrentChannel = Channel1
	end
end

function Module.UpdateFrameVisibility(p4) --[[ Line: 562 ]]
	p4.GuiObject.Visible = p4.Visible and p4.CoreGuiEnabled
end

function Module.GetVisible(p4) --[[ Line: 566 ]]
	return p4.Visible
end

function Module.SetVisible(p4, Visible) --[[ Line: 570 ]]
	p4.Visible = Visible
	p4:UpdateFrameVisibility()
end

function Module.GetCoreGuiEnabled(p4) --[[ Line: 575 ]]
	return p4.CoreGuiEnabled
end

function Module.SetCoreGuiEnabled(p4, CoreGuiEnabled) --[[ Line: 579 ]]
	p4.CoreGuiEnabled = CoreGuiEnabled
	p4:UpdateFrameVisibility()
end

function Module.EnableResizable(p4) --[[ Line: 584 ]]
	p4.GuiObjects.ChatResizerFrame.Active = true
end

function Module.DisableResizable(p4) --[[ Line: 588 ]]
	p4.GuiObjects.ChatResizerFrame.Active = false
end

function Module.FadeOutBackground(p4, p5) --[[ Line: 592 ]]
	-- upvalues: CurveUtilModule (copy)
	p4.ChannelsBar:FadeOutBackground(p5)
	p4.MessageLogDisplay:FadeOutBackground(p5)
	p4.ChatBar:FadeOutBackground(p5)
	p4.AnimParams.Background_TargetTransparency = 1
	p4.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p5)
end

function Module.FadeInBackground(p4, p5) --[[ Line: 601 ]]
	-- upvalues: CurveUtilModule (copy)
	p4.ChannelsBar:FadeInBackground(p5)
	p4.MessageLogDisplay:FadeInBackground(p5)
	p4.ChatBar:FadeInBackground(p5)
	p4.AnimParams.Background_TargetTransparency = 0.6
	p4.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p5)
end

function Module.FadeOutText(p4, p5) --[[ Line: 610 ]]
	p4.MessageLogDisplay:FadeOutText(p5)
	p4.ChannelsBar:FadeOutText(p5)
end

function Module.FadeInText(p4, p5) --[[ Line: 615 ]]
	p4.MessageLogDisplay:FadeInText(p5)
	p4.ChannelsBar:FadeInText(p5)
end

function Module.AnimGuiObjects(p4) --[[ Line: 620 ]]
	p4.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = p4.AnimParams.Background_CurrentTransparency
	p4.GuiObjects.ChatResizerFrame.BackgroundTransparency = p4.AnimParams.Background_CurrentTransparency
	p4.GuiObjects.ResizeIcon.ImageTransparency = p4.AnimParams.Background_CurrentTransparency
end

function Module.InitializeAnimParams(p4) --[[ Line: 626 ]]
	-- upvalues: CurveUtilModule (copy)
	p4.AnimParams.Background_TargetTransparency = 0.6
	p4.AnimParams.Background_CurrentTransparency = 0.6
	p4.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function Module.Update(p4, p5) --[[ Line: 632 ]]
	-- upvalues: CurveUtilModule (copy)
	p4.ChatBar:Update(p5)
	p4.ChannelsBar:Update(p5)
	p4.MessageLogDisplay:Update(p5)
	p4.AnimParams.Background_CurrentTransparency = CurveUtilModule:Expt(p4.AnimParams.Background_CurrentTransparency, p4.AnimParams.Background_TargetTransparency, p4.AnimParams.Background_NormalizedExptValue, p5)
	p4:AnimGuiObjects()
end

function ChatWindowModule.new() --[[ Line: 650 ]]
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.GuiObject = nil
	self.GuiObjects = {}
	self.ChatBar = nil
	self.ChannelsBar = nil
	self.MessageLogDisplay = nil
	self.Channels = {}
	self.CurrentChannel = nil
	self.Visible = true
	self.CoreGuiEnabled = true
	self.AnimParams = {}
	self:InitializeAnimParams()
	
	return self
end

return ChatWindowModule