local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Chat = game:GetService("Chat")
local TextService = game:GetService("TextService")
local LocalPlayer = Players.LocalPlayer
while LocalPlayer == nil do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Success, Result = pcall(function() --[[ Line: 24 ]]
	return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble")
end)
local Result1 = Success and Result
local Result2_1 = nil
local Success1, Result2 = pcall(function() --[[ Line: 30 ]]
	return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText")
end)
Result2_1 = Success1 and Result2
local Result3_1 = nil
local Success2, Result3 = pcall(function() --[[ Line: 37 ]]
	return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta")
end)
Result3_1 = Success2 and Result3
local Result4_1 = nil
local Success3, Result4 = pcall(function() --[[ Line: 44 ]]
	return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap")
end)
Result4_1 = Success3 and Result4

local function _(p1): number --[[ Line: 50 | Named "getMessageLength" ]]
	return utf8.len(utf8.nfcnormalize(p1))
end

local SourceSans = Enum.Font.SourceSans
local Size24 = Enum.FontSize.Size24
local LengthDelta = 128 - utf8.len(utf8.nfcnormalize("...")) - 1
local config = { WHITE = "dub", BLUE = "blu", GREEN = "gre", RED = "red" }
local BubbleChat = Instance.new("ScreenGui")
BubbleChat.Name = "BubbleChat"
BubbleChat.ResetOnSpawn = false
BubbleChat.Parent = PlayerGui

local _ = function(p1, p2, p3) --[[ Line: 93 | Named "lerpLength" ]]
	return p2 + (p3 - p2) * math.min(utf8.len(utf8.nfcnormalize(p1)) / 75, 1)
end

local function createFifo() --[[ Line: 97 ]]
	local BindableEvent = Instance.new("BindableEvent")
	local config = { data = {}, Emptied = BindableEvent.Event }
	
	function config:Size(): number --[[ Line: 104 ]]
		-- upvalues: config (copy)
		return #config.data
	end
	
	function config:Empty(): boolean --[[ Line: 108 ]]
		-- upvalues: config (copy)
		return config:Size() <= 0
	end
	
	function config:PopFront() --[[ Line: 112 ]]
		-- upvalues: config (copy), BindableEvent (copy)
		table.remove(config.data, 1)
		
		if config:Empty() then
			BindableEvent:Fire()
		end
	end
	
	function config:Front() --[[ Line: 117 ]]
		-- upvalues: config (copy)
		return config.data[1]
	end
	
	function config:Get(p1) --[[ Line: 121 ]]
		-- upvalues: config (copy)
		return config.data[p1]
	end
	
	function config:PushBack(p1) --[[ Line: 125 ]]
		-- upvalues: config (copy)
		table.insert(config.data, p1)
	end
	
	function config:GetData() --[[ Line: 129 ]]
		-- upvalues: config (copy)
		return config.data
	end
	
	return config
end

local _ = function() --[[ Line: 136 | Named "createCharacterChats" ]]
	-- upvalues: createFifo (copy)
	return { Fifo = createFifo(), BillboardGui = nil }
end

local function createMap() --[[ Line: 145 ]]
	-- upvalues: createFifo (copy)
	local Count = 0
	local config = {
		data = {},
		Size = function(_) --[[ Line: 150 ]]
			-- upvalues: Count (ref)
			return Count
		end
	}
	
	function config:Erase(p1) --[[ Line: 154 ]]
		-- upvalues: config (copy), Count (ref)
		if config.data[p1] then
			Count -= 1
		end
		config.data[p1] = nil
	end
	
	function config:Set(p1, p2) --[[ Line: 159 ]]
		-- upvalues: config (copy), Count (ref)
		config.data[p1] = p2
		
		if p2 then
			Count += 1
		end
	end
	
	function config:Get(p1) --[[ Line: 164 ]]
		-- upvalues: config (copy), createFifo (upval)
		if not p1 then return end
		if not config.data[p1] then
			config.data[p1] = { Fifo = createFifo(), BillboardGui = nil }
			local EmptiedConnection = nil
			EmptiedConnection = config.data[p1].Fifo.Emptied:connect(function() --[[ Line: 169 ]]
				-- upvalues: EmptiedConnection (ref), config (upval), p1 (copy)
				EmptiedConnection:disconnect()
				config:Erase(p1)
			end)
		end
		return config.data[p1]
	end
	
	function config:GetData() --[[ Line: 177 ]]
		-- upvalues: config (copy)
		return config.data
	end
	
	return config
