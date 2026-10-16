local config = {
	[Enum.DialogPurpose.Quest] = {
		"rbxasset://textures/ui/dialog_purpose_quest.png",
		Vector2.new(10, 34)
	},
	[Enum.DialogPurpose.Help] = {
		"rbxasset://textures/ui/dialog_purpose_help.png",
		Vector2.new(20, 35)
	},
	[Enum.DialogPurpose.Shop] = {
		"rbxasset://textures/ui/dialog_purpose_shop.png",
		Vector2.new(22, 43)
	}
}
local v1 = 24
local Size24 = Enum.FontSize.Size24
local _Vector2 = Vector2.new(80, 90)
local XOffset = 350
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Enabled = false
local Flag = false
local LocalPlayer = Players.LocalPlayer
while LocalPlayer == nil do
	Players.PlayerAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local Character = LocalPlayer.Character

if not Character or Character.Parent == nil then
	Character = LocalPlayer.CharacterAdded:Wait()
end
LocalPlayer.CharacterAdded:Connect(function(Character1) --[[ Line: 48 ]]
	-- upvalues: Character (ref)
	Character = Character1
end)

function setUsingGamepad(Input, _) --[[ Line: 52 ]]
	-- upvalues: Enabled (ref)
	if Input.UserInputType == Enum.UserInputType.Gamepad1 or Input.UserInputType == Enum.UserInputType.Gamepad2 or Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4 then
		Enabled = true
		
		return
	else
		Enabled = false
	end
end

game:GetService("UserInputService").InputBegan:Connect(setUsingGamepad)
game:GetService("UserInputService").InputChanged:Connect(setUsingGamepad)
local Frame = nil
local Choices = {}
local Choice = nil
local t = {}
local Key = nil
local v2 = nil
local t1 = {}
local Thread = nil
local CoreGui = game:GetService("CoreGui")
local _ = game:GetService("CorePackages")
local RobloxGui = CoreGui.RobloxGui
local SetDialogInUse = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", 1e999)
local Billboard = nil
local Frame1 = nil
local Guis = {}
local ChangedConnections = {}
local TouchControlFrame = nil
local Flag1 = false
local ControlFrame = nil
local GameTranslatorModule = require(RobloxGui.Modules.GameTranslator)
local IsSmallTouchScreen = require(RobloxGui.Modules.Settings.Utility):IsSmallTouchScreen()

if require(RobloxGui.Modules.TenFootInterface):IsEnabled() then
	Size24 = Enum.FontSize.Size36
	v1 = 36
	XOffset = 500
elseif IsSmallTouchScreen then
	Size24 = Enum.FontSize.Size14
	v1 = 14
	XOffset = 250
end
ControlFrame = if RobloxGui:FindFirstChild("ControlFrame") then RobloxGui.ControlFrame else RobloxGui
local TouchEnabled = game:GetService("UserInputService").TouchEnabled

local function _(p1) --[[ Line: 118 | Named "isDialogMultiplePlayers" ]]
	local Success, Result = pcall(function(): boolean --[[ Line: 119 ]]
		-- upvalues: p1 (copy)
		return p1.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	return Success and Result or false
end

function currentTone() --[[ Line: 123 ]]
	-- upvalues: Key (ref)
	return if Key then Key.Tone else Enum.DialogTone.Neutral
end

function createChatNotificationGui() --[[ Line: 132 ]]
	-- upvalues: Billboard (ref), _Vector2 (copy), UserInputService (copy)
	Billboard = Instance.new("BillboardGui")
	Billboard.Name = "ChatNotificationGui"
	Billboard.ExtentsOffset = vector.create(0, 1, 0)
	Billboard.Size = UDim2.new(_Vector2.X / 31.5, 0, _Vector2.Y / 31.5, 0)
	Billboard.SizeOffset = Vector2.new(0, 0)
	Billboard.StudsOffset = vector.create(0, 3.700000047683716, 0)
	Billboard.Enabled = true
	Billboard.RobloxLocked = true
	Billboard.Active = true
	local Background = Instance.new("ImageButton")
	Background.Name = "Background"
	Background.Active = false
	Background.BackgroundTransparency = 1
	Background.Position = UDim2.new(0, 0, 0, 0)
	Background.Size = UDim2.new(1, 0, 1, 0)
	Background.Image = ""
	Background.Parent = Billboard
	local Icon = Instance.new("ImageLabel")
	Icon.Name = "Icon"
	Icon.Position = UDim2.new(0, 0, 0, 0)
	Icon.Size = UDim2.new(1, 0, 1, 0)
	Icon.Image = ""
	Icon.BackgroundTransparency = 1
	Icon.Parent = Background
	local ActivationButton = Instance.new("ImageLabel")
	ActivationButton.Name = "ActivationButton"
	ActivationButton.Position = UDim2.new(-0.3, 0, -0.4, 0)
	ActivationButton.Size = UDim2.new(0.8, 0, 0.8 * (_Vector2.X / _Vector2.Y), 0)
	ActivationButton.Image = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX)
	ActivationButton.BackgroundTransparency = 1
	ActivationButton.Visible = false
	ActivationButton.Parent = Background
