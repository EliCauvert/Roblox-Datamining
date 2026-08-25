local playersService = game:GetService("Players")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local chatService = game:GetService("Chat")
local textService = game:GetService("TextService")
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local playerGui = localPlayer:WaitForChild("PlayerGui")
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble")
end)
local status_1 = ok and status
local _ = nil
local ok_1, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText")
end)
local status_2_1 = ok_1 and status_2
local _ = nil
local ok_2, status_3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta")
end)
local status_3_1 = ok_2 and status_3
local _ = nil
local ok_3, status_4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap")
end)
local status_4_1 = ok_3 and status_4

local function _(p0)
	return utf8.len(utf8.nfcnormalize(p0))
end

local sourceSans = Enum.Font.SourceSans
local size24 = Enum.FontSize.Size24
local var9 = 128 - utf8.len(utf8.nfcnormalize("...")) - 1
local t = { WHITE = "dub", BLUE = "blu", GREEN = "gre", RED = "red" }
local bubbleChat = Instance.new("ScreenGui")
bubbleChat.Name = "BubbleChat"
bubbleChat.ResetOnSpawn = false
bubbleChat.Parent = playerGui

local _ = function(startValue, endValue, alpha)
	return endValue + (alpha - endValue) * math.min(utf8.len(utf8.nfcnormalize(startValue)) / 75, 1)
end

local function createFifo()
	local t = { data = {} }
	local bindableEvent = Instance.new("BindableEvent")
	t.Emptied = bindableEvent.Event
	
	function t.Size(_)
		-- upvalues: t (ref)
		return #t.data
	end
	
	function t.Empty(_)
		-- upvalues: t (ref)
		return t:Size() <= 0
	end
	
	function t.PopFront(_)
		-- upvalues: t (ref), bindableEvent (ref)
		table.remove(t.data, 1)
		
		if t:Empty() then
			bindableEvent:Fire()
		end
	end
	
	function t.Front(_)
		-- upvalues: t (ref)
		return t.data[1]
	end
	
	function t.Get(_, p1)
		-- upvalues: t (ref)
		return t.data[p1]
	end
	
	function t.PushBack(_, p2)
		-- upvalues: t (ref)
		table.insert(t.data, p2)
	end
	
	function t.GetData(_)
		-- upvalues: t (ref)
		return t.data
	end
	
	return t
end

local _ = function()
	-- upvalues: createFifo (ref)
	return { Fifo = createFifo(), BillboardGui = nil }
end

local function createMap()
	-- upvalues: createFifo (ref)
	local t = { data = {} }
	local var25 = 0
	
	function t.Size(_)
		-- upvalues: var25 (write)
		return var25
	end
	
	function t.Erase(_, p3)
		-- upvalues: t (ref), var25 (write)
		if t.data[p3] then
			var25 -= 1
		end
		t.data[p3] = nil
	end
	
	function t.Set(_, p4, p5)
		-- upvalues: t (ref), var25 (write)
		t.data[p4] = p5
		
		if p5 then
			var25 += 1
		end
	end
	
	function t.Get(_, p6)
		-- upvalues: t (ref), createFifo (copy)
		if not p6 then return end
		if not t.data[p6] then
			t.data[p6] = { Fifo = createFifo(), BillboardGui = nil }
			local emptiedConnection = nil
			emptiedConnection = t.data[p6].Fifo.Emptied:connect(function()
				-- upvalues: emptiedConnection (write), t (copy), p6 (ref)
				emptiedConnection:disconnect()
				t:Erase(p6)
			end)
		end
		return t.data[p6]
	end
	
	function t.GetData(_)
		-- upvalues: t (ref)
		return t.data
	end
	
	return t
end

local function createChatLine(p7, p8, p9)
	local t = {
		ComputeBubbleLifetime = function(_, p10, p11)
			return if p11 then 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(p10)) / 75, 1) else 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(p10)) / 75, 1)
		end,
		Origin = nil,
		RenderBubble = nil,
		Message = p7
	}
	t.BubbleDieDelay = t:ComputeBubbleLifetime(p7, p9)
	t.BubbleColor = p8
	t.IsLocalPlayer = p9
	
	return t
end

local _ = function(p12, p13, p14)
	-- upvalues: createChatLine (ref)
	local var28 = createChatLine(p13, "dub", p14)
	
	if p12 then
		var28.User = p12.Name
		var28.Origin = p12.Character
	end
	return var28
end