end

local function createChatLine(Message, BubbleColor, IsLocalPlayer) --[[ Line: 184 ]]
	local config = {
		ComputeBubbleLifetime = function(_, Message, IsLocalPlayer): number --[[ Line: 187 ]]
			return if IsLocalPlayer then 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(Message)) / 75, 1) else 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(Message)) / 75, 1)
		end,
		Origin = nil,
		RenderBubble = nil,
		Message = Message
	}
	config.BubbleDieDelay = config:ComputeBubbleLifetime(Message, IsLocalPlayer)
	config.BubbleColor = BubbleColor
	config.IsLocalPlayer = IsLocalPlayer
	
	return config
end

local _ = function(Player, Message, IsLocalPlayer) --[[ Line: 205 | Named "createPlayerChatLine" ]]
	-- upvalues: createChatLine (copy)
	local Dub = createChatLine(Message, "dub", IsLocalPlayer)
	
	if Player then
		Dub.User = Player.Name
		Dub.Origin = Player.Character
	end
	return Dub
end

local _ = function(Origin, Message, IsLocalPlayer, BubbleColor) --[[ Line: 216 | Named "createGameChatLine" ]]
	-- upvalues: createChatLine (copy)
	local ChatLine = createChatLine(Message, BubbleColor, IsLocalPlayer)
	ChatLine.Origin = Origin
	
	return ChatLine
end

function createChatBubbleMain(p1, SliceCenter) --[[ Line: 223 ]]
	local ChatBubble = Instance.new("ImageLabel")
	ChatBubble.Name = "ChatBubble"
	ChatBubble.ScaleType = Enum.ScaleType.Slice
	ChatBubble.SliceCenter = SliceCenter
	ChatBubble.Image = "rbxasset://textures/" .. tostring(p1) .. ".png"
	ChatBubble.BackgroundTransparency = 1
	ChatBubble.BorderSizePixel = 0
	ChatBubble.Size = UDim2.new(1, 0, 1, 0)
	ChatBubble.Position = UDim2.new(0, 0, 0, 0)
	
	return ChatBubble
end

function createChatBubbleTail(Position, Size) --[[ Line: 237 ]]
	local ChatBubbleTail = Instance.new("ImageLabel")
	ChatBubbleTail.Name = "ChatBubbleTail"
	ChatBubbleTail.Image = "rbxasset://textures/ui/dialog_tail.png"
	ChatBubbleTail.BackgroundTransparency = 1
	ChatBubbleTail.BorderSizePixel = 0
	ChatBubbleTail.Position = Position
	ChatBubbleTail.Size = Size
	
	return ChatBubbleTail
end

function createChatBubbleWithTail(p1, p2, p3, p4) --[[ Line: 249 ]]
	local ChatBubbleMain = createChatBubbleMain(p1, p4)
	createChatBubbleTail(p2, p3).Parent = ChatBubbleMain
	
	return ChatBubbleMain
end

function createScaledChatBubbleWithTail(p1, XScale, p2, p3) --[[ Line: 258 ]]
	local ChatBubbleMain = createChatBubbleMain(p1, p3)
	local ChatBubbleTailFrame = Instance.new("Frame")
	ChatBubbleTailFrame.Name = "ChatBubbleTailFrame"
	ChatBubbleTailFrame.BackgroundTransparency = 1
	ChatBubbleTailFrame.SizeConstraint = Enum.SizeConstraint.RelativeXX
	ChatBubbleTailFrame.Position = UDim2.new(0.5, 0, 1, 0)
	ChatBubbleTailFrame.Size = UDim2.new(XScale, 0, XScale, 0)
	ChatBubbleTailFrame.Parent = ChatBubbleMain
	createChatBubbleTail(p2, UDim2.new(1, 0, 0.5, 0)).Parent = ChatBubbleTailFrame
	
	return ChatBubbleMain
end

