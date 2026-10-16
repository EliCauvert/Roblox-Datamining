local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreUtilityModule = require(game:GetService("CoreGui").RobloxGui.Modules.CoreUtility)
local AppFonts = require(game:GetService("CorePackages").Workspace.Packages.Style).AppFonts
local LocalPlayer = Players.LocalPlayer
while LocalPlayer == nil do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local PlayerGui = CoreUtilityModule.waitForChildOfClass(LocalPlayer, "PlayerGui")
local config = {
	[Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png",
	[Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png",
	[Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
}

if UserInputService:GetPlatform() == Enum.Platform.OSX then
	config[Enum.KeyCode.LeftMeta] = "rbxasset://textures/ui/Controls/command.png"
	config[Enum.KeyCode.RightMeta] = "rbxasset://textures/ui/Controls/command.png"
	config[Enum.KeyCode.LeftAlt] = "rbxasset://textures/ui/Controls/option.png"
	config[Enum.KeyCode.RightAlt] = "rbxasset://textures/ui/Controls/option.png"
end
local config1 = {
	["'"] = "rbxasset://textures/ui/Controls/apostrophe.png",
	[","] = "rbxasset://textures/ui/Controls/comma.png",
	["`"] = "rbxasset://textures/ui/Controls/graveaccent.png",
	["."] = "rbxasset://textures/ui/Controls/period.png",
	[" "] = "rbxasset://textures/ui/Controls/spacebar.png"
}
local config2 = {
	[Enum.KeyCode.LeftControl] = "Ctrl",
	[Enum.KeyCode.RightControl] = "Ctrl",
	[Enum.KeyCode.LeftAlt] = "Alt",
	[Enum.KeyCode.RightAlt] = "Alt",
	[Enum.KeyCode.F1] = "F1",
	[Enum.KeyCode.F2] = "F2",
	[Enum.KeyCode.F3] = "F3",
	[Enum.KeyCode.F4] = "F4",
	[Enum.KeyCode.F5] = "F5",
	[Enum.KeyCode.F6] = "F6",
	[Enum.KeyCode.F7] = "F7",
	[Enum.KeyCode.F8] = "F8",
	[Enum.KeyCode.F9] = "F9",
	[Enum.KeyCode.F10] = "F10",
	[Enum.KeyCode.F11] = "F11",
	[Enum.KeyCode.F12] = "F12",
	[Enum.KeyCode.PageUp] = "PgUp",
	[Enum.KeyCode.PageDown] = "PgDn",
	[Enum.KeyCode.Home] = "Home",
	[Enum.KeyCode.End] = "End",
	[Enum.KeyCode.Insert] = "Ins",
	[Enum.KeyCode.Delete] = "Del"
}
local config3 = {
	[Enum.KeyCode.LeftControl] = 12,
	[Enum.KeyCode.RightControl] = 12,
	[Enum.KeyCode.LeftAlt] = 12,
	[Enum.KeyCode.RightAlt] = 12,
	[Enum.KeyCode.F10] = 12,
	[Enum.KeyCode.F11] = 12,
	[Enum.KeyCode.F12] = 12,
	[Enum.KeyCode.PageUp] = 8,
	[Enum.KeyCode.PageDown] = 8,
	[Enum.KeyCode.Home] = 8,
	[Enum.KeyCode.End] = 10,
	[Enum.KeyCode.Insert] = 10,
	[Enum.KeyCode.Delete] = 10
}
local _Color3 = Color3.new(0.07, 0.07, 0.07)
local _Color3_1 = Color3.new(1, 1, 1)
local _Color3_2 = Color3.new(0.7, 0.7, 0.7)
local _TweenInfo = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local _TweenInfo1 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local _TweenInfo2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function _() --[[ Line: 99 | Named "getScreenGui" ]]
	-- upvalues: PlayerGui (copy)
	local ProximityPrompts = PlayerGui:FindFirstChild("ProximityPrompts")
	
	if ProximityPrompts == nil then
		ProximityPrompts = Instance.new("ScreenGui")
		ProximityPrompts.Name = "ProximityPrompts"
		ProximityPrompts.ResetOnSpawn = false
		ProximityPrompts.Parent = PlayerGui
		ProximityPrompts.IgnoreGuiInset = true
	end
	return ProximityPrompts
end

local function createProgressBarGradient(Frame, p1, List, List1) --[[ Line: 112 ]]
	-- upvalues: TweenService (copy), _TweenInfo (copy)
	local Frame1 = Instance.new("Frame")
	Frame1.Size = UDim2.fromScale(0.5, 1)
	Frame1.Position = UDim2.fromScale(if p1 then 0 else 0.5, 0)
	Frame1.BackgroundTransparency = 1
	Frame1.ClipsDescendants = true
	Frame1.Visible = false
	Frame1.Parent = Frame
	local Image = Instance.new("ImageLabel")
	Image.BackgroundTransparency = 1
	Image.Size = UDim2.fromScale(2, 1)
	Image.Position = UDim2.fromScale(if p1 then 0 else -1, 0)
	Image.Image = "rbxasset://textures/ui/Controls/RadialFill.png"
	Image.Parent = Frame1
	local Gradient = Instance.new("UIGradient")
	Gradient.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.5, 0),
		NumberSequenceKeypoint.new(0.51, 1),
		NumberSequenceKeypoint.new(1, 1)
	})
	Gradient.Rotation = if p1 then 180 else 0
	Gradient.Parent = Image
	table.insert(List, TweenService:Create(Image, _TweenInfo, { ImageTransparency = 1 }))
	table.insert(List1, TweenService:Create(Image, _TweenInfo, { ImageTransparency = 0 }))
	
	return Gradient, Frame1
