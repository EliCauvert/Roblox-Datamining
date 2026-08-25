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
local var3 = 350
local playersService = game:GetService("Players")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local var9 = false
local var10 = false
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.PlayerAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local character = localPlayer.Character

if not character or character.Parent == nil then
	character = localPlayer.CharacterAdded:Wait()
end
localPlayer.CharacterAdded:Connect(function(p0)
	-- upvalues: character (write)
	character = p0
end)

function setUsingGamepad(value, _)
	-- upvalues: var9 (write)
	if value.UserInputType == Enum.UserInputType.Gamepad1 or value.UserInputType == Enum.UserInputType.Gamepad2 or (value.UserInputType == Enum.UserInputType.Gamepad3 or value.UserInputType == Enum.UserInputType.Gamepad4) then
		var9 = true
		
		return
	end
	var9 = false
end

game:GetService("UserInputService").InputBegan:Connect(setUsingGamepad)
game:GetService("UserInputService").InputChanged:Connect(setUsingGamepad)
local var11 = nil
local t_1 = {}
local var13 = nil
local t_2 = {}
local var15 = nil
local var16 = nil
local t_3 = {}
local var18 = nil
local coreGuiService = game:GetService("CoreGui")
local _ = game:GetService("CorePackages")
local robloxGui = coreGuiService.RobloxGui
local setDialogInUse = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", 1e999)
local var21 = nil
local var22 = nil
local t_4 = {}
local t_5 = {}
local var25 = nil
local var26 = false
local _ = nil
local var27 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local var29 = require(robloxGui.Modules.Settings.Utility):IsSmallTouchScreen()

if var27 then
	size24 = Enum.FontSize.Size36
	var1 = 36
	var3 = 500
elseif var29 then
	size24 = Enum.FontSize.Size14
	var1 = 14
	var3 = 250
end
local var30 = if robloxGui:FindFirstChild("ControlFrame") then robloxGui.ControlFrame else robloxGui
local touchEnabled = game:GetService("UserInputService").TouchEnabled

local function _(p1)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	return if ok then status else false
end

function currentTone()
	-- upvalues: var15 (write)
	return if var15 then var15.Tone else Enum.DialogTone.Neutral
end

function createChatNotificationGui()
	-- upvalues: var21 (write), vector2 (ref), userInputService (ref)
	var21 = Instance.new("BillboardGui")
	var21.Name = "ChatNotificationGui"
	var21.ExtentsOffset = Vector3.new(0, 1, 0)
	var21.Size = UDim2.new(vector2.X / 31.5, 0, vector2.Y / 31.5, 0)
	var21.SizeOffset = Vector2.new(0, 0)
	var21.StudsOffset = Vector3.new(0, 3.700000047684, 0)
	var21.Enabled = true
	var21.RobloxLocked = true
	var21.Active = true
	local background = Instance.new("ImageButton")
	background.Name = "Background"
	background.Active = false
	background.BackgroundTransparency = 1
	background.Position = UDim2.new(0, 0, 0, 0)
	background.Size = UDim2.new(1, 0, 1, 0)
	background.Image = ""
	background.Parent = var21
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

function getChatColor(p2)
	if p2 == Enum.DialogTone.Neutral then
		return Enum.ChatColor.Blue
	elseif p2 == Enum.DialogTone.Friendly then
		return Enum.ChatColor.Green
	elseif p2 == Enum.DialogTone.Enemy then
		return Enum.ChatColor.Red
	end
end

function styleChoices()
	-- upvalues: t_1 (ref), var13 (write)
	for i, v in pairs(t_1) do
		v.BackgroundTransparency = 1
	end
	var13.BackgroundTransparency = 1
end

function styleMainFrame(p3)
	-- upvalues: var11 (write)
	if p3 == Enum.DialogTone.Neutral then
		var11.Style = Enum.FrameStyle.ChatBlue
	elseif p3 == Enum.DialogTone.Friendly then
		var11.Style = Enum.FrameStyle.ChatGreen
	elseif p3 == Enum.DialogTone.Enemy then
		var11.Style = Enum.FrameStyle.ChatRed
	end
	styleChoices()
end

function setChatNotificationTone(value, p4, p5)
	-- upvalues: t (ref), vector2 (ref)
	if p5 == Enum.DialogTone.Neutral then
		value.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png"
	elseif p5 == Enum.DialogTone.Friendly then
		value.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png"
	elseif p5 == Enum.DialogTone.Enemy then
		value.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png"
	end
	local var37, var38 = unpack(t[p4])
	local var39 = var38 / vector2
	value.Background.Icon.Size = UDim2.new(var39.X, 0, var39.Y, 0)
	value.Background.Icon.Position = UDim2.new(0.5 - var39.X / 2, 0, 0.4 - var39.Y / 2, 0)
	value.Background.Icon.Image = var37