function createChatImposter(p1, p2, YScale) --[[ Line: 275 ]]
	local DialogPlaceholder = Instance.new("ImageLabel")
	DialogPlaceholder.Name = "DialogPlaceholder"
	DialogPlaceholder.Image = "rbxasset://textures/" .. tostring(p1) .. ".png"
	DialogPlaceholder.BackgroundTransparency = 1
	DialogPlaceholder.BorderSizePixel = 0
	DialogPlaceholder.Position = UDim2.new(0, 0, -1.25, 0)
	DialogPlaceholder.Size = UDim2.new(1, 0, 1, 0)
	local DotDotDot = Instance.new("ImageLabel")
	DotDotDot.Name = "DotDotDot"
	DotDotDot.Image = "rbxasset://textures/" .. tostring(p2) .. ".png"
	DotDotDot.BackgroundTransparency = 1
	DotDotDot.BorderSizePixel = 0
	DotDotDot.Position = UDim2.new(0.001, 0, YScale, 0)
	DotDotDot.Size = UDim2.new(1, 0, 0.7, 0)
	DotDotDot.Parent = DialogPlaceholder
	
	return DialogPlaceholder
end

local config1 = {
	ChatBubble = {},
	ChatBubbleWithTail = {},
	ScalingChatBubbleWithTail = {},
	CharacterSortedMsg = createMap()
}

local function initChatBubbleType(p1, p2, _, p3, p4) --[[ Line: 304 ]]
	-- upvalues: config1 (copy)
	config1.ChatBubble[p1] = createChatBubbleMain(p2, p4)
	config1.ChatBubbleWithTail[p1] = createChatBubbleWithTail(p2, UDim2.new(0.5, -14, 1, if p3 then -1 else 0), UDim2.new(0, 30, 0, 14), p4)
	config1.ScalingChatBubbleWithTail[p1] = createScaledChatBubbleWithTail(p2, 0.5, UDim2.new(-0.5, 0, 0, if p3 then -1 else 0), p4)
end