end

function getChatColor(DialogTone) --[[ Line: 170 ]]
	if DialogTone == Enum.DialogTone.Neutral then
		return Enum.ChatColor.Blue
	elseif DialogTone == Enum.DialogTone.Friendly then
		return Enum.ChatColor.Green
	elseif DialogTone ~= Enum.DialogTone.Enemy then return end
	return Enum.ChatColor.Red
end

function styleChoices() --[[ Line: 180 ]]
	-- upvalues: Choices (copy), Choice (ref)
	for _, choice in pairs(Choices) do
		choice.BackgroundTransparency = 1
	end
	Choice.BackgroundTransparency = 1
end

function styleMainFrame(DialogTone) --[[ Line: 187 ]]
	-- upvalues: Frame (ref)
	if DialogTone == Enum.DialogTone.Neutral then
		Frame.Style = Enum.FrameStyle.ChatBlue
	elseif DialogTone == Enum.DialogTone.Friendly then
		Frame.Style = Enum.FrameStyle.ChatGreen
	elseif DialogTone == Enum.DialogTone.Enemy then
		Frame.Style = Enum.FrameStyle.ChatRed
	end
	styleChoices()
end

function setChatNotificationTone(p1, p2, DialogTone) --[[ Line: 198 ]]
	-- upvalues: config (copy), _Vector2 (copy)
	if DialogTone == Enum.DialogTone.Neutral then
		p1.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png"
	elseif DialogTone == Enum.DialogTone.Friendly then
		p1.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png"
	elseif DialogTone == Enum.DialogTone.Enemy then
		p1.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png"
	end
	local Unpacked, Unpacked2 = unpack(config[p2])
	local UnpackedRatio = Unpacked2 / _Vector2
	p1.Background.Icon.Size = UDim2.new(UnpackedRatio.X, 0, UnpackedRatio.Y, 0)
	p1.Background.Icon.Position = UDim2.new(0.5 - UnpackedRatio.X / 2, 0, 0.4 - UnpackedRatio.Y / 2, 0)
	p1.Background.Icon.Image = Unpacked
end

function createMessageDialog() --[[ Line: 214 ]]
	-- upvalues: Frame1 (ref)
	Frame1 = Instance.new("Frame")
	Frame1.Name = "DialogScriptMessage"
	Frame1.Style = Enum.FrameStyle.Custom
	Frame1.BackgroundTransparency = 0.5
	Frame1.BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039)
	Frame1.Visible = false
	Frame1.RobloxLocked = true
	local Text = Instance.new("TextLabel")
	Text.Name = "Text"
	Text.Position = UDim2.new(0, 0, 0, -1)
	Text.Size = UDim2.new(1, 0, 1, 0)
	Text.FontSize = Enum.FontSize.Size14
	Text.BackgroundTransparency = 1
	Text.TextColor3 = Color3.new(1, 1, 1)
	Text.Parent = Frame1
end

function showMessage(Text, XOffset) --[[ Line: 233 ]]
	-- upvalues: Frame1 (ref)
	Frame1.Text.Text = Text
	Frame1.Size = UDim2.new(0, XOffset, 0, 40)
	Frame1.Position = UDim2.new(0.5, -XOffset / 2, 0.5, -40)
	Frame1.Visible = true
	wait(2)
	Frame1.Visible = false
end

function variableDelay(Text: string) --[[ Line: 242 ]]
	wait(math.min(string.len(Text), 100) / 75 * 1.5 + 0.75)
end

function resetColor(p1) --[[ Line: 247 ]]
	p1.BackgroundTransparency = 1
end