end

local function createCircularProgressBar(CreateResults, CreateResults1) --[[ Line: 144 ]]
	-- upvalues: createProgressBarGradient (copy)
	local CircularProgressBar = Instance.new("Frame")
	CircularProgressBar.Name = "CircularProgressBar"
	CircularProgressBar.Size = UDim2.fromOffset(58, 58)
	CircularProgressBar.AnchorPoint = Vector2.new(0.5, 0.5)
	CircularProgressBar.Position = UDim2.fromScale(0.5, 0.5)
	CircularProgressBar.BackgroundTransparency = 1
	local ProgressBarGradient, ProgressBarGradient2 = createProgressBarGradient(CircularProgressBar, true, CreateResults, CreateResults1)
	local ProgressBarGradient1, ProgressBarGradient2_1 = createProgressBarGradient(CircularProgressBar, false, CreateResults, CreateResults1)
	local Progress = Instance.new("NumberValue")
	Progress.Name = "Progress"
	Progress.Parent = CircularProgressBar
	Progress.Changed:Connect(function(Value: number) --[[ Line: 158 ]]
		-- upvalues: ProgressBarGradient2 (copy), Progress (copy), ProgressBarGradient (copy), ProgressBarGradient2_1 (copy), ProgressBarGradient1 (copy)
		local ClampedValue = math.clamp(Value * 360, 0, 360)
		ProgressBarGradient2.Visible = Progress.Value > 0.5
		ProgressBarGradient.Rotation = math.clamp(ClampedValue, 180, 360)
		ProgressBarGradient2_1.Visible = Progress.Value > 0.01
		ProgressBarGradient1.Rotation = math.clamp(ClampedValue, 0, 180)
	end)
	
	return CircularProgressBar
end

