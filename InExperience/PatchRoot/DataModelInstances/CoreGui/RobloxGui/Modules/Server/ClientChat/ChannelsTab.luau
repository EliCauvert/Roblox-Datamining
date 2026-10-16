local ChatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local CurveUtilModule = require(script.Parent:WaitForChild("CurveUtil"))
local Module = {}
Module.__index = Module

local function CreateGuiObjects() --[[ Line: 21 ]]
	-- upvalues: ChatSettingsModule (copy)
	local Frame = Instance.new("Frame")
	Frame.Selectable = false
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundTransparency = 1
	local BackgroundFrame = Instance.new("Frame")
	BackgroundFrame.Selectable = false
	BackgroundFrame.Name = "BackgroundFrame"
	BackgroundFrame.Size = UDim2.new(1, -2, 1, -2)
	BackgroundFrame.Position = UDim2.new(0, 1, 0, 1)
	BackgroundFrame.BackgroundTransparency = 1
	BackgroundFrame.Parent = Frame
	local UnselectedFrame = Instance.new("Frame")
	UnselectedFrame.Selectable = false
	UnselectedFrame.Name = "UnselectedFrame"
	UnselectedFrame.Size = UDim2.new(1, 0, 1, 0)
	UnselectedFrame.Position = UDim2.new(0, 0, 0, 0)
	UnselectedFrame.BorderSizePixel = 0
	UnselectedFrame.BackgroundColor3 = ChatSettingsModule.ChannelsTabUnselectedColor
	UnselectedFrame.BackgroundTransparency = 0.6
	UnselectedFrame.Parent = BackgroundFrame
	local SelectedFrame = Instance.new("Frame")
	SelectedFrame.Selectable = false
	SelectedFrame.Name = "SelectedFrame"
	SelectedFrame.Size = UDim2.new(1, 0, 1, 0)
	SelectedFrame.Position = UDim2.new(0, 0, 0, 0)
	SelectedFrame.BorderSizePixel = 0
	SelectedFrame.BackgroundColor3 = ChatSettingsModule.ChannelsTabSelectedColor
	SelectedFrame.BackgroundTransparency = 1
	SelectedFrame.Parent = BackgroundFrame
	local BackgroundImage = Instance.new("ImageLabel")
	BackgroundImage.Selectable = false
	BackgroundImage.Name = "BackgroundImage"
	BackgroundImage.BackgroundTransparency = 1
	BackgroundImage.BorderSizePixel = 0
	BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
	BackgroundImage.Position = UDim2.new(0, 0, 0, 0)
	BackgroundImage.ScaleType = Enum.ScaleType.Slice
	BackgroundImage.Parent = SelectedFrame
	BackgroundImage.BackgroundTransparency = -0.4
	BackgroundImage.BackgroundColor3 = Color3.fromRGB(93.6, 100.8, 115.19999999999999)
	local BlueBarLeft = Instance.new("ImageLabel")
	BlueBarLeft.Selectable = false
	BlueBarLeft.Size = UDim2.new(0.5, -2, 0, 4)
	BlueBarLeft.BackgroundTransparency = 1
	BlueBarLeft.ScaleType = Enum.ScaleType.Slice
	BlueBarLeft.SliceCenter = Rect.new(3, 3, 32, 21)
	BlueBarLeft.Parent = SelectedFrame
	local BlueBarRight = BlueBarLeft:Clone()
	BlueBarRight.Parent = SelectedFrame
	BlueBarLeft.Position = UDim2.new(0, 2, 1, -4)
	BlueBarRight.Position = UDim2.new(0.5, 0, 1, -4)
	BlueBarLeft.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
	BlueBarRight.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
	BlueBarLeft.Name = "BlueBarLeft"
	BlueBarRight.Name = "BlueBarRight"
	local Button = Instance.new("TextButton")
	Button.Selectable = ChatSettingsModule.GamepadNavigationEnabled
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.Position = UDim2.new(0, 0, 0, 0)
	Button.BackgroundTransparency = 1
	Button.Font = ChatSettingsModule.DefaultFont
	Button.TextSize = ChatSettingsModule.ChatChannelsTabTextSize
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.TextStrokeTransparency = 0.75
	Button.Parent = BackgroundFrame
	local ButtonClone = Button:Clone()
	local ButtonClone1 = Button:Clone()
	ButtonClone.Parent = UnselectedFrame
	ButtonClone1.Parent = SelectedFrame
	ButtonClone.Font = Enum.Font.SourceSans
	ButtonClone.Active = false
	ButtonClone1.Active = false
	local Frame1 = Instance.new("Frame")
	Frame1.Selectable = false
	Frame1.Size = UDim2.new(0, 18, 0, 18)
	Frame1.Position = UDim2.new(0.8, -9, 0.5, -9)
	Frame1.BackgroundTransparency = 1
	Frame1.Parent = BackgroundFrame
	local Image = Instance.new("ImageLabel")
	Image.Selectable = false
	Image.Size = UDim2.new(1, 0, 1, 0)
	Image.BackgroundTransparency = 1
	Image.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
	Image.Visible = false
	Image.Parent = Frame1
	local Label = Instance.new("TextLabel")
	Label.Selectable = false
	Label.BackgroundTransparency = 1
	Label.Size = UDim2.new(0, 13, 0, 9)
	Label.Position = UDim2.new(0.5, -7, 0.5, -7)
	Label.Font = ChatSettingsModule.DefaultFont
	Label.TextSize = 14
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.Text = ""
	Label.Parent = Image
	
	return Frame, Button, ButtonClone, ButtonClone1, Image, UnselectedFrame, SelectedFrame