function wanderDialog() --[[ Line: 251 ]]
	-- upvalues: Frame (ref)
	Frame.Visible = false
	endDialog()
	showMessage("Chat ended because you walked away", 350)
end

function timeoutDialog() --[[ Line: 257 ]]
	-- upvalues: Frame (ref)
	Frame.Visible = false
	endDialog()
	showMessage("Chat ended because you didn't reply", 350)
end

function normalEndDialog() --[[ Line: 263 ]]
	endDialog()
end

function endDialog() --[[ Line: 267 ]]
	-- upvalues: Thread (ref), t1 (copy), Key (ref), SetDialogInUse (copy), Guis (copy), ContextActionService (copy), v2 (ref), TouchControlFrame (ref), Flag1 (ref), ControlFrame (ref), GuiService (copy), Frame (ref)
	if Thread then
		t1[Thread] = false
		Thread = nil
	end
	local Dialog = Key
	Key = nil
	
	if Dialog and Dialog.InUse then
		delay(5, function() --[[ Line: 277 ]]
			-- upvalues: SetDialogInUse (upval), Dialog (copy)
			SetDialogInUse:FireServer(Dialog, false)
			Dialog.InUse = false
		end)
	end
	for i, gui in pairs(Guis) do
		if i and gui then
			gui.Enabled = not i.InUse
		end
	end
	ContextActionService:UnbindCoreAction("Nothing")
	v2 = nil
	
	if TouchControlFrame then
		TouchControlFrame.Visible = true
	end
	if Flag1 then
		ControlFrame.BottomLeftControl.Visible = false
	end
	if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject.Parent == Frame then
		GuiService.SelectedCoreObject = nil
	end
end

function sanitizeMessage(Text: string): string --[[ Line: 306 ]]
	return if string.len(Text) == 0 then "..." else Text
end

local function chatFunc(Key, ...) --[[ Line: 314 ]]
	local Success, Result = pcall(function(): boolean --[[ Line: 119 ]]
		-- upvalues: Key (copy)
		return Key.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	if Success and Result or false then
		game:GetService("Chat"):ChatLocal(...)
		
		return
	else
		game:GetService("Chat"):Chat(...)
	end
end

function selectChoice(Choice1) --[[ Line: 322 ]]
	-- upvalues: Key (ref), Character (ref), Frame (ref), Choice (ref), chatFunc (copy), t (ref), LocalPlayer (ref), v2 (ref)
	if not Key then return end
	renewKillswitch(Key)
	
	if not Character:FindFirstAncestorOfClass("Workspace") then return end
	Frame.Visible = false
	
	if Choice1 == Choice then
		chatFunc(Key, Character, Choice.UserPrompt.Text, getChatColor(currentTone()))
		normalEndDialog()
		
		return
	end
	local Entry = t[Choice1]
	chatFunc(Key, Character, sanitizeMessage(Entry.UserDialog), getChatColor(currentTone()))
	wait(1)
	
	if Key then
		Key:SignalDialogChoiceSelected(LocalPlayer, Entry)
		chatFunc(Key, v2, sanitizeMessage(Entry.ResponseDialog), getChatColor(currentTone()))
		variableDelay(Entry.ResponseDialog)
		presentDialogChoices(v2, Entry:GetChildren(), Entry)
		
		return
	end
end

function newChoice() --[[ Line: 357 ]]
	-- upvalues: Size24 (ref), UserInputService (copy)
	local Frame = Instance.new("Frame")
	Frame.Visible = false
	local Button = Instance.new("TextButton")
	Button.BackgroundColor3 = Color3.new(0.8901960784313725, 0.8901960784313725, 0.8901960784313725)
	Button.BackgroundTransparency = 1
	Button.AutoButtonColor = false
	Button.BorderSizePixel = 0
	Button.Text = ""
	Button.MouseEnter:connect(function() --[[ Line: 367 ]]
		-- upvalues: Button (copy)
		Button.BackgroundTransparency = 0
	end)
	Button.MouseLeave:connect(function() --[[ Line: 370 ]]
		-- upvalues: Button (copy)
		Button.BackgroundTransparency = 1
	end)
	Button.SelectionImageObject = Frame
	Button.Activated:connect(function() --[[ Line: 374 ]]
		-- upvalues: Button (copy)
		selectChoice(Button)
	end)
	Button.RobloxLocked = true
	local UserPrompt = Instance.new("TextLabel")
	UserPrompt.AutoLocalize = false
	UserPrompt.Name = "UserPrompt"
	UserPrompt.BackgroundTransparency = 1
	UserPrompt.Font = Enum.Font.SourceSans
	UserPrompt.FontSize = Size24
	UserPrompt.Position = UDim2.new(0, 40, 0, 0)
	UserPrompt.Size = UDim2.new(1, -72, 1, 0)
	UserPrompt.TextXAlignment = Enum.TextXAlignment.Left
	UserPrompt.TextYAlignment = Enum.TextYAlignment.Center
	UserPrompt.TextWrap = true
	UserPrompt.Parent = Button
	local RBXchatDialogSelectionButton = Instance.new("ImageLabel")
	RBXchatDialogSelectionButton.Name = "RBXchatDialogSelectionButton"
	RBXchatDialogSelectionButton.Position = UDim2.new(0, 0, 0.5, -16.5)
	RBXchatDialogSelectionButton.Size = UDim2.new(0, 33, 0, 33)
	RBXchatDialogSelectionButton.Image = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)
	RBXchatDialogSelectionButton.BackgroundTransparency = 1
	RBXchatDialogSelectionButton.Visible = false
	RBXchatDialogSelectionButton.Parent = Button
	
	return Button