local function createPrompt(Prompt, ProximityPromptInputType, Parent) --[[ Line: 169 ]]
	-- upvalues: _Color3 (copy), TweenService (copy), _TweenInfo2 (copy), AppFonts (copy), _Color3_1 (copy), _Color3_2 (copy), _TweenInfo (copy), UserInputService (copy), config (copy), config1 (copy), config2 (copy), config3 (copy), createCircularProgressBar (copy), _TweenInfo1 (copy), RunService (copy)
	local CreateResults = {}
	local CreateResults1 = {}
	local CreateResults2 = {}
	local CreateResults3 = {}
	local _TweenInfo3 = TweenInfo.new(Prompt.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local Prompt1 = Instance.new("BillboardGui")
	Prompt1.Name = "Prompt"
	Prompt1.AlwaysOnTop = true
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromScale(0.5, 1)
	Frame.BackgroundTransparency = 1
	Frame.BackgroundColor3 = _Color3
	Frame.AnchorPoint = Vector2.new(0.5, 0)
	Frame.Position = UDim2.fromScale(0.5, 0)
	Frame.Size = UDim2.fromScale(0, 1)
	Frame.AutomaticSize = Enum.AutomaticSize.X
	Frame.Parent = Prompt1
	local Padding = Instance.new("UIPadding")
	Padding.Parent = Frame
	Instance.new("UICorner").Parent = Frame
	local InputFrame = Instance.new("Frame")
	InputFrame.Name = "InputFrame"
	InputFrame.Size = UDim2.fromScale(1, 1)
	InputFrame.BackgroundTransparency = 1
	InputFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	InputFrame.Parent = Frame
	local Frame1 = Instance.new("Frame")
	Frame1.Size = UDim2.fromScale(1, 1)
	Frame1.Position = UDim2.fromScale(0.5, 0.5)
	Frame1.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame1.BackgroundTransparency = 1
	Frame1.Parent = InputFrame
	local Scale = Instance.new("UIScale")
	Scale.Parent = Frame1
	table.insert(CreateResults, TweenService:Create(Scale, _TweenInfo2, {
		Scale = if ProximityPromptInputType == Enum.ProximityPromptInputType.Touch then 1.6 else 1.33
	}))
	table.insert(CreateResults1, TweenService:Create(Scale, _TweenInfo2, { Scale = 1 }))
	local ActionText = Instance.new("TextLabel")
	ActionText.Name = "ActionText"
	ActionText.Font = AppFonts.default:getMedium()
	ActionText.TextSize = 19
	ActionText.BackgroundTransparency = 1
	ActionText.TextTransparency = 1
	ActionText.TextColor3 = _Color3_1
	ActionText.TextXAlignment = Enum.TextXAlignment.Left
	table.insert(CreateResults, TweenService:Create(ActionText, _TweenInfo2, { TextTransparency = 1 }))
	table.insert(CreateResults1, TweenService:Create(ActionText, _TweenInfo2, { TextTransparency = 0 }))
	table.insert(CreateResults2, TweenService:Create(ActionText, _TweenInfo2, { TextTransparency = 1 }))
	table.insert(CreateResults3, TweenService:Create(ActionText, _TweenInfo2, { TextTransparency = 0 }))
	local ObjectText = Instance.new("TextLabel")
	ObjectText.Name = "ObjectText"
	ObjectText.Font = AppFonts.default:getMedium()
	ObjectText.TextSize = 14
	ObjectText.BackgroundTransparency = 1
	ObjectText.TextTransparency = 1
	ObjectText.TextColor3 = _Color3_2
	ObjectText.TextXAlignment = Enum.TextXAlignment.Left
	local ListLayout = Instance.new("UIListLayout")
	ListLayout.FillDirection = Enum.FillDirection.Horizontal
	ListLayout.Padding = UDim.new(-0.25, 0)
	ListLayout.Parent = Frame
	table.insert(CreateResults, TweenService:Create(ListLayout, _TweenInfo2, { Padding = UDim.new(-0.25, 0) }))
	table.insert(CreateResults1, TweenService:Create(ListLayout, _TweenInfo2, { Padding = UDim.new(0, 0) }))
	table.insert(CreateResults2, TweenService:Create(ListLayout, _TweenInfo2, { Padding = UDim.new(-0.25, 0) }))
	table.insert(CreateResults3, TweenService:Create(ListLayout, _TweenInfo2, { Padding = UDim.new(0, 0) }))
	local TextFrame = Instance.new("Frame")
	TextFrame.Name = "TextFrame"
	TextFrame.Size = UDim2.fromScale(0, 1)
	TextFrame.AutomaticSize = Enum.AutomaticSize.X
	TextFrame.BackgroundTransparency = 1
	TextFrame.Parent = Frame
	ActionText.Size = UDim2.fromScale(0, 1)
	ActionText.AutomaticSize = Enum.AutomaticSize.X
	ActionText.Parent = TextFrame
	ObjectText.Size = UDim2.fromScale(0, 1)
	ObjectText.AutomaticSize = Enum.AutomaticSize.X
	ObjectText.Parent = TextFrame
	table.insert(CreateResults, TweenService:Create(ObjectText, _TweenInfo2, { TextTransparency = 1 }))
	table.insert(CreateResults1, TweenService:Create(ObjectText, _TweenInfo2, { TextTransparency = 0 }))
	table.insert(CreateResults2, TweenService:Create(ObjectText, _TweenInfo2, { TextTransparency = 1 }))
	table.insert(CreateResults3, TweenService:Create(ObjectText, _TweenInfo2, { TextTransparency = 0 }))
	table.insert(CreateResults, TweenService:Create(Frame, _TweenInfo2, { BackgroundTransparency = 1 }))
	table.insert(CreateResults1, TweenService:Create(Frame, _TweenInfo2, { BackgroundTransparency = 0.2 }))
	table.insert(CreateResults2, TweenService:Create(Frame, _TweenInfo2, { BackgroundTransparency = 1 }))
	table.insert(CreateResults3, TweenService:Create(Frame, _TweenInfo2, { BackgroundTransparency = 0.2 }))
	local RoundFrame = Instance.new("Frame")
	RoundFrame.Name = "RoundFrame"
	RoundFrame.Size = UDim2.fromOffset(48, 48)
	RoundFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	RoundFrame.Position = UDim2.fromScale(0.5, 0.5)
	RoundFrame.BackgroundTransparency = 1
	RoundFrame.Parent = Frame1
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0.5, 0)
	Corner.Parent = RoundFrame
	table.insert(CreateResults2, TweenService:Create(RoundFrame, _TweenInfo, { BackgroundTransparency = 1 }))
	table.insert(CreateResults3, TweenService:Create(RoundFrame, _TweenInfo, { BackgroundTransparency = 0.5 }))
	
	if ProximityPromptInputType == Enum.ProximityPromptInputType.Gamepad then
		local ImageForKeyCode = UserInputService:GetImageForKeyCode(Prompt.GamepadKeyCode)
		
		if ImageForKeyCode then
			local ButtonImage = Instance.new("ImageLabel")
			ButtonImage.Name = "ButtonImage"
			ButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonImage.Size = UDim2.fromOffset(24, 24)
			ButtonImage.Position = UDim2.fromScale(0.5, 0.5)
			ButtonImage.BackgroundTransparency = 1
			ButtonImage.ImageTransparency = 1
			ButtonImage.Image = ImageForKeyCode
			ButtonImage.Parent = Frame1
			table.insert(CreateResults2, TweenService:Create(ButtonImage, _TweenInfo, { ImageTransparency = 1 }))
			table.insert(CreateResults3, TweenService:Create(ButtonImage, _TweenInfo, { ImageTransparency = 0 }))
		end
	elseif ProximityPromptInputType == Enum.ProximityPromptInputType.Touch then
		local ButtonImage = Instance.new("ImageLabel")
		ButtonImage.Name = "ButtonImage"
		ButtonImage.BackgroundTransparency = 1
		ButtonImage.ImageTransparency = 1
		ButtonImage.Size = UDim2.fromOffset(25, 31)
		ButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)
		ButtonImage.Position = UDim2.fromScale(0.5, 0.5)
		ButtonImage.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png"
		ButtonImage.Parent = Frame1
		table.insert(CreateResults2, TweenService:Create(ButtonImage, _TweenInfo, { ImageTransparency = 1 }))
		table.insert(CreateResults3, TweenService:Create(ButtonImage, _TweenInfo, { ImageTransparency = 0 }))
	else
		local ButtonImage = Instance.new("ImageLabel")
		ButtonImage.Name = "ButtonImage"
		ButtonImage.BackgroundTransparency = 1
		ButtonImage.ImageTransparency = 1
		ButtonImage.Size = UDim2.fromOffset(28, 30)
		ButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)
		ButtonImage.Position = UDim2.fromScale(0.5, 0.5)
		ButtonImage.Image = "rbxasset://textures/ui/Controls/key_single.png"
		ButtonImage.Parent = Frame1
		table.insert(CreateResults2, TweenService:Create(ButtonImage, _TweenInfo, { ImageTransparency = 1 }))
		table.insert(CreateResults3, TweenService:Create(ButtonImage, _TweenInfo, { ImageTransparency = 0 }))
		local StringForKeyCode = UserInputService:GetStringForKeyCode(Prompt.KeyboardKeyCode)
		local Entry = config[Prompt.KeyboardKeyCode]
		
		if Entry == nil then
			Entry = config1[StringForKeyCode]
		end
		if Entry == nil then
			local Entry1 = config2[Prompt.KeyboardKeyCode]
			
			if Entry1 then
				StringForKeyCode = Entry1
			end
		end
		if Entry then
			local ButtonImage1 = Instance.new("ImageLabel")
			ButtonImage1.Name = "ButtonImage"
			ButtonImage1.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonImage1.Size = UDim2.fromOffset(36, 36)
			ButtonImage1.Position = UDim2.fromScale(0.5, 0.5)
			ButtonImage1.BackgroundTransparency = 1
			ButtonImage1.ImageTransparency = 1
			ButtonImage1.Image = Entry
			ButtonImage1.Parent = Frame1
			table.insert(CreateResults2, TweenService:Create(ButtonImage1, _TweenInfo, { ImageTransparency = 1 }))
			table.insert(CreateResults3, TweenService:Create(ButtonImage1, _TweenInfo, { ImageTransparency = 0 }))
		elseif StringForKeyCode == nil or StringForKeyCode == "" then
			error("ProximityPrompt '" .. Prompt.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(Prompt.KeyboardKeyCode))
		else
			local ButtonText = Instance.new("TextLabel")
			ButtonText.Name = "ButtonText"
			ButtonText.AutoLocalize = false
			ButtonText.Position = UDim2.fromOffset(0, -1)
			ButtonText.Size = UDim2.fromScale(1, 1)
			ButtonText.Font = AppFonts.default:getMedium()
			local TextSize = config3[Prompt.KeyboardKeyCode]
			
			if TextSize == nil then
				TextSize = 14
			end
			ButtonText.TextSize = TextSize
			ButtonText.BackgroundTransparency = 1
			ButtonText.TextTransparency = 1
			ButtonText.TextColor3 = _Color3_1
			ButtonText.TextXAlignment = Enum.TextXAlignment.Center
			ButtonText.Text = StringForKeyCode
			ButtonText.Parent = Frame1
			table.insert(CreateResults2, TweenService:Create(ButtonText, _TweenInfo, { TextTransparency = 1 }))
			table.insert(CreateResults3, TweenService:Create(ButtonText, _TweenInfo, { TextTransparency = 0 }))
		end
	end
	if ProximityPromptInputType == Enum.ProximityPromptInputType.Touch or Prompt.ClickablePrompt then
		local Button = Instance.new("TextButton")
		Button.BackgroundTransparency = 1
		Button.TextTransparency = 1
		Button.Size = UDim2.fromScale(1, 1)
		Button.Parent = Prompt1
		Button.Selectable = false
		local Flag = false
		Button.InputBegan:Connect(function(Input) --[[ Line: 399 ]]
			-- upvalues: Prompt (copy), Flag (ref)
			if (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and Input.UserInputState ~= Enum.UserInputState.Change then
				Prompt:InputHoldBegin()
				Flag = true
			end
		end)
		Button.InputEnded:Connect(function(Input) --[[ Line: 406 ]]
			-- upvalues: Flag (ref), Prompt (copy)
			if (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and Flag then
				Flag = false
				Prompt:InputHoldEnd()
			end
		end)
		Prompt1.Active = true
	end
	if Prompt.HoldDuration > 0 then
		local CircularProgressBar = createCircularProgressBar(CreateResults2, CreateResults3)
		CircularProgressBar.Parent = Frame1
		table.insert(CreateResults, TweenService:Create(CircularProgressBar.Progress, _TweenInfo3, { Value = 1 }))
		table.insert(CreateResults1, TweenService:Create(CircularProgressBar.Progress, _TweenInfo1, { Value = 0 }))
	end
	local Connection = nil
	local Connection1 = nil
	local TriggeredConnection = nil
	local TriggerEndedConnection = nil
	
	if Prompt.HoldDuration > 0 then
		Connection = Prompt.PromptButtonHoldBegan:Connect(function() --[[ Line: 431 ]]
			-- upvalues: CreateResults (copy)
			for _, createResult in ipairs(CreateResults) do
				createResult:Play()
			end
		end)
		Connection1 = Prompt.PromptButtonHoldEnded:Connect(function() --[[ Line: 437 ]]
			-- upvalues: CreateResults1 (copy)
			for _, value in ipairs(CreateResults1) do
				value:Play()
			end
		end)
	end
	TriggeredConnection = Prompt.Triggered:Connect(function() --[[ Line: 444 ]]
		-- upvalues: CreateResults2 (copy)
		for _, value in ipairs(CreateResults2) do
			value:Play()
		end
	end)
	TriggerEndedConnection = Prompt.TriggerEnded:Connect(function() --[[ Line: 450 ]]
		-- upvalues: CreateResults3 (copy)
		for _, value in ipairs(CreateResults3) do
			value:Play()
		end
	end)
	
	local function updateUIFromPrompt() --[[ Line: 456 ]]
		-- upvalues: Prompt (copy), ActionText (copy), ObjectText (copy), Padding (copy), Prompt1 (copy), RunService (upval), Frame (copy)
		local X = 72
		local v1 = 24
		local YOffset: number = if Prompt.ObjectText == nil or Prompt.ObjectText == "" then 0 else 9
		ActionText.Text = Prompt.ActionText
		ObjectText.Text = Prompt.ObjectText
		ActionText.AutoLocalize = Prompt.AutoLocalize
		ActionText.RootLocalizationTable = Prompt.RootLocalizationTable
		ObjectText.AutoLocalize = Prompt.AutoLocalize
		ObjectText.RootLocalizationTable = Prompt.RootLocalizationTable
		local Offset = v1 - YOffset
		
		if (Prompt.ActionText == nil or Prompt.ActionText == "") and (Prompt.ObjectText == nil or Prompt.ObjectText == "") then
			Padding.PaddingRight = UDim.new(0, 0)
		else
			Padding.PaddingRight = UDim.new(0, Offset)
		end
		ActionText.Position = UDim2.new(0, 0, 0, YOffset)
		ObjectText.Position = UDim2.new(0, 0, 0, -10)
		Prompt1.Size = UDim2.fromOffset(X, 72)
		Prompt1.SizeOffset = Vector2.new(Prompt.UIOffset.X / Prompt1.Size.Width.Offset, Prompt.UIOffset.Y / Prompt1.Size.Height.Offset)
		task.defer(function() --[[ Line: 492 ]]
			-- upvalues: RunService (upval), X (ref), Frame (upval), Prompt1 (upval), Prompt (upval)
			RunService.RenderStepped:Wait()
			RunService.RenderStepped:Wait()
			X = Frame.AbsoluteSize.X
			Prompt1.Size = UDim2.fromOffset(X, 72)
			Prompt1.SizeOffset = Vector2.new(Prompt.UIOffset.X / Prompt1.Size.Width.Offset, Prompt.UIOffset.Y / Prompt1.Size.Height.Offset)
		end)
	end
	
	local ChangedConnection = Prompt.Changed:Connect(updateUIFromPrompt)
	updateUIFromPrompt()
	Prompt1.Adornee = Prompt.Parent
	Prompt1.Parent = Parent
	local AncestryChangedConnection = Prompt.AncestryChanged:Connect(function() --[[ Line: 509 | Named "updateUIAncestry" ]]
		-- upvalues: Prompt1 (copy), Prompt (copy)
		Prompt1.Adornee = Prompt.Parent
	end)
	
	for _, value in ipairs(CreateResults3) do
		value:Play()
	end
	return function() --[[ Line: 518 | Named "cleanup" ]]
		-- upvalues: Connection (ref), Connection1 (ref), TriggeredConnection (ref), TriggerEndedConnection (ref), ChangedConnection (copy), AncestryChangedConnection (copy), CreateResults2 (copy), Prompt1 (copy)
		if Connection then
			Connection:Disconnect()
		end
		if Connection1 then
			Connection1:Disconnect()
		end
		TriggeredConnection:Disconnect()
		TriggerEndedConnection:Disconnect()
		ChangedConnection:Disconnect()
		AncestryChangedConnection:Disconnect()
		
		for _, value in ipairs(CreateResults2) do
			value:Play()
		end
		wait(0.2)
		Prompt1.Parent = nil
	end
end

local function createIndicator(p1, Parent) --[[ Line: 544 ]]
	-- upvalues: _Color3 (copy), _Color3_1 (copy), TweenService (copy), _TweenInfo (copy)
	local CreateResults = {}
	local CreateResults1 = {}
	local Indicator = Instance.new("BillboardGui")
	Indicator.Name = "Indicator"
	Indicator.Size = UDim2.fromOffset(15, 15)
	Indicator.AlwaysOnTop = true
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromScale(1, 1)
	Frame.BackgroundTransparency = 1
	Frame.BackgroundColor3 = _Color3
	Frame.AnchorPoint = Vector2.new(0.5, 0)
	Frame.Position = UDim2.fromScale(0.5, 0)
	Frame.Parent = Indicator
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(1, 0)
	Corner.Parent = Frame
	local Stroke = Instance.new("UIStroke")
	Stroke.Color = _Color3_1
	Stroke.Thickness = 1.5
	Stroke.Transparency = 1
	Stroke.Parent = Frame
	table.insert(CreateResults, TweenService:Create(Frame, _TweenInfo, { BackgroundTransparency = 1 }))
	table.insert(CreateResults, TweenService:Create(Stroke, _TweenInfo, { Transparency = 1 }))
	table.insert(CreateResults1, TweenService:Create(Frame, _TweenInfo, { BackgroundTransparency = 0.2 }))
	table.insert(CreateResults1, TweenService:Create(Stroke, _TweenInfo, { Transparency = 0.2 }))
	Indicator.Adornee = p1.Parent
	Indicator.Parent = Parent
	local AncestryChangedConnection = p1.AncestryChanged:Connect(function() --[[ Line: 579 | Named "updateUIAncestry" ]]
		-- upvalues: Indicator (copy), p1 (copy)
		Indicator.Adornee = p1.Parent
	end)
	
	for _, value in ipairs(CreateResults1) do
		value:Play()
	end
	return function() --[[ Line: 588 | Named "cleanup" ]]
		-- upvalues: AncestryChangedConnection (copy), CreateResults (copy), Indicator (copy)
		AncestryChangedConnection:Disconnect()
		
		for _, createResult in ipairs(CreateResults) do
			createResult:Play()
		end
		wait(0.2)
		Indicator.Parent = nil
	end
end

;(function() --[[ Line: 603 | Named "onLoad" ]]
	-- upvalues: ProximityPromptService (copy), PlayerGui (copy), createPrompt (copy), createIndicator (copy)
	ProximityPromptService.PromptShown:Connect(function(Prompt, ProximityPromptInputType) --[[ Line: 604 ]]
		-- upvalues: PlayerGui (upval), createPrompt (upval)
		if Prompt.Style == Enum.ProximityPromptStyle.Custom then return end
		local ProximityPrompts = PlayerGui:FindFirstChild("ProximityPrompts")
		
		if ProximityPrompts == nil then
			ProximityPrompts = Instance.new("ScreenGui")
			ProximityPrompts.Name = "ProximityPrompts"
			ProximityPrompts.ResetOnSpawn = false
			ProximityPrompts.Parent = PlayerGui
			ProximityPrompts.IgnoreGuiInset = true
		end
		local Prompt1: () -> () = createPrompt(Prompt, ProximityPromptInputType, ProximityPrompts)
		local BindableEvent = Instance.new("BindableEvent")
		local PromptHiddenConnection = Prompt.PromptHidden:Connect(function() --[[ Line: 615 ]]
			-- upvalues: BindableEvent (copy)
			BindableEvent:Fire()
		end)
		local DestroyingConnection = Prompt.Destroying:Connect(function() --[[ Line: 618 ]]
			-- upvalues: BindableEvent (copy)
			BindableEvent:Fire()
		end)
		BindableEvent.Event:Wait()
		PromptHiddenConnection:Disconnect()
		DestroyingConnection:Disconnect()
		Prompt1()
	end)
	ProximityPromptService.IndicatorShown:Connect(function(p2) --[[ Line: 628 ]]
		-- upvalues: PlayerGui (upval), createIndicator (upval)
		if p2.Style == Enum.ProximityPromptStyle.Custom then return end
		local ProximityPrompts = PlayerGui:FindFirstChild("ProximityPrompts")
		
		if ProximityPrompts == nil then
			ProximityPrompts = Instance.new("ScreenGui")
			ProximityPrompts.Name = "ProximityPrompts"
			ProximityPrompts.ResetOnSpawn = false
			ProximityPrompts.Parent = PlayerGui
			ProximityPrompts.IgnoreGuiInset = true
		end
		local Indicator: () -> () = createIndicator(p2, ProximityPrompts)
		local BindableEvent = Instance.new("BindableEvent")
		local IndicatorHiddenConnection = p2.IndicatorHidden:Connect(function() --[[ Line: 639 ]]
			-- upvalues: BindableEvent (copy)
			BindableEvent:Fire()
		end)
		local DestroyingConnection = p2.Destroying:Connect(function() --[[ Line: 642 ]]
			-- upvalues: BindableEvent (copy)
			BindableEvent:Fire()
		end)
		BindableEvent.Event:Wait()
		IndicatorHiddenConnection:Disconnect()
		DestroyingConnection:Disconnect()
		Indicator()
	end)
end)()