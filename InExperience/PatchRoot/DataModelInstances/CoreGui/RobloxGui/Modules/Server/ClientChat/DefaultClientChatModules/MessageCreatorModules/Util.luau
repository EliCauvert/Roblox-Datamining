local var0 = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixOverlappingRtlChatMessages2")
end)

if ok then
	var0 = status
end
local textService = game:GetService("TextService")
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local parent = script.Parent.Parent
local chatSettingsModule = require(parent:WaitForChild("ChatSettings"))
local chatConstantsModule = require(parent:WaitForChild("ChatConstants"))
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.GetStringTextBounds(_, p0, p1, p2, p3)
	-- upvalues: textService (ref)
	return textService:GetTextSize(p0, p2, p1, p3 or Vector2.new(10000, 10000))
end

function t_1.GetMessageHeight(p4, p5, p6, p7)
	-- upvalues: var0 (write)
	local var7 = p4:GetStringTextBounds(if var0 then p5.ContentText else p5.Text, p5.Font, p5.TextSize, Vector2.new(p7 or p6.AbsoluteSize.X, 1000))
	
	return if var7.Y == math.floor(var7.Y) then var7.Y else var7.Y + 1
end

function t_1.GetNumberOfSpaces(p8, p9, p10, p11)
	return math.ceil(p8:GetStringTextBounds(p9, p10, p11).X / p8:GetStringTextBounds(" ", p10, p11).X)
end

function t_1.CreateLeadingSpaces(_, p12)
	-- upvalues: var0 (write)
	return if var0 then "<font dir=\"ltr\">" .. string.rep(" ", p12) .. "</font>" else string.rep(" ", p12)
end

function t_1.SanitizeForRichText(_, p13)
	-- upvalues: var0 (write)
	return if var0 then string.gsub(p13, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }) else p13
end

function t_1.CreateBaseMessage(p14, p15, p16, p17, p18)
	-- upvalues: var0 (write)
	local frameFromObjectPool = p14:GetFromObjectPool("Frame")
	frameFromObjectPool.Selectable = false
	frameFromObjectPool.Size = UDim2.new(1, 0, 0, 18)
	frameFromObjectPool.Visible = true
	frameFromObjectPool.BackgroundTransparency = 1
	local textLabelFromObjectPool = p14:GetFromObjectPool("TextLabel")
	textLabelFromObjectPool.Selectable = false
	textLabelFromObjectPool.Size = UDim2.new(1, -14, 1, 0)
	textLabelFromObjectPool.Position = UDim2.new(0, 8, 0, 0)
	textLabelFromObjectPool.BackgroundTransparency = 1
	textLabelFromObjectPool.Font = p16
	textLabelFromObjectPool.TextSize = p17
	textLabelFromObjectPool.TextXAlignment = Enum.TextXAlignment.Left
	textLabelFromObjectPool.TextYAlignment = Enum.TextYAlignment.Top
	textLabelFromObjectPool.TextTransparency = 0
	textLabelFromObjectPool.TextStrokeTransparency = 0.75
	textLabelFromObjectPool.TextColor3 = p18
	textLabelFromObjectPool.TextWrapped = true
	textLabelFromObjectPool.ClipsDescendants = true
	textLabelFromObjectPool.Text = p15
	textLabelFromObjectPool.Visible = true
	textLabelFromObjectPool.RichText = if var0 then true else false
	textLabelFromObjectPool.Parent = frameFromObjectPool
	
	return frameFromObjectPool, textLabelFromObjectPool
end

function t_1.AddNameButtonToBaseMessage(p19, p20, p21, p22, p23)
	local var10 = p19:GetStringTextBounds(p22, p20.Font, p20.TextSize)
	local textButtonFromObjectPool = p19:GetFromObjectPool("TextButton")
	textButtonFromObjectPool.Selectable = false
	textButtonFromObjectPool.Size = UDim2.new(0, var10.X, 0, var10.Y)
	textButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	textButtonFromObjectPool.BackgroundTransparency = 1
	textButtonFromObjectPool.Font = p20.Font
	textButtonFromObjectPool.TextSize = p20.TextSize
	textButtonFromObjectPool.TextXAlignment = p20.TextXAlignment
	textButtonFromObjectPool.TextYAlignment = p20.TextYAlignment
	textButtonFromObjectPool.TextTransparency = p20.TextTransparency
	textButtonFromObjectPool.TextStrokeTransparency = p20.TextStrokeTransparency
	textButtonFromObjectPool.TextColor3 = p21
	textButtonFromObjectPool.Text = p22
	textButtonFromObjectPool.Visible = true
	textButtonFromObjectPool.Parent = p20
	local mouseButton1ClickConnection = textButtonFromObjectPool.MouseButton1Click:connect(function()
		-- upvalues: p19 (ref), textButtonFromObjectPool (ref), p23 (ref)
		p19:NameButtonClicked(textButtonFromObjectPool, p23)
	end)
	local changedConnection = nil
	changedConnection = textButtonFromObjectPool.Changed:connect(function(p24)
		-- upvalues: mouseButton1ClickConnection (ref), changedConnection (write)
		if p24 == "Parent" then
			mouseButton1ClickConnection:Disconnect()
			changedConnection:Disconnect()
		end
	end)
	
	return textButtonFromObjectPool
