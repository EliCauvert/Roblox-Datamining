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

local function _(p1)
	return utf8.len(utf8.nfcnormalize(p1))
end

local sourceSans = Enum.Font.SourceSans
local size24 = Enum.FontSize.Size24
local var1 = 128 - utf8.len(utf8.nfcnormalize("...")) - 1
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
	
	function t.PushBack(_, p1)
		-- upvalues: t (ref)
		table.insert(t.data, p1)
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
	local var2 = 0
	
	function t.Size(_)
		-- upvalues: var2 (write)
		return var2
	end
	
	function t.Erase(_, p1)
		-- upvalues: t (ref), var2 (write)
		if t.data[p1] then
			var2 -= 1
		end
		t.data[p1] = nil
	end
	
	function t.Set(_, p1, p2)
		-- upvalues: t (ref), var2 (write)
		t.data[p1] = p2
		
		if p2 then
			var2 += 1
		end
	end
	
	function t.Get(_, p1)
		-- upvalues: t (ref), createFifo (copy)
		if not p1 then return end
		if not t.data[p1] then
			t.data[p1] = { Fifo = createFifo(), BillboardGui = nil }
			local emptiedConnection = nil
			emptiedConnection = t.data[p1].Fifo.Emptied:connect(function()
				-- upvalues: emptiedConnection (write), t (copy), p1 (ref)
				emptiedConnection:disconnect()
				t:Erase(p1)
			end)
		end
		return t.data[p1]
	end
	
	function t.GetData(_)
		-- upvalues: t (ref)
		return t.data
	end
	
	return t
end

local function createChatLine(p1, p2, p3)
	local t = {
		ComputeBubbleLifetime = function(_, p4, p5)
			return if p5 then 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(p4)) / 75, 1) else 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(p4)) / 75, 1)
		end,
		Origin = nil,
		RenderBubble = nil,
		Message = p1
	}
	t.BubbleDieDelay = t:ComputeBubbleLifetime(p1, p3)
	t.BubbleColor = p2
	t.IsLocalPlayer = p3
	
	return t
end

local _ = function(p1, p2, p3)
	-- upvalues: createChatLine (ref)
	local var2 = createChatLine(p2, "dub", p3)
	
	if p1 then
		var2.User = p1.Name
		var2.Origin = p1.Character
	end
	return var2
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: createChatLine (ref)
	local var2 = createChatLine(p2, p4, p3)
	var2.Origin = p1
	
	return var2
end

function createChatBubbleMain(p1, p2)
	local chatBubble = Instance.new("ImageLabel")
	chatBubble.Name = "ChatBubble"
	chatBubble.ScaleType = Enum.ScaleType.Slice
	chatBubble.SliceCenter = p2
	chatBubble.Image = "rbxasset://textures/" .. tostring(p1) .. ".png"
	chatBubble.BackgroundTransparency = 1
	chatBubble.BorderSizePixel = 0
	chatBubble.Size = UDim2.new(1, 0, 1, 0)
	chatBubble.Position = UDim2.new(0, 0, 0, 0)
	
	return chatBubble
end

function createChatBubbleTail(p1, p2)
	local chatBubbleTail = Instance.new("ImageLabel")
	chatBubbleTail.Name = "ChatBubbleTail"
	chatBubbleTail.Image = "rbxasset://textures/ui/dialog_tail.png"
	chatBubbleTail.BackgroundTransparency = 1
	chatBubbleTail.BorderSizePixel = 0
	chatBubbleTail.Position = p1
	chatBubbleTail.Size = p2
	
	return chatBubbleTail
end

function createChatBubbleWithTail(p1, p2, p3, p4)
	local var2 = createChatBubbleMain(p1, p4)
	createChatBubbleTail(p2, p3).Parent = var2
	
	return var2
end