end

function createMessageDialog()
	-- upvalues: var22 (write)
	var22 = Instance.new("Frame")
	var22.Name = "DialogScriptMessage"
	var22.Style = Enum.FrameStyle.Custom
	var22.BackgroundTransparency = 0.5
	var22.BackgroundColor3 = Color3.new(0.121568627451, 0.121568627451, 0.121568627451)
	var22.Visible = false
	var22.RobloxLocked = true
	local text = Instance.new("TextLabel")
	text.Name = "Text"
	text.Position = UDim2.new(0, 0, 0, -1)
	text.Size = UDim2.new(1, 0, 1, 0)
	text.FontSize = Enum.FontSize.Size14
	text.BackgroundTransparency = 1
	text.TextColor3 = Color3.new(1, 1, 1)
	text.Parent = var22
end

function showMessage(p6, p7)
	-- upvalues: var22 (write)
	var22.Text.Text = p6
	var22.Size = UDim2.new(0, p7, 0, 40)
	var22.Position = UDim2.new(0.5, -p7 / 2, 0.5, -40)
	var22.Visible = true
	wait(2)
	var22.Visible = false
end

function variableDelay(p8)
	wait(math.min(string.len(p8), 100) / 75 * 1.5 + 0.75)
end

function resetColor(value)
	value.BackgroundTransparency = 1
end

function wanderDialog()
	-- upvalues: var11 (write)
	var11.Visible = false
	endDialog()
	showMessage("Chat ended because you walked away", 350)
end

function timeoutDialog()
	-- upvalues: var11 (write)
	var11.Visible = false
	endDialog()
	showMessage("Chat ended because you didn't reply", 350)
end

function normalEndDialog()
	endDialog()
end

function endDialog()
	-- upvalues: var18 (write), t_3 (ref), var15 (write), setDialogInUse (ref), t_4 (ref), contextActionService (ref), var16 (write), var25 (write), var26 (write), var30 (write), guiService (ref), var11 (write)
	if var18 then
		t_3[var18] = false
		var18 = nil
	end
	var15 = nil
	
	if var15 and var15.InUse then
		delay(5, function()
			-- upvalues: setDialogInUse (copy), var15 (ref)
			setDialogInUse:FireServer(var15, false)
			var15.InUse = false
		end)
	end
	for i, v in pairs(t_4) do
		if i and v then
			v.Enabled = not i.InUse
		end
	end
	contextActionService:UnbindCoreAction("Nothing")
	var16 = nil
	
	if var25 then
		var25.Visible = true
	end
	if var26 then
		var30.BottomLeftControl.Visible = false
	end
	if guiService.SelectedCoreObject and guiService.SelectedCoreObject.Parent == var11 then
		guiService.SelectedCoreObject = nil
	end
end

function sanitizeMessage(p9)
	return if string.len(p9) == 0 then "..." else p9
end

