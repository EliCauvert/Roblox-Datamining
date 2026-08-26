local userInputService = game:GetService("UserInputService")
local proximityPromptService = game:GetService("ProximityPromptService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local coreUtilityModule = require(coreGuiService.RobloxGui.Modules.CoreUtility)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local playerGui = coreUtilityModule.waitForChildOfClass(localPlayer, "PlayerGui")
local t = {
	[Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png",
	[Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png",
	[Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
}

if userInputService:GetPlatform() == Enum.Platform.OSX then
	t[Enum.KeyCode.LeftMeta] = "rbxasset://textures/ui/Controls/command.png"
	t[Enum.KeyCode.RightMeta] = "rbxasset://textures/ui/Controls/command.png"
	t[Enum.KeyCode.LeftAlt] = "rbxasset://textures/ui/Controls/option.png"
	t[Enum.KeyCode.RightAlt] = "rbxasset://textures/ui/Controls/option.png"
end
local t_1 = {
	["'"] = "rbxasset://textures/ui/Controls/apostrophe.png",
	[","] = "rbxasset://textures/ui/Controls/comma.png",
	["`"] = "rbxasset://textures/ui/Controls/graveaccent.png",
	["."] = "rbxasset://textures/ui/Controls/period.png",
	[" "] = "rbxasset://textures/ui/Controls/spacebar.png"
}
local t_2 = {
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
local t_3 = {
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
local color3 = Color3.new(0.07, 0.07, 0.07)
local color3_1 = Color3.new(1, 1, 1)
local color3_2 = Color3.new(0.7, 0.7, 0.7)
local tweenInfo = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tweenInfo_1 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo_2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function _()
	-- upvalues: playerGui (ref)
	local proximityPrompts_1 = playerGui:FindFirstChild("ProximityPrompts")
	
	if proximityPrompts_1 == nil then
		proximityPrompts_1 = Instance.new("ScreenGui")
		proximityPrompts_1.Name = "ProximityPrompts"
		proximityPrompts_1.ResetOnSpawn = false
		proximityPrompts_1.Parent = playerGui
		proximityPrompts_1.IgnoreGuiInset = true
	end
	return proximityPrompts_1
end

local function createProgressBarGradient(p1, p2, p3, p4)
	-- upvalues: tweenService (ref), tweenInfo (ref)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromScale(0.5, 1)
	frame.Position = UDim2.fromScale(if p2 then 0 else 0.5, 0)
	frame.BackgroundTransparency = 1
	frame.ClipsDescendants = true
	frame.Visible = false
	frame.Parent = p1
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.BackgroundTransparency = 1
	imageLabel.Size = UDim2.fromScale(2, 1)
	imageLabel.Position = UDim2.fromScale(if p2 then 0 else -1, 0)
	imageLabel.Image = "rbxasset://textures/ui/Controls/RadialFill.png"
	imageLabel.Parent = frame
	local UIGradient = Instance.new("UIGradient")
	UIGradient.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.5, 0),
		NumberSequenceKeypoint.new(0.51, 1),
		NumberSequenceKeypoint.new(1, 1)
	})
	UIGradient.Rotation = if p2 then 180 else 0
	UIGradient.Parent = imageLabel
	table.insert(p3, tweenService:Create(imageLabel, tweenInfo, { ImageTransparency = 1 }))
	table.insert(p4, tweenService:Create(imageLabel, tweenInfo, { ImageTransparency = 0 }))
	
	return UIGradient, frame
end

local function createCircularProgressBar(p1, p2)
	-- upvalues: createProgressBarGradient (ref)
	local circularProgressBar = Instance.new("Frame")
	circularProgressBar.Name = "CircularProgressBar"
	circularProgressBar.Size = UDim2.fromOffset(58, 58)
	circularProgressBar.AnchorPoint = Vector2.new(0.5, 0.5)
	circularProgressBar.Position = UDim2.fromScale(0.5, 0.5)
	circularProgressBar.BackgroundTransparency = 1
	local var1, var2 = createProgressBarGradient(circularProgressBar, true, p1, p2)
	local var3, var4 = createProgressBarGradient(circularProgressBar, false, p1, p2)
	local progress = Instance.new("NumberValue")
	progress.Name = "Progress"
	progress.Parent = circularProgressBar
	progress.Changed:Connect(function(p3)
		-- upvalues: var2 (ref), progress (ref), var1 (ref), var4 (ref), var3 (ref)
		local clampedValue = math.clamp(p3 * 360, 0, 360)
		var2.Visible = progress.Value > 0.5
		var1.Rotation = math.clamp(clampedValue, 180, 360)
		var4.Visible = progress.Value > 0.01
		var3.Rotation = math.clamp(clampedValue, 0, 180)
	end)
	
	return circularProgressBar
end

local function createPrompt(p1, p2, p3)
	-- upvalues: color3 (ref), tweenService (ref), tweenInfo_2 (ref), appFonts (ref), color3_1 (ref), color3_2 (ref), tweenInfo (ref), userInputService (ref), t (ref), t_1 (ref), t_2 (ref), t_3 (ref), createCircularProgressBar (ref), tweenInfo_1 (ref), runService (ref)
	local keyboardKeyCodeStringForKeyCode
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local t_7 = {}
	local tweenInfo_3 = TweenInfo.new(p1.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local prompt = Instance.new("BillboardGui")
	prompt.Name = "Prompt"
	prompt.AlwaysOnTop = true
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromScale(0.5, 1)
	frame.BackgroundTransparency = 1
	frame.BackgroundColor3 = color3
	frame.AnchorPoint = Vector2.new(0.5, 0)
	frame.Position = UDim2.fromScale(0.5, 0)
	frame.Size = UDim2.fromScale(0, 1)
	frame.AutomaticSize = Enum.AutomaticSize.X
	frame.Parent = prompt
	local UIPadding = Instance.new("UIPadding")
	UIPadding.Parent = frame
	Instance.new("UICorner").Parent = frame
	local inputFrame = Instance.new("Frame")
	inputFrame.Name = "InputFrame"
	inputFrame.Size = UDim2.fromScale(1, 1)
	inputFrame.BackgroundTransparency = 1
	inputFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	inputFrame.Parent = frame
	local frame_2 = Instance.new("Frame")
	frame_2.Size = UDim2.fromScale(1, 1)
	frame_2.Position = UDim2.fromScale(0.5, 0.5)
	frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
	frame_2.BackgroundTransparency = 1
	frame_2.Parent = inputFrame
	local UIScale = Instance.new("UIScale")
	UIScale.Parent = frame_2
	table.insert(t_4, tweenService:Create(UIScale, tweenInfo_2, {
		Scale = if p2 == Enum.ProximityPromptInputType.Touch then 1.6 else 1.33
	}))
	table.insert(t_5, tweenService:Create(UIScale, tweenInfo_2, { Scale = 1 }))
	local actionText = Instance.new("TextLabel")
	actionText.Name = "ActionText"
	actionText.Font = appFonts.default:getMedium()
	actionText.TextSize = 19
	actionText.BackgroundTransparency = 1
	actionText.TextTransparency = 1
	actionText.TextColor3 = color3_1
	actionText.TextXAlignment = Enum.TextXAlignment.Left
	table.insert(t_4, tweenService:Create(actionText, tweenInfo_2, { TextTransparency = 1 }))
	table.insert(t_5, tweenService:Create(actionText, tweenInfo_2, { TextTransparency = 0 }))
	table.insert(t_6, tweenService:Create(actionText, tweenInfo_2, { TextTransparency = 1 }))
	table.insert(t_7, tweenService:Create(actionText, tweenInfo_2, { TextTransparency = 0 }))
	local objectText = Instance.new("TextLabel")
	objectText.Name = "ObjectText"
	objectText.Font = appFonts.default:getMedium()
	objectText.TextSize = 14
	objectText.BackgroundTransparency = 1
	objectText.TextTransparency = 1
	objectText.TextColor3 = color3_2
	objectText.TextXAlignment = Enum.TextXAlignment.Left
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.Padding = UDim.new(-0.25, 0)
	UIListLayout.Parent = frame
	table.insert(t_4, tweenService:Create(UIListLayout, tweenInfo_2, { Padding = UDim.new(-0.25, 0) }))
	table.insert(t_5, tweenService:Create(UIListLayout, tweenInfo_2, { Padding = UDim.new(0, 0) }))
	table.insert(t_6, tweenService:Create(UIListLayout, tweenInfo_2, { Padding = UDim.new(-0.25, 0) }))
	table.insert(t_7, tweenService:Create(UIListLayout, tweenInfo_2, { Padding = UDim.new(0, 0) }))
	local textFrame = Instance.new("Frame")
	textFrame.Name = "TextFrame"
	textFrame.Size = UDim2.fromScale(0, 1)
	textFrame.AutomaticSize = Enum.AutomaticSize.X
	textFrame.BackgroundTransparency = 1
	textFrame.Parent = frame
	actionText.Size = UDim2.fromScale(0, 1)
	actionText.AutomaticSize = Enum.AutomaticSize.X
	actionText.Parent = textFrame
	objectText.Size = UDim2.fromScale(0, 1)
	objectText.AutomaticSize = Enum.AutomaticSize.X
	objectText.Parent = textFrame
	table.insert(t_4, tweenService:Create(objectText, tweenInfo_2, { TextTransparency = 1 }))
	table.insert(t_5, tweenService:Create(objectText, tweenInfo_2, { TextTransparency = 0 }))
	table.insert(t_6, tweenService:Create(objectText, tweenInfo_2, { TextTransparency = 1 }))
	table.insert(t_7, tweenService:Create(objectText, tweenInfo_2, { TextTransparency = 0 }))
	table.insert(t_4, tweenService:Create(frame, tweenInfo_2, { BackgroundTransparency = 1 }))
	table.insert(t_5, tweenService:Create(frame, tweenInfo_2, { BackgroundTransparency = 0.2 }))
	table.insert(t_6, tweenService:Create(frame, tweenInfo_2, { BackgroundTransparency = 1 }))
	table.insert(t_7, tweenService:Create(frame, tweenInfo_2, { BackgroundTransparency = 0.2 }))
	local roundFrame = Instance.new("Frame")
	roundFrame.Name = "RoundFrame"
	roundFrame.Size = UDim2.fromOffset(48, 48)
	roundFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	roundFrame.Position = UDim2.fromScale(0.5, 0.5)
	roundFrame.BackgroundTransparency = 1
	roundFrame.Parent = frame_2
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0.5, 0)
	UICorner.Parent = roundFrame
	table.insert(t_6, tweenService:Create(roundFrame, tweenInfo, { BackgroundTransparency = 1 }))
	table.insert(t_7, tweenService:Create(roundFrame, tweenInfo, { BackgroundTransparency = 0.5 }))
	
	if p2 == Enum.ProximityPromptInputType.Gamepad then
		local gamepadKeyCodeImageForKeyCode = userInputService:GetImageForKeyCode(p1.GamepadKeyCode)
		
		if gamepadKeyCodeImageForKeyCode then
			local buttonImage = Instance.new("ImageLabel")
			buttonImage.Name = "ButtonImage"
			buttonImage.AnchorPoint = Vector2.new(0.5, 0.5)
			buttonImage.Size = UDim2.fromOffset(24, 24)
			buttonImage.Position = UDim2.fromScale(0.5, 0.5)
			buttonImage.BackgroundTransparency = 1
			buttonImage.ImageTransparency = 1
			buttonImage.Image = gamepadKeyCodeImageForKeyCode
			buttonImage.Parent = frame_2
			table.insert(t_6, tweenService:Create(buttonImage, tweenInfo, { ImageTransparency = 1 }))
			table.insert(t_7, tweenService:Create(buttonImage, tweenInfo, { ImageTransparency = 0 }))
		end
	elseif p2 == Enum.ProximityPromptInputType.Touch then
		local buttonImage_1 = Instance.new("ImageLabel")
		buttonImage_1.Name = "ButtonImage"
		buttonImage_1.BackgroundTransparency = 1
		buttonImage_1.ImageTransparency = 1
		buttonImage_1.Size = UDim2.fromOffset(25, 31)
		buttonImage_1.AnchorPoint = Vector2.new(0.5, 0.5)
		buttonImage_1.Position = UDim2.fromScale(0.5, 0.5)
		buttonImage_1.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png"
		buttonImage_1.Parent = frame_2
		table.insert(t_6, tweenService:Create(buttonImage_1, tweenInfo, { ImageTransparency = 1 }))
		table.insert(t_7, tweenService:Create(buttonImage_1, tweenInfo, { ImageTransparency = 0 }))
	else
		local buttonImage_2 = Instance.new("ImageLabel")
		buttonImage_2.Name = "ButtonImage"
		buttonImage_2.BackgroundTransparency = 1
		buttonImage_2.ImageTransparency = 1
		buttonImage_2.Size = UDim2.fromOffset(28, 30)
		buttonImage_2.AnchorPoint = Vector2.new(0.5, 0.5)
		buttonImage_2.Position = UDim2.fromScale(0.5, 0.5)
		buttonImage_2.Image = "rbxasset://textures/ui/Controls/key_single.png"
		buttonImage_2.Parent = frame_2
		table.insert(t_6, tweenService:Create(buttonImage_2, tweenInfo, { ImageTransparency = 1 }))
		table.insert(t_7, tweenService:Create(buttonImage_2, tweenInfo, { ImageTransparency = 0 }))
		keyboardKeyCodeStringForKeyCode = userInputService:GetStringForKeyCode(p1.KeyboardKeyCode)
		local keyboardKeyCode = t[p1.KeyboardKeyCode]
		
		if keyboardKeyCode == nil then
			keyboardKeyCode = t_1[keyboardKeyCodeStringForKeyCode]
		end
		if keyboardKeyCode == nil then
			local keyboardKeyCode_1 = t_2[p1.KeyboardKeyCode]
			
			if keyboardKeyCode_1 then
				keyboardKeyCodeStringForKeyCode = keyboardKeyCode_1
			end
		end
		if keyboardKeyCode then
			local buttonImage_3 = Instance.new("ImageLabel")
			buttonImage_3.Name = "ButtonImage"
			buttonImage_3.AnchorPoint = Vector2.new(0.5, 0.5)
			buttonImage_3.Size = UDim2.fromOffset(36, 36)
			buttonImage_3.Position = UDim2.fromScale(0.5, 0.5)
			buttonImage_3.BackgroundTransparency = 1
			buttonImage_3.ImageTransparency = 1
			buttonImage_3.Image = keyboardKeyCode
			buttonImage_3.Parent = frame_2
			table.insert(t_6, tweenService:Create(buttonImage_3, tweenInfo, { ImageTransparency = 1 }))
			table.insert(t_7, tweenService:Create(buttonImage_3, tweenInfo, { ImageTransparency = 0 }))
		elseif keyboardKeyCodeStringForKeyCode == nil or keyboardKeyCodeStringForKeyCode == "" then
			error("ProximityPrompt '" .. p7.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(p1.KeyboardKeyCode))
		else
			local buttonText = Instance.new("TextLabel")
			buttonText.Name = "ButtonText"
			buttonText.AutoLocalize = false
			buttonText.Position = UDim2.fromOffset(0, -1)
			buttonText.Size = UDim2.fromScale(1, 1)
			buttonText.Font = appFonts.default:getMedium()
			local keyboardKeyCode_1 = t_3[p1.KeyboardKeyCode]
			
			if keyboardKeyCode_1 == nil then
				keyboardKeyCode_1 = 14
			end
			buttonText.TextSize = keyboardKeyCode_1
			buttonText.BackgroundTransparency = 1
			buttonText.TextTransparency = 1
			buttonText.TextColor3 = color3_1
			buttonText.TextXAlignment = Enum.TextXAlignment.Center
			buttonText.Text = keyboardKeyCodeStringForKeyCode
			buttonText.Parent = frame_2
			table.insert(t_6, tweenService:Create(buttonText, tweenInfo, { TextTransparency = 1 }))
			table.insert(t_7, tweenService:Create(buttonText, tweenInfo, { TextTransparency = 0 }))
		end
	end
	if p2 == Enum.ProximityPromptInputType.Touch or p1.ClickablePrompt then
		local textButton = Instance.new("TextButton")
		textButton.BackgroundTransparency = 1
		textButton.TextTransparency = 1
		textButton.Size = UDim2.fromScale(1, 1)
		textButton.Parent = prompt
		textButton.Selectable = false
		keyboardKeyCodeStringForKeyCode = false
		textButton.InputBegan:Connect(function(p4)
			-- upvalues: p1 (ref), keyboardKeyCodeStringForKeyCode (write)
			if (p4.UserInputType == Enum.UserInputType.Touch or p4.UserInputType == Enum.UserInputType.MouseButton1) and p4.UserInputState ~= Enum.UserInputState.Change then
				p1:InputHoldBegin()
				keyboardKeyCodeStringForKeyCode = true
			end
		end)
		textButton.InputEnded:Connect(function(p4)
			-- upvalues: keyboardKeyCodeStringForKeyCode (write), p1 (ref)
			if (p4.UserInputType == Enum.UserInputType.Touch or p4.UserInputType == Enum.UserInputType.MouseButton1) and keyboardKeyCodeStringForKeyCode then
				keyboardKeyCodeStringForKeyCode = false
				p1:InputHoldEnd()
			end
		end)
		prompt.Active = true
	end
	if p1.HoldDuration > 0 then
		local var1 = createCircularProgressBar(t_6, t_7)
		var1.Parent = frame_2
		table.insert(t_4, tweenService:Create(var1.Progress, tweenInfo_3, { Value = 1 }))
		table.insert(t_5, tweenService:Create(var1.Progress, tweenInfo_1, { Value = 0 }))
	end
	local promptButtonHoldBeganConnection = nil
	keyboardKeyCodeStringForKeyCode = nil
	local _ = nil
	local _ = nil
	
	if p1.HoldDuration > 0 then
		promptButtonHoldBeganConnection = p1.PromptButtonHoldBegan:Connect(function()
			-- upvalues: t_4 (ref)
			for i, v in ipairs(t_4) do
				v:Play()
			end
		end)
		keyboardKeyCodeStringForKeyCode = p1.PromptButtonHoldEnded:Connect(function()
			-- upvalues: t_5 (ref)
			for i, v in ipairs(t_5) do
				v:Play()
			end
		end)
	end
	local triggeredConnection = p1.Triggered:Connect(function()
		-- upvalues: t_6 (ref)
		for i, v in ipairs(t_6) do
			v:Play()
		end
	end)
	local triggerEndedConnection = p1.TriggerEnded:Connect(function()
		-- upvalues: t_7 (ref)
		for i, v in ipairs(t_7) do
			v:Play()
		end
	end)
	
	local function updateUIFromPrompt()
		-- upvalues: p1 (ref), actionText (ref), objectText (ref), UIPadding (ref), prompt (ref), runService (copy), frame (ref)
		local var2 = 72
		local var3 = 24
		local var4 = if not (p1.ObjectText == nil or p1.ObjectText == "") then 9 else 0
		actionText.Text = p1.ActionText
		objectText.Text = p1.ObjectText
		actionText.AutoLocalize = p1.AutoLocalize
		actionText.RootLocalizationTable = p1.RootLocalizationTable
		objectText.AutoLocalize = p1.AutoLocalize
		objectText.RootLocalizationTable = p1.RootLocalizationTable
		var3 -= var4
		
		if (p1.ActionText == nil or p1.ActionText == "") and (p1.ObjectText == nil or p1.ObjectText == "") then
			UIPadding.PaddingRight = UDim.new(0, 0)
		else
			UIPadding.PaddingRight = UDim.new(0, var3)
		end
		actionText.Position = UDim2.new(0, 0, 0, var4)
		objectText.Position = UDim2.new(0, 0, 0, -10)
		prompt.Size = UDim2.fromOffset(var2, 72)
		prompt.SizeOffset = Vector2.new(p1.UIOffset.X / prompt.Size.Width.Offset, p1.UIOffset.Y / prompt.Size.Height.Offset)
		task.defer(function()
			-- upvalues: runService (copy), var2 (write), frame (copy), prompt (copy), p1 (copy)
			runService.RenderStepped:Wait()
			runService.RenderStepped:Wait()
			var2 = frame.AbsoluteSize.X
			prompt.Size = UDim2.fromOffset(var2, 72)
			prompt.SizeOffset = Vector2.new(p1.UIOffset.X / prompt.Size.Width.Offset, p1.UIOffset.Y / prompt.Size.Height.Offset)
		end)
	end
	
	local changedConnection = p1.Changed:Connect(updateUIFromPrompt)
	updateUIFromPrompt()
	prompt.Adornee = p1.Parent
	prompt.Parent = p3
	local ancestryChangedConnection = p1.AncestryChanged:Connect(function()
		-- upvalues: prompt (ref), p1 (ref)
		prompt.Adornee = p1.Parent
	end)
	
	for i, v in ipairs(t_7) do
		v:Play()
	end
	return function()
		-- upvalues: promptButtonHoldBeganConnection (write), keyboardKeyCodeStringForKeyCode (write), triggeredConnection (write), triggerEndedConnection (write), changedConnection (ref), ancestryChangedConnection (ref), t_6 (ref), prompt (ref)
		if promptButtonHoldBeganConnection then
			promptButtonHoldBeganConnection:Disconnect()
		end
		if keyboardKeyCodeStringForKeyCode then
			keyboardKeyCodeStringForKeyCode:Disconnect()
		end
		triggeredConnection:Disconnect()
		triggerEndedConnection:Disconnect()
		changedConnection:Disconnect()
		ancestryChangedConnection:Disconnect()
		
		for i, v in ipairs(t_6) do
			v:Play()
		end
		wait(0.2)
		prompt.Parent = nil
	end
end

local function createIndicator(p4, p5)
	-- upvalues: color3 (ref), color3_1 (ref), tweenService (ref), tweenInfo (ref)
	local t = {}
	local t_1 = {}
	local indicator = Instance.new("BillboardGui")
	indicator.Name = "Indicator"
	indicator.Size = UDim2.fromOffset(15, 15)
	indicator.AlwaysOnTop = true
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromScale(1, 1)
	frame.BackgroundTransparency = 1
	frame.BackgroundColor3 = color3
	frame.AnchorPoint = Vector2.new(0.5, 0)
	frame.Position = UDim2.fromScale(0.5, 0)
	frame.Parent = indicator
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = frame
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = color3_1
	UIStroke.Thickness = 1.5
	UIStroke.Transparency = 1
	UIStroke.Parent = frame
	table.insert(t, tweenService:Create(frame, tweenInfo, { BackgroundTransparency = 1 }))
	table.insert(t, tweenService:Create(UIStroke, tweenInfo, { Transparency = 1 }))
	table.insert(t_1, tweenService:Create(frame, tweenInfo, { BackgroundTransparency = 0.2 }))
	table.insert(t_1, tweenService:Create(UIStroke, tweenInfo, { Transparency = 0.2 }))
	indicator.Adornee = p4.Parent
	indicator.Parent = p5
	local ancestryChangedConnection = p4.AncestryChanged:Connect(function()
		-- upvalues: indicator (ref), p4 (ref)
		indicator.Adornee = p4.Parent
	end)
	
	for i, v in ipairs(t_1) do
		v:Play()
	end
	return function()
		-- upvalues: ancestryChangedConnection (ref), t (ref), indicator (ref)
		ancestryChangedConnection:Disconnect()
		
		for i, v in ipairs(t) do
			v:Play()
		end
		wait(0.2)
		indicator.Parent = nil
	end
end

;(function()
	-- upvalues: proximityPromptService (ref), playerGui (ref), createPrompt (ref), createIndicator (ref)
	proximityPromptService.PromptShown:Connect(function(p6, p7)
		-- upvalues: playerGui (copy), createPrompt (copy)
		if p6.Style == Enum.ProximityPromptStyle.Custom then return end
		local proximityPrompts_1 = playerGui:FindFirstChild("ProximityPrompts")
		
		if proximityPrompts_1 == nil then
			proximityPrompts_1 = Instance.new("ScreenGui")
			proximityPrompts_1.Name = "ProximityPrompts"
			proximityPrompts_1.ResetOnSpawn = false
			proximityPrompts_1.Parent = playerGui
			proximityPrompts_1.IgnoreGuiInset = true
		end
		proximityPrompts_1 = createPrompt(p6, p7, proximityPrompts_1)
		local bindableEvent = Instance.new("BindableEvent")
		local promptHiddenConnection = p6.PromptHidden:Connect(function()
			-- upvalues: bindableEvent (ref)
			bindableEvent:Fire()
		end)
		local destroyingConnection = p6.Destroying:Connect(function()
			-- upvalues: bindableEvent (ref)
			bindableEvent:Fire()
		end)
		bindableEvent.Event:Wait()
		promptHiddenConnection:Disconnect()
		destroyingConnection:Disconnect()
		proximityPrompts_1()
	end)
	proximityPromptService.IndicatorShown:Connect(function(p6)
		-- upvalues: playerGui (copy), createIndicator (copy)
		if p6.Style == Enum.ProximityPromptStyle.Custom then return end
		local proximityPrompts_1 = playerGui:FindFirstChild("ProximityPrompts")
		
		if proximityPrompts_1 == nil then
			proximityPrompts_1 = Instance.new("ScreenGui")
			proximityPrompts_1.Name = "ProximityPrompts"
			proximityPrompts_1.ResetOnSpawn = false
			proximityPrompts_1.Parent = playerGui
			proximityPrompts_1.IgnoreGuiInset = true
		end
		proximityPrompts_1 = createIndicator(p6, proximityPrompts_1)
		local bindableEvent = Instance.new("BindableEvent")
		local indicatorHiddenConnection = p6.IndicatorHidden:Connect(function()
			-- upvalues: bindableEvent (ref)
			bindableEvent:Fire()
		end)
		local destroyingConnection = p6.Destroying:Connect(function()
			-- upvalues: bindableEvent (ref)
			bindableEvent:Fire()
		end)
		bindableEvent.Event:Wait()
		indicatorHiddenConnection:Disconnect()
		destroyingConnection:Disconnect()
		proximityPrompts_1()
	end)
end)()