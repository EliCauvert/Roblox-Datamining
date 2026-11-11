local v1 = false
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixOverlappingRtlChatMessages2")
end)

if Success then
	v1 = Result
end
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local Parent = script.Parent.Parent
local ChatSettingsModule = require(Parent:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(Parent:WaitForChild("ChatConstants"))
local Module = {}
Module.__index = Module

function Module:GetStringTextBounds(ContentText, p1, TextSize, Vector)
	-- upvalues: TextService (copy)
	return TextService:GetTextSize(ContentText, TextSize, p1, Vector or Vector2.new(10000, 10000))
end

function Module.GetMessageHeight(p1, Label, Frame, p2)
	-- upvalues: v1 (ref)
	local StringTextBounds = p1:GetStringTextBounds(if v1 then Label.ContentText else Label.Text, Label.Font, Label.TextSize, Vector2.new(p2 or Frame.AbsoluteSize.X, 1000))
	
	return if StringTextBounds.Y == math.floor(StringTextBounds.Y) then StringTextBounds.Y else StringTextBounds.Y + 1
end

function Module.GetNumberOfSpaces(p1, p2, p3, p4): number
	return (math.ceil(p1:GetStringTextBounds(p2, p3, p4).X / p1:GetStringTextBounds(" ", p3, p4).X))
end

function Module:CreateLeadingSpaces(Count: number): string
	-- upvalues: v1 (ref)
	return if v1 then "<font dir=\"ltr\">" .. string.rep(" ", Count) .. "</font>" else string.rep(" ", Count)
end

function Module:SanitizeForRichText(Text: string): string
	-- upvalues: v1 (ref)
	return if v1 then string.gsub(Text, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }) else Text
end

function Module.CreateBaseMessage(p1, Text, p2, TextSize, TextColor3)
	-- upvalues: v1 (ref)
	local FrameFromObjectPool = p1:GetFromObjectPool("Frame")
	FrameFromObjectPool.Selectable = false
	FrameFromObjectPool.Size = UDim2.new(1, 0, 0, 18)
	FrameFromObjectPool.Visible = true
	FrameFromObjectPool.BackgroundTransparency = 1
	local TextLabelFromObjectPool = p1:GetFromObjectPool("TextLabel")
	TextLabelFromObjectPool.Selectable = false
	TextLabelFromObjectPool.Size = UDim2.new(1, -14, 1, 0)
	TextLabelFromObjectPool.Position = UDim2.new(0, 8, 0, 0)
	TextLabelFromObjectPool.BackgroundTransparency = 1
	TextLabelFromObjectPool.Font = p2
	TextLabelFromObjectPool.TextSize = TextSize
	TextLabelFromObjectPool.TextXAlignment = Enum.TextXAlignment.Left
	TextLabelFromObjectPool.TextYAlignment = Enum.TextYAlignment.Top
	TextLabelFromObjectPool.TextTransparency = 0
	TextLabelFromObjectPool.TextStrokeTransparency = 0.75
	TextLabelFromObjectPool.TextColor3 = TextColor3
	TextLabelFromObjectPool.TextWrapped = true
	TextLabelFromObjectPool.ClipsDescendants = true
	TextLabelFromObjectPool.Text = Text
	TextLabelFromObjectPool.Visible = true
	TextLabelFromObjectPool.RichText = if v1 then true else false
	TextLabelFromObjectPool.Parent = FrameFromObjectPool
	
	return FrameFromObjectPool, TextLabelFromObjectPool
end

function Module.AddNameButtonToBaseMessage(p1, Label, TextColor3, Text, p2)
	local StringTextBounds = p1:GetStringTextBounds(Text, Label.Font, Label.TextSize)
	local TextButtonFromObjectPool = p1:GetFromObjectPool("TextButton")
	TextButtonFromObjectPool.Selectable = false
	TextButtonFromObjectPool.Size = UDim2.new(0, StringTextBounds.X, 0, StringTextBounds.Y)
	TextButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	TextButtonFromObjectPool.BackgroundTransparency = 1
	TextButtonFromObjectPool.Font = Label.Font
	TextButtonFromObjectPool.TextSize = Label.TextSize
	TextButtonFromObjectPool.TextXAlignment = Label.TextXAlignment
	TextButtonFromObjectPool.TextYAlignment = Label.TextYAlignment
	TextButtonFromObjectPool.TextTransparency = Label.TextTransparency
	TextButtonFromObjectPool.TextStrokeTransparency = Label.TextStrokeTransparency
	TextButtonFromObjectPool.TextColor3 = TextColor3
	TextButtonFromObjectPool.Text = Text
	TextButtonFromObjectPool.Visible = true
	TextButtonFromObjectPool.Parent = Label
	local MouseButton1ClickConnection = TextButtonFromObjectPool.MouseButton1Click:connect(function()
		-- upvalues: p1 (copy), TextButtonFromObjectPool (copy), p2 (copy)
		p1:NameButtonClicked(TextButtonFromObjectPool, p2)
	end)
	local Connection = nil
	Connection = TextButtonFromObjectPool.Changed:connect(function(p3)
		-- upvalues: MouseButton1ClickConnection (copy), Connection (ref)
		if p3 == "Parent" then
			MouseButton1ClickConnection:Disconnect()
			Connection:Disconnect()
		end
	end)
	
	return TextButtonFromObjectPool
