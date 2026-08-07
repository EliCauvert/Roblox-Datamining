local t = {}
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local curveUtilModule = require(script.Parent:WaitForChild("CurveUtil"))
local t_1 = {}
t_1.__index = t_1

local function CreateGuiObjects() --[[ line: 21 ]]
	-- upvalues: chatSettingsModule (ref)
	local frame = Instance.new("Frame")
	frame.Selectable = false
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	local backgroundFrame = Instance.new("Frame")
	backgroundFrame.Selectable = false
	backgroundFrame.Name = "BackgroundFrame"
	backgroundFrame.Size = UDim2.new(1, -2, 1, -2)
	backgroundFrame.Position = UDim2.new(0, 1, 0, 1)
	backgroundFrame.BackgroundTransparency = 1
	backgroundFrame.Parent = frame
	local unselectedFrame = Instance.new("Frame")
	unselectedFrame.Selectable = false
	unselectedFrame.Name = "UnselectedFrame"
	unselectedFrame.Size = UDim2.new(1, 0, 1, 0)
	unselectedFrame.Position = UDim2.new(0, 0, 0, 0)
	unselectedFrame.BorderSizePixel = 0
	unselectedFrame.BackgroundColor3 = chatSettingsModule.ChannelsTabUnselectedColor
	unselectedFrame.BackgroundTransparency = 0.6
	unselectedFrame.Parent = backgroundFrame
	local selectedFrame = Instance.new("Frame")
	selectedFrame.Selectable = false
	selectedFrame.Name = "SelectedFrame"
	selectedFrame.Size = UDim2.new(1, 0, 1, 0)
	selectedFrame.Position = UDim2.new(0, 0, 0, 0)
	selectedFrame.BorderSizePixel = 0
	selectedFrame.BackgroundColor3 = chatSettingsModule.ChannelsTabSelectedColor
	selectedFrame.BackgroundTransparency = 1
	selectedFrame.Parent = backgroundFrame
	local backgroundImage = Instance.new("ImageLabel")
	backgroundImage.Selectable = false
	backgroundImage.Name = "BackgroundImage"
	backgroundImage.BackgroundTransparency = 1
	backgroundImage.BorderSizePixel = 0
	backgroundImage.Size = UDim2.new(1, 0, 1, 0)
	backgroundImage.Position = UDim2.new(0, 0, 0, 0)
	backgroundImage.ScaleType = Enum.ScaleType.Slice
	backgroundImage.Parent = selectedFrame
	backgroundImage.BackgroundTransparency = -0.4
	backgroundImage.BackgroundColor3 = Color3.fromRGB(93.6, 100.8, 115.2)
	local blueBarLeft = Instance.new("ImageLabel")
	blueBarLeft.Selectable = false
	blueBarLeft.Size = UDim2.new(0.5, -2, 0, 4)
	blueBarLeft.BackgroundTransparency = 1
	blueBarLeft.ScaleType = Enum.ScaleType.Slice
	blueBarLeft.SliceCenter = Rect.new(3, 3, 32, 21)
	blueBarLeft.Parent = selectedFrame
	local blueBarRight = blueBarLeft:Clone()
	blueBarRight.Parent = selectedFrame
	blueBarLeft.Position = UDim2.new(0, 2, 1, -4)
	blueBarRight.Position = UDim2.new(0.5, 0, 1, -4)
	blueBarLeft.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
	blueBarRight.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
	blueBarLeft.Name = "BlueBarLeft"
	blueBarRight.Name = "BlueBarRight"
	local textButton = Instance.new("TextButton")
	textButton.Selectable = chatSettingsModule.GamepadNavigationEnabled
	textButton.Size = UDim2.new(1, 0, 1, 0)
	textButton.Position = UDim2.new(0, 0, 0, 0)
	textButton.BackgroundTransparency = 1
	textButton.Font = chatSettingsModule.DefaultFont
	textButton.TextSize = chatSettingsModule.ChatChannelsTabTextSize
	textButton.TextColor3 = Color3.new(1, 1, 1)
	textButton.TextStrokeTransparency = 0.75
	textButton.Parent = backgroundFrame
	local var13 = textButton:Clone()
	local var14 = textButton:Clone()
	var13.Parent = unselectedFrame
	var14.Parent = selectedFrame
	var13.Font = Enum.Font.SourceSans
	var13.Active = false
	var14.Active = false
	local frame_4 = Instance.new("Frame")
	frame_4.Selectable = false
	frame_4.Size = UDim2.new(0, 18, 0, 18)
	frame_4.Position = UDim2.new(0.8, -9, 0.5, -9)
	frame_4.BackgroundTransparency = 1
	frame_4.Parent = backgroundFrame
	local imageLabel_2 = Instance.new("ImageLabel")
	imageLabel_2.Selectable = false
	imageLabel_2.Size = UDim2.new(1, 0, 1, 0)
	imageLabel_2.BackgroundTransparency = 1
	imageLabel_2.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
	imageLabel_2.Visible = false
	imageLabel_2.Parent = frame_4
	local textLabel = Instance.new("TextLabel")
	textLabel.Selectable = false
	textLabel.BackgroundTransparency = 1
	textLabel.Size = UDim2.new(0, 13, 0, 9)
	textLabel.Position = UDim2.new(0.5, -7, 0.5, -7)
	textLabel.Font = chatSettingsModule.DefaultFont
	textLabel.TextSize = 14
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.Text = ""
	textLabel.Parent = imageLabel_2
	
	return frame, textButton, var13, var14, imageLabel_2, unselectedFrame, selectedFrame
