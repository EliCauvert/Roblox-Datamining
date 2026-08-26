local t = {
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
local var1 = 24
local size24 = Enum.FontSize.Size24
local vector2 = Vector2.new(80, 90)
local var2 = 350
local playersService = game:GetService("Players")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local var3 = false
local var4 = false
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.PlayerAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local character = localPlayer.Character

if not character or character.Parent == nil then
	character = localPlayer.CharacterAdded:Wait()
end
localPlayer.CharacterAdded:Connect(function(p1)
	-- upvalues: character (write)
	character = p1
end)

function setUsingGamepad(value, _)
	-- upvalues: var3 (write)
	if value.UserInputType == Enum.UserInputType.Gamepad1 or value.UserInputType == Enum.UserInputType.Gamepad2 or (value.UserInputType == Enum.UserInputType.Gamepad3 or value.UserInputType == Enum.UserInputType.Gamepad4) then
		var3 = true
		
		return
	end
	var3 = false
end

game:GetService("UserInputService").InputBegan:Connect(setUsingGamepad)
game:GetService("UserInputService").InputChanged:Connect(setUsingGamepad)
local var5 = nil
local t_1 = {}
local var6 = nil
local t_2 = {}
local var7 = nil
local var8 = nil
local t_3 = {}
local var9 = nil
local coreGuiService = game:GetService("CoreGui")
local _ = game:GetService("CorePackages")
local robloxGui = coreGuiService.RobloxGui
local setDialogInUse = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", 1e999)
local var10 = nil
local var11 = nil
local t_4 = {}
local t_5 = {}
local var12 = nil
local var13 = false
local _ = nil
local var14 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local var15 = require(robloxGui.Modules.Settings.Utility):IsSmallTouchScreen()

if var14 then
	size24 = Enum.FontSize.Size36
	var1 = 36
	var2 = 500
elseif var15 then
	size24 = Enum.FontSize.Size14
	var1 = 14
	var2 = 250
end
local var16 = if robloxGui:FindFirstChild("ControlFrame") then robloxGui.ControlFrame else robloxGui
local touchEnabled = game:GetService("UserInputService").TouchEnabled

local function _(p1)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	return if ok then status else false
end

function currentTone()
	-- upvalues: var7 (write)
	return if var7 then var7.Tone else Enum.DialogTone.Neutral
end

function createChatNotificationGui()
	-- upvalues: var10 (write), vector2 (ref), userInputService (ref)
	var10 = Instance.new("BillboardGui")
	var10.Name = "ChatNotificationGui"
	var10.ExtentsOffset = Vector3.new(0, 1, 0)
	var10.Size = UDim2.new(vector2.X / 31.5, 0, vector2.Y / 31.5, 0)
	var10.SizeOffset = Vector2.new(0, 0)
	var10.StudsOffset = Vector3.new(0, 3.700000047684, 0)
	var10.Enabled = true
	var10.RobloxLocked = true
	var10.Active = true
	local background = Instance.new("ImageButton")
	background.Name = "Background"
	background.Active = false
	background.BackgroundTransparency = 1
	background.Position = UDim2.new(0, 0, 0, 0)
	background.Size = UDim2.new(1, 0, 1, 0)
	background.Image = ""
	background.Parent = var10
	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.Position = UDim2.new(0, 0, 0, 0)
	icon.Size = UDim2.new(1, 0, 1, 0)
	icon.Image = ""
	icon.BackgroundTransparency = 1
	icon.Parent = background
	local activationButton = Instance.new("ImageLabel")
	activationButton.Name = "ActivationButton"
	activationButton.Position = UDim2.new(-0.3, 0, -0.4, 0)
	activationButton.Size = UDim2.new(0.8, 0, 0.8 * (vector2.X / vector2.Y), 0)
	activationButton.Image = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonX)
	activationButton.BackgroundTransparency = 1
	activationButton.Visible = false
	activationButton.Parent = background
end

function getChatColor(p1)
	if p1 == Enum.DialogTone.Neutral then
		return Enum.ChatColor.Blue
	elseif p1 == Enum.DialogTone.Friendly then
		return Enum.ChatColor.Green
	elseif p1 == Enum.DialogTone.Enemy then
		return Enum.ChatColor.Red
	end
end

function styleChoices()
	-- upvalues: t_1 (ref), var6 (write)
	for i, v in pairs(t_1) do
		v.BackgroundTransparency = 1
	end
	var6.BackgroundTransparency = 1