end

function Module.AddTranslationButtonToBaseMessage(p1, Label)
	local Floored = math.floor(Label.TextSize * 0.9)
	local _Vector2 = Vector2.new(Floored, Floored)
	local ImageButtonFromObjectPool = p1:GetFromObjectPool("ImageButton")
	ImageButtonFromObjectPool.Selectable = false
	ImageButtonFromObjectPool.Size = UDim2.new(0, _Vector2.X, 0, _Vector2.Y)
	ImageButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	ImageButtonFromObjectPool.BackgroundTransparency = 1
	ImageButtonFromObjectPool.Visible = false
	ImageButtonFromObjectPool.Parent = Label
	ImageButtonFromObjectPool.Image = "rbxasset://textures/translateIcon.png"
	ImageButtonFromObjectPool.HoverImage = "rbxasset://textures/translateIconDark.png"
	ImageButtonFromObjectPool.PressedImage = "rbxasset://textures/translateIconDark.png"
	
	return ImageButtonFromObjectPool
end

function Module.AddChannelButtonToBaseMessage(p1, Label, TextColor3, Text, p2)
	local StringTextBounds = p1:GetStringTextBounds(Text, Label.Font, Label.TextSize)
	local TextButtonFromObjectPool = p1:GetFromObjectPool("TextButton")
	TextButtonFromObjectPool.Selectable = false
	TextButtonFromObjectPool.Size = UDim2.new(0, StringTextBounds.X, 0, StringTextBounds.Y)
	TextButtonFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	TextButtonFromObjectPool.BackgroundTransparency = 1
	TextButtonFromObjectPool.Font = Label.Font
	TextButtonFromObjectPool.TextSize = Label.TextSize
	TextButtonFromObjectPool.TextXAlignment = Label.TextXAlignment
	TextButtonFromObjectPool.TextYAlignment = Label.TextYAlignment
	TextButtonFromObjectPool.TextTransparency = Label.TextTransparency
	TextButtonFromObjectPool.TextStrokeTransparency = Label.TextStrokeTransparency
	TextButtonFromObjectPool.TextColor3 = TextColor3
	TextButtonFromObjectPool.Text = Text
	TextButtonFromObjectPool.Visible = true
	TextButtonFromObjectPool.Parent = Label
	local MouseButton1ClickConnection = TextButtonFromObjectPool.MouseButton1Click:connect(function()
		-- upvalues: p1 (copy), TextButtonFromObjectPool (copy), p2 (copy)
		p1:ChannelButtonClicked(TextButtonFromObjectPool, p2)
	end)
	local Connection = nil
	Connection = TextButtonFromObjectPool.Changed:connect(function(p3)
		-- upvalues: MouseButton1ClickConnection (copy), Connection (ref)
		if p3 == "Parent" then
			MouseButton1ClickConnection:Disconnect()
			Connection:Disconnect()
		end
	end)
	
	return TextButtonFromObjectPool
end

function Module.AddTagLabelToBaseMessage(p1, Label, TextColor3, Text)
	local StringTextBounds = p1:GetStringTextBounds(Text, Label.Font, Label.TextSize)
	local TextLabelFromObjectPool = p1:GetFromObjectPool("TextLabel")
	TextLabelFromObjectPool.Selectable = false
	TextLabelFromObjectPool.Size = UDim2.new(0, StringTextBounds.X, 0, StringTextBounds.Y)
	TextLabelFromObjectPool.Position = UDim2.new(0, 0, 0, 0)
	TextLabelFromObjectPool.BackgroundTransparency = 1
	TextLabelFromObjectPool.Font = Label.Font
	TextLabelFromObjectPool.TextSize = Label.TextSize
	TextLabelFromObjectPool.TextXAlignment = Label.TextXAlignment
	TextLabelFromObjectPool.TextYAlignment = Label.TextYAlignment
	TextLabelFromObjectPool.TextTransparency = Label.TextTransparency
	TextLabelFromObjectPool.TextStrokeTransparency = Label.TextStrokeTransparency
	TextLabelFromObjectPool.TextColor3 = TextColor3
	TextLabelFromObjectPool.Text = Text
	TextLabelFromObjectPool.Visible = true
	TextLabelFromObjectPool.Parent = Label
	
	return TextLabelFromObjectPool
end

function GetWhisperChannelPrefix()
	-- upvalues: ChatConstantsModule (copy)
	return if ChatConstantsModule.WhisperChannelPrefix then ChatConstantsModule.WhisperChannelPrefix else "To "
