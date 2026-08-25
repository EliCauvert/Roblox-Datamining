local t = {}
local clientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local parent = script.Parent
local channelsTabModule = require(parent:WaitForChild("ChannelsTab"))
local messageSenderModule = require(parent:WaitForChild("MessageSender"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local curveUtilModule = require(parent:WaitForChild("CurveUtil"))
local t_1 = {}
t_1.__index = t_1

function t_1.CreateGuiObjects(p0, p1)
	-- upvalues: chatSettingsModule (ref), messageSenderModule (ref)
	local frame = Instance.new("Frame")
	frame.Selectable = false
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Parent = p1
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
	local var15 = textButton_1:Clone()
	var15.Parent = leaveConfirmationFrame
	var15.Position = UDim2.new(0.75, 0, 0, 0)
	var15.TextColor3 = Color3.new(1, 0, 0)
	var15.Text = "Cancel"
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
	var15.MouseButton1Click:connect(function()
		-- upvalues: leaveConfirmationFrame (ref), position (ref)
		leaveConfirmationFrame:TweenPosition(position, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	local _ = "rbxasset://textures/ui/Chat/TabArrowBackground.png"
	local _ = "rbxasset://textures/ui/Chat/TabArrow.png"
	local var18 = "rbxassetid://471630199"
	local var19 = "rbxassetid://471630112"
	local pageLeftButton = Instance.new("ImageButton", frame)
	pageLeftButton.Selectable = chatSettingsModule.GamepadNavigationEnabled
	pageLeftButton.Name = "PageLeftButton"
	pageLeftButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	pageLeftButton.Size = UDim2.new(0.7, 0, 0.7, 0)
	pageLeftButton.BackgroundTransparency = 1
	pageLeftButton.Position = UDim2.new(0, 4, 0.15, 0)
	pageLeftButton.Visible = false
	pageLeftButton.Image = var18
	local arrowLabel = Instance.new("ImageLabel", pageLeftButton)
	arrowLabel.Name = "ArrowLabel"
	arrowLabel.BackgroundTransparency = 1
	arrowLabel.Size = UDim2.new(0.4, 0, 0.4, 0)
	arrowLabel.Image = var19
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
	p0.GuiObject = frame
	p0.GuiObjects.BaseFrame = frame
	p0.GuiObjects.ScrollerSizer = scrollerSizer
	p0.GuiObjects.ScrollerFrame = scrollerFrame
	p0.GuiObjects.PageLeftButton = pageLeftButton
	p0.GuiObjects.PageRightButton = pageRightButton
	p0.GuiObjects.LeaveConfirmationFrame = leaveConfirmationFrame
	p0.GuiObjects.LeaveConfirmationNotice = textLabel
	p0.GuiObjects.PageLeftButtonArrow = pageLeftButton.ArrowLabel
	p0.GuiObjects.PageRightButtonArrow = pageRightButton.ArrowLabel
	p0:AnimGuiObjects()
	pageLeftButton.MouseButton1Click:connect(function()
		-- upvalues: p0 (ref)
		p0:ScrollChannelsFrame(-1)
	end)
	pageRightButton.MouseButton1Click:connect(function()
		-- upvalues: p0 (ref)
		p0:ScrollChannelsFrame(1)
	end)
	p0:ScrollChannelsFrame(0)
end

function t_1.UpdateMessagePostedInChannel(p2, p3)
	local var25 = p2:GetChannelTab(p3)
	
	if var25 then
		var25:UpdateMessagePostedInChannel()
		
		return
	end
	warn("ChannelsTab '" .. p3 .. "' does not exist!")
end

function t_1.AddChannelTab(p4, p5)
	-- upvalues: channelsTabModule (ref), chatSettingsModule (ref)
	if p4:GetChannelTab(p5) then
		error("Channel tab '" .. p5 .. "'already exists!")
	end
	local var26 = channelsTabModule.new(p5)
	var26.GuiObject.Parent = p4.GuiObjects.ScrollerFrame
	p4.ChannelTabs[p5:lower()] = var26
	p4.NumTabs += 1
	p4:OrganizeChannelTabs()
	
	if chatSettingsModule.RightClickToLeaveChannelEnabled then
		var26.NameTag.MouseButton2Click:connect(function()
			-- upvalues: p4 (ref), var26 (ref)
			p4.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", var26.ChannelName)
			p4.LeaveConfirmationFrame.LeaveTarget.Value = var26.ChannelName
			p4.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
		end)
	end
	return var26
end

function t_1.RemoveChannelTab(p6, p7)
	if not p6:GetChannelTab(p7) then
		error("Channel tab '" .. p7 .. "'does not exist!")
	end
	local var27 = p7:lower()
	p6.ChannelTabs[var27]:Destroy()
	p6.ChannelTabs[var27] = nil
	p6.NumTabs -= 1
	p6:OrganizeChannelTabs()
end

function t_1.GetChannelTab(p8, p9)
	return p8.ChannelTabs[p9:lower()]
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

function t_1.ResizeChannelTabText(p10, p11)
	for i, v in pairs(p10.ChannelTabs) do
		v:SetTextSize(p11)
	end
end

function t_1.ScrollChannelsFrame(p12, p13)
	-- upvalues: chatSettingsModule (ref)
	if p12.ScrollChannelsFrameLock then return end
	p12.ScrollChannelsFrameLock = true
	local channelsBarFullTabSize = chatSettingsModule.ChannelsBarFullTabSize
	local var29 = p12.CurPageNum + p13
	
	if var29 < 0 then
		var29 = 0
	elseif var29 > 0 and p12.NumTabs < var29 + channelsBarFullTabSize then
		var29 = p12.NumTabs - channelsBarFullTabSize
	end
	p12.CurPageNum = var29
	local uDim2 = UDim2.new(-p12.CurPageNum, 0, 0, 0)
	p12.GuiObjects.PageLeftButton.Visible = p12.CurPageNum > 0
	p12.GuiObjects.PageRightButton.Visible = p12.CurPageNum + channelsBarFullTabSize < p12.NumTabs
	
	if p13 == 0 then
		p12.ScrollChannelsFrameLock = false
		
		return
	end
	local function UnlockFunc()
		-- upvalues: p12 (ref)
		p12.ScrollChannelsFrameLock = false
	end
	
	p12:WaitUntilParentedCorrectly()
	p12.GuiObjects.ScrollerFrame:TweenPosition(uDim2, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, UnlockFunc)
end

function t_1.FadeOutBackground(value, p14)
	-- upvalues: curveUtilModule (ref)
	for i, v in pairs(value.ChannelTabs) do
		v:FadeOutBackground(p14)
	end
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p14)
end

function t_1.FadeInBackground(value, p15)
	-- upvalues: curveUtilModule (ref)
	for i, v in pairs(value.ChannelTabs) do
		v:FadeInBackground(p15)
	end
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p15)
end

function t_1.FadeOutText(p16, p17)
	for i, v in pairs(p16.ChannelTabs) do
		v:FadeOutText(p17)
	end
end

function t_1.FadeInText(p18, p19)
	for i, v in pairs(p18.ChannelTabs) do
		v:FadeInText(p19)
	end
end

function t_1.AnimGuiObjects(p20)
	p20.GuiObjects.PageLeftButton.ImageTransparency = p20.AnimParams.Background_CurrentTransparency
	p20.GuiObjects.PageRightButton.ImageTransparency = p20.AnimParams.Background_CurrentTransparency
	p20.GuiObjects.PageLeftButtonArrow.ImageTransparency = p20.AnimParams.Background_CurrentTransparency
	p20.GuiObjects.PageRightButtonArrow.ImageTransparency = p20.AnimParams.Background_CurrentTransparency
end

function t_1.InitializeAnimParams(p21)
	-- upvalues: curveUtilModule (ref)
	p21.AnimParams.Background_TargetTransparency = 0.6
	p21.AnimParams.Background_CurrentTransparency = 0.6
	p21.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function t_1.Update(p22, p23)
	-- upvalues: curveUtilModule (ref)
	for i, v in pairs(p22.ChannelTabs) do
		v:Update(p23)
	end
	p22.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p22.AnimParams.Background_CurrentTransparency, p22.AnimParams.Background_TargetTransparency, p22.AnimParams.Background_NormalizedExptValue, p23)
	p22:AnimGuiObjects()
end

function t_1.WaitUntilParentedCorrectly(p24)
	while not p24.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p24.GuiObject.AncestryChanged:wait()
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
	chatSettingsModule.SettingsChanged:connect(function(p25, p26)
		-- upvalues: tbl (ref)
		if p25 == "ChatChannelsTabTextSize" then
			tbl:ResizeChannelTabText(p26)
		end
	end)
	
	return tbl
end

return t