end

function styleMainFrame(p1)
	-- upvalues: var5 (write)
	if p1 == Enum.DialogTone.Neutral then
		var5.Style = Enum.FrameStyle.ChatBlue
	elseif p1 == Enum.DialogTone.Friendly then
		var5.Style = Enum.FrameStyle.ChatGreen
	elseif p1 == Enum.DialogTone.Enemy then
		var5.Style = Enum.FrameStyle.ChatRed
	end
	styleChoices()
end

function setChatNotificationTone(value, p1, p2)
	-- upvalues: t (ref), vector2 (ref)
	if p2 == Enum.DialogTone.Neutral then
		value.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png"
	elseif p2 == Enum.DialogTone.Friendly then
		value.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png"
	elseif p2 == Enum.DialogTone.Enemy then
		value.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png"
	end
	local var17, var18 = unpack(t[p1])
	local var19 = var18 / vector2
	value.Background.Icon.Size = UDim2.new(var19.X, 0, var19.Y, 0)
	value.Background.Icon.Position = UDim2.new(0.5 - var19.X / 2, 0, 0.4 - var19.Y / 2, 0)
	value.Background.Icon.Image = var17
end

function createMessageDialog()
	-- upvalues: var11 (write)
	var11 = Instance.new("Frame")
	var11.Name = "DialogScriptMessage"
	var11.Style = Enum.FrameStyle.Custom
	var11.BackgroundTransparency = 0.5
	var11.BackgroundColor3 = Color3.new(0.121568627451, 0.121568627451, 0.121568627451)
	var11.Visible = false
	var11.RobloxLocked = true
	local text = Instance.new("TextLabel")
	text.Name = "Text"
	text.Position = UDim2.new(0, 0, 0, -1)
	text.Size = UDim2.new(1, 0, 1, 0)
	text.FontSize = Enum.FontSize.Size14
	text.BackgroundTransparency = 1
	text.TextColor3 = Color3.new(1, 1, 1)
	text.Parent = var11
end

function showMessage(p1, p2)
	-- upvalues: var11 (write)
	var11.Text.Text = p1
	var11.Size = UDim2.new(0, p2, 0, 40)
	var11.Position = UDim2.new(0.5, -p2 / 2, 0.5, -40)
	var11.Visible = true
	wait(2)
	var11.Visible = false
end

function variableDelay(p1)
	wait(math.min(string.len(p1), 100) / 75 * 1.5 + 0.75)
end

function resetColor(value)
	value.BackgroundTransparency = 1
end

function wanderDialog()
	-- upvalues: var5 (write)
	var5.Visible = false
	endDialog()
	showMessage("Chat ended because you walked away", 350)
end

function timeoutDialog()
	-- upvalues: var5 (write)
	var5.Visible = false
	endDialog()
	showMessage("Chat ended because you didn't reply", 350)
end

function normalEndDialog()
	endDialog()
end

function endDialog()
	-- upvalues: var9 (write), t_3 (ref), var7 (write), setDialogInUse (ref), t_4 (ref), contextActionService (ref), var8 (write), var12 (write), var13 (write), var16 (write), guiService (ref), var5 (write)
	if var9 then
		t_3[var9] = false
		var9 = nil
	end
	var7 = nil
	
	if var7 and var7.InUse then
		delay(5, function()
			-- upvalues: setDialogInUse (copy), var7 (ref)
			setDialogInUse:FireServer(var7, false)
			var7.InUse = false
		end)
	end
	for i, v in pairs(t_4) do
		if i and v then
			v.Enabled = not i.InUse
		end
	end
	contextActionService:UnbindCoreAction("Nothing")
	var8 = nil
	
	if var12 then
		var12.Visible = true
	end
	if var13 then
		var16.BottomLeftControl.Visible = false
	end
	if guiService.SelectedCoreObject and guiService.SelectedCoreObject.Parent == var5 then
		guiService.SelectedCoreObject = nil
	end
end

function sanitizeMessage(p1)
	return if string.len(p1) == 0 then "..." else p1
end

local function chatFunc(p1, ...)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	if if ok then status else false then
		game:GetService("Chat"):ChatLocal(...)
		
		return
	end
	game:GetService("Chat"):Chat(...)
end