end

function Module.NameButtonClicked(p1, _, Text)
	-- upvalues: ChatSettingsModule (copy), Players (copy), LocalPlayer (ref)
	if not p1.ChatWindow then return end
	if ChatSettingsModule.ClickOnPlayerNameToWhisper then
		local Text1 = Players:FindFirstChild(Text)
		
		if Text1 and Text1 ~= LocalPlayer then
			local Text2 = GetWhisperChannelPrefix() .. Text
			
			if p1.ChatWindow:GetChannel(Text2) then
				p1.ChatBar:ResetCustomState()
				
				if p1.ChatWindow:GetTargetMessageChannel() ~= Text2 then
					p1.ChatWindow:SwitchCurrentChannel(Text2)
				end
				p1.ChatBar:SetText("/w " .. Text)
				p1.ChatBar:CaptureFocus()
				
				return
			elseif not p1.ChatBar:IsInCustomState() then
				p1.ChatBar:SetText("/w " .. Text)
				p1.ChatBar:CaptureFocus()
			end
		end
	end
end

function Module.ChannelButtonClicked(p1, _, TargetMessageChannel)
	-- upvalues: ChatSettingsModule (copy)
	if not p1.ChatWindow then return end
	if ChatSettingsModule.ClickOnChannelNameToSetMainChannel and p1.ChatWindow:GetChannel(TargetMessageChannel) then
		p1.ChatBar:ResetCustomState()
		
		if p1.ChatWindow:GetTargetMessageChannel() ~= TargetMessageChannel then
			p1.ChatWindow:SwitchCurrentChannel(TargetMessageChannel)
		end
		p1.ChatBar:ResetText()
		p1.ChatBar:CaptureFocus()
	end
end

function Module.RegisterChatWindow(p1, ChatWindow)
	p1.ChatWindow = ChatWindow
	p1.ChatBar = ChatWindow:GetChatBar()
end

function Module.GetFromObjectPool(p1, p2)
	return if p1.ObjectPool == nil then Instance.new(p2) else p1.ObjectPool:GetInstance(p2)
end

function Module.RegisterObjectPool(p1, ObjectPool)
	p1.ObjectPool = ObjectPool
end

function Module:CreateFadeFunctions(List)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = {}
		
		for i1, value1 in pairs(value) do
			t[i][i1] = {
				NormalizedExptValue = 1,
				Target = value1.FadedIn,
				Current = i[i1]
			}
		end
	end
	local function AnimGuiObjects()
		-- upvalues: t (copy)
		for i, value in pairs(t) do
			for i1, value1 in pairs(value) do
				i[i1] = value1.Current
			end
		end
	end
	
	return function(p1, p2)
		-- upvalues: t (copy), List (copy)
		for i, value in pairs(t) do
			for i1, value1 in pairs(value) do
				value1.Target = List[i][i1].FadedIn
				value1.NormalizedExptValue = p2:NormalizedDefaultExptValueInSeconds(p1)
			end
		end
	end, function(p3, p4)
		-- upvalues: t (copy), List (copy)
		for i, value in pairs(t) do
			for i1, value1 in pairs(value) do
				value1.Target = List[i][i1].FadedOut
				value1.NormalizedExptValue = p4:NormalizedDefaultExptValueInSeconds(p3)
			end
		end
	end, function(p5, p6)
		-- upvalues: t (copy), AnimGuiObjects (copy)
		for _, value in pairs(t) do
			for _, Mouse in pairs(value) do
				Mouse.Current = p6:Expt(Mouse.Current, Mouse.Target, Mouse.NormalizedExptValue, p5)
			end
		end
		AnimGuiObjects()
	end
end

function Module:NewBindableEvent(Name)
	local BindableEvent = Instance.new("BindableEvent")
	BindableEvent.Name = Name
	
	return BindableEvent
end

function Module:RegisterGuiRoot() end

return ({
	new = function()
		-- upvalues: Module (copy)
		local self = setmetatable({}, Module)
		self.ObjectPool = nil
		self.ChatWindow = nil
		self.DEFAULT_MESSAGE_CREATOR = "UnknownMessage"
		self.MESSAGE_CREATOR_MODULES_VERSION = 1
		self.KEY_MESSAGE_TYPE = "MessageType"
		self.KEY_CREATOR_FUNCTION = "MessageCreatorFunc"
		self.KEY_BASE_FRAME = "BaseFrame"
		self.KEY_BASE_MESSAGE = "BaseMessage"
		self.KEY_UPDATE_TEXT_FUNC = "UpdateTextFunction"
		self.KEY_GET_HEIGHT = "GetHeightFunction"
		self.KEY_FADE_IN = "FadeInFunction"
		self.KEY_FADE_OUT = "FadeOutFunction"
		self.KEY_UPDATE_ANIMATION = "UpdateAnimFunction"
		
		return self
	end
}).new()