local _ = function(p15, p16, p17, p18)
	-- upvalues: createChatLine (ref)
	local var29 = createChatLine(p16, p18, p17)
	var29.Origin = p15
	
	return var29
end

function createChatBubbleMain(p19, p20)
	local chatBubble = Instance.new("ImageLabel")
	chatBubble.Name = "ChatBubble"
	chatBubble.ScaleType = Enum.ScaleType.Slice
	chatBubble.SliceCenter = p20
	chatBubble.Image = "rbxasset://textures/" .. tostring(p19) .. ".png"
	chatBubble.BackgroundTransparency = 1
	chatBubble.BorderSizePixel = 0
	chatBubble.Size = UDim2.new(1, 0, 1, 0)
	chatBubble.Position = UDim2.new(0, 0, 0, 0)
	
	return chatBubble
end

function createChatBubbleTail(p21, p22)
	local chatBubbleTail = Instance.new("ImageLabel")
	chatBubbleTail.Name = "ChatBubbleTail"
	chatBubbleTail.Image = "rbxasset://textures/ui/dialog_tail.png"
	chatBubbleTail.BackgroundTransparency = 1
	chatBubbleTail.BorderSizePixel = 0
	chatBubbleTail.Position = p21
	chatBubbleTail.Size = p22
	
	return chatBubbleTail
end

function createChatBubbleWithTail(p23, p24, p25, p26)
	local var32 = createChatBubbleMain(p23, p26)
	createChatBubbleTail(p24, p25).Parent = var32
	
	return var32
end

function createScaledChatBubbleWithTail(p27, p28, p29, p30)
	local var33 = createChatBubbleMain(p27, p30)
	local chatBubbleTailFrame = Instance.new("Frame")
	chatBubbleTailFrame.Name = "ChatBubbleTailFrame"
	chatBubbleTailFrame.BackgroundTransparency = 1
	chatBubbleTailFrame.SizeConstraint = Enum.SizeConstraint.RelativeXX
	chatBubbleTailFrame.Position = UDim2.new(0.5, 0, 1, 0)
	chatBubbleTailFrame.Size = UDim2.new(p28, 0, p28, 0)
	chatBubbleTailFrame.Parent = var33
	createChatBubbleTail(p29, UDim2.new(1, 0, 0.5, 0)).Parent = chatBubbleTailFrame
	
	return var33
end

function createChatImposter(p31, p32, p33)
	local dialogPlaceholder = Instance.new("ImageLabel")
	dialogPlaceholder.Name = "DialogPlaceholder"
	dialogPlaceholder.Image = "rbxasset://textures/" .. tostring(p31) .. ".png"
	dialogPlaceholder.BackgroundTransparency = 1
	dialogPlaceholder.BorderSizePixel = 0
	dialogPlaceholder.Position = UDim2.new(0, 0, -1.25, 0)
	dialogPlaceholder.Size = UDim2.new(1, 0, 1, 0)
	local dotDotDot = Instance.new("ImageLabel")
	dotDotDot.Name = "DotDotDot"
	dotDotDot.Image = "rbxasset://textures/" .. tostring(p32) .. ".png"
	dotDotDot.BackgroundTransparency = 1
	dotDotDot.BorderSizePixel = 0
	dotDotDot.Position = UDim2.new(0.001, 0, p33, 0)
	dotDotDot.Size = UDim2.new(1, 0, 0.7, 0)
	dotDotDot.Parent = dialogPlaceholder
	
	return dialogPlaceholder
end

local t_1 = {
	ChatBubble = {},
	ChatBubbleWithTail = {},
	ScalingChatBubbleWithTail = {},
	CharacterSortedMsg = createMap()
}

local function initChatBubbleType(p34, p35, _, p36, p37)
	-- upvalues: t_1 (ref)
	t_1.ChatBubble[p34] = createChatBubbleMain(p35, p37)
	t_1.ChatBubbleWithTail[p34] = createChatBubbleWithTail(p35, UDim2.new(0.5, -14, 1, if p36 then -1 else 0), UDim2.new(0, 30, 0, 14), p37)
	t_1.ScalingChatBubbleWithTail[p34] = createScaledChatBubbleWithTail(p35, 0.5, UDim2.new(-0.5, 0, 0, if p36 then -1 else 0), p37)
end