function selectChoice(p1)
	-- upvalues: var7 (write), character (write), var5 (write), var6 (write), chatFunc (ref), t_2 (write), localPlayer (write), var8 (write)
	if not var7 then return end
	renewKillswitch(var7)
	
	if not character:FindFirstAncestorOfClass("Workspace") then return end
	var5.Visible = false
	
	if p1 == var6 then
		chatFunc(var7, character, var6.UserPrompt.Text, getChatColor(currentTone()))
		normalEndDialog()
		
		return
	end
	local var17 = t_2[p1]
	chatFunc(var7, character, sanitizeMessage(var17.UserDialog), getChatColor(currentTone()))
	wait(1)
	
	if var7 then
		var7:SignalDialogChoiceSelected(localPlayer, var17)
		chatFunc(var7, var8, sanitizeMessage(var17.ResponseDialog), getChatColor(currentTone()))
		variableDelay(var17.ResponseDialog)
		presentDialogChoices(var8, var17:GetChildren(), var17)
		
		return
	end
end

function newChoice()
	-- upvalues: size24 (write), userInputService (ref)
	local frame = Instance.new("Frame")
	frame.Visible = false
	local textButton = Instance.new("TextButton")
	textButton.BackgroundColor3 = Color3.new(0.890196078431, 0.890196078431, 0.890196078431)
	textButton.BackgroundTransparency = 1
	textButton.AutoButtonColor = false
	textButton.BorderSizePixel = 0
	textButton.Text = ""
	textButton.MouseEnter:connect(function()
		-- upvalues: textButton (ref)
		textButton.BackgroundTransparency = 0
	end)
	textButton.MouseLeave:connect(function()
		-- upvalues: textButton (ref)
		textButton.BackgroundTransparency = 1
	end)
	textButton.SelectionImageObject = frame
	textButton.Activated:connect(function()
		-- upvalues: textButton (ref)
		selectChoice(textButton)
	end)
	textButton.RobloxLocked = true
	local userPrompt = Instance.new("TextLabel")
	userPrompt.AutoLocalize = false
	userPrompt.Name = "UserPrompt"
	userPrompt.BackgroundTransparency = 1
	userPrompt.Font = Enum.Font.SourceSans
	userPrompt.FontSize = size24
	userPrompt.Position = UDim2.new(0, 40, 0, 0)
	userPrompt.Size = UDim2.new(1, -72, 1, 0)
	userPrompt.TextXAlignment = Enum.TextXAlignment.Left
	userPrompt.TextYAlignment = Enum.TextYAlignment.Center
	userPrompt.TextWrap = true
	userPrompt.Parent = textButton
	local RBXchatDialogSelectionButton = Instance.new("ImageLabel")
	RBXchatDialogSelectionButton.Name = "RBXchatDialogSelectionButton"
	RBXchatDialogSelectionButton.Position = UDim2.new(0, 0, 0.5, -16.5)
	RBXchatDialogSelectionButton.Size = UDim2.new(0, 33, 0, 33)
	RBXchatDialogSelectionButton.Image = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)
	RBXchatDialogSelectionButton.BackgroundTransparency = 1
	RBXchatDialogSelectionButton.Visible = false
	RBXchatDialogSelectionButton.Parent = textButton
	
	return textButton
end

function initialize(p1)
	-- upvalues: t_1 (ref), var6 (write), var1 (write), var5 (write), var2 (write)
	t_1[1] = newChoice()
	t_1[2] = newChoice()
	t_1[3] = newChoice()
	t_1[4] = newChoice()
	var6 = newChoice()
	var6.UserPrompt.Text = "Goodbye!"
	var6.Size = UDim2.new(1, 28, 0, var1 + 12)
	var5 = Instance.new("Frame")
	var5.Name = "UserDialogArea"
	var5.Size = UDim2.new(0, var2, 0, 200)
	var5.Style = Enum.FrameStyle.ChatBlue
	var5.Visible = false
	
	for i, v in pairs(t_1) do
		v.RobloxLocked = true
		v.Parent = var5
	end
	var6.RobloxLocked = true
	var6.Parent = var5
	var5.RobloxLocked = true
	var5.Parent = p1
end