end

function t_1.AddTranslationButtonToBaseMessage(p25, p26)
	local floored = math.floor(p26.TextSize * 0.9)
	local vector2 = Vector2.new(floored, floored)
	local imageButtonFromObjectPool = p25:GetFromObjectPool("ImageButton")
	imageButtonFromObjectPool.Selectable = false
	imageButtonFromObjectPool.Size = UDim2.new(0, vector2.X, 0, vector2.Y)
	imageButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	imageButtonFromObjectPool.BackgroundTransparency = 1
	imageButtonFromObjectPool.Visible = false
	imageButtonFromObjectPool.Parent = p26
	imageButtonFromObjectPool.Image = "rbxasset://textures/translateIcon.png"
	imageButtonFromObjectPool.HoverImage = "rbxasset://textures/translateIconDark.png"
	imageButtonFromObjectPool.PressedImage = "rbxasset://textures/translateIconDark.png"
	
	return imageButtonFromObjectPool
end

function t_1.AddChannelButtonToBaseMessage(p27, p28, p29, p30, p31)
	local var17 = p27:GetStringTextBounds(p30, p28.Font, p28.TextSize)
	local textButtonFromObjectPool = p27:GetFromObjectPool("TextButton")
	textButtonFromObjectPool.Selectable = false
	textButtonFromObjectPool.Size = UDim2.new(0, var17.X, 0, var17.Y)
	textButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	textButtonFromObjectPool.BackgroundTransparency = 1
	textButtonFromObjectPool.Font = p28.Font
	textButtonFromObjectPool.TextSize = p28.TextSize
	textButtonFromObjectPool.TextXAlignment = p28.TextXAlignment
	textButtonFromObjectPool.TextYAlignment = p28.TextYAlignment
	textButtonFromObjectPool.TextTransparency = p28.TextTransparency
	textButtonFromObjectPool.TextStrokeTransparency = p28.TextStrokeTransparency
	textButtonFromObjectPool.TextColor3 = p29
	textButtonFromObjectPool.Text = p30
	textButtonFromObjectPool.Visible = true
	textButtonFromObjectPool.Parent = p28
	local mouseButton1ClickConnection = textButtonFromObjectPool.MouseButton1Click:connect(function()
		-- upvalues: p27 (ref), textButtonFromObjectPool (ref), p31 (ref)
		p27:ChannelButtonClicked(textButtonFromObjectPool, p31)
	end)
	local changedConnection = nil
	changedConnection = textButtonFromObjectPool.Changed:connect(function(p32)
		-- upvalues: mouseButton1ClickConnection (ref), changedConnection (write)
		if p32 == "Parent" then
			mouseButton1ClickConnection:Disconnect()
			changedConnection:Disconnect()
		end
	end)
	
	return textButtonFromObjectPool
end

function t_1.AddTagLabelToBaseMessage(p33, p34, p35, p36)
	local var21 = p33:GetStringTextBounds(p36, p34.Font, p34.TextSize)
	local textLabelFromObjectPool = p33:GetFromObjectPool("TextLabel")
	textLabelFromObjectPool.Selectable = false
	textLabelFromObjectPool.Size = UDim2.new(0, var21.X, 0, var21.Y)
	textLabelFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	textLabelFromObjectPool.BackgroundTransparency = 1
	textLabelFromObjectPool.Font = p34.Font
	textLabelFromObjectPool.TextSize = p34.TextSize
	textLabelFromObjectPool.TextXAlignment = p34.TextXAlignment
	textLabelFromObjectPool.TextYAlignment = p34.TextYAlignment
	textLabelFromObjectPool.TextTransparency = p34.TextTransparency
	textLabelFromObjectPool.TextStrokeTransparency = p34.TextStrokeTransparency
	textLabelFromObjectPool.TextColor3 = p35
	textLabelFromObjectPool.Text = p36
	textLabelFromObjectPool.Visible = true
	textLabelFromObjectPool.Parent = p34
	
	return textLabelFromObjectPool
end

function GetWhisperChannelPrefix()
	-- upvalues: chatConstantsModule (ref)
	return if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To "
end