end

function initialize(Parent) --[[ Line: 404 ]]
	-- upvalues: Choices (copy), Choice (ref), v1 (ref), Frame (ref), XOffset (ref)
	Choices[1] = newChoice()
	Choices[2] = newChoice()
	Choices[3] = newChoice()
	Choices[4] = newChoice()
	Choice = newChoice()
	Choice.UserPrompt.Text = "Goodbye!"
	Choice.Size = UDim2.new(1, 28, 0, v1 + 12)
	Frame = Instance.new("Frame")
	Frame.Name = "UserDialogArea"
	Frame.Size = UDim2.new(0, XOffset, 0, 200)
	Frame.Style = Enum.FrameStyle.ChatBlue
	Frame.Visible = false
	
	for _, choice in pairs(Choices) do
		choice.RobloxLocked = true
		choice.Parent = Frame
	end
	Choice.RobloxLocked = true
	Choice.Parent = Frame
	Frame.RobloxLocked = true
	Frame.Parent = Parent
end

function presentDialogChoices(p1, DialogChoices, p2) --[[ Line: 432 ]]
	-- upvalues: Key (ref), v2 (ref), t (ref), Choices (copy), v1 (ref), GameTranslatorModule (copy), Choice (ref), Frame (ref), XOffset (ref), IsSmallTouchScreen (copy), LocalPlayer (ref), TouchControlFrame (ref), TouchEnabled (copy), ControlFrame (ref), Flag1 (ref), Enabled (ref)
	if not Key then return end
	v2 = p1
	local List = {}
	
	for _, dialogChoice in pairs(DialogChoices) do
		if dialogChoice:IsA("DialogChoice") then
			table.insert(List, dialogChoice)
		end
	end
	table.sort(List, function(A, B): boolean --[[ Line: 444 ]]
		return A.Name < B.Name
	end)
	
	if #List == 0 then
		normalEndDialog()
		
		return
	end
	local Count = 1
	local v3 = 0
	t = {}
	
	for _, choice in pairs(Choices) do
		choice.Visible = false
	end
	for _, value in pairs(List) do
		if Count <= #Choices then
			Choices[Count].Size = UDim2.new(1, 28, 0, v1 * 3)
			GameTranslatorModule:TranslateAndRegister(Choices[Count].UserPrompt, value, value.UserDialog)
			local NewCeiled = math.ceil(Choices[Count].UserPrompt.TextBounds.Y / v1) * v1 + 12
			Choices[Count].Position = UDim2.new(0, -11, 0, v3 + -8)
			Choices[Count].Size = UDim2.new(1, 28, 0, NewCeiled)
			Choices[Count].Visible = true
			t[Choices[Count]] = value
			v3 = v3 + NewCeiled + 1
			Count += 1
		end
	end
	Choice.Size = UDim2.new(1, 28, 0, v1 * 3)
	Choice.UserPrompt.Text = if p2.GoodbyeDialog == "" then "Goodbye!" else p2.GoodbyeDialog
	Choice.Size = UDim2.new(1, 28, 0, math.ceil(Choice.UserPrompt.TextBounds.Y / v1) * v1 + 12)
	Choice.Position = UDim2.new(0, -11, 0, v3 + -8)
	Choice.Visible = true
	
	if p2.GoodbyeChoiceActive then
		Frame.Size = UDim2.new(0, XOffset, 0, v3 + Choice.AbsoluteSize.Y + 34 + -16)
	else
		Choice.Visible = false
		Frame.Size = UDim2.new(0, XOffset, 0, v3 + 34 + -16)
	end
	Frame.Position = UDim2.new(0, 20, 1, -Frame.Size.Y.Offset - 20)
	
	if IsSmallTouchScreen then
		local TouchGui = LocalPlayer.PlayerGui:FindFirstChild("TouchGui")
		
		if TouchGui then
			TouchControlFrame = TouchGui:FindFirstChild("TouchControlFrame")
			
			if TouchControlFrame then
				TouchControlFrame.Visible = false
			end
		end
		Frame.Position = UDim2.new(0, 10, 1, -Frame.Size.Y.Offset)
	elseif not TouchEnabled and not ControlFrame.BottomLeftControl.Visible then
		ControlFrame.BottomLeftControl.Visible = true
		Flag1 = true
	end
	styleMainFrame(currentTone())
	Frame.Visible = true
	
	if Enabled then
		game:GetService("GuiService").SelectedCoreObject = Choices[1]
	end