end

function t_1.Destroy(p0) --[[ line: 141 ]]
	p0.GuiObject:Destroy()
end

function t_1.UpdateMessagePostedInChannel(p1, p2) --[[ line: 145 ]]
	if p1.Active and p2 ~= true then
		return
	end
	local var18 = p1.UnreadMessageCount + 1
	p1.UnreadMessageCount = var18
	local newMessageIcon = p1.NewMessageIcon
	newMessageIcon.Visible = true
	newMessageIcon.TextLabel.Text = var18 < 100 and tostring(var18) or "!"
	local _ = newMessageIcon.Position + UDim2.new(0, 0, -0.1, 0)
	local out = Enum.EasingDirection.Out
	local quad = Enum.EasingStyle.Quad
	newMessageIcon.Position = UDim2.new(0, 0, -0.15, 0)
	newMessageIcon:TweenPosition(UDim2.new(0, 0, 0, 0), out, quad, 0.15, true)
end

function t_1.SetActive(value, p3) --[[ line: 168 ]]
	value.Active = p3
	value.UnselectedFrame.Visible = not p3
	value.SelectedFrame.Visible = p3
	
	if p3 then
		value.UnreadMessageCount = 0
		value.NewMessageIcon.Visible = false
		value.NameTag.Font = Enum.Font.SourceSansBold
		
		return
	end
	value.NameTag.Font = Enum.Font.SourceSans
end

function t_1.SetTextSize(value, p4) --[[ line: 184 ]]
	value.NameTag.TextSize = p4
end

function t_1.FadeOutBackground(value, p5) --[[ line: 188 ]]
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p5)
end

function t_1.FadeInBackground(value, p6) --[[ line: 193 ]]
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p6)
end

function t_1.FadeOutText(p7, p8) --[[ line: 198 ]]
	-- upvalues: curveUtilModule (ref)
	p7.AnimParams.Text_TargetTransparency = 1
	p7.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p8)
	p7.AnimParams.TextStroke_TargetTransparency = 1
	p7.AnimParams.TextStroke_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p8)
end

function t_1.FadeInText(p9, p10) --[[ line: 205 ]]
	-- upvalues: curveUtilModule (ref)
	p9.AnimParams.Text_TargetTransparency = 0
	p9.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p10)
	p9.AnimParams.TextStroke_TargetTransparency = 0.75
	p9.AnimParams.TextStroke_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p10)
end