function presentDialogChoices(p2, p3, p4)
	-- upvalues: var7 (write), var8 (write), t_2 (write), t_1 (ref), var1 (write), gameTranslatorModule (ref), var6 (write), var5 (write), var2 (write), var15 (ref), localPlayer (write), var12 (write), touchEnabled (ref), var16 (write), var13 (write), var3 (write)
	if not var7 then return end
	var8 = p2
	local t = {}
	
	for i, v in pairs(p3) do
		if v:IsA("DialogChoice") then
			table.insert(t, v)
		end
	end
	table.sort(t, function(p5, p6)
		return p5.Name < p6.Name
	end)
	
	if #t == 0 then
		normalEndDialog()
		
		return
	end
	local var17 = 1
	local var18 = 0
	t_2 = {}
	
	for i_1, v_1 in pairs(t_1) do
		v_1.Visible = false
	end
	for i_1, v_2 in pairs(t) do
		if var17 <= #t_1 then
			t_1[var17].Size = UDim2.new(1, 28, 0, var1 * 3)
			gameTranslatorModule:TranslateAndRegister(t_1[var17].UserPrompt, v_2, v_2.UserDialog)
			local var19 = math.ceil(t_1[var17].UserPrompt.TextBounds.Y / var1) * var1 + 12
			t_1[var17].Position = UDim2.new(0, -11, 0, var18 + -8)
			t_1[var17].Size = UDim2.new(1, 28, 0, var19)
			t_1[var17].Visible = true
			t_2[t_1[var17]] = v_2
			var18 = var18 + var19 + 1
			var17 += 1
		end
	end
	var6.Size = UDim2.new(1, 28, 0, var1 * 3)
	var6.UserPrompt.Text = if p4.GoodbyeDialog == "" then "Goodbye!" else p4.GoodbyeDialog
	var6.Size = UDim2.new(1, 28, 0, math.ceil(var6.UserPrompt.TextBounds.Y / var1) * var1 + 12)
	var6.Position = UDim2.new(0, -11, 0, var18 + -8)
	var6.Visible = true
	
	if p4.GoodbyeChoiceActive then
		var5.Size = UDim2.new(0, var2, 0, var18 + var6.AbsoluteSize.Y + 34 + -16)
	else
		var6.Visible = false
		var5.Size = UDim2.new(0, var2, 0, var18 + 34 + -16)
	end
	var5.Position = UDim2.new(0, 20, 1, (-var5.Size.Y.Offset) - 20)
	
	if var15 then
		local touchGui = localPlayer.PlayerGui:FindFirstChild("TouchGui")
		
		if touchGui then
			var12 = touchGui:FindFirstChild("TouchControlFrame")
			
			if var12 then
				var12.Visible = false
			end
		end
		var5.Position = UDim2.new(0, 10, 1, -var5.Size.Y.Offset)
	elseif not touchEnabled and not var16.BottomLeftControl.Visible then
		var16.BottomLeftControl.Visible = true
		var13 = true
	end
	styleMainFrame(currentTone())
	var5.Visible = true
	
	if var3 then
		game:GetService("GuiService").SelectedCoreObject = t_1[1]
	end
end