end

function doDialog(Object) --[[ Line: 516 ]]
	-- upvalues: Key (ref), ContextActionService (copy), SetDialogInUse (copy), chatFunc (copy)
	if Object.InitialPrompt == "" then
		warn("Can't start a dialog with an empty InitialPrompt")
		
		return
	end
	local Success, Result = pcall(function(): boolean --[[ Line: 119 ]]
		-- upvalues: Object (copy)
		return Object.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	if not Object.InUse or (Success and Result or false) then
		Key = Object
		Object.InUse = true
		ContextActionService:BindCoreAction("Nothing", function() --[[ Line: 530 ]] end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
		SetDialogInUse:FireServer(Object, true)
		chatFunc(Object, Object.Parent, Object.InitialPrompt, getChatColor(Object.Tone))
		variableDelay(Object.InitialPrompt)
		presentDialogChoices(Object.Parent, Object:GetChildren(), Object)
		
		return
	end
end

function renewKillswitch(p3) --[[ Line: 541 ]]
	-- upvalues: Thread (ref), t1 (copy), SetDialogInUse (copy)
	if Thread then
		t1[Thread] = false
		Thread = nil
	end
	Thread = coroutine.create(function(Key) --[[ Line: 547 ]]
		-- upvalues: t1 (upval), SetDialogInUse (upval), p3 (copy)
		wait(15)
		
		if Key ~= nil then
			if t1[Key] == nil then
				SetDialogInUse:FireServer(p3, false)
				p3.InUse = false
			end
			t1[Key] = nil
		end
	end)
	coroutine.resume(Thread, Thread)
end

function checkForLeaveArea() --[[ Line: 560 ]]
	-- upvalues: Key (ref), LocalPlayer (ref)
	while Key do
		if Key.Parent and Key.ConversationDistance <= LocalPlayer:DistanceFromCharacter(Key.Parent.Position) then
			wanderDialog()
		end
		wait(1)
	end
end

function startDialog(p3) --[[ Line: 569 ]]
	-- upvalues: RbxAnalyticsService (copy), LocalPlayer (ref), Guis (copy)
	if p3.Parent and p3.Parent:IsA("BasePart") then
		RbxAnalyticsService:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated")
		
		if p3.ConversationDistance <= LocalPlayer:DistanceFromCharacter(p3.Parent.Position) then
			showMessage("You are too far away to chat!", 300)
			
			return
		end
		for i, gui in pairs(Guis) do
			if i and gui then
				gui.Enabled = false
			end
		end
		renewKillswitch(p3)
		delay(1, checkForLeaveArea)
		doDialog(p3)
	end
end

function removeDialog(Key) --[[ Line: 591 ]]
	-- upvalues: Guis (copy), ChangedConnections (copy)
	if Guis[Key] then
		Guis[Key]:Destroy()
		Guis[Key] = nil
	end
	if ChangedConnections[Key] then
		ChangedConnections[Key]:disconnect()
		ChangedConnections[Key] = nil
	end
end

function addDialog(Key1) --[[ Line: 602 ]]
	-- upvalues: Flag (ref), RbxAnalyticsService (copy), Billboard (ref), CoreGui (copy), Guis (copy), ChangedConnections (copy), Key (ref)
	if Key1.Parent then
		if Key1.Parent:IsA("BasePart") and Key1:IsDescendantOf(game.Workspace) then
			Flag = true
			RbxAnalyticsService:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId)
			local BillboardClone = Billboard:clone()
			BillboardClone.Adornee = Key1.Parent
			BillboardClone.RobloxLocked = true
			local NoInUse = not Key1.InUse
			
			if not NoInUse then
				local Success, Result = pcall(function(): boolean --[[ Line: 119 ]]
					-- upvalues: Key1 (copy)
					return Key1.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
				end)
				NoInUse = Success and Result or false
			end
			BillboardClone.Enabled = NoInUse
			BillboardClone.Parent = CoreGui
			BillboardClone.Background.MouseButton1Click:connect(function() --[[ Line: 614 ]]
				-- upvalues: Key1 (copy)
				startDialog(Key1)
			end)
			setChatNotificationTone(BillboardClone, Key1.Purpose, Key1.Tone)
			
			if game:GetEngineFeature("ClosestVisibleDialogAPI") then
				Key1:SetGuiObject(BillboardClone)
			end
			Guis[Key1] = BillboardClone
			ChangedConnections[Key1] = Key1.Changed:connect(function(p4) --[[ Line: 624 ]]
				-- upvalues: Key1 (copy), BillboardClone (copy), Key (upval)
				if p4 == "Parent" and Key1.Parent then
					removeDialog(Key1)
					addDialog(Key1)
					
					return
				end
				if p4 == "InUse" then
					local Success, Result = pcall(function(): boolean --[[ Line: 119 ]]
						-- upvalues: Key1 (copy)
						return Key1.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
					end)
					
					if Success and Result or false then
						BillboardClone.Enabled = Key ~= Key1
					else
						BillboardClone.Enabled = Key == nil and not Key1.InUse
					end
					if not Key1.InUse then
						local Success1, Result1 = pcall(function(): boolean --[[ Line: 119 ]]
							-- upvalues: Key1 (copy)
							return Key1.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
						end)
						
						if (not Success1 or not Result1) and true and Key1 == Key then
							timeoutDialog()
							
							return
						end
					end
				elseif p4 == "Tone" or p4 == "Purpose" then
					setChatNotificationTone(BillboardClone, Key1.Purpose, Key1.Tone)
				end
			end)
			
			return
		else
			ChangedConnections[Key1] = Key1.Changed:connect(function(p4) --[[ Line: 644 ]]
				-- upvalues: Key1 (copy)
				if p4 == "Parent" and Key1.Parent then
					removeDialog(Key1)
					addDialog(Key1)
				end
			end)
		end
	end
end

function onLoad() --[[ Line: 655 ]]
	-- upvalues: Frame1 (ref), ControlFrame (ref), TouchEnabled (copy), IsSmallTouchScreen (copy)
	createChatNotificationGui()
	createMessageDialog()
	Frame1.RobloxLocked = true
	Frame1.Parent = ControlFrame
	ControlFrame:WaitForChild("BottomLeftControl")
	local DialogFrame = Instance.new("Frame")
	DialogFrame.Name = "DialogFrame"
	DialogFrame.Position = UDim2.new(0, 0, 0, 0)
	DialogFrame.Size = UDim2.new(0, 0, 0, 0)
	DialogFrame.BackgroundTransparency = 1
	DialogFrame.RobloxLocked = true
	game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", DialogFrame)
	
	if TouchEnabled and not IsSmallTouchScreen then
		DialogFrame.Position = UDim2.new(0, 20, 0.5, 0)
		DialogFrame.Size = UDim2.new(0.25, 0, 0.1, 0)
		DialogFrame.Parent = ControlFrame
	elseif IsSmallTouchScreen then
		DialogFrame.Position = UDim2.new(0, 0, 0.9, -10)
		DialogFrame.Size = UDim2.new(0.25, 0, 0.1, 0)
		DialogFrame.Parent = ControlFrame
	else
		DialogFrame.Parent = ControlFrame.BottomLeftControl
	end
	initialize(DialogFrame)
	game:GetService("CollectionService").ItemAdded:Connect(function(Dialog) --[[ Line: 686 ]]
		if Dialog:IsA("Dialog") then
			addDialog(Dialog)
		end
	end)
	game:GetService("CollectionService").ItemRemoved:Connect(function(Dialog) --[[ Line: 691 ]]
		if Dialog:IsA("Dialog") then
			removeDialog(Dialog)
		end
	end)
	
	for _, Dialog in pairs(game:GetService("CollectionService"):GetCollection("Dialog")) do
		if Dialog:IsA("Dialog") then
			addDialog(Dialog)
		end
	end
end

function getLocalHumanoidRootPart() --[[ Line: 703 ]]
	-- upvalues: LocalPlayer (ref)
	if not LocalPlayer.Character then return end
	return LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

function dialogIsValid(p4) --[[ Line: 709 ]]
	return p4 and (p4.Parent and p4.Parent:IsA("BasePart"))
end

local ClosestVisibleDialogToPosition = nil
local GetClosestDialogToPositionFunction = GuiService.GetClosestDialogToPosition
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 716 ]]
	-- upvalues: GetClosestDialogToPositionFunction (copy), GuiService (copy), Key (ref), LocalPlayer (ref), Enabled (ref), ClosestVisibleDialogToPosition (ref), Guis (copy), ContextActionService (copy)
	local ClosestVisibleDialogToPosition1 = nil
	local LocalHumanoidRootPart = getLocalHumanoidRootPart()
	
	if LocalHumanoidRootPart then
		ClosestVisibleDialogToPosition1 = GetClosestDialogToPositionFunction(GuiService, LocalHumanoidRootPart.Position)
	end
	if getLocalHumanoidRootPart() and dialogIsValid(ClosestVisibleDialogToPosition1) and Key == nil then
		local TriggerDistance = ClosestVisibleDialogToPosition1.TriggerDistance
		local v4 = LocalPlayer:DistanceFromCharacter(ClosestVisibleDialogToPosition1.Parent.Position + ClosestVisibleDialogToPosition1.TriggerOffset)
		
		if TriggerDistance ~= 0 and v4 < ClosestVisibleDialogToPosition1.ConversationDistance and v4 < TriggerDistance then
			startDialog(ClosestVisibleDialogToPosition1)
		end
	end
	if Enabled == true then
		if LocalHumanoidRootPart and game:GetEngineFeature("ClosestVisibleDialogAPI") then
			ClosestVisibleDialogToPosition1 = GuiService.GetClosestVisibleDialogToPosition(GuiService, LocalHumanoidRootPart.Position)
		end
		if ClosestVisibleDialogToPosition1 ~= ClosestVisibleDialogToPosition then
			if Guis[ClosestVisibleDialogToPosition] then
				Guis[ClosestVisibleDialogToPosition].Background.ActivationButton.Visible = false
			end
			ClosestVisibleDialogToPosition = ClosestVisibleDialogToPosition1
			ContextActionService:UnbindCoreAction("StartDialogAction")
			
			if ClosestVisibleDialogToPosition1 ~= nil then
				ContextActionService:BindCoreAction("StartDialogAction", function(_, UserInputState, _) --[[ Line: 755 ]]
					-- upvalues: ClosestVisibleDialogToPosition1 (ref)
					if UserInputState == Enum.UserInputState.Begin and ClosestVisibleDialogToPosition1 and ClosestVisibleDialogToPosition1.Parent then
						startDialog(ClosestVisibleDialogToPosition1)
					end
				end, false, Enum.KeyCode.ButtonX)
				
				if Guis[ClosestVisibleDialogToPosition1] then
					Guis[ClosestVisibleDialogToPosition1].Background.ActivationButton.Visible = true
				end
			end
		end
	end
end)
local SelectedCoreObject = nil
GuiService.Changed:connect(function(Property) --[[ Line: 772 ]]
	-- upvalues: SelectedCoreObject (ref), GuiService (copy)
	if Property == "SelectedCoreObject" then
		if SelectedCoreObject and SelectedCoreObject:FindFirstChild("RBXchatDialogSelectionButton") then
			SelectedCoreObject:FindFirstChild("RBXchatDialogSelectionButton").Visible = false
			SelectedCoreObject.BackgroundTransparency = 1
		end
		SelectedCoreObject = GuiService.SelectedCoreObject
		
		if SelectedCoreObject and SelectedCoreObject:FindFirstChild("RBXchatDialogSelectionButton") then
			SelectedCoreObject:FindFirstChild("RBXchatDialogSelectionButton").Visible = true
			SelectedCoreObject.BackgroundTransparency = 0
		end
	end
end)
onLoad()