function t_1.AnimGuiObjects(p11) --[[ line: 212 ]]
	p11.UnselectedFrame.BackgroundTransparency = p11.AnimParams.Background_CurrentTransparency
	p11.SelectedFrame.BackgroundImage.BackgroundTransparency = p11.AnimParams.Background_CurrentTransparency
	p11.SelectedFrame.BlueBarLeft.ImageTransparency = p11.AnimParams.Background_CurrentTransparency
	p11.SelectedFrame.BlueBarRight.ImageTransparency = p11.AnimParams.Background_CurrentTransparency
	p11.NameTagNonSelect.TextTransparency = p11.AnimParams.Background_CurrentTransparency
	p11.NameTagNonSelect.TextStrokeTransparency = p11.AnimParams.Background_CurrentTransparency
	p11.NameTag.TextTransparency = p11.AnimParams.Text_CurrentTransparency
	p11.NewMessageIcon.ImageTransparency = p11.AnimParams.Text_CurrentTransparency
	p11.WhiteTextNewMessageNotification.TextTransparency = p11.AnimParams.Text_CurrentTransparency
	p11.NameTagSelect.TextTransparency = p11.AnimParams.Text_CurrentTransparency
	p11.NameTag.TextStrokeTransparency = p11.AnimParams.TextStroke_CurrentTransparency
	p11.WhiteTextNewMessageNotification.TextStrokeTransparency = p11.AnimParams.TextStroke_CurrentTransparency
	p11.NameTagSelect.TextStrokeTransparency = p11.AnimParams.TextStroke_CurrentTransparency
end

function t_1.InitializeAnimParams(p12) --[[ line: 230 ]]
	-- upvalues: curveUtilModule (ref)
	p12.AnimParams.Text_TargetTransparency = 0
	p12.AnimParams.Text_CurrentTransparency = 0
	p12.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
	p12.AnimParams.TextStroke_TargetTransparency = 0.75
	p12.AnimParams.TextStroke_CurrentTransparency = 0.75
	p12.AnimParams.TextStroke_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
	p12.AnimParams.Background_TargetTransparency = 0.6
	p12.AnimParams.Background_CurrentTransparency = 0.6
	p12.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function t_1.Update(p13, p14) --[[ line: 244 ]]
	-- upvalues: curveUtilModule (ref)
	p13.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p13.AnimParams.Background_CurrentTransparency, p13.AnimParams.Background_TargetTransparency, p13.AnimParams.Background_NormalizedExptValue, p14)
	p13.AnimParams.Text_CurrentTransparency = curveUtilModule:Expt(p13.AnimParams.Text_CurrentTransparency, p13.AnimParams.Text_TargetTransparency, p13.AnimParams.Text_NormalizedExptValue, p14)
	p13.AnimParams.TextStroke_CurrentTransparency = curveUtilModule:Expt(p13.AnimParams.TextStroke_CurrentTransparency, p13.AnimParams.TextStroke_TargetTransparency, p13.AnimParams.TextStroke_NormalizedExptValue, p14)
	p13:AnimGuiObjects()
end

function t.new(p15) --[[ line: 270 ]]
	-- upvalues: t_1 (ref), CreateGuiObjects (ref), chatSettingsModule (ref)
	local tbl = setmetatable({}, t_1)
	local var20, var21, var22, var23, var24, var25, var26 = CreateGuiObjects()
	tbl.GuiObject = var20
	tbl.NameTag = var21
	tbl.NameTagNonSelect = var22
	tbl.NameTagSelect = var23
	tbl.NewMessageIcon = var24
	tbl.UnselectedFrame = var25
	tbl.SelectedFrame = var26
	tbl.BlueBarLeft = var26.BlueBarLeft
	tbl.BlueBarRight = var26.BlueBarRight
	tbl.BackgroundImage = var26.BackgroundImage
	tbl.WhiteTextNewMessageNotification = tbl.NewMessageIcon.TextLabel
	tbl.ChannelName = p15
	tbl.UnreadMessageCount = 0
	tbl.Active = false
	tbl.GuiObject.Name = "Frame_" .. tbl.ChannelName
	
	if chatSettingsModule.MaxChannelNameLength < string.len(p15) then
		p15 = string.sub(p15, 1, chatSettingsModule.MaxChannelNameLength - 3) .. "..."
	end
	tbl.NameTag.Text = ""
	tbl.NameTagNonSelect.Text = p15
	tbl.NameTagSelect.Text = p15
	tbl.AnimParams = {}
	tbl:InitializeAnimParams()
	tbl:AnimGuiObjects()
	tbl:SetActive(false)
	
	return tbl
end

return t