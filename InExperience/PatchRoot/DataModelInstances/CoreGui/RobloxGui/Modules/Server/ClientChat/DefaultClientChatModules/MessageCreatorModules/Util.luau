local var1 = false
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixOverlappingRtlChatMessages2")
end)

if ok then
	var1 = status
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

function t_1.GetStringTextBounds(_, p1, p2, p3, p4)
	-- upvalues: textService (ref)
	return textService:GetTextSize(p1, p3, p2, p4 or Vector2.new(10000, 10000))
end

function t_1.GetMessageHeight(p1, p2, p3, p4)
	-- upvalues: var1 (write)
	local var2 = p1:GetStringTextBounds(if var1 then p2.ContentText else p2.Text, p2.Font, p2.TextSize, Vector2.new(p4 or p3.AbsoluteSize.X, 1000))
	
	return if var2.Y == math.floor(var2.Y) then var2.Y else var2.Y + 1
end

function t_1.GetNumberOfSpaces(p1, p2, p3, p4)
	return math.ceil(p1:GetStringTextBounds(p2, p3, p4).X / p1:GetStringTextBounds(" ", p3, p4).X)
end

function t_1.CreateLeadingSpaces(_, p1)
	-- upvalues: var1 (write)
	return if var1 then "<font dir=\"ltr\">" .. string.rep(" ", p1) .. "</font>" else string.rep(" ", p1)
end

function t_1.SanitizeForRichText(_, p1)
	-- upvalues: var1 (write)
	return if var1 then string.gsub(p1, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }) else p1
end

function t_1.CreateBaseMessage(p1, p2, p3, p4, p5)
	-- upvalues: var1 (write)
	local frameFromObjectPool = p1:GetFromObjectPool("Frame")
	frameFromObjectPool.Selectable = false
	frameFromObjectPool.Size = UDim2.new(1, 0, 0, 18)
	frameFromObjectPool.Visible = true
	frameFromObjectPool.BackgroundTransparency = 1
	local textLabelFromObjectPool = p1:GetFromObjectPool("TextLabel")
	textLabelFromObjectPool.Selectable = false
	textLabelFromObjectPool.Size = UDim2.new(1, -14, 1, 0)
	textLabelFromObjectPool.Position = UDim2.new(0, 8, 0, 0)
	textLabelFromObjectPool.BackgroundTransparency = 1
	textLabelFromObjectPool.Font = p3
	textLabelFromObjectPool.TextSize = p4
	textLabelFromObjectPool.TextXAlignment = Enum.TextXAlignment.Left
	textLabelFromObjectPool.TextYAlignment = Enum.TextYAlignment.Top
	textLabelFromObjectPool.TextTransparency = 0
	textLabelFromObjectPool.TextStrokeTransparency = 0.75
	textLabelFromObjectPool.TextColor3 = p5
	textLabelFromObjectPool.TextWrapped = true
	textLabelFromObjectPool.ClipsDescendants = true
	textLabelFromObjectPool.Text = p2
	textLabelFromObjectPool.Visible = true
	textLabelFromObjectPool.RichText = if var1 then true else false
	textLabelFromObjectPool.Parent = frameFromObjectPool
	
	return frameFromObjectPool, textLabelFromObjectPool
end

function t_1.AddNameButtonToBaseMessage(p1, p2, p3, p4, p5)
	local var2 = p1:GetStringTextBounds(p4, p2.Font, p2.TextSize)
	local textButtonFromObjectPool = p1:GetFromObjectPool("TextButton")
	textButtonFromObjectPool.Selectable = false
	textButtonFromObjectPool.Size = UDim2.new(0, var2.X, 0, var2.Y)
	textButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	textButtonFromObjectPool.BackgroundTransparency = 1
	textButtonFromObjectPool.Font = p2.Font
	textButtonFromObjectPool.TextSize = p2.TextSize
	textButtonFromObjectPool.TextXAlignment = p2.TextXAlignment
	textButtonFromObjectPool.TextYAlignment = p2.TextYAlignment
	textButtonFromObjectPool.TextTransparency = p2.TextTransparency
	textButtonFromObjectPool.TextStrokeTransparency = p2.TextStrokeTransparency
	textButtonFromObjectPool.TextColor3 = p3
	textButtonFromObjectPool.Text = p4
	textButtonFromObjectPool.Visible = true
	textButtonFromObjectPool.Parent = p2
	local mouseButton1ClickConnection = textButtonFromObjectPool.MouseButton1Click:connect(function()
		-- upvalues: p1 (ref), textButtonFromObjectPool (ref), p5 (ref)
		p1:NameButtonClicked(textButtonFromObjectPool, p5)
	end)
	local changedConnection = nil
	changedConnection = textButtonFromObjectPool.Changed:connect(function(p6)
		-- upvalues: mouseButton1ClickConnection (ref), changedConnection (write)
		if p6 == "Parent" then
			mouseButton1ClickConnection:Disconnect()
			changedConnection:Disconnect()
		end
	end)
	
	return textButtonFromObjectPool