local function chatFunc(p10, ...)
	local ok, status = pcall(function()
		-- upvalues: p10 (ref)
		return p10.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	if if ok then status else false then
		game:GetService("Chat"):ChatLocal(...)
		
		return
	end
	game:GetService("Chat"):Chat(...)
end

function selectChoice(p11)
	-- upvalues: var15 (write), character (write), var11 (write), var13 (write), chatFunc (ref), t_2 (write), localPlayer (write), var16 (write)
	if not var15 then return end
	renewKillswitch(var15)
	
	if not character:FindFirstAncestorOfClass("Workspace") then return end
	var11.Visible = false
	
	if p11 == var13 then
		chatFunc(var15, character, var13.UserPrompt.Text, getChatColor(currentTone()))
		normalEndDialog()
		
		return
	end
	local var41 = t_2[p11]
	chatFunc(var15, character, sanitizeMessage(var41.UserDialog), getChatColor(currentTone()))
	wait(1)
	
	if var15 then
		var15:SignalDialogChoiceSelected(localPlayer, var41)
		chatFunc(var15, var16, sanitizeMessage(var41.ResponseDialog), getChatColor(currentTone()))
		variableDelay(var41.ResponseDialog)
		presentDialogChoices(var16, var41:GetChildren(), var41)
		
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

function initialize(p12)
	-- upvalues: t_1 (ref), var13 (write), var1 (write), var11 (write), var3 (write)
	t_1[1] = newChoice()
	t_1[2] = newChoice()
	t_1[3] = newChoice()
	t_1[4] = newChoice()
	var13 = newChoice()
	var13.UserPrompt.Text = "Goodbye!"
	var13.Size = UDim2.new(1, 28, 0, var1 + 12)
	var11 = Instance.new("Frame")
	var11.Name = "UserDialogArea"
	var11.Size = UDim2.new(0, var3, 0, 200)
	var11.Style = Enum.FrameStyle.ChatBlue
	var11.Visible = false
	
	for i, v in pairs(t_1) do
		v.RobloxLocked = true
		v.Parent = var11
	end
	var13.RobloxLocked = true
	var13.Parent = var11
	var11.RobloxLocked = true
	var11.Parent = p12
end

function presentDialogChoices(p13, p14, p15)
	-- upvalues: var15 (write), var16 (write), t_2 (write), t_1 (ref), var1 (write), gameTranslatorModule (ref), var13 (write), var11 (write), var3 (write), var29 (ref), localPlayer (write), var25 (write), touchEnabled (ref), var30 (write), var26 (write), var9 (write)
	if not var15 then return end
	var16 = p13
	local t = {}
	
	for i, v in pairs(p14) do
		if v:IsA("DialogChoice") then
			table.insert(t, v)
		end
	end
	table.sort(t, function(p16, p17)
		return p16.Name < p17.Name
	end)
	
	if #t == 0 then
		normalEndDialog()
		
		return
	end
	local var47 = 1
	local var48 = 0
	t_2 = {}
	
	for i_1, v_1 in pairs(t_1) do
		v_1.Visible = false
	end
	for i_1, v_2 in pairs(t) do
		if var47 <= #t_1 then
			t_1[var47].Size = UDim2.new(1, 28, 0, var1 * 3)
			gameTranslatorModule:TranslateAndRegister(t_1[var47].UserPrompt, v_2, v_2.UserDialog)
			local var50 = math.ceil(t_1[var47].UserPrompt.TextBounds.Y / var1) * var1 + 12
			t_1[var47].Position = UDim2.new(0, -11, 0, var48 + -8)
			t_1[var47].Size = UDim2.new(1, 28, 0, var50)
			t_1[var47].Visible = true
			t_2[t_1[var47]] = v_2
			var48 = var48 + var50 + 1
			var47 += 1
		end
	end
	var13.Size = UDim2.new(1, 28, 0, var1 * 3)
	var13.UserPrompt.Text = if p15.GoodbyeDialog == "" then "Goodbye!" else p15.GoodbyeDialog
	var13.Size = UDim2.new(1, 28, 0, math.ceil(var13.UserPrompt.TextBounds.Y / var1) * var1 + 12)
	var13.Position = UDim2.new(0, -11, 0, var48 + -8)
	var13.Visible = true
	
	if p15.GoodbyeChoiceActive then
		var11.Size = UDim2.new(0, var3, 0, var48 + var13.AbsoluteSize.Y + 34 + -16)
	else
		var13.Visible = false
		var11.Size = UDim2.new(0, var3, 0, var48 + 34 + -16)
	end
	var11.Position = UDim2.new(0, 20, 1, (-var11.Size.Y.Offset) - 20)
	
	if var29 then
		local touchGui = localPlayer.PlayerGui:FindFirstChild("TouchGui")
		
		if touchGui then
			var25 = touchGui:FindFirstChild("TouchControlFrame")
			
			if var25 then
				var25.Visible = false
			end
		end
		var11.Position = UDim2.new(0, 10, 1, -var11.Size.Y.Offset)
	elseif not touchEnabled and not var30.BottomLeftControl.Visible then
		var30.BottomLeftControl.Visible = true
		var26 = true
	end
	styleMainFrame(currentTone())
	var11.Visible = true
	
	if var9 then
		game:GetService("GuiService").SelectedCoreObject = t_1[1]
	end
end

function doDialog(p18)
	-- upvalues: var15 (write), contextActionService (ref), setDialogInUse (ref), chatFunc (ref)
	if p18.InitialPrompt == "" then
		warn("Can't start a dialog with an empty InitialPrompt")
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: p18 (ref)
		return p18.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
	end)
	
	if p18.InUse and not (if ok then status else false) then
		return
	end
	var15 = p18
	p18.InUse = true
	contextActionService:BindCoreAction("Nothing", function() end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
	setDialogInUse:FireServer(p18, true)
	chatFunc(p18, p18.Parent, p18.InitialPrompt, getChatColor(p18.Tone))
	variableDelay(p18.InitialPrompt)
	presentDialogChoices(p18.Parent, p18:GetChildren(), p18)
end

function renewKillswitch(p19)
	-- upvalues: var18 (write), t_3 (ref), setDialogInUse (ref)
	if var18 then
		t_3[var18] = false
		var18 = nil
	end
	var18 = coroutine.create(function(p20)
		-- upvalues: t_3 (copy), setDialogInUse (copy), p19 (ref)
		wait(15)
		
		if p20 ~= nil then
			if t_3[p20] == nil then
				setDialogInUse:FireServer(p19, false)
				p19.InUse = false
			end
			t_3[p20] = nil
		end
	end)
	coroutine.resume(var18, var18)
end

function checkForLeaveArea()
	-- upvalues: var15 (write), localPlayer (write)
	while var15 do
		if var15.Parent and var15.ConversationDistance <= localPlayer:DistanceFromCharacter(var15.Parent.Position) then
			wanderDialog()
		end
		wait(1)
	end
end

function startDialog(p21)
	-- upvalues: rbxAnalyticsService (ref), localPlayer (write), t_4 (ref)
	if p21.Parent and p21.Parent:IsA("BasePart") then
		rbxAnalyticsService:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated")
		
		if p21.ConversationDistance <= localPlayer:DistanceFromCharacter(p21.Parent.Position) then
			showMessage("You are too far away to chat!", 300)
			
			return
		end
		for i, v in pairs(t_4) do
			if i and v then
				v.Enabled = false
			end
		end
		renewKillswitch(p21)
		delay(1, checkForLeaveArea)
		doDialog(p21)
	end
end

function removeDialog(p22)
	-- upvalues: t_4 (ref), t_5 (ref)
	if t_4[p22] then
		t_4[p22]:Destroy()
		t_4[p22] = nil
	end
	if t_5[p22] then
		t_5[p22]:disconnect()
		t_5[p22] = nil
	end
end

function addDialog(p23)
	-- upvalues: var10 (write), rbxAnalyticsService (ref), var21 (write), coreGuiService (ref), t_4 (ref), t_5 (ref), var15 (write)
	if p23.Parent then
		if p23.Parent:IsA("BasePart") and p23:IsDescendantOf(game.Workspace) then
			var10 = true
			rbxAnalyticsService:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId)
			local var51 = var21:clone()
			var51.Adornee = p23.Parent
			var51.RobloxLocked = true
			local var52 = not p23.InUse
			
			if not var52 then
				local ok, status = pcall(function()
					-- upvalues: p23 (ref)
					return p23.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
				end)
				var52 = if ok then status else false
			end
			var51.Enabled = var52
			var51.Parent = coreGuiService
			var51.Background.MouseButton1Click:connect(function()
				-- upvalues: p23 (ref)
				startDialog(p23)
			end)
			setChatNotificationTone(var51, p23.Purpose, p23.Tone)
			
			if game:GetEngineFeature("ClosestVisibleDialogAPI") then
				p23:SetGuiObject(var51)
			end
			t_4[p23] = var51
			t_5[p23] = p23.Changed:connect(function(p24)
				-- upvalues: p23 (ref), var51 (ref), var15 (copy)
				if p24 == "Parent" and p23.Parent then
					removeDialog(p23)
					addDialog(p23)
					
					return
				elseif p24 == "InUse" then
					local ok, status = pcall(function()
						-- upvalues: p23 (ref)
						return p23.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
					end)
					
					if if ok then status else false then
						var51.Enabled = var15 ~= p23
					else
						var51.Enabled = var15 == nil and not p23.InUse
					end
					if not p23.InUse then
						local var53 = p23
						local ok_1, status_1 = pcall(function()
							-- upvalues: var53 (ref)
							return var53.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers
						end)
						
						if (if ok_1 then status_1 else false) or p23 ~= var15 then
							return
						else
							timeoutDialog()
							
							return
						end
					end
				elseif p24 == "Tone" or p24 == "Purpose" then
					setChatNotificationTone(var51, p23.Purpose, p23.Tone)
				end
			end)
			
			return
		else
			t_5[p23] = p23.Changed:connect(function(p25)
				-- upvalues: p23 (ref)
				if p25 == "Parent" and p23.Parent then
					removeDialog(p23)
					addDialog(p23)
				end
			end)
		end
	end