end

function Module.Destroy(p1) --[[ Line: 141 ]]
	p1.GuiObject:Destroy()
end

function Module.UpdateMessagePostedInChannel(p1, Enabled) --[[ Line: 145 ]]
	if not p1.Active or Enabled == true then
		local NewUnreadMessageCount = p1.UnreadMessageCount + 1
		p1.UnreadMessageCount = NewUnreadMessageCount
		local NewMessageIcon = p1.NewMessageIcon
		NewMessageIcon.Visible = true
		NewMessageIcon.TextLabel.Text = NewUnreadMessageCount < 100 and tostring(NewUnreadMessageCount) or "!"
		local _ = NewMessageIcon.Position + UDim2.new(0, 0, -0.1, 0)
		local Out = Enum.EasingDirection.Out
		local Quad = Enum.EasingStyle.Quad
		NewMessageIcon.Position = UDim2.new(0, 0, -0.15, 0)
		NewMessageIcon:TweenPosition(UDim2.new(0, 0, 0, 0), Out, Quad, 0.15, true)
		
		return
	end
end

function Module.SetActive(p1, Active) --[[ Line: 168 ]]
	p1.Active = Active
	p1.UnselectedFrame.Visible = not Active
	p1.SelectedFrame.Visible = Active
	
	if Active then
		p1.UnreadMessageCount = 0
		p1.NewMessageIcon.Visible = false
		p1.NameTag.Font = Enum.Font.SourceSansBold
		
		return
	else
		p1.NameTag.Font = Enum.Font.SourceSans
	end
end

function Module.SetTextSize(p1, TextSize) --[[ Line: 184 ]]
	p1.NameTag.TextSize = TextSize
end

function Module.FadeOutBackground(p1, p2) --[[ Line: 188 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Background_TargetTransparency = 1
	p1.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function Module.FadeInBackground(p1, p2) --[[ Line: 193 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Background_TargetTransparency = 0.6
	p1.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function Module.FadeOutText(p1, p2) --[[ Line: 198 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Text_TargetTransparency = 1
	p1.AnimParams.Text_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
	p1.AnimParams.TextStroke_TargetTransparency = 1
	p1.AnimParams.TextStroke_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function Module.FadeInText(p1, p2) --[[ Line: 205 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Text_TargetTransparency = 0
	p1.AnimParams.Text_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
	p1.AnimParams.TextStroke_TargetTransparency = 0.75
	p1.AnimParams.TextStroke_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(p2)
end

function Module.AnimGuiObjects(p1) --[[ Line: 212 ]]
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

function Module.InitializeAnimParams(p1) --[[ Line: 230 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Text_TargetTransparency = 0
	p1.AnimParams.Text_CurrentTransparency = 0
	p1.AnimParams.Text_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(0)
	p1.AnimParams.TextStroke_TargetTransparency = 0.75
	p1.AnimParams.TextStroke_CurrentTransparency = 0.75
	p1.AnimParams.TextStroke_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(0)
	p1.AnimParams.Background_TargetTransparency = 0.6
	p1.AnimParams.Background_CurrentTransparency = 0.6
	p1.AnimParams.Background_NormalizedExptValue = CurveUtilModule:NormalizedDefaultExptValueInSeconds(0)
end

function Module.Update(p1, p2) --[[ Line: 244 ]]
	-- upvalues: CurveUtilModule (copy)
	p1.AnimParams.Background_CurrentTransparency = CurveUtilModule:Expt(p1.AnimParams.Background_CurrentTransparency, p1.AnimParams.Background_TargetTransparency, p1.AnimParams.Background_NormalizedExptValue, p2)
	p1.AnimParams.Text_CurrentTransparency = CurveUtilModule:Expt(p1.AnimParams.Text_CurrentTransparency, p1.AnimParams.Text_TargetTransparency, p1.AnimParams.Text_NormalizedExptValue, p2)
	p1.AnimParams.TextStroke_CurrentTransparency = CurveUtilModule:Expt(p1.AnimParams.TextStroke_CurrentTransparency, p1.AnimParams.TextStroke_TargetTransparency, p1.AnimParams.TextStroke_NormalizedExptValue, p2)
	p1:AnimGuiObjects()
end

return {
	new = function(Text: string) --[[ Line: 270 ]]
		-- upvalues: Module (copy), CreateGuiObjects (copy), ChatSettingsModule (copy)
		local self = setmetatable({}, Module)
		local GuiObjects7
		self.GuiObject, self.NameTag, self.NameTagNonSelect, self.NameTagSelect, self.NewMessageIcon, self.UnselectedFrame, GuiObjects7 = CreateGuiObjects()
		self.SelectedFrame = GuiObjects7
		self.BlueBarLeft = GuiObjects7.BlueBarLeft
		self.BlueBarRight = GuiObjects7.BlueBarRight
		self.BackgroundImage = GuiObjects7.BackgroundImage
		self.WhiteTextNewMessageNotification = self.NewMessageIcon.TextLabel
		self.ChannelName = Text
		self.UnreadMessageCount = 0
		self.Active = false
		self.GuiObject.Name = "Frame_" .. self.ChannelName
		
		if ChatSettingsModule.MaxChannelNameLength < string.len(Text) then
			Text = string.sub(Text, 1, ChatSettingsModule.MaxChannelNameLength - 3) .. "..."
		end
		self.NameTag.Text = ""
		self.NameTagNonSelect.Text = Text
		self.NameTagSelect.Text = Text
		self.AnimParams = {}
		self:InitializeAnimParams()
		self:AnimGuiObjects()
		self:SetActive(false)
		
		return self
	end
}