end

function t_1.AddTranslationButtonToBaseMessage(p1, p2)
	local floored = math.floor(p2.TextSize * 0.9)
	local vector2 = Vector2.new(floored, floored)
	local imageButtonFromObjectPool = p1:GetFromObjectPool("ImageButton")
	imageButtonFromObjectPool.Selectable = false
	imageButtonFromObjectPool.Size = UDim2.new(0, vector2.X, 0, vector2.Y)
	imageButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	imageButtonFromObjectPool.BackgroundTransparency = 1
	imageButtonFromObjectPool.Visible = false
	imageButtonFromObjectPool.Parent = p2
	imageButtonFromObjectPool.Image = "rbxasset://textures/translateIcon.png"
	imageButtonFromObjectPool.HoverImage = "rbxasset://textures/translateIconDark.png"
	imageButtonFromObjectPool.PressedImage = "rbxasset://textures/translateIconDark.png"
	
	return imageButtonFromObjectPool
end

function t_1.AddChannelButtonToBaseMessage(p1, p2, p3, p4, p5)
	local var2 = p1:GetStringTextBounds(p4, p2.Font, p2.TextSize)
	local textButtonFromObjectPool = p1:GetFromObjectPool("TextButton")
	textButtonFromObjectPool.Selectable = false
	textButtonFromObjectPool.Size = UDim2.new(0, var2.X, 0, var2.Y)
	textButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	textButtonFromObjectPool.BackgroundTransparency = 1
	textButtonFromObjectPool.Font = p2.Font
	textButtonFromObjectPool.TextSize = p2.TextSize
	textButtonFromObjectPool.TextXAlignment = p2.TextXAlignment
	textButtonFromObjectPool.TextYAlignment = p2.TextYAlignment
	textButtonFromObjectPool.TextTransparency = p2.TextTransparency
	textButtonFromObjectPool.TextStrokeTransparency = p2.TextStrokeTransparency
	textButtonFromObjectPool.TextColor3 = p3
	textButtonFromObjectPool.Text = p4
	textButtonFromObjectPool.Visible = true
	textButtonFromObjectPool.Parent = p2
	local mouseButton1ClickConnection = textButtonFromObjectPool.MouseButton1Click:connect(function()
		-- upvalues: p1 (ref), textButtonFromObjectPool (ref), p5 (ref)
		p1:ChannelButtonClicked(textButtonFromObjectPool, p5)
	end)
	local changedConnection = nil
	changedConnection = textButtonFromObjectPool.Changed:connect(function(p6)
		-- upvalues: mouseButton1ClickConnection (ref), changedConnection (write)
		if p6 == "Parent" then
			mouseButton1ClickConnection:Disconnect()
			changedConnection:Disconnect()
		end
	end)
	
	return textButtonFromObjectPool
end

