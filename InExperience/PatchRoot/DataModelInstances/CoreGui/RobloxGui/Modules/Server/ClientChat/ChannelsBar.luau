local Parent = script.Parent
local ChannelsTabModule = require(Parent:WaitForChild("ChannelsTab"))
local MessageSenderModule = require(Parent:WaitForChild("MessageSender"))
local ChatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local CurveUtilModule = require(Parent:WaitForChild("CurveUtil"))
local Module = {}
Module.__index = Module

function Module.CreateGuiObjects(p1, Parent) --[[ Line: 24 ]]
	-- upvalues: ChatSettingsModule (copy), MessageSenderModule (copy)
	local Frame = Instance.new("Frame")
	Frame.Selectable = false
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundTransparency = 1
	Frame.Parent = Parent
	local ScrollingBase = Instance.new("Frame")
	ScrollingBase.Selectable = false
	ScrollingBase.Name = "ScrollingBase"
	ScrollingBase.BackgroundTransparency = 1
	ScrollingBase.ClipsDescendants = true
	ScrollingBase.Size = UDim2.new(1, 0, 1, 0)
	ScrollingBase.Position = UDim2.new(0, 0, 0, 0)
	ScrollingBase.Parent = Frame
	local ScrollerSizer = Instance.new("Frame")
	ScrollerSizer.Selectable = false
	ScrollerSizer.Name = "ScrollerSizer"
	ScrollerSizer.BackgroundTransparency = 1
	ScrollerSizer.Size = UDim2.new(1, 0, 1, 0)
	ScrollerSizer.Position = UDim2.new(0, 0, 0, 0)
	ScrollerSizer.Parent = ScrollingBase
	local ScrollerFrame = Instance.new("Frame")
	ScrollerFrame.Selectable = false
	ScrollerFrame.Name = "ScrollerFrame"
	ScrollerFrame.BackgroundTransparency = 1
	ScrollerFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollerFrame.Position = UDim2.new(0, 0, 0, 0)
	ScrollerFrame.Parent = ScrollerSizer
	local Frame1 = Instance.new("Frame")
	Frame1.Selectable = false
	Frame1.Size = UDim2.new(1, 0, 1, 0)
	Frame1.Position = UDim2.new(0, 0, 0, 0)
	Frame1.ClipsDescendants = true
	Frame1.BackgroundTransparency = 1
	Frame1.Parent = Frame
	local LeaveConfirmationFrame = Instance.new("Frame")
	LeaveConfirmationFrame.Selectable = false
	LeaveConfirmationFrame.Name = "LeaveConfirmationFrame"
	LeaveConfirmationFrame.Size = UDim2.new(1, 0, 1, 0)
	LeaveConfirmationFrame.Position = UDim2.new(0, 0, 1, 0)
	LeaveConfirmationFrame.BackgroundTransparency = 0.6
	LeaveConfirmationFrame.BorderSizePixel = 0
	LeaveConfirmationFrame.BackgroundColor3 = Color3.new(0, 0, 0)
	LeaveConfirmationFrame.Parent = Frame1
	local Button = Instance.new("TextButton")
	Button.Selectable = false
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.BackgroundTransparency = 1
	Button.Text = ""
	Button.Parent = LeaveConfirmationFrame
	local Button1 = Instance.new("TextButton")
	Button1.Selectable = false
	Button1.Size = UDim2.new(0.25, 0, 1, 0)
	Button1.BackgroundTransparency = 1
	Button1.Font = ChatSettingsModule.DefaultFont
	Button1.TextSize = 18
	Button1.TextStrokeTransparency = 0.75
	Button1.Position = UDim2.new(0, 0, 0, 0)
	Button1.TextColor3 = Color3.new(0, 1, 0)
	Button1.Text = "Confirm"
	Button1.Parent = LeaveConfirmationFrame
	local ButtonClone = Button1:Clone()
	ButtonClone.Parent = LeaveConfirmationFrame
	ButtonClone.Position = UDim2.new(0.75, 0, 0, 0)
	ButtonClone.TextColor3 = Color3.new(1, 0, 0)
	ButtonClone.Text = "Cancel"
	local Label = Instance.new("TextLabel")
	Label.Selectable = false
	Label.Size = UDim2.new(0.5, 0, 1, 0)
	Label.Position = UDim2.new(0.25, 0, 0, 0)
	Label.BackgroundTransparency = 1
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.TextStrokeTransparency = 0.75
	Label.Text = "Leave channel <XX>?"
	Label.Font = ChatSettingsModule.DefaultFont
	Label.TextSize = 18
	Label.Parent = LeaveConfirmationFrame
	local LeaveTarget = Instance.new("StringValue")
	LeaveTarget.Name = "LeaveTarget"
	LeaveTarget.Parent = LeaveConfirmationFrame
	local Position = LeaveConfirmationFrame.Position
	Button1.MouseButton1Click:connect(function() --[[ Line: 116 ]]
		-- upvalues: MessageSenderModule (upval), LeaveTarget (copy), LeaveConfirmationFrame (copy), Position (copy)
		MessageSenderModule:SendMessage(string.format("/leave %s", LeaveTarget.Value), nil)
		LeaveConfirmationFrame:TweenPosition(Position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	ButtonClone.MouseButton1Click:connect(function() --[[ Line: 120 ]]
		-- upvalues: LeaveConfirmationFrame (copy), Position (copy)
		LeaveConfirmationFrame:TweenPosition(Position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	local Image = "rbxassetid://471630199"
	local Image1 = "rbxassetid://471630112"
	local PageLeftButton = Instance.new("ImageButton", Frame)
	PageLeftButton.Selectable = ChatSettingsModule.GamepadNavigationEnabled
	PageLeftButton.Name = "PageLeftButton"
	PageLeftButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	PageLeftButton.Size = UDim2.new(0.7, 0, 0.7, 0)
	PageLeftButton.BackgroundTransparency = 1
	PageLeftButton.Position = UDim2.new(0, 4, 0.15000000000000002, 0)
	PageLeftButton.Visible = false
	PageLeftButton.Image = Image
	local ArrowLabel = Instance.new("ImageLabel", PageLeftButton)
	ArrowLabel.Name = "ArrowLabel"
	ArrowLabel.BackgroundTransparency = 1
	ArrowLabel.Size = UDim2.new(0.4, 0, 0.4, 0)
	ArrowLabel.Image = Image1
	local PositionalHelper = Instance.new("Frame", Frame)
	PositionalHelper.Selectable = false
	PositionalHelper.BackgroundTransparency = 1
	PositionalHelper.Name = "PositionalHelper"
	PositionalHelper.Size = PageLeftButton.Size
	PositionalHelper.SizeConstraint = PageLeftButton.SizeConstraint
	PositionalHelper.Position = UDim2.new(1, 0, 0.15000000000000002, 0)
	local PageRightButton = PageLeftButton:Clone()
	PageRightButton.Parent = PositionalHelper
	PageRightButton.Name = "PageRightButton"
	PageRightButton.Size = UDim2.new(1, 0, 1, 0)
	PageRightButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
	PageRightButton.Position = UDim2.new(-1, -4, 0, 0)
	local _UDim2 = UDim2.new(0.05, 0, 0, 0)
	PageRightButton.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + _UDim2
	PageLeftButton.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - _UDim2
	PageLeftButton.ArrowLabel.Rotation = 180
	p1.GuiObject = Frame
	p1.GuiObjects.BaseFrame = Frame
	p1.GuiObjects.ScrollerSizer = ScrollerSizer
	p1.GuiObjects.ScrollerFrame = ScrollerFrame
	p1.GuiObjects.PageLeftButton = PageLeftButton
	p1.GuiObjects.PageRightButton = PageRightButton
	p1.GuiObjects.LeaveConfirmationFrame = LeaveConfirmationFrame
	p1.GuiObjects.LeaveConfirmationNotice = Label
	p1.GuiObjects.PageLeftButtonArrow = PageLeftButton.ArrowLabel
	p1.GuiObjects.PageRightButtonArrow = PageRightButton.ArrowLabel
	p1:AnimGuiObjects()
	PageLeftButton.MouseButton1Click:connect(function() --[[ Line: 188 ]]
		-- upvalues: p1 (copy)
		p1:ScrollChannelsFrame(-1)
	end)
	PageRightButton.MouseButton1Click:connect(function() --[[ Line: 189 ]]
		-- upvalues: p1 (copy)
		p1:ScrollChannelsFrame(1)
	end)
	p1:ScrollChannelsFrame(0)
end

function Module.UpdateMessagePostedInChannel(p1, Text) --[[ Line: 195 ]]
	local ChannelTab = p1:GetChannelTab(Text)
	
	if ChannelTab then
		ChannelTab:UpdateMessagePostedInChannel()
		
		return
	else
		warn("ChannelsTab '" .. Text .. "' does not exist!")
	end
end

function Module.AddChannelTab(p1, Text: string) --[[ Line: 204 ]]
	-- upvalues: ChannelsTabModule (copy), ChatSettingsModule (copy)
	if p1:GetChannelTab(Text) then
		error("Channel tab '" .. Text .. "'already exists!")
	end
	local NewChannelsTab = ChannelsTabModule.new(Text)
	NewChannelsTab.GuiObject.Parent = p1.GuiObjects.ScrollerFrame
	p1.ChannelTabs[Text:lower()] = NewChannelsTab
	p1.NumTabs += 1
	p1:OrganizeChannelTabs()
	
	if ChatSettingsModule.RightClickToLeaveChannelEnabled then
		NewChannelsTab.NameTag.MouseButton2Click:connect(function() --[[ Line: 217 ]]
			-- upvalues: p1 (copy), NewChannelsTab (copy)
			p1.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", NewChannelsTab.ChannelName)
			p1.LeaveConfirmationFrame.LeaveTarget.Value = NewChannelsTab.ChannelName
			p1.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
		end)
	end
	return NewChannelsTab
end

function Module.RemoveChannelTab(p1, Text: string) --[[ Line: 227 ]]
	if not p1:GetChannelTab(Text) then
		error("Channel tab '" .. Text .. "'does not exist!")
	end
	local Lowered = Text:lower()
	p1.ChannelTabs[Lowered]:Destroy()
	p1.ChannelTabs[Lowered] = nil
	p1.NumTabs -= 1
	p1:OrganizeChannelTabs()
end

function Module.GetChannelTab(p1, Text: string) --[[ Line: 240 ]]
	return p1.ChannelTabs[Text:lower()]
end

function Module.OrganizeChannelTabs(p1) --[[ Line: 244 ]]
	-- upvalues: ChatSettingsModule (copy)
	local List = {}
	table.insert(List, p1:GetChannelTab(ChatSettingsModule.GeneralChannelName))
	table.insert(List, p1:GetChannelTab("System"))
	
	for _, channelTab in pairs(p1.ChannelTabs) do
		if channelTab.ChannelName ~= ChatSettingsModule.GeneralChannelName and channelTab.ChannelName ~= "System" then
			table.insert(List, channelTab)
		end
	end
	for i, value in pairs(List) do
		value.GuiObject.Position = UDim2.new(i - 1, 0, 0, 0)
	end
	p1.GuiObjects.ScrollerSizer.Size = UDim2.new(1 / math.max(1, (math.min(ChatSettingsModule.ChannelsBarFullTabSize, p1.NumTabs))), 0, 1, 0)
	p1:ScrollChannelsFrame(0)
end

function Module.ResizeChannelTabText(p2, p3) --[[ Line: 266 ]]
	for _, channelTab in pairs(p2.ChannelTabs) do
		channelTab:SetTextSize(p3)
	end
end

function Module.ScrollChannelsFrame(p4, p5) --[[ Line: 272 ]]
	-- upvalues: ChatSettingsModule (copy)
	if p4.ScrollChannelsFrameLock then return end
	p4.ScrollChannelsFrameLock = true
	local ChannelsBarFullTabSize: number = ChatSettingsModule.ChannelsBarFullTabSize
	local NewCurPageNum = p4.CurPageNum + p5
	
	if NewCurPageNum < 0 then
		NewCurPageNum = 0
	elseif NewCurPageNum > 0 and p4.NumTabs < NewCurPageNum + ChannelsBarFullTabSize then
		NewCurPageNum = p4.NumTabs - ChannelsBarFullTabSize
	end
	p4.CurPageNum = NewCurPageNum
	local _UDim2 = UDim2.new(-p4.CurPageNum, 0, 0, 0)
	p4.GuiObjects.PageLeftButton.Visible = p4.CurPageNum > 0
	p4.GuiObjects.PageRightButton.Visible = p4.CurPageNum + ChannelsBarFullTabSize < p4.NumTabs
	
	if p5 == 0 then
		p4.ScrollChannelsFrameLock = false
		
		return
	else
		local function UnlockFunc() --[[ Line: 298 ]]
			-- upvalues: p4 (copy)
			p4.ScrollChannelsFrameLock = false
		end
		
		p4:WaitUntilParentedCorrectly()
		p4.GuiObjects.ScrollerFrame:TweenPosition(_UDim2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, UnlockFunc)
	end
end

function Module.FadeOutBackground(p4, p5) --[[ Line: 307 ]]
	-- upvalues: CurveUtilModule (copy)
	for _, channelTab in pairs(p4.ChannelTabs) do
		channelTab:FadeOutBackground(p5)
	end
	p4.AnimParams.Background_TargetTransparency = 1
	p4.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p5)
end

function Module.FadeInBackground(p6, p7) --[[ Line: 316 ]]
	-- upvalues: CurveUtilModule (copy)
	for _, channelTab in pairs(p6.ChannelTabs) do
		channelTab:FadeInBackground(p7)
	end
	p6.AnimParams.Background_TargetTransparency = 0.6
	p6.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p7)
end

function Module.FadeOutText(p8, p9) --[[ Line: 325 ]]
	for _, channelTab in pairs(p8.ChannelTabs) do
		channelTab:FadeOutText(p9)
	end
end

function Module.FadeInText(p10, p11) --[[ Line: 331 ]]
	for _, channelTab in pairs(p10.ChannelTabs) do
		channelTab:FadeInText(p11)
	end
end

function Module.AnimGuiObjects(p12) --[[ Line: 337 ]]
	p12.GuiObjects.PageLeftButton.ImageTransparency = p12.AnimParams.Background_CurrentTransparency
	p12.GuiObjects.PageRightButton.ImageTransparency = p12.AnimParams.Background_CurrentTransparency
	p12.GuiObjects.PageLeftButtonArrow.ImageTransparency = p12.AnimParams.Background_CurrentTransparency
	p12.GuiObjects.PageRightButtonArrow.ImageTransparency = p12.AnimParams.Background_CurrentTransparency
end

function Module.InitializeAnimParams(p12) --[[ Line: 344 ]]
	-- upvalues: CurveUtilModule (copy)
	p12.AnimParams.Background_TargetTransparency = 0.6
	p12.AnimParams.Background_CurrentTransparency = 0.6
	p12.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function Module.Update(p12, p13) --[[ Line: 350 ]]
	-- upvalues: CurveUtilModule (copy)
	for _, channelTab in pairs(p12.ChannelTabs) do
		channelTab:Update(p13)
	end
	p12.AnimParams.Background_CurrentTransparency = CurveUtilModule:Expt(p12.AnimParams.Background_CurrentTransparency, p12.AnimParams.Background_TargetTransparency, p12.AnimParams.Background_NormalizedExptValue, p13)
	p12:AnimGuiObjects()
end

function Module.WaitUntilParentedCorrectly(p14) --[[ Line: 366 ]]
	while not p14.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p14.GuiObject.AncestryChanged:wait()
	end
end

return {
	new = function() --[[ Line: 375 ]]
		-- upvalues: Module (copy), ChatSettingsModule (copy)
		local self = setmetatable({}, Module)
		self.GuiObject = nil
		self.GuiObjects = {}
		self.ChannelTabs = {}
		self.NumTabs = 0
		self.CurPageNum = 0
		self.ScrollChannelsFrameLock = false
		self.AnimParams = {}
		self:InitializeAnimParams()
		ChatSettingsModule.SettingsChanged:connect(function(p15, p16) --[[ Line: 391 ]]
			-- upvalues: self (copy)
			if p15 == "ChatChannelsTabTextSize" then
				self:ResizeChannelTabText(p16)
			end
		end)
		
		return self
	end
}