function createScaledChatBubbleWithTail(p1, p2, p3, p4)
	local var2 = createChatBubbleMain(p1, p4)
	local chatBubbleTailFrame = Instance.new("Frame")
	chatBubbleTailFrame.Name = "ChatBubbleTailFrame"
	chatBubbleTailFrame.BackgroundTransparency = 1
	chatBubbleTailFrame.SizeConstraint = Enum.SizeConstraint.RelativeXX
	chatBubbleTailFrame.Position = UDim2.new(0.5, 0, 1, 0)
	chatBubbleTailFrame.Size = UDim2.new(p2, 0, p2, 0)
	chatBubbleTailFrame.Parent = var2
	createChatBubbleTail(p3, UDim2.new(1, 0, 0.5, 0)).Parent = chatBubbleTailFrame
	
	return var2
end

function createChatImposter(p1, p2, p3)
	local dialogPlaceholder = Instance.new("ImageLabel")
	dialogPlaceholder.Name = "DialogPlaceholder"
	dialogPlaceholder.Image = "rbxasset://textures/" .. tostring(p1) .. ".png"
	dialogPlaceholder.BackgroundTransparency = 1
	dialogPlaceholder.BorderSizePixel = 0
	dialogPlaceholder.Position = UDim2.new(0, 0, -1.25, 0)
	dialogPlaceholder.Size = UDim2.new(1, 0, 1, 0)
	local dotDotDot = Instance.new("ImageLabel")
	dotDotDot.Name = "DotDotDot"
	dotDotDot.Image = "rbxasset://textures/" .. tostring(p2) .. ".png"
	dotDotDot.BackgroundTransparency = 1
	dotDotDot.BorderSizePixel = 0
	dotDotDot.Position = UDim2.new(0.001, 0, p3, 0)
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

local function initChatBubbleType(p1, p2, _, p3, p4)
	-- upvalues: t_1 (ref)
	t_1.ChatBubble[p1] = createChatBubbleMain(p2, p4)
	t_1.ChatBubbleWithTail[p1] = createChatBubbleWithTail(p2, UDim2.new(0.5, -14, 1, if p3 then -1 else 0), UDim2.new(0, 30, 0, 14), p4)
	t_1.ScalingChatBubbleWithTail[p1] = createScaledChatBubbleWithTail(p2, 0.5, UDim2.new(-0.5, 0, 0, if p3 then -1 else 0), p4)
end

