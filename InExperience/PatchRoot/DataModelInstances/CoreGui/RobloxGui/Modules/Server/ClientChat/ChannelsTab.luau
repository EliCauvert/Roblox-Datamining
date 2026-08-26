local t = {}
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local curveUtilModule = require(script.Parent:WaitForChild("CurveUtil"))
local t_1 = {}
t_1.__index = t_1

local function CreateGuiObjects()
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
	local var1 = textButton:Clone()
	local var2 = textButton:Clone()
	var1.Parent = unselectedFrame
	var2.Parent = selectedFrame
	var1.Font = Enum.Font.SourceSans
	var1.Active = false
	var2.Active = false
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
	
	return frame, textButton, var1, var2, imageLabel_2, unselectedFrame, selectedFrame
end

function t_1.Destroy(p1)
	p1.GuiObject:Destroy()
end

function t_1.UpdateMessagePostedInChannel(p1, p2)
	if p1.Active and p2 ~= true then
		return
	end
	local var1 = p1.UnreadMessageCount + 1
	p1.UnreadMessageCount = var1
	local newMessageIcon = p1.NewMessageIcon
	newMessageIcon.Visible = true
	newMessageIcon.TextLabel.Text = var1 < 100 and tostring(var1) or "!"
	local _ = newMessageIcon.Position + UDim2.new(0, 0, -0.1, 0)
	local out = Enum.EasingDirection.Out
	local quad = Enum.EasingStyle.Quad
	newMessageIcon.Position = UDim2.new(0, 0, -0.15, 0)
	newMessageIcon:TweenPosition(UDim2.new(0, 0, 0, 0), out, quad, 0.15, true)
end

function t_1.SetActive(value, p1)
	value.Active = p1
	value.UnselectedFrame.Visible = not p1
	value.SelectedFrame.Visible = p1
	
	if p1 then
		value.UnreadMessageCount = 0
		value.NewMessageIcon.Visible = false
		value.NameTag.Font = Enum.Font.SourceSansBold
		
		return
	end
	value.NameTag.Font = Enum.Font.SourceSans
end

function t_1.SetTextSize(value, p1)
	value.NameTag.TextSize = p1
end

function t_1.FadeOutBackground(value, p1)
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 1
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p1)
end

function t_1.FadeInBackground(value, p1)
	-- upvalues: curveUtilModule (ref)
	value.AnimParams.Background_TargetTransparency = 0.6
	value.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p1)
end

function t_1.FadeOutText(p1, p2)
	-- upvalues: curveUtilModule (ref)
	p1.AnimParams.Text_TargetTransparency = 1
	p1.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
	p1.AnimParams.TextStroke_TargetTransparency = 1
	p1.AnimParams.TextStroke_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function t_1.FadeInText(p1, p2)
	-- upvalues: curveUtilModule (ref)
	p1.AnimParams.Text_TargetTransparency = 0
	p1.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
	p1.AnimParams.TextStroke_TargetTransparency = 0.75
	p1.AnimParams.TextStroke_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function t_1.AnimGuiObjects(p1)
	p1.UnselectedFrame.BackgroundTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.SelectedFrame.BackgroundImage.BackgroundTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.SelectedFrame.BlueBarLeft.ImageTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.SelectedFrame.BlueBarRight.ImageTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.NameTagNonSelect.TextTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.NameTagNonSelect.TextStrokeTransparency = p1.AnimParams.Background_CurrentTransparency
	p1.NameTag.TextTransparency = p1.AnimParams.Text_CurrentTransparency
	p1.NewMessageIcon.ImageTransparency = p1.AnimParams.Text_CurrentTransparency
	p1.WhiteTextNewMessageNotification.TextTransparency = p1.AnimParams.Text_CurrentTransparency
	p1.NameTagSelect.TextTransparency = p1.AnimParams.Text_CurrentTransparency
	p1.NameTag.TextStrokeTransparency = p1.AnimParams.TextStroke_CurrentTransparency
	p1.WhiteTextNewMessageNotification.TextStrokeTransparency = p1.AnimParams.TextStroke_CurrentTransparency
	p1.NameTagSelect.TextStrokeTransparency = p1.AnimParams.TextStroke_CurrentTransparency
end

function t_1.InitializeAnimParams(p1)
	-- upvalues: curveUtilModule (ref)
	p1.AnimParams.Text_TargetTransparency = 0
	p1.AnimParams.Text_CurrentTransparency = 0
	p1.AnimParams.Text_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
	p1.AnimParams.TextStroke_TargetTransparency = 0.75
	p1.AnimParams.TextStroke_CurrentTransparency = 0.75
	p1.AnimParams.TextStroke_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
	p1.AnimParams.Background_TargetTransparency = 0.6
	p1.AnimParams.Background_CurrentTransparency = 0.6
	p1.AnimParams.Background_NormalizedExptValue = curveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function t_1.Update(p1, p2)
	-- upvalues: curveUtilModule (ref)
	p1.AnimParams.Background_CurrentTransparency = curveUtilModule:Expt(p1.AnimParams.Background_CurrentTransparency, p1.AnimParams.Background_TargetTransparency, p1.AnimParams.Background_NormalizedExptValue, p2)
	p1.AnimParams.Text_CurrentTransparency = curveUtilModule:Expt(p1.AnimParams.Text_CurrentTransparency, p1.AnimParams.Text_TargetTransparency, p1.AnimParams.Text_NormalizedExptValue, p2)
	p1.AnimParams.TextStroke_CurrentTransparency = curveUtilModule:Expt(p1.AnimParams.TextStroke_CurrentTransparency, p1.AnimParams.TextStroke_TargetTransparency, p1.AnimParams.TextStroke_NormalizedExptValue, p2)
	p1:AnimGuiObjects()
end

function t.new(p1)
	-- upvalues: t_1 (ref), CreateGuiObjects (ref), chatSettingsModule (ref)
	local tbl = setmetatable({}, t_1)
	local var1, var2, var3, var4, var5, var6, var7 = CreateGuiObjects()
	tbl.GuiObject = var1
	tbl.NameTag = var2
	tbl.NameTagNonSelect = var3
	tbl.NameTagSelect = var4
	tbl.NewMessageIcon = var5
	tbl.UnselectedFrame = var6
	tbl.SelectedFrame = var7
	tbl.BlueBarLeft = var7.BlueBarLeft
	tbl.BlueBarRight = var7.BlueBarRight
	tbl.BackgroundImage = var7.BackgroundImage
	tbl.WhiteTextNewMessageNotification = tbl.NewMessageIcon.TextLabel
	tbl.ChannelName = p1
	tbl.UnreadMessageCount = 0
	tbl.Active = false
	tbl.GuiObject.Name = "Frame_" .. tbl.ChannelName
	
	if chatSettingsModule.MaxChannelNameLength < string.len(p1) then
		p1 = string.sub(p1, 1, chatSettingsModule.MaxChannelNameLength - 3) .. "..."
	end
	tbl.NameTag.Text = ""
	tbl.NameTagNonSelect.Text = p1
	tbl.NameTagSelect.Text = p1
	tbl.AnimParams = {}
	tbl:InitializeAnimParams()
	tbl:AnimGuiObjects()
	tbl:SetActive(false)
	
	return tbl
end

return t