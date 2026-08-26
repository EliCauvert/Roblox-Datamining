local t = {}
local clientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local parent = script.Parent
local channelsTabModule = require(parent:WaitForChild("ChannelsTab"))
local messageSenderModule = require(parent:WaitForChild("MessageSender"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local curveUtilModule = require(parent:WaitForChild("CurveUtil"))
local t_1 = {}
t_1.__index = t_1

function t_1.CreateGuiObjects(p1, p2)
	-- upvalues: chatSettingsModule (ref), messageSenderModule (ref)
	local frame = Instance.new("Frame")
	frame.Selectable = false
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Parent = p2
	local scrollingBase = Instance.new("Frame")
	scrollingBase.Selectable = false
	scrollingBase.Name = "ScrollingBase"
	scrollingBase.BackgroundTransparency = 1
	scrollingBase.ClipsDescendants = true
	scrollingBase.Size = UDim2.new(1, 0, 1, 0)
	scrollingBase.Position = UDim2.new(0, 0, 0, 0)
	scrollingBase.Parent = frame
	local scrollerSizer = Instance.new("Frame")
	scrollerSizer.Selectable = false
	scrollerSizer.Name = "ScrollerSizer"
	scrollerSizer.BackgroundTransparency = 1
	scrollerSizer.Size = UDim2.new(1, 0, 1, 0)
	scrollerSizer.Position = UDim2.new(0, 0, 0, 0)
	scrollerSizer.Parent = scrollingBase
	local scrollerFrame = Instance.new("Frame")
	scrollerFrame.Selectable = false
	scrollerFrame.Name = "ScrollerFrame"
	scrollerFrame.BackgroundTransparency = 1
	scrollerFrame.Size = UDim2.new(1, 0, 1, 0)
	scrollerFrame.Position = UDim2.new(0, 0, 0, 0)
	scrollerFrame.Parent = scrollerSizer
	local frame_4 = Instance.new("Frame")
	frame_4.Selectable = false
	frame_4.Size = UDim2.new(1, 0, 1, 0)
	frame_4.Position = UDim2.new(0, 0, 0, 0)
	frame_4.ClipsDescendants = true
	frame_4.BackgroundTransparency = 1
	frame_4.Parent = frame
	local leaveConfirmationFrame = Instance.new("Frame")
	leaveConfirmationFrame.Selectable = false
	leaveConfirmationFrame.Name = "LeaveConfirmationFrame"
	leaveConfirmationFrame.Size = UDim2.new(1, 0, 1, 0)
	leaveConfirmationFrame.Position = UDim2.new(0, 0, 1, 0)
	leaveConfirmationFrame.BackgroundTransparency = 0.6
	leaveConfirmationFrame.BorderSizePixel = 0
	leaveConfirmationFrame.BackgroundColor3 = Color3.new(0, 0, 0)
	leaveConfirmationFrame.Parent = frame_4
	local textButton = Instance.new("TextButton")
	textButton.Selectable = false
	textButton.Size = UDim2.new(1, 0, 1, 0)
	textButton.BackgroundTransparency = 1
	textButton.Text = ""
	textButton.Parent = leaveConfirmationFrame
	local textButton_1 = Instance.new("TextButton")
	textButton_1.Selectable = false
	textButton_1.Size = UDim2.new(0.25, 0, 1, 0)
	textButton_1.BackgroundTransparency = 1
	textButton_1.Font = chatSettingsModule.DefaultFont
	textButton_1.TextSize = 18
	textButton_1.TextStrokeTransparency = 0.75
	textButton_1.Position = UDim2.new(0, 0, 0, 0)
	textButton_1.TextColor3 = Color3.new(0, 1, 0)
	textButton_1.Text = "Confirm"
	textButton_1.Parent = leaveConfirmationFrame
	local var1 = textButton_1:Clone()
	var1.Parent = leaveConfirmationFrame
	var1.Position = UDim2.new(0.75, 0, 0, 0)
	var1.TextColor3 = Color3.new(1, 0, 0)
	var1.Text = "Cancel"
	local textLabel = Instance.new("TextLabel")
	textLabel.Selectable = false
	textLabel.Size = UDim2.new(0.5, 0, 1, 0)
	textLabel.Position = UDim2.new(0.25, 0, 0, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextStrokeTransparency = 0.75
	textLabel.Text = "Leave channel <XX>?"
	textLabel.Font = chatSettingsModule.DefaultFont
	textLabel.TextSize = 18
	textLabel.Parent = leaveConfirmationFrame
	local leaveTarget = Instance.new("StringValue")
	leaveTarget.Name = "LeaveTarget"
	leaveTarget.Parent = leaveConfirmationFrame
	local position = leaveConfirmationFrame.Position
	textButton_1.MouseButton1Click:connect(function()
		-- upvalues: messageSenderModule (copy), leaveTarget (ref), leaveConfirmationFrame (ref), position (ref)
		messageSenderModule:SendMessage(string.format("/leave %s", leaveTarget.Value), nil)
		leaveConfirmationFrame:TweenPosition(position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	var1.MouseButton1Click:connect(function()
		-- upvalues: leaveConfirmationFrame (ref), position (ref)
		leaveConfirmationFrame:TweenPosition(position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	local _ = "rbxasset://textures/ui/Chat/TabArrowBackground.png"
	local _ = "rbxasset://textures/ui/Chat/TabArrow.png"
	local var2 = "rbxassetid://471630199"
	local var3 = "rbxassetid://471630112"
	local pageLeftButton = Instance.new("ImageButton", frame)
	pageLeftButton.Selectable = chatSettingsModule.GamepadNavigationEnabled
	pageLeftButton.Name = "PageLeftButton"
	pageLeftButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	pageLeftButton.Size = UDim2.new(0.7, 0, 0.7, 0)
	pageLeftButton.BackgroundTransparency = 1
	pageLeftButton.Position = UDim2.new(0, 4, 0.15, 0)
	pageLeftButton.Visible = false
	pageLeftButton.Image = var2
	local arrowLabel = Instance.new("ImageLabel", pageLeftButton)
	arrowLabel.Name = "ArrowLabel"
	arrowLabel.BackgroundTransparency = 1
	arrowLabel.Size = UDim2.new(0.4, 0, 0.4, 0)
	arrowLabel.Image = var3
	local positionalHelper = Instance.new("Frame", frame)
	positionalHelper.Selectable = false
	positionalHelper.BackgroundTransparency = 1
	positionalHelper.Name = "PositionalHelper"
	positionalHelper.Size = pageLeftButton.Size
	positionalHelper.SizeConstraint = pageLeftButton.SizeConstraint
	positionalHelper.Position = UDim2.new(1, 0, 0.15, 0)
	local pageRightButton = pageLeftButton:Clone()
	pageRightButton.Parent = positionalHelper
	pageRightButton.Name = "PageRightButton"
	pageRightButton.Size = UDim2.new(1, 0, 1, 0)
	pageRightButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
	pageRightButton.Position = UDim2.new(-1, -4, 0, 0)
	local uDim2 = UDim2.new(0.05, 0, 0, 0)
	pageRightButton.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + uDim2
	pageLeftButton.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - uDim2
	pageLeftButton.ArrowLabel.Rotation = 180
	p1.GuiObject = frame
	p1.GuiObjects.BaseFrame = frame
	p1.GuiObjects.ScrollerSizer = scrollerSizer
	p1.GuiObjects.ScrollerFrame = scrollerFrame
	p1.GuiObjects.PageLeftButton = pageLeftButton
	p1.GuiObjects.PageRightButton = pageRightButton
	p1.GuiObjects.LeaveConfirmationFrame = leaveConfirmationFrame
	p1.GuiObjects.LeaveConfirmationNotice = textLabel
	p1.GuiObjects.PageLeftButtonArrow = pageLeftButton.ArrowLabel
	p1.GuiObjects.PageRightButtonArrow = pageRightButton.ArrowLabel
	p1:AnimGuiObjects()
	pageLeftButton.MouseButton1Click:connect(function()
		-- upvalues: p1 (ref)
		p1:ScrollChannelsFrame(-1)
	end)
	pageRightButton.MouseButton1Click:connect(function()
		-- upvalues: p1 (ref)
		p1:ScrollChannelsFrame(1)
	end)
	p1:ScrollChannelsFrame(0)
end

function t_1.UpdateMessagePostedInChannel(p1, p2)
	local var1 = p1:GetChannelTab(p2)
	
	if var1 then
		var1:UpdateMessagePostedInChannel()
		
		return
	end
	warn("ChannelsTab '" .. p3 .. "' does not exist!")
end

function t_1.AddChannelTab(p1, p2)
	-- upvalues: channelsTabModule (ref), chatSettingsModule (ref)
	if p1:GetChannelTab(p2) then
		error("Channel tab '" .. p5 .. "'already exists!")
	end
	local var1 = channelsTabModule.new(p2)
	var1.GuiObject.Parent = p1.GuiObjects.ScrollerFrame
	p1.ChannelTabs[p2:lower()] = var1
	p1.NumTabs += 1
	p1:OrganizeChannelTabs()
	
	if chatSettingsModule.RightClickToLeaveChannelEnabled then
		var1.NameTag.MouseButton2Click:connect(function()
			-- upvalues: p1 (ref), var1 (ref)
			p1.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", var1.ChannelName)
			p1.LeaveConfirmationFrame.LeaveTarget.Value = var1.ChannelName
			p1.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
		end)
	end
	return var1
end

function t_1.RemoveChannelTab(p1, p2)
	if not p1:GetChannelTab(p2) then
		error("Channel tab '" .. p7 .. "'does not exist!")
	end
	local var1 = p2:lower()
	p1.ChannelTabs[var1]:Destroy()
	p1.ChannelTabs[var1] = nil
	p1.NumTabs -= 1
	p1:OrganizeChannelTabs()
end

function t_1.GetChannelTab(p1, p2)
	return p1.ChannelTabs[p2:lower()]
end

function t_1.OrganizeChannelTabs(value)
	-- upvalues: chatSettingsModule (ref)
	local t = {}
	table.insert(t, value:GetChannelTab(chatSettingsModule.GeneralChannelName))
	table.insert(t, value:GetChannelTab("System"))
	
	for i, v in pairs(value.ChannelTabs) do
		if v.ChannelName ~= chatSettingsModule.GeneralChannelName and v.ChannelName ~= "System" then
			table.insert(t, v)
		end
	end
	for i_1, v_1 in pairs(t) do
		v_1.GuiObject.Position = UDim2.new(i_1 - 1, 0, 0, 0)
	end
	value.GuiObjects.ScrollerSizer.Size = UDim2.new(1 / math.max(1, math.min(chatSettingsModule.ChannelsBarFullTabSize, value.NumTabs)), 0, 1, 0)
	value:ScrollChannelsFrame(0)
end

function t_1.ResizeChannelTabText(p1, p2)
	for i, v in pairs(p1.ChannelTabs) do
		v:SetTextSize(p2)
	end
end

function t_1.ScrollChannelsFrame(p3, p4)
	-- upvalues: chatSettingsModule (ref)
	if p3.ScrollChannelsFrameLock then return end
	p3.ScrollChannelsFrameLock = true
	local channelsBarFullTabSize = chatSettingsModule.ChannelsBarFullTabSize
	local var1 = p3.CurPageNum + p4
	
	if var1 < 0 then
		var1 = 0
	elseif var1 > 0 and p3.NumTabs < var1 + channelsBarFullTabSize then
		var1 = p3.NumTabs - channelsBarFullTabSize
	end
	p3.CurPageNum = var1
	local uDim2 = UDim2.new(-p3.CurPageNum, 0, 0, 0)
	p3.GuiObjects.PageLeftButton.Visible = p3.CurPageNum > 0
	p3.GuiObjects.PageRightButton.Visible = p3.CurPageNum + channelsBarFullTabSize < p3.NumTabs
	
	if p4 == 0 then
		p3.ScrollChannelsFrameLock = false
		
		return
	end
	local function UnlockFunc()
		-- upvalues: p3 (ref)
		p3.ScrollChannelsFrameLock = false
	end
	
	p3:WaitUntilParentedCorrectly()
	p3.GuiObjects.ScrollerFrame:TweenPosition(uDim2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, UnlockFunc)
end

function t_1.FadeOutBackground(value, p3)
	-- upvalues: curveUtilModule (ref)
	for i, v in pairs(value.ChannelTabs) do
		v:FadeOutBackground(p3)
	end
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p3)
end

function t_1.FadeInBackground(value, p4)
	-- upvalues: curveUtilModule (ref)
	for i, v in pairs(value.ChannelTabs) do
		v:FadeInBackground(p4)
	end
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p4)
end

function t_1.FadeOutText(p5, p6)
	for i, v in pairs(p5.ChannelTabs) do
		v:FadeOutText(p6)
	end
end

function t_1.FadeInText(p7, p8)
	for i, v in pairs(p7.ChannelTabs) do
		v:FadeInText(p8)
	end
end

function t_1.AnimGuiObjects(p9)
	p9.GuiObjects.PageLeftButton.ImageTransparency = p9.AnimParams.Background_CurrentTransparency
	p9.GuiObjects.PageRightButton.ImageTransparency = p9.AnimParams.Background_CurrentTransparency
	p9.GuiObjects.PageLeftButtonArrow.ImageTransparency = p9.AnimParams.Background_CurrentTransparency
	p9.GuiObjects.PageRightButtonArrow.ImageTransparency = p9.AnimParams.Background_CurrentTransparency
end

function t_1.InitializeAnimParams(p9)
	-- upvalues: curveUtilModule (ref)
	p9.AnimParams.Background_TargetTransparency = 0.6
	p9.AnimParams.Background_CurrentTransparency = 0.6
	p9.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function t_1.Update(p9, p10)
	-- upvalues: curveUtilModule (ref)
	for i, v in pairs(p9.ChannelTabs) do
		v:Update(p10)
	end
	p9.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p9.AnimParams.Background_CurrentTransparency, p9.AnimParams.Background_TargetTransparency, p9.AnimParams.Background_NormalizedExptValue, p10)
	p9:AnimGuiObjects()
end

function t_1.WaitUntilParentedCorrectly(p11)
	while not p11.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p11.GuiObject.AncestryChanged:wait()
	end
end

function t.new()
	-- upvalues: t_1 (ref), chatSettingsModule (ref)
	local tbl = setmetatable({}, t_1)
	tbl.GuiObject = nil
	tbl.GuiObjects = {}
	tbl.ChannelTabs = {}
	tbl.NumTabs = 0
	tbl.CurPageNum = 0
	tbl.ScrollChannelsFrameLock = false
	tbl.AnimParams = {}
	tbl:InitializeAnimParams()
	chatSettingsModule.SettingsChanged:connect(function(p12, p13)
		-- upvalues: tbl (ref)
		if p12 == "ChatChannelsTabTextSize" then
			tbl:ResizeChannelTabText(p13)
		end
	end)
	
	return tbl
end

return t