end

function onLoad()
	-- upvalues: var22 (write), var30 (write), touchEnabled (ref), var29 (ref)
	createChatNotificationGui()
	createMessageDialog()
	var22.RobloxLocked = true
	var22.Parent = var30
	var30:WaitForChild("BottomLeftControl")
	local dialogFrame = Instance.new("Frame")
	dialogFrame.Name = "DialogFrame"
	dialogFrame.Position = UDim2.new(0, 0, 0, 0)
	dialogFrame.Size = UDim2.new(0, 0, 0, 0)
	dialogFrame.BackgroundTransparency = 1
	dialogFrame.RobloxLocked = true
	game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", dialogFrame)
	
	if touchEnabled and not var29 then
		dialogFrame.Position = UDim2.new(0, 20, 0.5, 0)
		dialogFrame.Size = UDim2.new(0.25, 0, 0.1, 0)
		dialogFrame.Parent = var30
	elseif var29 then
		dialogFrame.Position = UDim2.new(0, 0, 0.9, -10)
		dialogFrame.Size = UDim2.new(0.25, 0, 0.1, 0)
		dialogFrame.Parent = var30
	else
		dialogFrame.Parent = var30.BottomLeftControl
	end
	initialize(dialogFrame)
	game:GetService("CollectionService").ItemAdded:Connect(function(p26)
		if p26:IsA("Dialog") then
			addDialog(p26)
		end
	end)
	game:GetService("CollectionService").ItemRemoved:Connect(function(p27)
		if p27:IsA("Dialog") then
			removeDialog(p27)
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

function dialogIsValid(p28)
	return p28 and (p28.Parent and p28.Parent:IsA("BasePart"))
end

local var32 = nil
local getClosestDialogToPosition = guiService.GetClosestDialogToPosition
game:GetService("RunService").Heartbeat:Connect(function()
	-- upvalues: getClosestDialogToPosition (ref), guiService (ref), var15 (write), localPlayer (write), var9 (write), var32 (write), t_4 (ref), contextActionService (ref)
	local positionClosestVisibleDialogToPosition = nil
	local var56 = getLocalHumanoidRootPart()
	
	if var56 then
		positionClosestVisibleDialogToPosition = getClosestDialogToPosition(guiService, var56.Position)
	end
	if getLocalHumanoidRootPart() and dialogIsValid(positionClosestVisibleDialogToPosition) and var15 == nil then
		local triggerDistance = positionClosestVisibleDialogToPosition.TriggerDistance
		local var57 = localPlayer:DistanceFromCharacter(positionClosestVisibleDialogToPosition.Parent.Position + positionClosestVisibleDialogToPosition.TriggerOffset)
		
		if triggerDistance ~= 0 and var57 < positionClosestVisibleDialogToPosition.ConversationDistance and var57 < triggerDistance then
			startDialog(positionClosestVisibleDialogToPosition)
		end
	end
	if var9 == true then
		if var56 and game:GetEngineFeature("ClosestVisibleDialogAPI") then
			positionClosestVisibleDialogToPosition = guiService:GetClosestVisibleDialogToPosition(var56.Position)
		end
		if positionClosestVisibleDialogToPosition ~= var32 then
			if t_4[var32] then
				t_4[var32].Background.ActivationButton.Visible = false
			end
			var32 = positionClosestVisibleDialogToPosition
			contextActionService:UnbindCoreAction("StartDialogAction")
			
			if positionClosestVisibleDialogToPosition ~= nil then
				contextActionService:BindCoreAction("StartDialogAction", function(_, p29, _)
					-- upvalues: positionClosestVisibleDialogToPosition (write)
					if p29 == Enum.UserInputState.Begin and positionClosestVisibleDialogToPosition and positionClosestVisibleDialogToPosition.Parent then
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
local var33 = nil
guiService.Changed:connect(function(p30)
	-- upvalues: var33 (write), guiService (ref)
	if p30 == "SelectedCoreObject" then
		if var33 and var33:FindFirstChild("RBXchatDialogSelectionButton") then
			var33:FindFirstChild("RBXchatDialogSelectionButton").Visible = false
			var33.BackgroundTransparency = 1
		end
		var33 = guiService.SelectedCoreObject
		
		if var33 and var33:FindFirstChild("RBXchatDialogSelectionButton") then
			var33:FindFirstChild("RBXchatDialogSelectionButton").Visible = true
			var33.BackgroundTransparency = 0
		end
	end
end)
onLoad()