initChatBubbleType("dub", "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15))
initChatBubbleType("blu", "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33))
initChatBubbleType("red", "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33))
initChatBubbleType("gre", "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33))

function t_1.SanitizeChatLine(_, p1)
	-- upvalues: var1 (ref)
	return if var1 < utf8.len(utf8.nfcnormalize(p1)) then string.sub(p1, 1, utf8.offset(p1, var1 + utf8.len(utf8.nfcnormalize("...")) + 1) - 1) else p1
end

local function createBillboardInstance(p1)
	-- upvalues: bubbleChat (ref), t_1 (ref)
	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Adornee = p1
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

function t_1.CreateBillboardGuiHelper(_, p1, p2)
	-- upvalues: t_1 (ref), createBillboardInstance (ref)
	if p1 and not t_1.CharacterSortedMsg:Get(p1).BillboardGui then
		if not p2 and p1:IsA("BasePart") then
			t_1.CharacterSortedMsg:Get(p1).BillboardGui = createBillboardInstance(p1)
			
			return
		elseif p1:IsA("Model") then
			local head = p1:FindFirstChild("Head")
			
			if head and head:IsA("BasePart") then
				t_1.CharacterSortedMsg:Get(p1).BillboardGui = createBillboardInstance(head)
			end
		end
	end
end

local _ = function(p1)
	return if p1 then (p1.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude else 100000
end

local _ = function(p1)
	-- upvalues: playersService (ref)
	if p1 and playersService.LocalPlayer.Character then
		return p1:IsDescendantOf(playersService.LocalPlayer.Character)
	end
end

function t_1.SetBillboardLODNear(_, p1)
	-- upvalues: playersService (ref)
	local adornee = p1.Adornee
	local var2 = if adornee and playersService.LocalPlayer.Character then adornee:IsDescendantOf(playersService.LocalPlayer.Character) else nil
	p1.Size = UDim2.new(0, 400, 0, 250)
	p1.StudsOffset = Vector3.new(0, if var2 then 1.5 else 2.5, if var2 then 2 else 0.1)
	p1.Enabled = true
	adornee = p1.BillboardFrame:GetChildren()
	
	for i = 1, #adornee do
		adornee[i].Visible = true
	end
	p1.BillboardFrame.SmallTalkBubble.Visible = false
end

function t_1.SetBillboardLODDistant(_, p2)
	-- upvalues: playersService (ref)
	local adornee = p2.Adornee
	local var3 = if adornee and playersService.LocalPlayer.Character then adornee:IsDescendantOf(playersService.LocalPlayer.Character) else nil
	p2.Size = UDim2.new(4, 0, 3, 0)
	p2.StudsOffset = Vector3.new(0, 3, if var3 then 2 else 0.1)
	p2.Enabled = true
	adornee = p2.BillboardFrame:GetChildren()
	
	for i = 1, #adornee do
		adornee[i].Visible = false
	end
	p2.BillboardFrame.SmallTalkBubble.Visible = true
end

function t_1.SetBillboardLODVeryFar(_, p3)
	p3.Enabled = false
end

function t_1.SetBillboardGuiLOD(_, p3, p4)
	-- upvalues: t_1 (ref)
	if not p4 then return end
	if p4:IsA("Model") then
		local head = p4:FindFirstChild("Head")
		p4 = head or p4.PrimaryPart
	end
	local var4 = if not p4 then 100000 else (p4.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude
	
	if var4 < 65 then
		t_1:SetBillboardLODNear(p3)
		
		return
	elseif var4 >= 65 and var4 < 100 then
		t_1:SetBillboardLODDistant(p3)
		
		return
	end
	t_1:SetBillboardLODVeryFar(p3)
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

function t_1.CreateBubbleText(_, p3, p4)
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
	bubbleText.Text = p3
	bubbleText.Visible = false
	bubbleText.AutoLocalize = p4
	
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

function t_1.CreateSmallTalkBubble(_, p3)
	-- upvalues: t_1 (ref)
	local smallTalkBubble = t_1.ScalingChatBubbleWithTail[p3]:Clone()
	smallTalkBubble.Name = "SmallTalkBubble"
	smallTalkBubble.AnchorPoint = Vector2.new(0, 0.5)
	smallTalkBubble.Position = UDim2.new(0, 0, 0.5, 0)
	smallTalkBubble.Visible = false
	local var4 = t_1:CreateBubbleText("...")
	var4.TextScaled = true
	var4.TextWrapped = false
	var4.Visible = true
	var4.Parent = smallTalkBubble
	
	return smallTalkBubble
end

function t_1.UpdateChatLinesForOrigin(_, p3, p4)
	-- upvalues: t_1 (ref)
	local fifo = t_1.CharacterSortedMsg:Get(p3).Fifo
	local var4 = fifo:Size()
	local data = fifo:GetData()
	
	if #data <= 1 then return end
	for i = #data - 1, 1, -1 do
		local renderBubble = data[i].RenderBubble
		
		if renderBubble then
			if var4 - i + 1 > 1 then
				local chatBubbleTail = renderBubble:FindFirstChild("ChatBubbleTail")
				
				if chatBubbleTail then
					chatBubbleTail:Destroy()
				end
				local bubbleText = renderBubble:FindFirstChild("BubbleText")
				
				if bubbleText then
					bubbleText.TextTransparency = 0.5
				end
			end
			renderBubble:TweenPosition(UDim2.new(renderBubble.Position.X.Scale, renderBubble.Position.X.Offset, 1, p4 - renderBubble.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true)
			p4 = p4 - renderBubble.Size.Y.Offset - 14
		end
		return
	end
end

function t_1.DestroyBubble(_, p5, p6)
	if not p5 then return end
	if p5:Empty() then return end
	local renderBubble = p5:Front().RenderBubble
	
	if renderBubble then
		spawn(function()
			-- upvalues: p5 (ref), p6 (ref), renderBubble (write)
			while p5:Front().RenderBubble ~= p6 do
				wait()
			end
			renderBubble = p5:Front().RenderBubble
			local _ = 0
			local bubbleText = renderBubble:FindFirstChild("BubbleText")
			local chatBubbleTail = renderBubble:FindFirstChild("ChatBubbleTail")
			while renderBubble and renderBubble.ImageTransparency < 1 do
				local var5 = wait()
				
				if not renderBubble then continue end
				local var6 = var5 * 1.5
				renderBubble.ImageTransparency += var6
				
				if bubbleText then
					bubbleText.TextTransparency += var6
				end
				if chatBubbleTail then
					chatBubbleTail.ImageTransparency += var6
				end
			end
			if renderBubble then
				renderBubble:Destroy()
				p5:PopFront()
			end
		end)
		
		return
	end
	p5:PopFront()
end

function t_1.CreateChatLineRender(_, p7, p8, p9, p10, p11)
	-- upvalues: t_1 (ref), textService (ref), sourceSans (ref), status_2_1 (write)
	if not p7 then return end
	if not t_1.CharacterSortedMsg:Get(p7).BillboardGui then
		t_1:CreateBillboardGuiHelper(p7, p9)
	end
	local billboardGui = t_1.CharacterSortedMsg:Get(p7).BillboardGui
	
	if billboardGui then
		local var5 = t_1.ChatBubbleWithTail[p8.BubbleColor]:Clone()
		var5.Visible = false
		local message = t_1:CreateBubbleText(p8.Message, p11)
		message.Parent = var5
		var5.Parent = billboardGui.BillboardFrame
		p8.RenderBubble = var5
		local textTextSize = textService:GetTextSize(message.Text, 24, sourceSans, Vector2.new(400, 250))
		local var6 = textTextSize.Y / 24
		
		if status_2_1 then
			local ceiled = math.ceil(textTextSize.X + 24)
			local var7 = var6 * 34
			var5.Size = UDim2.fromOffset(0, 0)
			var5.Position = UDim2.fromScale(0.5, 1)
			var5:TweenSizeAndPosition(UDim2.fromOffset(ceiled, var7), UDim2.new(0.5, -ceiled / 2, 1, -var7), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				-- upvalues: message (ref)
				message.Visible = true
			end)
			t_1:SetBillboardGuiLOD(billboardGui, p8.Origin)
			t_1:UpdateChatLinesForOrigin(p8.Origin, -var7)
		else
			local maxValue = math.max((textTextSize.X + 30) / 400, 0.1)
			var5.Size = UDim2.new(0, 0, 0, 0)
			var5.Position = UDim2.new(0.5, 0, 1, 0)
			local var8 = var6 * 34
			var5:TweenSizeAndPosition(UDim2.new(maxValue, 0, 0, var8), UDim2.new((1 - maxValue) / 2, 0, 1, -var8), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				-- upvalues: message (ref)
				message.Visible = true
			end)
			t_1:SetBillboardGuiLOD(billboardGui, p8.Origin)
			t_1:UpdateChatLinesForOrigin(p8.Origin, -var8)
		end
		delay(p8.BubbleDieDelay, function()
			-- upvalues: t_1 (copy), p10 (ref), var5 (ref)
			t_1:DestroyBubble(p10, var5)
		end)
	end
end

function t_1.OnPlayerChatMessage(_, p7, p8, _)
	-- upvalues: t_1 (ref), playersService (ref), createChatLine (ref), t (ref)
	if not t_1:BubbleChatEnabled() then return end
	local localPlayer = playersService.LocalPlayer
	local var5 = createChatLine(t_1:SanitizeChatLine(p8), t.WHITE, not (localPlayer ~= nil and p7 ~= localPlayer))
	
	if p7 then
		var5.User = p7.Name
		var5.Origin = p7.Character
	end
	if p7 and var5.Origin then
		local fifo = t_1.CharacterSortedMsg:Get(var5.Origin).Fifo
		fifo:PushBack(var5)
		t_1:CreateChatLineRender(p7.Character, var5, true, fifo, false)
	end
end

function t_1.OnGameChatMessage(_, p7, p8, p9)
	-- upvalues: status_3_1 (write), status_4_1 (write), chatService (ref), playersService (ref), t_1 (ref), createChatLine (ref), status_1 (ref)
	if status_3_1 or status_4_1 and chatService.BubbleChatEnabled then return end
	local localPlayer = playersService.LocalPlayer
	local var5 = localPlayer ~= nil and localPlayer.Character ~= p7
	local var6 = "dub"
	
	if p9 == Enum.ChatColor.Blue then
		var6 = "blu"
	elseif p9 == Enum.ChatColor.Green then
		var6 = "gre"
	elseif p9 == Enum.ChatColor.Red then
		var6 = "red"
	end
	local var7 = createChatLine(t_1:SanitizeChatLine(p8), var6, not var5)
	var7.Origin = p7
	t_1.CharacterSortedMsg:Get(var7.Origin).Fifo:PushBack(var7)
	
	if status_1 then
		t_1:CreateChatLineRender(p7, var7, false, t_1.CharacterSortedMsg:Get(var7.Origin).Fifo, true)
		
		return
	end
	t_1:CreateChatLineRender(p7, var7, false, t_1.CharacterSortedMsg:Get(var7.Origin).Fifo, false)
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

function findPlayer(p7)
	-- upvalues: playersService (ref)
	for i, v in pairs(playersService:GetPlayers()) do
		if v.Name == p7 then
			return v
		end
	end
end

chatService.Chatted:connect(function(p8, p9, p10)
	-- upvalues: t_1 (ref)
	t_1:OnGameChatMessage(p8, p9, p10)
end)
local var5 = if game.Workspace.CurrentCamera then game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
	-- upvalues: t_1 (ref)
	t_1:CameraCFrameChanged()
end) else nil
game.Workspace.Changed:Connect(function(p8)
	-- upvalues: var5 (write), t_1 (ref)
	if p8 == "CurrentCamera" then
		if var5 then
			var5:disconnect()
		end
		if game.Workspace.CurrentCamera then
			var5 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
				-- upvalues: t_1 (copy)
				t_1:CameraCFrameChanged()
			end)
		end
	end
end)
local var6 = nil

function getAllowedMessageTypes()
	-- upvalues: var6 (write), chatService (ref)
	if var6 then
		return var6
	end
	local clientChatModules = chatService:FindFirstChild("ClientChatModules")
	
	if not clientChatModules then
		return { "Message", "Whisper" }
	end
	local chatSettings = clientChatModules:FindFirstChild("ChatSettings")
	
	if chatSettings then
		chatSettings = require(chatSettings)
		
		if chatSettings.BubbleChatMessageTypes then
			var6 = chatSettings.BubbleChatMessageTypes
			
			return var6
		end
	end
	local chatConstants = clientChatModules:FindFirstChild("ChatConstants")
	
	if chatConstants then
		chatConstants = require(chatConstants)
		var6 = {
			chatConstants.MessageTypeDefault,
			chatConstants.MessageTypeWhisper
		}
	end
	return var6
end

function checkAllowedMessageType(p8)
	local var7 = getAllowedMessageTypes()
	
	for i = 1, #var7 do
		if var7[i] ~= p8.MessageType then
			continue
		end
		return true
	end
	return false
end

local defaultChatSystemChatEvents = replicatedStorageService:WaitForChild("DefaultChatSystemChatEvents")
local onMessageDoneFiltering = defaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering")
defaultChatSystemChatEvents:WaitForChild("OnNewMessage").OnClientEvent:connect(function(p9, _)
	-- upvalues: localPlayer (write), t_1 (ref)
	if not checkAllowedMessageType(p9) then return end
	local var8 = findPlayer(p9.FromSpeaker)
	
	if not var8 then return end
	if p9.IsFiltered and p9.FromSpeaker ~= localPlayer.Name or p9.FromSpeaker == localPlayer.Name and not t_1:ShowOwnFilteredMessage() then
		t_1:OnPlayerChatMessage(var8, p9.Message, nil)
		
		return
	end
end)
onMessageDoneFiltering.OnClientEvent:connect(function(p9, _)
	-- upvalues: localPlayer (write), t_1 (ref)
	if not checkAllowedMessageType(p9) then return end
	local var8 = findPlayer(p9.FromSpeaker)
	
	if not var8 then return end
	if p9.FromSpeaker == localPlayer.Name and not t_1:ShowOwnFilteredMessage() then
		return
	end
	t_1:OnPlayerChatMessage(var8, p9.Message, nil)
end)