function t_1.NameButtonClicked(p37, _, p38)
	-- upvalues: chatSettingsModule (ref), playersService (ref), localPlayer (write)
	if not p37.ChatWindow then return end
	if chatSettingsModule.ClickOnPlayerNameToWhisper then
		local var23 = playersService:FindFirstChild(p38)
		
		if var23 and var23 ~= localPlayer then
			local text = GetWhisperChannelPrefix() .. p38
			
			if p37.ChatWindow:GetChannel(text) then
				p37.ChatBar:ResetCustomState()
				
				if p37.ChatWindow:GetTargetMessageChannel() ~= text then
					p37.ChatWindow:SwitchCurrentChannel(text)
				end
				p37.ChatBar:SetText("/w " .. p38)
				p37.ChatBar:CaptureFocus()
				
				return
			elseif not p37.ChatBar:IsInCustomState() then
				p37.ChatBar:SetText("/w " .. p38)
				p37.ChatBar:CaptureFocus()
			end
		end
	end
end

function t_1.ChannelButtonClicked(p39, _, p40)
	-- upvalues: chatSettingsModule (ref)
	if not p39.ChatWindow then return end
	if chatSettingsModule.ClickOnChannelNameToSetMainChannel and p39.ChatWindow:GetChannel(p40) then
		p39.ChatBar:ResetCustomState()
		
		if p39.ChatWindow:GetTargetMessageChannel() ~= p40 then
			p39.ChatWindow:SwitchCurrentChannel(p40)
		end
		p39.ChatBar:ResetText()
		p39.ChatBar:CaptureFocus()
	end
end

function t_1.RegisterChatWindow(p41, p42)
	p41.ChatWindow = p42
	p41.ChatBar = p42:GetChatBar()
end

function t_1.GetFromObjectPool(p43, p44)
	return if p43.ObjectPool == nil then Instance.new(p44) else p43.ObjectPool:GetInstance(p44)
end

function t_1.RegisterObjectPool(p45, p46)
	p45.ObjectPool = p46
end

function t_1.CreateFadeFunctions(_, p47)
	local t = {}
	
	for i, v in pairs(p47) do
		t[i] = {}
		
		for i_1, v_1 in pairs(v) do
			t[i][i_1] = {
				NormalizedExptValue = 1,
				Target = v_1.FadedIn,
				Current = i[i_1]
			}
		end
	end
	local function AnimGuiObjects()
		-- upvalues: t (ref)
		for i, v in pairs(t) do
			for i_1, v_1 in pairs(v) do
				i[i_1] = v_1.Current
			end
		end
	end
	
	return function(p48, p49)
		-- upvalues: t (ref), p47 (ref)
		for i, v in pairs(t) do
			for i_1, v_1 in pairs(v) do
				v_1.Target = p47[i][i_1].FadedIn
				v_1.NormalizedExptValue = p49:NormalizedDefaultExptValueInSeconds(p48)
			end
		end
	end, function(p50, p51)
		-- upvalues: t (ref), p47 (ref)
		for i, v in pairs(t) do
			for i_1, v_1 in pairs(v) do
				v_1.Target = p47[i][i_1].FadedOut
				v_1.NormalizedExptValue = p51:NormalizedDefaultExptValueInSeconds(p50)
			end
		end
	end, function(p52, p53)
		-- upvalues: t (ref), AnimGuiObjects (ref)
		for i, v in pairs(t) do
			for i_1, v_1 in pairs(v) do
				v_1.Current = p53:Expt(v_1.Current, v_1.Target, v_1.NormalizedExptValue, p52)
			end
		end
		AnimGuiObjects()
	end
end

function t_1.NewBindableEvent(_, p54)
	local bindableEvent = Instance.new("BindableEvent")
	bindableEvent.Name = p54
	
	return bindableEvent
end

function t_1.RegisterGuiRoot(_) end

function t.new()
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.ObjectPool = nil
	tbl.ChatWindow = nil
	tbl.DEFAULT_MESSAGE_CREATOR = "UnknownMessage"
	tbl.MESSAGE_CREATOR_MODULES_VERSION = 1
	tbl.KEY_MESSAGE_TYPE = "MessageType"
	tbl.KEY_CREATOR_FUNCTION = "MessageCreatorFunc"
	tbl.KEY_BASE_FRAME = "BaseFrame"
	tbl.KEY_BASE_MESSAGE = "BaseMessage"
	tbl.KEY_UPDATE_TEXT_FUNC = "UpdateTextFunction"
	tbl.KEY_GET_HEIGHT = "GetHeightFunction"
	tbl.KEY_FADE_IN = "FadeInFunction"
	tbl.KEY_FADE_OUT = "FadeOutFunction"
	tbl.KEY_UPDATE_ANIMATION = "UpdateAnimFunction"
	
	return tbl
end

return t.new()