function doDialog(p5)
	-- upvalues: var7 (write), contextActionService (ref), setDialogInUse (ref), chatFunc (ref)
	if p5.InitialPrompt == "" then
		warn("Can't start a dialog with an empty InitialPrompt")
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: p5 (ref)
		return p5.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	if p5.InUse and not (if ok then status else false) then
		return
	end
	var7 = p5
	p5.InUse = true
	contextActionService:BindCoreAction("Nothing", function() end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
	setDialogInUse:FireServer(p5, true)
	chatFunc(p5, p5.Parent, p5.InitialPrompt, getChatColor(p5.Tone))
	variableDelay(p5.InitialPrompt)
	presentDialogChoices(p5.Parent, p5:GetChildren(), p5)
end

function renewKillswitch(p5)
	-- upvalues: var9 (write), t_3 (ref), setDialogInUse (ref)
	if var9 then
		t_3[var9] = false
		var9 = nil
	end
	var9 = coroutine.create(function(p6)
		-- upvalues: t_3 (copy), setDialogInUse (copy), p5 (ref)
		wait(15)
		
		if p6 ~= nil then
			if t_3[p6] == nil then
				setDialogInUse:FireServer(p5, false)
				p5.InUse = false
			end
			t_3[p6] = nil
		end
	end)
	coroutine.resume(var9, var9)
end

function checkForLeaveArea()
	-- upvalues: var7 (write), localPlayer (write)
	while var7 do
		if var7.Parent and var7.ConversationDistance <= localPlayer:DistanceFromCharacter(var7.Parent.Position) then
			wanderDialog()
		end
		wait(1)
	end
end

function startDialog(p5)
	-- upvalues: rbxAnalyticsService (ref), localPlayer (write), t_4 (ref)
	if p5.Parent and p5.Parent:IsA("BasePart") then
		rbxAnalyticsService:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated")
		
		if p5.ConversationDistance <= localPlayer:DistanceFromCharacter(p5.Parent.Position) then
			showMessage("You are too far away to chat!", 300)
			
			return
		end
		for i, v in pairs(t_4) do
			if i and v then
				v.Enabled = false
			end
		end
		renewKillswitch(p5)
		delay(1, checkForLeaveArea)
		doDialog(p5)
	end
end

function removeDialog(p6)
	-- upvalues: t_4 (ref), t_5 (ref)
	if t_4[p6] then
		t_4[p6]:Destroy()
		t_4[p6] = nil
	end
	if t_5[p6] then
		t_5[p6]:disconnect()
		t_5[p6] = nil
	end
end

function addDialog(p6)
	-- upvalues: var4 (write), rbxAnalyticsService (ref), var10 (write), coreGuiService (ref), t_4 (ref), t_5 (ref), var7 (write)
	if p6.Parent then
		if p6.Parent:IsA("BasePart") and p6:IsDescendantOf(game.Workspace) then
			var4 = true
			rbxAnalyticsService:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId)
			local var20 = var10:clone()
			var20.Adornee = p6.Parent
			var20.RobloxLocked = true
			local var21 = not p6.InUse
			
			if not var21 then
				local ok, status = pcall(function()
					-- upvalues: p6 (ref)
					return p6.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
				end)
				var21 = if ok then status else false
			end
			var20.Enabled = var21
			var20.Parent = coreGuiService
			var20.Background.MouseButton1Click:connect(function()
				-- upvalues: p6 (ref)
				startDialog(p6)
			end)
			setChatNotificationTone(var20, p6.Purpose, p6.Tone)
			
			if game:GetEngineFeature("ClosestVisibleDialogAPI") then
				p6:SetGuiObject(var20)
			end
			t_4[p6] = var20
			t_5[p6] = p6.Changed:connect(function(p7)
				-- upvalues: p6 (ref), var20 (ref), var7 (copy)
				if p7 == "Parent" and p6.Parent then
					removeDialog(p6)
					addDialog(p6)
					
					return
				elseif p7 == "InUse" then
					local ok, status = pcall(function()
						-- upvalues: p6 (ref)
						return p6.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
					end)
					
					if if ok then status else false then
						var20.Enabled = var7 ~= p6
					else
						var20.Enabled = var7 == nil and not p6.InUse
					end
					if not p6.InUse then
						local var22 = p6
						local ok_1, status_1 = pcall(function()
							-- upvalues: var22 (ref)
							return var22.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
						end)
						
						if (if ok_1 then status_1 else false) or p6 ~= var7 then
							return
						else
							timeoutDialog()
							
							return
						end
					end
				elseif p7 == "Tone" or p7 == "Purpose" then
					setChatNotificationTone(var20, p6.Purpose, p6.Tone)
				end
			end)
			
			return
		else
			t_5[p6] = p6.Changed:connect(function(p7)
				-- upvalues: p6 (ref)
				if p7 == "Parent" and p6.Parent then
					removeDialog(p6)
					addDialog(p6)
				end
			end)
		end
	end
end