function t_1.AddTagLabelToBaseMessage(p1, p2, p3, p4)
	local var2 = p1:GetStringTextBounds(p4, p2.Font, p2.TextSize)
	local textLabelFromObjectPool = p1:GetFromObjectPool("TextLabel")
	textLabelFromObjectPool.Selectable = false
	textLabelFromObjectPool.Size = UDim2.new(0, var2.X, 0, var2.Y)
	textLabelFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	textLabelFromObjectPool.BackgroundTransparency = 1
	textLabelFromObjectPool.Font = p2.Font
	textLabelFromObjectPool.TextSize = p2.TextSize
	textLabelFromObjectPool.TextXAlignment = p2.TextXAlignment
	textLabelFromObjectPool.TextYAlignment = p2.TextYAlignment
	textLabelFromObjectPool.TextTransparency = p2.TextTransparency
	textLabelFromObjectPool.TextStrokeTransparency = p2.TextStrokeTransparency
	textLabelFromObjectPool.TextColor3 = p3
	textLabelFromObjectPool.Text = p4
	textLabelFromObjectPool.Visible = true
	textLabelFromObjectPool.Parent = p2
	
	return textLabelFromObjectPool
end

function GetWhisperChannelPrefix()
	-- upvalues: chatConstantsModule (ref)
	return if chatConstantsModule.WhisperChannelPrefix then chatConstantsModule.WhisperChannelPrefix else "To "
end

function t_1.NameButtonClicked(p1, _, p2)
	-- upvalues: chatSettingsModule (ref), playersService (ref), localPlayer (write)
	if not p1.ChatWindow then return end
	if chatSettingsModule.ClickOnPlayerNameToWhisper then
		local var2 = playersService:FindFirstChild(p2)
		
		if var2 and var2 ~= localPlayer then
			local text = GetWhisperChannelPrefix() .. p38
			
			if p1.ChatWindow:GetChannel(text) then
				p1.ChatBar:ResetCustomState()
				
				if p1.ChatWindow:GetTargetMessageChannel() ~= text then
					p1.ChatWindow:SwitchCurrentChannel(text)
				end
				p1.ChatBar:SetText("/w " .. p38)
				p1.ChatBar:CaptureFocus()
				
				return
			elseif not p1.ChatBar:IsInCustomState() then
				p1.ChatBar:SetText("/w " .. p38)
				p1.ChatBar:CaptureFocus()
			end
		end
	end
end

function t_1.ChannelButtonClicked(p1, _, p2)
	-- upvalues: chatSettingsModule (ref)
	if not p1.ChatWindow then return end
	if chatSettingsModule.ClickOnChannelNameToSetMainChannel and p1.ChatWindow:GetChannel(p2) then
		p1.ChatBar:ResetCustomState()
		
		if p1.ChatWindow:GetTargetMessageChannel() ~= p2 then
			p1.ChatWindow:SwitchCurrentChannel(p2)
		end
		p1.ChatBar:ResetText()
		p1.ChatBar:CaptureFocus()
	end
end

function t_1.RegisterChatWindow(p1, p2)
	p1.ChatWindow = p2
	p1.ChatBar = p2:GetChatBar()
end

function t_1.GetFromObjectPool(p1, p2)
	return if p1.ObjectPool == nil then Instance.new(p2) else p1.ObjectPool:GetInstance(p2)
end

function t_1.RegisterObjectPool(p1, p2)
	p1.ObjectPool = p2
end

function t_1.CreateFadeFunctions(_, p1)
	local t = {}
	
	for i, v in pairs(p1) do
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
	
	return function(p2, p3)
		-- upvalues: t (ref), p1 (ref)
		for i, v in pairs(t) do
			for i_1, v_1 in pairs(v) do
				v_1.Target = p1[i][i_1].FadedIn
				v_1.NormalizedExptValue = p3:NormalizedDefaultExptValueInSeconds(p2)
			end
		end
	end, function(p4, p5)
		-- upvalues: t (ref), p1 (ref)
		for i, v in pairs(t) do
			for i_1, v_1 in pairs(v) do
				v_1.Target = p1[i][i_1].FadedOut
				v_1.NormalizedExptValue = p5:NormalizedDefaultExptValueInSeconds(p4)
			end
		end
	end, function(p6, p7)
		-- upvalues: t (ref), AnimGuiObjects (ref)
		for i, v in pairs(t) do
			for i_1, v_1 in pairs(v) do
				v_1.Current = p7:Expt(v_1.Current, v_1.Target, v_1.NormalizedExptValue, p6)
			end
		end
		AnimGuiObjects()
	end
end

function t_1.NewBindableEvent(_, p8)
	local bindableEvent = Instance.new("BindableEvent")
	bindableEvent.Name = p8
	
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