initChatBubbleType("dub", "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15))
initChatBubbleType("blu", "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33))
initChatBubbleType("red", "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33))
initChatBubbleType("gre", "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33))

function t_1.SanitizeChatLine(_, p38)
	-- upvalues: var9 (ref)
	return if var9 < utf8.len(utf8.nfcnormalize(p38)) then string.sub(p38, 1, utf8.offset(p38, var9 + utf8.len(utf8.nfcnormalize("...")) + 1) - 1) else p38
end

local function createBillboardInstance(p39)
	-- upvalues: bubbleChat (ref), t_1 (ref)
	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Adornee = p39
	billboardGui.Size = UDim2.new(0, 400, 0, 250)
	billboardGui.StudsOffset = Vector3.new(0, 1.5, 2)
	billboardGui.Parent = bubbleChat
	local billboardFrame = Instance.new("Frame")
	billboardFrame.Name = "BillboardFrame"
	billboardFrame.Size = UDim2.new(1, 0, 1, 0)
	billboardFrame.Position = UDim2.new(0, 0, -0.5, 0)
	billboardFrame.BackgroundTransparency = 1
	billboardFrame.Parent = billboardGui
	local childRemovedConnection = nil
	childRemovedConnection = billboardFrame.ChildRemoved:connect(function()
		-- upvalues: billboardFrame (ref), childRemovedConnection (write), billboardGui (ref)
		if #billboardFrame:GetChildren() <= 1 then
			childRemovedConnection:disconnect()
			billboardGui:Destroy()
		end
	end)
	t_1:CreateSmallTalkBubble("dub").Parent = billboardFrame
	
	return billboardGui
end

function t_1.CreateBillboardGuiHelper(_, p40, p41)
	-- upvalues: t_1 (ref), createBillboardInstance (ref)
	if p40 and not t_1.CharacterSortedMsg:Get(p40).BillboardGui then
		if not p41 and p40:IsA("BasePart") then
			t_1.CharacterSortedMsg:Get(p40).BillboardGui = createBillboardInstance(p40)
			
			return
		elseif p40:IsA("Model") then
			local head = p40:FindFirstChild("Head")
			
			if head and head:IsA("BasePart") then
				t_1.CharacterSortedMsg:Get(p40).BillboardGui = createBillboardInstance(head)
			end
		end
	end
end

local _ = function(p42)
	return if p42 then (p42.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude else 100000
end

local _ = function(p43)
	-- upvalues: playersService (ref)
	if p43 and playersService.LocalPlayer.Character then
		return p43:IsDescendantOf(playersService.LocalPlayer.Character)
	end
end

function t_1.SetBillboardLODNear(_, p44)
	-- upvalues: playersService (ref)
	local adornee = p44.Adornee
	local var41 = if adornee and playersService.LocalPlayer.Character then adornee:IsDescendantOf(playersService.LocalPlayer.Character) else nil
	p44.Size = UDim2.new(0, 400, 0, 250)
	p44.StudsOffset = Vector3.new(0, if var41 then 1.5 else 2.5, if var41 then 2 else 0.1)
	p44.Enabled = true
	adornee = p44.BillboardFrame:GetChildren()
	
	for i = 1, #adornee do
		adornee[i].Visible = true
	end
	p44.BillboardFrame.SmallTalkBubble.Visible = false
end

function t_1.SetBillboardLODDistant(_, p45)
	-- upvalues: playersService (ref)
	local adornee = p45.Adornee
	local var42 = if adornee and playersService.LocalPlayer.Character then adornee:IsDescendantOf(playersService.LocalPlayer.Character) else nil
	p45.Size = UDim2.new(4, 0, 3, 0)
	p45.StudsOffset = Vector3.new(0, 3, if var42 then 2 else 0.1)
	p45.Enabled = true
	adornee = p45.BillboardFrame:GetChildren()
	
	for i = 1, #adornee do
		adornee[i].Visible = false
	end
	p45.BillboardFrame.SmallTalkBubble.Visible = true
end

function t_1.SetBillboardLODVeryFar(_, p46)
	p46.Enabled = false
end

function t_1.SetBillboardGuiLOD(_, p47, p48)
	-- upvalues: t_1 (ref)
	if not p48 then return end
	if p48:IsA("Model") then
		local head = p48:FindFirstChild("Head")
		p48 = head or p48.PrimaryPart
	end
	local var44 = if not p48 then 100000 else (p48.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude
	
	if var44 < 65 then
		t_1:SetBillboardLODNear(p47)
		
		return
	elseif var44 >= 65 and var44 < 100 then
		t_1:SetBillboardLODDistant(p47)
		
		return
	end
	t_1:SetBillboardLODVeryFar(p47)
end

function t_1.CameraCFrameChanged(_)
	-- upvalues: t_1 (ref)
	for i, v in pairs(t_1.CharacterSortedMsg:GetData()) do
		local billboardGui = v.BillboardGui
		
		if billboardGui then
			t_1:SetBillboardGuiLOD(billboardGui, i)
		end
	end
end

function t_1.CreateBubbleText(_, p49, p50)
	-- upvalues: status_2_1 (write), sourceSans (ref), size24 (ref)
	local bubbleText = Instance.new("TextLabel")
	bubbleText.Name = "BubbleText"
	bubbleText.BackgroundTransparency = 1
	
	if status_2_1 then
		bubbleText.Size = UDim2.fromScale(1, 1)
	else
		bubbleText.Position = UDim2.new(0, 15, 0, 0)
		bubbleText.Size = UDim2.new(1, -30, 1, 0)
	end
	bubbleText.Font = sourceSans
	bubbleText.ClipsDescendants = true
	bubbleText.TextWrapped = true
	bubbleText.FontSize = size24
	bubbleText.Text = p49
	bubbleText.Visible = false
	bubbleText.AutoLocalize = p50
	
	if status_2_1 then
		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingTop = UDim.new(0, 12)
		UIPadding.PaddingRight = UDim.new(0, 12)
		UIPadding.PaddingBottom = UDim.new(0, 12)
		UIPadding.PaddingLeft = UDim.new(0, 12)
		UIPadding.Parent = bubbleText
	end
	return bubbleText
end

function t_1.CreateSmallTalkBubble(_, p51)
	-- upvalues: t_1 (ref)
	local smallTalkBubble = t_1.ScalingChatBubbleWithTail[p51]:Clone()
	smallTalkBubble.Name = "SmallTalkBubble"
	smallTalkBubble.AnchorPoint = Vector2.new(0, 0.5)
	smallTalkBubble.Position = UDim2.new(0, 0, 0.5, 0)
	smallTalkBubble.Visible = false
	local var48 = t_1:CreateBubbleText("...")
	var48.TextScaled = true
	var48.TextWrapped = false
	var48.Visible = true
	var48.Parent = smallTalkBubble
	
	return smallTalkBubble
end

function t_1.UpdateChatLinesForOrigin(_, p52, p53)
	-- upvalues: t_1 (ref)
	local fifo = t_1.CharacterSortedMsg:Get(p52).Fifo
	local var49 = fifo:Size()
	local data = fifo:GetData()
	
	if #data <= 1 then return end
	for i = #data - 1, 1, -1 do
		local renderBubble = data[i].RenderBubble
		
		if renderBubble then
			if var49 - i + 1 > 1 then
				local chatBubbleTail = renderBubble:FindFirstChild("ChatBubbleTail")
				
				if chatBubbleTail then
					chatBubbleTail:Destroy()
				end
				local bubbleText = renderBubble:FindFirstChild("BubbleText")
				
				if bubbleText then
					bubbleText.TextTransparency = 0.5
				end
			end
			renderBubble:TweenPosition(UDim2.new(renderBubble.Position.X.Scale, renderBubble.Position.X.Offset, 1, p53 - renderBubble.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true)
			p53 = p53 - renderBubble.Size.Y.Offset - 14
		end
		return
	end
end

function t_1.DestroyBubble(_, p54, p55)
	if not p54 then return end
	if p54:Empty() then return end
	local renderBubble = p54:Front().RenderBubble
	
	if renderBubble then
		spawn(function()
			-- upvalues: p54 (ref), p55 (ref), renderBubble (write)
			while p54:Front().RenderBubble ~= p55 do
				wait()
			end
			renderBubble = p54:Front().RenderBubble
			local _ = 0
			local bubbleText = renderBubble:FindFirstChild("BubbleText")
			local chatBubbleTail = renderBubble:FindFirstChild("ChatBubbleTail")
			while renderBubble and renderBubble.ImageTransparency < 1 do
				local var55 = wait()
				
				if not renderBubble then continue end
				local var56 = var55 * 1.5
				renderBubble.ImageTransparency += var56
				
				if bubbleText then
					bubbleText.TextTransparency += var56
				end
				if chatBubbleTail then
					chatBubbleTail.ImageTransparency += var56
				end
			end
			if renderBubble then
				renderBubble:Destroy()
				p54:PopFront()
			end
		end)
		
		return
	end
	p54:PopFront()
end

function t_1.CreateChatLineRender(_, p56, p57, p58, p59, p60)
	-- upvalues: t_1 (ref), textService (ref), sourceSans (ref), status_2_1 (write)
	if not p56 then return end
	if not t_1.CharacterSortedMsg:Get(p56).BillboardGui then
		t_1:CreateBillboardGuiHelper(p56, p58)
	end
	local billboardGui = t_1.CharacterSortedMsg:Get(p56).BillboardGui
	
	if billboardGui then
		local var57 = t_1.ChatBubbleWithTail[p57.BubbleColor]:Clone()
		var57.Visible = false
		local message = t_1:CreateBubbleText(p57.Message, p60)
		message.Parent = var57
		var57.Parent = billboardGui.BillboardFrame
		p57.RenderBubble = var57
		local textTextSize = textService:GetTextSize(message.Text, 24, sourceSans, Vector2.new(400, 250))
		local var60 = textTextSize.Y / 24
		
		if status_2_1 then
			local ceiled = math.ceil(textTextSize.X + 24)
			local var62 = var60 * 34
			var57.Size = UDim2.fromOffset(0, 0)
			var57.Position = UDim2.fromScale(0.5, 1)
			var57:TweenSizeAndPosition(UDim2.fromOffset(ceiled, var62), UDim2.new(0.5, -ceiled / 2, 1, -var62), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				-- upvalues: message (ref)
				message.Visible = true
			end)
			t_1:SetBillboardGuiLOD(billboardGui, p57.Origin)
			t_1:UpdateChatLinesForOrigin(p57.Origin, -var62)
		else
			local maxValue = math.max((textTextSize.X + 30) / 400, 0.1)
			var57.Size = UDim2.new(0, 0, 0, 0)
			var57.Position = UDim2.new(0.5, 0, 1, 0)
			local var64 = var60 * 34
			var57:TweenSizeAndPosition(UDim2.new(maxValue, 0, 0, var64), UDim2.new((1 - maxValue) / 2, 0, 1, -var64), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				-- upvalues: message (ref)
				message.Visible = true
			end)
			t_1:SetBillboardGuiLOD(billboardGui, p57.Origin)
			t_1:UpdateChatLinesForOrigin(p57.Origin, -var64)
		end
		delay(p57.BubbleDieDelay, function()
			-- upvalues: t_1 (copy), p59 (ref), var57 (ref)
			t_1:DestroyBubble(p59, var57)
		end)
	end
end

function t_1.OnPlayerChatMessage(_, p61, p62, _)
	-- upvalues: t_1 (ref), playersService (ref), createChatLine (ref), t (ref)
	if not t_1:BubbleChatEnabled() then return end
	local localPlayer = playersService.LocalPlayer
	local var65 = createChatLine(t_1:SanitizeChatLine(p62), t.WHITE, not (localPlayer ~= nil and p61 ~= localPlayer))
	
	if p61 then
		var65.User = p61.Name
		var65.Origin = p61.Character
	end
	if p61 and var65.Origin then
		local fifo = t_1.CharacterSortedMsg:Get(var65.Origin).Fifo
		fifo:PushBack(var65)
		t_1:CreateChatLineRender(p61.Character, var65, true, fifo, false)
	end
end

function t_1.OnGameChatMessage(_, p63, p64, p65)
	-- upvalues: status_3_1 (write), status_4_1 (write), chatService (ref), playersService (ref), t_1 (ref), createChatLine (ref), status_1 (ref)
	if status_3_1 or status_4_1 and chatService.BubbleChatEnabled then return end
	local localPlayer = playersService.LocalPlayer
	local var66 = localPlayer ~= nil and localPlayer.Character ~= p63
	local var67 = "dub"
	
	if p65 == Enum.ChatColor.Blue then
		var67 = "blu"
	elseif p65 == Enum.ChatColor.Green then
		var67 = "gre"
	elseif p65 == Enum.ChatColor.Red then
		var67 = "red"
	end
	local var68 = createChatLine(t_1:SanitizeChatLine(p64), var67, not var66)
	var68.Origin = p63
	t_1.CharacterSortedMsg:Get(var68.Origin).Fifo:PushBack(var68)
	
	if status_1 then
		t_1:CreateChatLineRender(p63, var68, false, t_1.CharacterSortedMsg:Get(var68.Origin).Fifo, true)
		
		return
	end
	t_1:CreateChatLineRender(p63, var68, false, t_1.CharacterSortedMsg:Get(var68.Origin).Fifo, false)
end

function t_1.BubbleChatEnabled(_)
	-- upvalues: status_3_1 (write), status_4_1 (write), chatService (ref), playersService (ref)
	if status_3_1 or status_4_1 and chatService.BubbleChatEnabled then
		return false
	end
	local clientChatModules = chatService:FindFirstChild("ClientChatModules")
	
	if clientChatModules then
		local chatSettings = clientChatModules:FindFirstChild("ChatSettings")
		
		if chatSettings then
			chatSettings = require(chatSettings)
			
			return if chatSettings.BubbleChatEnabled == nil then playersService.BubbleChat else chatSettings.BubbleChatEnabled
		end
	end
end

function t_1.ShowOwnFilteredMessage(_)
	-- upvalues: chatService (ref)
	local clientChatModules = chatService:FindFirstChild("ClientChatModules")
	
	if clientChatModules then
		local chatSettings = clientChatModules:FindFirstChild("ChatSettings")
		
		return if chatSettings then require(chatSettings).ShowUserOwnFilteredMessage else false
	end
end

function findPlayer(p66)
	-- upvalues: playersService (ref)
	for i, v in pairs(playersService:GetPlayers()) do
		if v.Name == p66 then
			return v
		end
	end
end

chatService.Chatted:connect(function(p67, p68, p69)
	-- upvalues: t_1 (ref)
	t_1:OnGameChatMessage(p67, p68, p69)
end)
local var18 = if game.Workspace.CurrentCamera then game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
	-- upvalues: t_1 (ref)
	t_1:CameraCFrameChanged()
end) else nil
game.Workspace.Changed:Connect(function(p70)
	-- upvalues: var18 (write), t_1 (ref)
	if p70 == "CurrentCamera" then
		if var18 then
			var18:disconnect()
		end
		if game.Workspace.CurrentCamera then
			var18 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
				-- upvalues: t_1 (copy)
				t_1:CameraCFrameChanged()
			end)
		end
	end
end)
local var19 = nil

function getAllowedMessageTypes()
	-- upvalues: var19 (write), chatService (ref)
	if var19 then
		return var19
	end
	local clientChatModules = chatService:FindFirstChild("ClientChatModules")
	
	if not clientChatModules then
		return { "Message", "Whisper" }
	end
	local chatSettings = clientChatModules:FindFirstChild("ChatSettings")
	
	if chatSettings then
		chatSettings = require(chatSettings)
		
		if chatSettings.BubbleChatMessageTypes then
			var19 = chatSettings.BubbleChatMessageTypes
			
			return var19
		end
	end
	local chatConstants = clientChatModules:FindFirstChild("ChatConstants")
	
	if chatConstants then
		chatConstants = require(chatConstants)
		var19 = {
			chatConstants.MessageTypeDefault,
			chatConstants.MessageTypeWhisper
		}
	end
	return var19
end

function checkAllowedMessageType(p71)
	local var76 = getAllowedMessageTypes()
	
	for i = 1, #var76 do
		if var76[i] ~= p71.MessageType then
			continue
		end
		return true
	end
	return false
end

local defaultChatSystemChatEvents = replicatedStorageService:WaitForChild("DefaultChatSystemChatEvents")
local onMessageDoneFiltering = defaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering")
defaultChatSystemChatEvents:WaitForChild("OnNewMessage").OnClientEvent:connect(function(p72, _)
	-- upvalues: localPlayer (write), t_1 (ref)
	if not checkAllowedMessageType(p72) then return end
	local var77 = findPlayer(p72.FromSpeaker)
	
	if not var77 then return end
	if p72.IsFiltered and p72.FromSpeaker ~= localPlayer.Name or p72.FromSpeaker == localPlayer.Name and not t_1:ShowOwnFilteredMessage() then
		t_1:OnPlayerChatMessage(var77, p72.Message, nil)
		
		return
	end
end)
onMessageDoneFiltering.OnClientEvent:connect(function(p73, _)
	-- upvalues: localPlayer (write), t_1 (ref)
	if not checkAllowedMessageType(p73) then return end
	local var78 = findPlayer(p73.FromSpeaker)
	
	if not var78 then return end
	if p73.FromSpeaker == localPlayer.Name and not t_1:ShowOwnFilteredMessage() then
		return
	end
	t_1:OnPlayerChatMessage(var78, p73.Message, nil)
end)