function onLoad()
	-- upvalues: var11 (write), var16 (write), touchEnabled (ref), var15 (ref)
	createChatNotificationGui()
	createMessageDialog()
	var11.RobloxLocked = true
	var11.Parent = var16
	var16:WaitForChild("BottomLeftControl")
	local dialogFrame = Instance.new("Frame")
	dialogFrame.Name = "DialogFrame"
	dialogFrame.Position = UDim2.new(0, 0, 0, 0)
	dialogFrame.Size = UDim2.new(0, 0, 0, 0)
	dialogFrame.BackgroundTransparency = 1
	dialogFrame.RobloxLocked = true
	game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", dialogFrame)
	
	if touchEnabled and not var15 then
		dialogFrame.Position = UDim2.new(0, 20, 0.5, 0)
		dialogFrame.Size = UDim2.new(0.25, 0, 0.1, 0)
		dialogFrame.Parent = var16
	elseif var15 then
		dialogFrame.Position = UDim2.new(0, 0, 0.9, -10)
		dialogFrame.Size = UDim2.new(0.25, 0, 0.1, 0)
		dialogFrame.Parent = var16
	else
		dialogFrame.Parent = var16.BottomLeftControl
	end
	initialize(dialogFrame)
	game:GetService("CollectionService").ItemAdded:Connect(function(p6)
		if p6:IsA("Dialog") then
			addDialog(p6)
		end
	end)
	game:GetService("CollectionService").ItemRemoved:Connect(function(p6)
		if p6:IsA("Dialog") then
			removeDialog(p6)
		end
	end)
	
	for i, v in pairs(game:GetService("CollectionService"):GetCollection("Dialog")) do
		if v:IsA("Dialog") then
			addDialog(v)
		end
	end
end

function getLocalHumanoidRootPart()
	-- upvalues: localPlayer (write)
	if localPlayer.Character then
		return localPlayer.Character:FindFirstChild("HumanoidRootPart")
	end
end

function dialogIsValid(p6)
	return p6 and (p6.Parent and p6.Parent:IsA("BasePart"))
end

local var20 = nil
local getClosestDialogToPosition = guiService.GetClosestDialogToPosition
game:GetService("RunService").Heartbeat:Connect(function()
	-- upvalues: getClosestDialogToPosition (ref), guiService (ref), var7 (write), localPlayer (write), var3 (write), var20 (write), t_4 (ref), contextActionService (ref)
	local positionClosestVisibleDialogToPosition = nil
	local var21 = getLocalHumanoidRootPart()
	
	if var21 then
		positionClosestVisibleDialogToPosition = getClosestDialogToPosition(guiService, var21.Position)
	end
	if getLocalHumanoidRootPart() and dialogIsValid(positionClosestVisibleDialogToPosition) and var7 == nil then
		local triggerDistance = positionClosestVisibleDialogToPosition.TriggerDistance
		local var22 = localPlayer:DistanceFromCharacter(positionClosestVisibleDialogToPosition.Parent.Position + positionClosestVisibleDialogToPosition.TriggerOffset)
		
		if triggerDistance ~= 0 and var22 < positionClosestVisibleDialogToPosition.ConversationDistance and var22 < triggerDistance then
			startDialog(positionClosestVisibleDialogToPosition)
		end
	end
	if var3 == true then
		if var21 and game:GetEngineFeature("ClosestVisibleDialogAPI") then
			positionClosestVisibleDialogToPosition = guiService:GetClosestVisibleDialogToPosition(var21.Position)
		end
		if positionClosestVisibleDialogToPosition ~= var20 then
			if t_4[var20] then
				t_4[var20].Background.ActivationButton.Visible = false
			end
			var20 = positionClosestVisibleDialogToPosition
			contextActionService:UnbindCoreAction("StartDialogAction")
			
			if positionClosestVisibleDialogToPosition ~= nil then
				contextActionService:BindCoreAction("StartDialogAction", function(_, p6, _)
					-- upvalues: positionClosestVisibleDialogToPosition (write)
					if p6 == Enum.UserInputState.Begin and positionClosestVisibleDialogToPosition and positionClosestVisibleDialogToPosition.Parent then
						startDialog(positionClosestVisibleDialogToPosition)
					end
				end, false, Enum.KeyCode.ButtonX)
				
				if t_4[positionClosestVisibleDialogToPosition] then
					t_4[positionClosestVisibleDialogToPosition].Background.ActivationButton.Visible = true
				end
			end
		end
	end
end)
local var21 = nil
guiService.Changed:connect(function(p6)
	-- upvalues: var21 (write), guiService (ref)
	if p6 == "SelectedCoreObject" then
		if var21 and var21:FindFirstChild("RBXchatDialogSelectionButton") then
			var21:FindFirstChild("RBXchatDialogSelectionButton").Visible = false
			var21.BackgroundTransparency = 1
		end
		var21 = guiService.SelectedCoreObject
		
		if var21 and var21:FindFirstChild("RBXchatDialogSelectionButton") then
			var21:FindFirstChild("RBXchatDialogSelectionButton").Visible = true
			var21.BackgroundTransparency = 0
		end
	end
end)
onLoad()