initChatBubbleType("dub", "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15))
initChatBubbleType("blu", "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33))
initChatBubbleType("red", "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33))
initChatBubbleType("gre", "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33))

function config1:SanitizeChatLine(Text: string): string --[[ Line: 315 ]]
	-- upvalues: LengthDelta (copy)
	return if LengthDelta < utf8.len(utf8.nfcnormalize(Text)) then string.sub(Text, 1, utf8.offset(Text, LengthDelta + utf8.len(utf8.nfcnormalize("...")) + 1) - 1) else Text
end

local function createBillboardInstance(Adornee) --[[ Line: 324 ]]
	-- upvalues: BubbleChat (copy), config1 (copy)
	local Billboard = Instance.new("BillboardGui")
	Billboard.Adornee = Adornee
	Billboard.Size = UDim2.new(0, 400, 0, 250)
	Billboard.StudsOffset = vector.create(0, 1.5, 2)
	Billboard.Parent = BubbleChat
	local BillboardFrame = Instance.new("Frame")
	BillboardFrame.Name = "BillboardFrame"
	BillboardFrame.Size = UDim2.new(1, 0, 1, 0)
	BillboardFrame.Position = UDim2.new(0, 0, -0.5, 0)
	BillboardFrame.BackgroundTransparency = 1
	BillboardFrame.Parent = Billboard
	local ChildRemovedConnection = nil
	ChildRemovedConnection = BillboardFrame.ChildRemoved:connect(function() --[[ Line: 339 ]]
		-- upvalues: BillboardFrame (copy), ChildRemovedConnection (ref), Billboard (copy)
		if #BillboardFrame:GetChildren() <= 1 then
			ChildRemovedConnection:disconnect()
			Billboard:Destroy()
		end
	end)
	config1:CreateSmallTalkBubble("dub").Parent = BillboardFrame
	
	return Billboard
end

function config1:CreateBillboardGuiHelper(Object, p1) --[[ Line: 351 ]]
	-- upvalues: config1 (copy), createBillboardInstance (copy)
	if Object and not config1.CharacterSortedMsg:Get(Object).BillboardGui then
		if not p1 and Object:IsA("BasePart") then
			config1.CharacterSortedMsg:Get(Object).BillboardGui = createBillboardInstance(Object)
			
			return
		end
		if Object:IsA("Model") then
			local Head = Object:FindFirstChild("Head")
			
			if Head and Head:IsA("BasePart") then
				config1.CharacterSortedMsg:Get(Object).BillboardGui = createBillboardInstance(Head)
			end
		end
	end
end

local _ = function(p1) --[[ Line: 373 | Named "distanceToBubbleOrigin" ]]
	return if p1 then (p1.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude else 100000
end

local _ = function(Object) --[[ Line: 379 | Named "isPartOfLocalPlayer" ]]
	-- upvalues: Players (copy)
	if not Object or not Players.LocalPlayer.Character then return end
	return Object:IsDescendantOf(Players.LocalPlayer.Character)
end

function config1:SetBillboardLODNear(p1) --[[ Line: 385 ]]
	-- upvalues: Players (copy)
	local Adornee = p1.Adornee
	local IsDescendantOf = if Adornee and Players.LocalPlayer.Character then Adornee:IsDescendantOf(Players.LocalPlayer.Character) else nil
	p1.Size = UDim2.new(0, 400, 0, 250)
	p1.StudsOffset = Vector3.new(0, if IsDescendantOf then 1.5 else 2.5, if IsDescendantOf then 2 else 0.1)
	p1.Enabled = true
	local Children = p1.BillboardFrame:GetChildren()
	
	for i = 1, #Children do
		Children[i].Visible = true
	end
	p1.BillboardFrame.SmallTalkBubble.Visible = false
end

function config1:SetBillboardLODDistant(p2) --[[ Line: 397 ]]
	-- upvalues: Players (copy)
	local Adornee = p2.Adornee
	local IsDescendantOf = if Adornee and Players.LocalPlayer.Character then Adornee:IsDescendantOf(Players.LocalPlayer.Character) else nil
	p2.Size = UDim2.new(4, 0, 3, 0)
	p2.StudsOffset = Vector3.new(0, 3, if IsDescendantOf then 2 else 0.1)
	p2.Enabled = true
	local Children = p2.BillboardFrame:GetChildren()
	
	for i = 1, #Children do
		Children[i].Visible = false
	end
	p2.BillboardFrame.SmallTalkBubble.Visible = true
end

function config1:SetBillboardLODVeryFar(p3) --[[ Line: 409 ]]
	p3.Enabled = false
end

function config1:SetBillboardGuiLOD(BillboardGui, Model: Model) --[[ Line: 413 ]]
	-- upvalues: config1 (copy)
	if not Model then return end
	if Model:IsA("Model") then
		local Head = Model:FindFirstChild("Head")
		
		if Head then
			Model = Head
		else
			Model = Model.PrimaryPart
		end
	end
	local Magnitude = if Model then (Model.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude else 100000
	
	if Magnitude < 65 then
		config1:SetBillboardLODNear(BillboardGui)
		
		return
	end
	if Magnitude >= 65 and Magnitude < 100 then
		config1:SetBillboardLODDistant(BillboardGui)
		
		return
	else
		config1:SetBillboardLODVeryFar(BillboardGui)
	end
end

function config1:CameraCFrameChanged() --[[ Line: 433 ]]
	-- upvalues: config1 (copy)
	for i, entry in pairs(config1.CharacterSortedMsg:GetData()) do
		local BillboardGui = entry.BillboardGui
		
		if BillboardGui then
			config1:SetBillboardGuiLOD(BillboardGui, i)
		end
	end
end

function config1:CreateBubbleText(Text, AutoLocalize) --[[ Line: 440 ]]
	-- upvalues: Result2_1 (ref), SourceSans (copy), Size24 (copy)
	local BubbleText = Instance.new("TextLabel")
	BubbleText.Name = "BubbleText"
	BubbleText.BackgroundTransparency = 1
	
	if Result2_1 then
		BubbleText.Size = UDim2.fromScale(1, 1)
	else
		BubbleText.Position = UDim2.new(0, 15, 0, 0)
		BubbleText.Size = UDim2.new(1, -30, 1, 0)
	end
	BubbleText.Font = SourceSans
	BubbleText.ClipsDescendants = true
	BubbleText.TextWrapped = true
	BubbleText.FontSize = Size24
	BubbleText.Text = Text
	BubbleText.Visible = false
	BubbleText.AutoLocalize = AutoLocalize
	
	if Result2_1 then
		local Padding = Instance.new("UIPadding")
		Padding.PaddingTop = UDim.new(0, 12)
		Padding.PaddingRight = UDim.new(0, 12)
		Padding.PaddingBottom = UDim.new(0, 12)
		Padding.PaddingLeft = UDim.new(0, 12)
		Padding.Parent = BubbleText
	end
	return BubbleText
end

function config1:CreateSmallTalkBubble(p3) --[[ Line: 472 ]]
	-- upvalues: config1 (copy)
	local SmallTalkBubble = config1.ScalingChatBubbleWithTail[p3]:Clone()
	SmallTalkBubble.Name = "SmallTalkBubble"
	SmallTalkBubble.AnchorPoint = Vector2.new(0, 0.5)
	SmallTalkBubble.Position = UDim2.new(0, 0, 0.5, 0)
	SmallTalkBubble.Visible = false
	local Label = config1:CreateBubbleText("...")
	Label.TextScaled = true
	Label.TextWrapped = false
	Label.Visible = true
	Label.Parent = SmallTalkBubble
	
	return SmallTalkBubble
end

function config1:UpdateChatLinesForOrigin(Origin, p3: number) --[[ Line: 487 ]]
	-- upvalues: config1 (copy)
	local Fifo = config1.CharacterSortedMsg:Get(Origin).Fifo
	local SizeResult: number = Fifo:Size()
	local Data = Fifo:GetData()
	
	if #Data <= 1 then return end
	for i = #Data - 1, 1, -1 do
		local RenderBubble = Data[i].RenderBubble
		
		if not RenderBubble then break end
		if SizeResult - i + 1 > 1 then
			local ChatBubbleTail = RenderBubble:FindFirstChild("ChatBubbleTail")
			
			if ChatBubbleTail then
				ChatBubbleTail:Destroy()
			end
			local BubbleText = RenderBubble:FindFirstChild("BubbleText")
			
			if BubbleText then
				BubbleText.TextTransparency = 0.5
			end
		end
		RenderBubble:TweenPosition(UDim2.new(RenderBubble.Position.X.Scale, RenderBubble.Position.X.Offset, 1, p3 - RenderBubble.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true)
		p3 = p3 - RenderBubble.Size.Y.Offset - 14
	end
end

function config1:DestroyBubble(p4, Frame) --[[ Line: 513 ]]
	if not p4 then return end
	if p4:Empty() then return end
	local RenderBubble = p4:Front().RenderBubble
	
	if RenderBubble then
		spawn(function() --[[ Line: 523 ]]
			-- upvalues: p4 (copy), Frame (copy), RenderBubble (ref)
			while p4:Front().RenderBubble ~= Frame do
				wait()
			end
			RenderBubble = p4:Front().RenderBubble
			local BubbleText = RenderBubble:FindFirstChild("BubbleText")
			local ChatBubbleTail = RenderBubble:FindFirstChild("ChatBubbleTail")
			while RenderBubble and RenderBubble.ImageTransparency < 1 do
				local Elapsed: number = wait()
				
				if not RenderBubble then continue end
				local ScaledElapsed = Elapsed * 1.5
				RenderBubble.ImageTransparency += ScaledElapsed
				
				if BubbleText then
					BubbleText.TextTransparency += ScaledElapsed
				end
				if ChatBubbleTail then
					ChatBubbleTail.ImageTransparency += ScaledElapsed
				end
			end
			if RenderBubble then
				RenderBubble:Destroy()
				p4:PopFront()
			end
		end)
		
		return
	else
		p4:PopFront()
	end
end

function config1:CreateChatLineRender(Origin, p5, p6, Fifo, AutoLocalize) --[[ Line: 551 ]]
	-- upvalues: config1 (copy), TextService (copy), SourceSans (copy), Result2_1 (ref)
	if not Origin then return end
	if not config1.CharacterSortedMsg:Get(Origin).BillboardGui then
		config1:CreateBillboardGuiHelper(Origin, p6)
	end
	local BillboardGui = config1.CharacterSortedMsg:Get(Origin).BillboardGui
	
	if BillboardGui then
		local Copy = config1.ChatBubbleWithTail[p5.BubbleColor]:Clone()
		Copy.Visible = false
		local BubbleText = config1:CreateBubbleText(p5.Message, AutoLocalize)
		BubbleText.Parent = Copy
		Copy.Parent = BillboardGui.BillboardFrame
		p5.RenderBubble = Copy
		local TextSize = TextService:GetTextSize(BubbleText.Text, 24, SourceSans, Vector2.new(400, 250))
		local YRatio = TextSize.Y / 24
		
		if Result2_1 then
			local Ceiled = math.ceil(TextSize.X + 24)
			local YOffset = YRatio * 34
			Copy.Size = UDim2.fromOffset(0, 0)
			Copy.Position = UDim2.fromScale(0.5, 1)
			Copy:TweenSizeAndPosition(UDim2.fromOffset(Ceiled, YOffset), UDim2.new(0.5, -Ceiled / 2, 1, -YOffset), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function() --[[ Line: 590 ]]
				-- upvalues: BubbleText (copy)
				BubbleText.Visible = true
			end)
			config1:SetBillboardGuiLOD(BillboardGui, p5.Origin)
			config1:UpdateChatLinesForOrigin(p5.Origin, -YOffset)
		else
			local Largest = math.max((TextSize.X + 30) / 400, 0.1)
			Copy.Size = UDim2.new(0, 0, 0, 0)
			Copy.Position = UDim2.new(0.5, 0, 1, 0)
			local YOffset1 = YRatio * 34
			Copy:TweenSizeAndPosition(UDim2.new(Largest, 0, 0, YOffset1), UDim2.new((1 - Largest) / 2, 0, 1, -YOffset1), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function() --[[ Line: 610 ]]
				-- upvalues: BubbleText (copy)
				BubbleText.Visible = true
			end)
			config1:SetBillboardGuiLOD(BillboardGui, p5.Origin)
			config1:UpdateChatLinesForOrigin(p5.Origin, -YOffset1)
		end
		delay(p5.BubbleDieDelay, function() --[[ Line: 617 ]]
			-- upvalues: config1 (upval), Fifo (copy), Copy (copy)
			config1:DestroyBubble(Fifo, Copy)
		end)
	end
end

function config1:OnPlayerChatMessage(Player: Player, Message, _) --[[ Line: 623 ]]
	-- upvalues: config1 (copy), Players (copy), createChatLine (copy), config (copy)
	if not config1:BubbleChatEnabled() then return end
	local LocalPlayer = Players.LocalPlayer
	local ChatLine = createChatLine(config1:SanitizeChatLine(Message), config.WHITE, not (LocalPlayer ~= nil and Player ~= LocalPlayer))
	
	if Player then
		ChatLine.User = Player.Name
		ChatLine.Origin = Player.Character
	end
	if Player and ChatLine.Origin then
		local Fifo = config1.CharacterSortedMsg:Get(ChatLine.Origin).Fifo
		Fifo:PushBack(ChatLine)
		config1:CreateChatLineRender(Player.Character, ChatLine, true, Fifo, false)
	end
end

function config1:OnGameChatMessage(Origin, p5, ChatColor) --[[ Line: 642 ]]
	-- upvalues: Result3_1 (ref), Result4_1 (ref), Chat (copy), Players (copy), config1 (copy), createChatLine (copy), Result1 (copy)
	if Result3_1 or Result4_1 and Chat.BubbleChatEnabled then return end
	local LocalPlayer = Players.LocalPlayer
	local ChatLine = createChatLine(config1:SanitizeChatLine(p5), if ChatColor == Enum.ChatColor.Blue then "blu" elseif ChatColor == Enum.ChatColor.Green then "gre" elseif ChatColor == Enum.ChatColor.Red then "red" else "dub", not (LocalPlayer ~= nil and LocalPlayer.Character ~= Origin))
	ChatLine.Origin = Origin
	config1.CharacterSortedMsg:Get(ChatLine.Origin).Fifo:PushBack(ChatLine)
	
	if Result1 then
		config1:CreateChatLineRender(Origin, ChatLine, false, config1.CharacterSortedMsg:Get(ChatLine.Origin).Fifo, true)
		
		return
	else
		config1:CreateChatLineRender(Origin, ChatLine, false, config1.CharacterSortedMsg:Get(ChatLine.Origin).Fifo, false)
	end
end

function config1:BubbleChatEnabled() --[[ Line: 668 ]]
	-- upvalues: Result3_1 (ref), Result4_1 (ref), Chat (copy), Players (copy)
	if Result3_1 or Result4_1 and Chat.BubbleChatEnabled then
		return false
	end
	local ClientChatModules = Chat:FindFirstChild("ClientChatModules")
	
	if ClientChatModules then
		local ChatSettings = ClientChatModules:FindFirstChild("ChatSettings")
		
		if ChatSettings then
			local Module = require(ChatSettings)
			
			if Module.BubbleChatEnabled ~= nil then
				return Module.BubbleChatEnabled
			end
		end
	end
	return Players.BubbleChat
end

function config1:ShowOwnFilteredMessage() --[[ Line: 685 ]]
	-- upvalues: Chat (copy)
	local ClientChatModules = Chat:FindFirstChild("ClientChatModules")
	
	if ClientChatModules then
		local ChatSettings = ClientChatModules:FindFirstChild("ChatSettings")
		
		if ChatSettings then
			return require(ChatSettings).ShowUserOwnFilteredMessage
		end
	end
	return false
end

function findPlayer(Name) --[[ Line: 697 ]]
	-- upvalues: Players (copy)
	for _, player in pairs(Players:GetPlayers()) do
		if player.Name == Name then
			return player
		end
	end
end

Chat.Chatted:connect(function(Message, Recipient, ChatColor) --[[ Line: 705 ]]
	-- upvalues: config1 (copy)
	config1:OnGameChatMessage(Message, Recipient, ChatColor)
end)
local Connection = if game.Workspace.CurrentCamera then game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_) --[[ Line: 709 ]]
	-- upvalues: config1 (copy)
	config1:CameraCFrameChanged()
end) else nil
game.Workspace.Changed:Connect(function(Property) --[[ Line: 712 ]]
	-- upvalues: Connection (ref), config1 (copy)
	if Property == "CurrentCamera" then
		if Connection then
			Connection:disconnect()
		end
		if game.Workspace.CurrentCamera then
			Connection = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_) --[[ Line: 716 ]]
				-- upvalues: config1 (upval)
				config1:CameraCFrameChanged()
			end)
		end
	end
end)
local List = nil

function getAllowedMessageTypes() --[[ Line: 724 ]]
	-- upvalues: List (ref), Chat (copy)
	if List then
		return List
	end
	local ClientChatModules = Chat:FindFirstChild("ClientChatModules")
	
	if not ClientChatModules then
		return { "Message", "Whisper" }
	end
	local ChatSettings = ClientChatModules:FindFirstChild("ChatSettings")
	
	if ChatSettings then
		local Module = require(ChatSettings)
		
		if Module.BubbleChatMessageTypes then
			List = Module.BubbleChatMessageTypes
			
			return List
		end
	end
	local ChatConstants = ClientChatModules:FindFirstChild("ChatConstants")
	
	if ChatConstants then
		local Module = require(ChatConstants)
		List = { Module.MessageTypeDefault, Module.MessageTypeWhisper }
	end
	return List
end

function checkAllowedMessageType(p5): boolean --[[ Line: 748 ]]
	local AllowedMessageTypes = getAllowedMessageTypes()
	
	for i = 1, #AllowedMessageTypes do
		if AllowedMessageTypes[i] == p5.MessageType then
			return true
		end
	end
	return false
end

local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
local OnMessageDoneFiltering = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering")
DefaultChatSystemChatEvents:WaitForChild("OnNewMessage").OnClientEvent:connect(function(p6, _) --[[ Line: 762 ]]
	-- upvalues: LocalPlayer (ref), config1 (copy)
	if not checkAllowedMessageType(p6) then return end
	local Player = findPlayer(p6.FromSpeaker)
	
	if not Player then return end
	if p6.IsFiltered and p6.FromSpeaker ~= LocalPlayer.Name or p6.FromSpeaker == LocalPlayer.Name and not config1:ShowOwnFilteredMessage() then
		config1:OnPlayerChatMessage(Player, p6.Message, nil)
		
		return
	end
end)
OnMessageDoneFiltering.OnClientEvent:connect(function(p6, _) --[[ Line: 781 ]]
	-- upvalues: LocalPlayer (ref), config1 (copy)
	if not checkAllowedMessageType(p6) then return end
	local Player = findPlayer(p6.FromSpeaker)
	
	if not Player then return end
	if p6.FromSpeaker ~= LocalPlayer.Name or config1:ShowOwnFilteredMessage() then
		config1:OnPlayerChatMessage(Player, p6.Message, nil)
		
		return
	end
end)