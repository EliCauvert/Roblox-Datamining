local RunService = game:GetService("RunService")
local _ = game:GetService("UserInputService")
local _ = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local ContextActionService = game:GetService("ContextActionService")
local _ = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local _Color3 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
local _Color3_1 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805)
local _Color3_2 = Color3.new(0, 0.6352941176470588, 1)
local _Color3_3 = Color3.new(0, 0.6352941176470588, 1)
local _Color3_4 = Color3.new(1, 1, 1)
local SymW8W24Speaker = HttpService:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"Q\",\n    \"W\",\n    \"E\",\n    \"R\",\n    \"T\",\n    \"Y\",\n    \"U\",\n    \"I\",\n    \"O\",\n    \"P\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"Caps\",\n    \"A\",\n    \"S\",\n    \"D\",\n    \"F\",\n    \"G\",\n    \"H\",\n    \"J\",\n    \"K\",\n    \"L\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"Shift\",\n    \"Z\",\n    \"X\",\n    \"C\",\n    \"V\",\n    \"B\",\n    \"N\",\n    \"M\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"123/sym\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
local W22AbcW8W24Speaker = HttpService:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"1\",\n    \"2\",\n    \"3\",\n    \"4\",\n    \"5\",\n    \"6\",\n    \"7\",\n    \"8\",\n    \"9\",\n    \"0\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"!\",\n    \"@\",\n    \"#\",\n    \"$\",\n    \"%\",\n    \"^\",\n    \"&\",\n    \"(\",\n    \")\",\n    \"=\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 1.2\n    },\n    \"/\",\n    \"-\",\n    \"+\",\n    \"_\",\n    \":\",\n    \";\",\n    \"'\",\n    \"\\\"\",\n    \",\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"abc\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
local t = {}

for i, value in pairs({
	"ASR_STATUS_OK", "ASR_STATUS_CANCELLED", "ASR_STATUS_UNKNOWN",
	"ASR_STATUS_INVALID_ARGUMENTS", "ASR_STATUS_DEADLINE_EXCEEDED",
	"ASR_STATUS_NOT_FOUND", "ASR_STATUS_ALREADY_EXISTS",
	"ASR_STATUS_PERMISSION_DENIED", "ASR_STATUS_UNAUTHENTICATED",
	"ASR_STATUS_RESOURCE_EXHAUSTED", "ASR_STATUS_FAILED_PRECONDITION",
	"ASR_STATUS_ABORTED", "ASR_STATUS_OUT_OF_RANGE", "ASR_STATUS_UNIMPLEMENTED",
	"ASR_STATUS_INTERNAL", "ASR_STATUS_UNAVAILABLE", "ASR_STATUS_DATA_LOSS",
	"ASR_STATUS_NOT_ENABLED", "ASR_STATUS_LOW_CONFIDENCE",
	"ASR_STATUS_INVALID_JSON"
}) do
	t[value] = i - 1
end
local function _(Text: string, Text1)
	local List = {}
	
	for i in string.gmatch(Text, "([^" .. Text1 .. "]+)") do
		table.insert(List, i)
	end
	return List
end

local _ = function(p1): string
	local Match: string? = string.match(p1.Name, "%d+")
	
	return Match and tostring(Match) or 12
end

local _ = function(Direction, p1, p2)
	local Unit = p1.unit
	local Direction1 = Direction.Unit
	local DotProduct = Unit:Dot(Direction1.Direction)
	
	if DotProduct == 0 then
		return nil
	else
		local DotProductRatio = Unit:Dot(p2 - Direction1.Origin) / DotProduct
		
		return if DotProductRatio < 0 then nil else Direction1.Origin + Direction1.Direction * DotProductRatio
	end
end

function Clamp(p1: number, p2: number, p3: number): number
	return (math.max(p1, (math.min(p2, p3))))
end

local _ = function(Frame: Frame, p1, p2): boolean
	local AbsolutePosition = Frame.AbsolutePosition
	local NewAbsolutePosition = Frame.AbsolutePosition + Frame.AbsoluteSize
	
	return AbsolutePosition.X <= p1 and p1 <= NewAbsolutePosition.X and AbsolutePosition.Y <= p2 and p2 <= NewAbsolutePosition.Y
end

local function FindAncestorOfType(Parent, ClassName)
	-- upvalues: FindAncestorOfType (copy)
	if Parent then
		local Parent1 = Parent.Parent
		
		return if Parent1 and Parent1:IsA(ClassName) then Parent1 else FindAncestorOfType(Parent1, ClassName)
	else
		return nil
	end
end

local function ExtendedInstance(Frame)
	local t = {}
	setmetatable(t, {
		__index = function(_, p1)
			-- upvalues: Frame (copy)
			return Frame[p1]
		end,
		__newindex = function(_, Key, p1)
			-- upvalues: Frame (copy)
			Frame[Key] = p1
		end
	})
	
	return t
end

local function CreateVRButton(Frame: Frame)
	-- upvalues: ExtendedInstance (copy)
	local ExtendedInstanceResult = ExtendedInstance(Frame)
	rawset(ExtendedInstanceResult, "OnEnter", function(_) end)
	rawset(ExtendedInstanceResult, "OnLeave", function(_) end)
	rawset(ExtendedInstanceResult, "OnDown", function(_) end)
	rawset(ExtendedInstanceResult, "OnUp", function(_) end)
	rawset(ExtendedInstanceResult, "ContainsPoint", function(_, p1, p2): boolean
		-- upvalues: Frame (copy)
		local AbsolutePosition = Frame.AbsolutePosition
		local NewAbsolutePosition = Frame.AbsolutePosition + Frame.AbsoluteSize
		
		return AbsolutePosition.X <= p1 and p1 <= NewAbsolutePosition.X and AbsolutePosition.Y <= p2 and p2 <= NewAbsolutePosition.Y
	end)
	rawset(ExtendedInstanceResult, "Update", function(_) end)
	
	return ExtendedInstanceResult
end

local _ = CreateFunction("ImageLabel")({
	Name = "SelectionRing",
	Image = "rbxasset://textures/ui/menu/buttonHover.png",
	BackgroundTransparency = 1,
	Size = UDim2.new(1, -6, 1, -6),
	Position = UDim2.new(0, 4, 0, 3),
	ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(47, 47, 47, 47)
})
local config = {
	["<Speaker>"] = {
		Asset = "rbxasset://textures/ui/Keyboard/mic_icon.png",
		AspectRatio = 0.615
	}
}

local function CreateKeyboardKey(p1, Vector, Entry)
	-- upvalues: CreateFunction (copy), _Color3_4 (copy), _Color3 (copy), CreateVRButton (copy), config (copy), _Color3_2 (copy), _Color3_1 (copy), _Color3_3 (copy)
	local Y2 = Vector.width2 and (Vector.height2 and (Vector.x2 and Vector.y2))
	local Parent = CreateFunction("ImageButton")({
		BorderSizePixel = 0,
		Image = "",
		BackgroundTransparency = 1,
		ZIndex = 1,
		Name = Entry[1],
		Position = UDim2.new(Vector.x, 0, Vector.y, 0),
		Size = UDim2.new(Vector.width, 0, Vector.height, 0)
	})
	local v1 = CreateFunction("TextLabel")({
		Name = "KeyText",
		BackgroundTransparency = 1,
		Selectable = true,
		ZIndex = 2,
		Text = Entry[#Entry],
		Position = UDim2.new(0, -10, 0, -10),
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = _Color3_4,
		Parent = Parent
	})
	local Frame = CreateFunction("Frame")({
		Name = "KeyBackground",
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -10, 1, -10),
		Position = UDim2.new(0, -5, 0, -5),
		BackgroundColor3 = _Color3,
		Parent = Parent
	})
	local v2 = CreateFunction("ImageLabel")({
		Name = "SelectionObject",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png",
		ImageTransparency = 0,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(12, 12, 52, 52)
	})
	Parent.SelectionImageObject = CreateFunction("ImageLabel")({ Visible = false })
	local Button = nil
	local Object = nil
	local v3 = nil
	local v4 = nil
	
	if Y2 then
		Button = CreateFunction("ImageButton")({
			Name = "KeyBackground",
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Position = UDim2.new(Vector.x2 / Vector.width, -5, Vector.y2 / Vector.height, -5),
			Size = UDim2.new(Vector.width2 / Vector.width, 0, Vector.height2 / Vector.height, -10),
			BackgroundColor3 = _Color3,
			SelectionImageObject = Parent.SelectionImageObject,
			Parent = Parent
		})
		
		if Vector.x2 <= 0 then
			v1.Size = Button.Size - UDim2.new(0, 10, 0, 0)
			v1.Position = Button.Position
			Button.Size -= UDim2.new(1, 0, 0, 0)
		end
		Object = CreateFunction("Frame")({
			Name = "SpecialSelectionObject",
			Size = UDim2.new(1, 0, 0.5, 0),
			Position = UDim2.new(0, 0, 0.5, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			CreateFunction("ImageLabel")({
				Name = "Borders",
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png",
				ImageTransparency = 0,
				Position = UDim2.new(-1, 0, -1, 0),
				Size = UDim2.new(2, 0, 2, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(12, 12, 52, 52)
			})
		})
		v3 = Object:Clone()
		v3.Size = UDim2.new(1, 0, 0.5, 5)
		v3.Position = UDim2.new(0, 0, 0, 0)
		v3.Borders.Size = UDim2.new(1, 0, 1, 30)
		v3.Borders.Position = UDim2.new(0, 0, 0, 0)
		v4 = Object:Clone()
		v4.Size = UDim2.new(1, 5, 1, 0)
		v4.Position = UDim2.new(0, 0, 0, 0)
		v4.Borders.Size = UDim2.new(1, 30, 1, 0)
		v4.Borders.Position = UDim2.new(0, 0, 0, 0)
	end
	local VRButton = CreateVRButton(Parent)
	local Flag = false
	local Flag1 = false
	local IsByteValueBelow: boolean = #Entry == 1 and (type(Entry[1]) == "string" and (#Entry[1] == 1 and string.byte(Entry[1]) >= 65)) and string.byte(Entry[1]) <= 122
	local Frame1 = nil
	
	if Entry[1] and config[Entry[1]] then
		v1.Visible = false
		Frame1 = CreateFunction("ImageLabel")({
			Name = "KeyIcon",
			BackgroundTransparency = 1,
			Size = UDim2.new(config[Entry[1]].AspectRatio, -20, 1, -20),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Image = config[Entry[1]].Asset,
			Parent = Frame
		})
		Frame1.Changed:connect(function(p2)
			-- upvalues: Frame1 (ref)
			if p2 == "AbsoluteSize" then
				Frame1.Position = UDim2.new(0.5, -Frame1.AbsoluteSize.X / 2, 0.5, -Frame1.AbsoluteSize.Y / 2)
			end
		end)
		Frame1.Position = UDim2.new(0.5, -Frame1.AbsoluteSize.X / 2, 0.5, -Frame1.AbsoluteSize.Y / 2)
	end
	local function onClicked()
		-- upvalues: VRButton (copy), p1 (copy), IsByteValueBelow (copy)
		local v5 = nil
		local CurrentKeyValue = VRButton:GetCurrentKeyValue()
		
		if CurrentKeyValue == "Shift" then
			p1:SetShift(not p1:GetShift())
		elseif CurrentKeyValue == "Caps" then
			p1:SetCaps(not p1:GetCaps())
		elseif CurrentKeyValue == "Enter" then
			p1:SubmitText(true, true)
		elseif CurrentKeyValue == "Delete" then
			p1:BackspaceAtCursor()
		elseif CurrentKeyValue == "123/sym" then
			p1:SetCurrentKeyset(2)
		elseif CurrentKeyValue == "abc" then
			p1:SetCurrentKeyset(1)
		elseif CurrentKeyValue == "<Speaker>" then
			p1:SetVoiceMode(true)
		else
			v5 = if CurrentKeyValue == "Tab" then "\t" else CurrentKeyValue
		end
		if v5 ~= nil then
			p1:SubmitCharacter(v5, IsByteValueBelow)
		end
	end
	
	local function _(BackgroundColor3, p2)
		-- upvalues: Frame (copy), Button (ref), Y2 (copy), Object (ref), v3 (ref), v4 (ref), v2 (copy)
		Frame.BackgroundColor3 = BackgroundColor3
		
		if Button then
			Button.BackgroundColor3 = BackgroundColor3
		end
		if Y2 then
			Object.Parent = p2 and Frame or nil
			v3.Parent = p2 and Frame or nil
			v4.Parent = p2 and Button or nil
			
			return
		else
			v2.Parent = p2 and Frame or nil
		end
	end
	
	local function update()
		-- upvalues: VRButton (copy), Flag1 (ref), _Color3_2 (upval), Frame (copy), Button (ref), Y2 (copy), Object (ref), v3 (ref), v4 (ref), v2 (copy), Flag (ref), _Color3_1 (upval), p1 (copy), _Color3_3 (upval), _Color3 (upval), Frame1 (ref), v1 (copy)
		local CurrentKeyValue = VRButton:GetCurrentKeyValue()
		
		if Flag1 then
			Frame.BackgroundColor3 = _Color3_2
			
			if Button then
				Button.BackgroundColor3 = _Color3_2
			end
			if Y2 then
				Object.Parent = nil
				v3.Parent = nil
				v4.Parent = nil
			else
				v2.Parent = nil
			end
		elseif Flag then
			Frame.BackgroundColor3 = _Color3_1
			
			if Button then
				Button.BackgroundColor3 = _Color3_1
			end
			if Y2 then
				Object.Parent = Frame or nil
				v3.Parent = Frame or nil
				v4.Parent = Button or nil
			else
				v2.Parent = Frame or nil
			end
		elseif CurrentKeyValue == "Caps" and p1:GetCaps() then
			Frame.BackgroundColor3 = _Color3_3
			
			if Button then
				Button.BackgroundColor3 = _Color3_3
			end
			if Y2 then
				Object.Parent = nil
				v3.Parent = nil
				v4.Parent = nil
			else
				v2.Parent = nil
			end
		elseif CurrentKeyValue == "Shift" and p1:GetShift() then
			Frame.BackgroundColor3 = _Color3_3
			
			if Button then
				Button.BackgroundColor3 = _Color3_3
			end
			if Y2 then
				Object.Parent = nil
				v3.Parent = nil
				v4.Parent = nil
			else
				v2.Parent = nil
			end
		elseif CurrentKeyValue == "abc" then
			Frame.BackgroundColor3 = _Color3_3
			
			if Button then
				Button.BackgroundColor3 = _Color3_3
			end
			if Y2 then
				Object.Parent = nil
				v3.Parent = nil
				v4.Parent = nil
			else
				v2.Parent = nil
			end
		else
			Frame.BackgroundColor3 = _Color3
			
			if Button then
				Button.BackgroundColor3 = _Color3
			end
			if Y2 then
				Object.Parent = nil
				v3.Parent = nil
				v4.Parent = nil
			else
				v2.Parent = nil
			end
		end
		if Frame1 then
			Frame1.ImageTransparency = 0.5
		end
		v1.Text = VRButton:GetCurrentKeyValue()
	end
	
	local t = {}
	rawset(VRButton, "OnEnter", function(_)
		-- upvalues: Flag (ref), update (copy)
		Flag = true
		update()
	end)
	rawset(VRButton, "OnLeave", function(_)
		-- upvalues: t (copy), Flag (ref), Flag1 (ref), update (copy)
		if not next(t) then
			Flag = false
			Flag1 = false
			update()
		end
	end)
	rawset(VRButton, "OnDown", function(_)
		-- upvalues: Flag1 (ref), update (copy), onClicked (copy)
		Flag1 = true
		update()
		onClicked()
	end)
	rawset(VRButton, "OnUp", function(_)
		-- upvalues: Flag1 (ref), update (copy)
		Flag1 = false
		update()
	end)
	rawset(VRButton, "GetCurrentKeyValue", function(_)
		-- upvalues: p1 (copy), IsByteValueBelow (copy), Entry (copy)
		local Shift = p1:GetShift()
		local Caps = p1:GetCaps()
		
		return if IsByteValueBelow then if Caps and Shift then string.lower(Entry[#Entry]) elseif Caps or Shift then Entry[1] else string.lower(Entry[#Entry]) elseif Shift then Entry[1] else Entry[#Entry]
	end)
	rawset(VRButton, "ContainsPoint", function(_, p2, p3): boolean
		-- upvalues: Frame (copy), Button (ref)
		local AbsolutePosition = Frame.AbsolutePosition
		local NewAbsolutePosition = Frame.AbsolutePosition + Frame.AbsoluteSize
		local IsYAbove: boolean = AbsolutePosition.X <= p2 and p2 <= NewAbsolutePosition.X and AbsolutePosition.Y <= p3 and p3 <= NewAbsolutePosition.Y
		
		if not IsYAbove then
			IsYAbove = Button
			
			if IsYAbove then
				local Frame1 = Button
				local AbsolutePosition1 = Frame1.AbsolutePosition
				local NewAbsolutePosition1 = Frame1.AbsolutePosition + Frame1.AbsoluteSize
				
				if AbsolutePosition1.X <= p2 and p2 <= NewAbsolutePosition1.X and AbsolutePosition1.Y <= p3 and p3 <= NewAbsolutePosition1.Y then
					return true
				end
				IsYAbove = false
			end
		end
		return IsYAbove
	end)
	rawset(VRButton, "Update", function(_)
		-- upvalues: update (copy)
		update()
	end)
	rawset(VRButton, "GetInstance", function(_)
		-- upvalues: Parent (copy)
		return Parent
	end)
	Parent.MouseButton1Down:connect(function()
		-- upvalues: VRButton (copy)
		VRButton:OnDown()
	end)
	Parent.MouseButton1Up:connect(function()
		-- upvalues: VRButton (copy)
		VRButton:OnUp()
	end)
	Parent.SelectionGained:connect(function()
		-- upvalues: t (copy), Parent (copy), VRButton (copy)
		t[Parent] = true
		VRButton:OnEnter()
	end)
	Parent.SelectionLost:connect(function()
		-- upvalues: t (copy), Parent (copy), VRButton (copy)
		t[Parent] = nil
		VRButton:OnLeave()
	end)
	
	if Button then
		Button.MouseButton1Down:connect(function()
			-- upvalues: VRButton (copy)
			VRButton:OnDown()
		end)
		Button.MouseButton1Up:connect(function()
			-- upvalues: VRButton (copy)
			VRButton:OnUp()
		end)
		Button.SelectionGained:connect(function()
			-- upvalues: t (copy), Button (ref), VRButton (copy)
			t[Button] = true
			VRButton:OnEnter()
		end)
		Button.SelectionLost:connect(function()
			-- upvalues: t (copy), Button (ref), VRButton (copy)
			t[Button] = nil
			VRButton:OnLeave()
		end)
	end
	update()
	
	return VRButton
end

local function CreateBaseVoiceState()
	return {
		Name = "Base",
		TransitionFrom = function(_) end,
		TransitionTo = function(_) end
	}
end

local _ = function()
	-- upvalues: CreateBaseVoiceState (copy), SoundService (copy)
	local Listening = CreateBaseVoiceState()
	Listening.Name = "Listening"
	
	function Listening:TransitionTo()
		-- upvalues: SoundService (upval)
		pcall(function()
			-- upvalues: SoundService (upval)
			SoundService:BeginRecording()
		end)
	end
	
	return Listening
end

local _ = function()
	-- upvalues: CreateBaseVoiceState (copy), SoundService (copy)
	local Processing = CreateBaseVoiceState()
	Processing.Name = "Processing"
	local v1 = false
	local v2 = nil
	
	function Processing:TransitionTo()
		-- upvalues: v2 (ref), SoundService (upval), v1 (ref)
		coroutine.wrap(function()
			-- upvalues: v2 (upval), SoundService (upval), v1 (upval)
			pcall(function()
				-- upvalues: v2 (upval), SoundService (upval)
				v2 = SoundService:EndRecording()
			end)
			v1 = true
		end)()
	end
	
	function Processing:GetResultAsync()
		-- upvalues: v1 (ref), v2 (ref)
		while not v1 do
			wait()
		end
		return v2
	end
	
	return Processing
end

local _ = function()
	-- upvalues: CreateBaseVoiceState (copy)
	local Waiting = CreateBaseVoiceState()
	Waiting.Name = "Waiting"
	
	return Waiting
end

local config1 = {
	Listening = { Processing = true },
	Processing = { Waiting = true },
	Waiting = { Listening = true }
}
local Waiting = CreateBaseVoiceState()
Waiting.Name = "Waiting"
local BindableEvent = Instance.new("BindableEvent")
local config2 = {
	CurrentState = Waiting,
	TransitionState = function(p1, CurrentState): boolean
		-- upvalues: config1 (copy), BindableEvent (copy)
		if config1[p1.CurrentState.Name][CurrentState.Name] then
			p1.CurrentState:TransitionFrom()
			p1.CurrentState = CurrentState
			p1.CurrentState:TransitionTo()
			BindableEvent:Fire(p1.CurrentState)
			
			return true
		else
			return false
		end
	end,
	GetCurrentState = function(p1)
		return p1.CurrentState
	end,
	StateTransitionedEvent = BindableEvent.Event
}

local function ConstructKeyboardUI(List)
	-- upvalues: CorePackages (copy), CreateFunction (copy), _Color3_3 (copy), CreateVRButton (copy), _Color3 (copy), _Color3_4 (copy), RunService (copy), ExtendedInstance (copy), TextService (copy), config2 (copy), CreateBaseVoiceState (copy), SoundService (copy), ContextActionService (copy), CreateKeyboardKey (copy), t (copy)
	local Panel3D = require(CorePackages.Workspace.Packages.VrCommon).Panel3D
	local Keyboard = Panel3D.Get("Keyboard")
	Keyboard:SetVisible(false)
	local Buttons = {}
	local Parent = CreateFunction("Frame")({
		Name = "VirtualKeyboard",
		BackgroundTransparency = 1,
		Active = true,
		Visible = false,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	})
	local Frame = CreateFunction("TextButton")({
		Name = "TextEntryField",
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 4, 0, 4),
		Size = UDim2.new(1, -8, 1, -8),
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size60,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = CreateFunction("Frame")({
			Name = "TextfieldBackground",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Visible = true,
			Position = UDim2.new(0, 2, 0, 2),
			Size = UDim2.new(1, -4, 1, -4),
			BackgroundColor3 = Color3.new(0.8196078431372549, 0.8470588235294118, 0.8666666666666667),
			Parent = CreateFunction("ImageLabel")({
				Name = "TextEntryBackground",
				Image = "",
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Size = UDim2.new(0.5, 0, 0.125, 0),
				Position = UDim2.new(0.25, 0, 0, 0),
				BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039),
				Parent = Parent
			})
		})
	})
	local v3 = CreateFunction("Frame")({
		Name = "TextfieldCursor",
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ZIndex = 2,
		Size = UDim2.new(0, 5, 0.9, 0),
		Position = UDim2.new(0, 0, 0.05, 0),
		BackgroundColor3 = _Color3_3,
		Parent = Frame
	})
	local Parent1 = CreateFunction("ImageButton")({
		Name = "CloseButton",
		Image = "rbxasset://textures/ui/Keyboard/close_button_background.png",
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Size = UDim2.new(0.075, -10, 0.198, -10),
		Position = UDim2.new(0, -5, 0, -35),
		Parent = Parent
	})
	Parent1.SelectionImageObject = CreateFunction("ImageLabel")({
		Name = "Selection",
		Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.9, 0, 0.9, 0),
		Position = UDim2.new(0.05, 0, 0.05, 0)
	})
	CreateFunction("ImageLabel")({
		Name = "Icon",
		Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.25, 0, 0.25, 0),
		Parent = Parent1
	})
	local VRButton = CreateVRButton(Parent1)
	table.insert(Buttons, VRButton)
	local Parent2 = CreateFunction("Frame")({
		Name = "VoiceRecognitionContainer",
		BackgroundTransparency = 1,
		Active = true,
		Visible = false,
		Size = UDim2.new(1, 0, 0.85, 0),
		Position = UDim2.new(0, 0, 0.15, 0),
		Parent = Parent
	})
	local Copy = CreateFunction("Frame")({
		Name = "voiceRecognitionBackground1",
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Active = true,
		Size = UDim2.new(1, 0, 0.75, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = _Color3,
		Parent = Parent2
	}):Clone()
	Copy.Size = UDim2.new(0.8, 0, 0.25, 0)
	Copy.Position = UDim2.new(0, 0, 0.75, 0)
	Copy.Parent = Parent2
	local VRButton1 = CreateVRButton(CreateFunction("TextButton")({
		Name = "DoneButton",
		Text = "Done",
		BackgroundTransparency = 0,
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Size = UDim2.new(0.2, -5, 0.25, -5),
		Position = UDim2.new(0.8, 5, 0.75, 5),
		BackgroundColor3 = _Color3_3,
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = _Color3_4,
		Parent = Parent2
	}))
	table.insert(Buttons, VRButton1)
	local v4 = CreateFunction("TextLabel")({
		Name = "VoiceProcessingStatus",
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.33, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = _Color3_4,
		Parent = Parent2
	})
	local v5 = (function()
		-- upvalues: CreateFunction (upval), _Color3_4 (upval), RunService (upval)
		local List = {}
		local Container = CreateFunction("Frame")({
			Name = "VoiceVisualizerContainer",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		})
		local config = { Container = Container }
		
		for i = 1, 50 do
			table.insert(List, (CreateFunction("Frame")({
				Name = "Bar",
				BackgroundTransparency = 0,
				Size = UDim2.new(0.02, -4, 1, 0),
				Position = UDim2.new(i / 50, 0, 0, 0),
				BackgroundColor3 = _Color3_4,
				Parent = Container
			})))
		end
		function config:StartAnimation()
			-- upvalues: RunService (upval), List (copy)
			RunService:UnbindFromRenderStep("VoiceVisualizerWidget")
			RunService:BindToRenderStep("VoiceVisualizerWidget", Enum.RenderPriority.First.Value, function()
				-- upvalues: List (upval)
				for i, value in pairs(List) do
					local ScaledMagnitude = ((math.abs((math.sin(tick() * 2.5 + i * 0.5026548245743669))) + math.abs((math.cos(tick() * 2.5 + i * 0.5026548245743669)))) / 2 - 0.3) * 1.4285714285714286
					value.Size = UDim2.new(0.02, -4, ScaledMagnitude, 0)
					value.Position = UDim2.new(i / 50, 0, (1 - ScaledMagnitude) / 2, 0)
				end
			end)
		end
		
		function config:StopAnimation()
			-- upvalues: RunService (upval)
			RunService:UnbindFromRenderStep("VoiceVisualizerWidget")
		end
		
		return config
	end)()
	v5.Container.Parent = Parent2
	v5.Container.Size = UDim2.new(0.5, 0, 0.4, 0)
	v5.Container.Position = UDim2.new(0.25, 0, 0.4, 0)
	local ExtendedInstanceResult = ExtendedInstance(Parent)
	local v6 = nil
	local List1 = {}
	local v7 = false
	local v8 = false
	local ClampResult = 0
	local BindableEvent = Instance.new("BindableEvent")
	local BindableEvent1 = Instance.new("BindableEvent")
	local Flag = false
	
	local function SetTextFieldCursorPosition(EndIndex)
		-- upvalues: ClampResult (ref), Frame (copy), TextService (upval), v3 (copy)
		ClampResult = if Frame.TextFits then Clamp(0, #Frame.Text, EndIndex) else #Frame.Text
		local Match: string? = string.match(Frame.FontSize.Name, "%d+")
		v3.Position = UDim2.new(0, TextService:GetTextSize(string.sub(Frame.Text, 1, ClampResult), Match and tostring(Match) or 12, Frame.Font, Frame.AbsoluteSize).x, v3.Position.Y.Scale, v3.Position.Y.Offset)
	end
	
	local function _(p1)
		-- upvalues: Frame (copy), SetTextFieldCursorPosition (copy), ClampResult (ref)
		Frame:SetTextFromInput(p1)
		SetTextFieldCursorPosition(ClampResult)
	end
	
	local BufferText = ""
	
	local _ = function()
		-- upvalues: v6 (ref), BufferText (ref)
		return if v6 and v6.TextBox then v6.TextBox.Text else BufferText
	end
	
	local _ = function(Value)
		-- upvalues: v6 (ref), BufferText (ref), Frame (copy), SetTextFieldCursorPosition (copy), ClampResult (ref)
		if v6 and v6.TextBox then
			v6.TextBox.Text = Value
			
			return
		end
		if BufferText ~= Value then
			BufferText = Value
			Frame:SetTextFromInput(BufferText)
			SetTextFieldCursorPosition(ClampResult)
		end
	end
	
	local function calculateTextCursorPosition(X, Y): number
		-- upvalues: Frame (copy), TextService (upval)
		local XDelta = X - Frame.AbsolutePosition.x
		local _ = Y - Frame.AbsolutePosition.y
		
		for i = 1, #Frame.Text do
			local Match: string? = string.match(Frame.FontSize.Name, "%d+")
			
			if XDelta < TextService:GetTextSize(string.sub(Frame.Text, 1, i), Match and tostring(Match) or 12, Frame.Font, Frame.AbsoluteSize).x then
				return i - 1
			end
		end
		return #Frame.Text
	end
	
	local v9 = nil
	rawset(ExtendedInstanceResult, "OpenedEvent", BindableEvent.Event)
	rawset(ExtendedInstanceResult, "ClosedEvent", BindableEvent1.Event)
	rawset(ExtendedInstanceResult, "GetCurrentKeyset", function(_)
		-- upvalues: List1 (copy), v9 (ref)
		return List1[v9]
	end)
	rawset(ExtendedInstanceResult, "SetCurrentKeyset", function(_, p1)
		-- upvalues: v9 (ref), List1 (copy)
		if p1 ~= v9 and List1[p1] ~= nil then
			if List1[v9] and List1[v9].container then
				List1[v9].container.Visible = false
			end
			v9 = p1
			
			if List1[v9] and List1[v9].container then
				List1[v9].container.Visible = true
			end
		end
	end)
	rawset(ExtendedInstanceResult, "SetVoiceMode", function(p1, _)
		-- upvalues: Parent2 (copy), config2 (upval), CreateBaseVoiceState (upval), SoundService (upval)
		local Visible = false
		local CurrentKeyset = p1:GetCurrentKeyset()
		
		if CurrentKeyset and CurrentKeyset.container then
			CurrentKeyset.container.Visible = not Visible
		end
		Parent2.Visible = Visible
		
		if Visible then
			local Listening = CreateBaseVoiceState()
			Listening.Name = "Listening"
			
			function Listening:TransitionTo()
				-- upvalues: SoundService (upval)
				pcall(function()
					-- upvalues: SoundService (upval)
					SoundService:BeginRecording()
				end)
			end
			
			config2:TransitionState(Listening)
		end
	end)
	rawset(ExtendedInstanceResult, "GetCaps", function(_)
		-- upvalues: v7 (ref)
		return v7
	end)
	rawset(ExtendedInstanceResult, "SetCaps", function(p1, p2)
		-- upvalues: v7 (ref)
		v7 = p2
		
		for _, key in pairs(p1:GetCurrentKeyset().keys) do
			key:Update()
		end
	end)
	rawset(ExtendedInstanceResult, "GetShift", function(_)
		-- upvalues: v8 (ref)
		return v8
	end)
	rawset(ExtendedInstanceResult, "SetShift", function(p3, p4)
		-- upvalues: v8 (ref)
		v8 = p4
		
		for _, key in pairs(p3:GetCurrentKeyset().keys) do
			key:Update()
		end
	end)
	local Flag1 = false
	local ChangedConnection = nil
	local FocusLostConnection = nil
	local EventConnection = nil
	
	local _ = function()
		-- upvalues: ChangedConnection (ref), FocusLostConnection (ref), EventConnection (ref)
		if ChangedConnection then
			ChangedConnection:disconnect()
		end
		ChangedConnection = nil
		
		if FocusLostConnection then
			FocusLostConnection:disconnect()
		end
		FocusLostConnection = nil
		
		if EventConnection then
			EventConnection:disconnect()
		end
		EventConnection = nil
	end
	
	rawset(ExtendedInstanceResult, "Open", function(p5, p6)
		-- upvalues: Flag (ref), v6 (ref), Parent (copy), Keyboard (copy), ChangedConnection (ref), FocusLostConnection (ref), EventConnection (ref), Frame (copy), SetTextFieldCursorPosition (copy), ClampResult (ref), Flag1 (ref), BufferText (ref), Panel3D (copy), ContextActionService (upval), v9 (ref), List1 (copy), BindableEvent (copy)
		if Flag then return end
		Flag = true
		v6 = p6
		p5:SetCurrentKeyset(1)
		p5:SetVoiceMode(false)
		Parent.Visible = true
		Keyboard:ResizeStuds(5.9, 2.25, 320)
		local _CFrame = CFrame.new()
		
		if ChangedConnection then
			ChangedConnection:disconnect()
		end
		ChangedConnection = nil
		
		if FocusLostConnection then
			FocusLostConnection:disconnect()
		end
		FocusLostConnection = nil
		
		if EventConnection then
			EventConnection:disconnect()
		end
		EventConnection = nil
		
		if p6.TextBox then
			ChangedConnection = p6.TextBox.Changed:connect(function(p7)
				-- upvalues: p6 (copy), Frame (upval), SetTextFieldCursorPosition (upval), ClampResult (upval)
				if p7 == "Text" then
					Frame:SetTextFromInput(p6.TextBox.Text)
					SetTextFieldCursorPosition(ClampResult)
				end
			end)
			FocusLostConnection = p6.TextBox.FocusLost:connect(function(EnterPressed)
				-- upvalues: Flag1 (upval), p5 (copy)
				if not Flag1 then
					p5:Close(EnterPressed)
				end
			end)
			
			if p6.TextBox.ClearTextOnFocus then
				if v6 and v6.TextBox then
					v6.TextBox.Text = ""
				elseif BufferText ~= "" then
					BufferText = ""
					Frame:SetTextFromInput(BufferText)
					SetTextFieldCursorPosition(ClampResult)
				end
			else
				Frame:SetTextFromInput(p6.TextBox.Text)
				SetTextFieldCursorPosition(ClampResult)
			end
			local ContainerOf = Panel3D.FindContainerOf(p6.TextBox)
			
			if ContainerOf then
				EventConnection = Panel3D.OnPanelClosed.Event:connect(function(Name)
					-- upvalues: ContainerOf (copy), p5 (copy)
					if Name == ContainerOf.name then
						p5:Close(false)
					end
				end)
				_CFrame = ContainerOf:GetCFrameInCameraSpace() * CFrame.new(ContainerOf:GetGuiPositionInPanelSpace(p6.TextBox.AbsolutePosition + Vector2.new(0.5, 1) * p6.TextBox.AbsoluteSize)) * CFrame.new(0, -Keyboard.height * 0.65, 0.5) * CFrame.Angles(-0.39269908169872414, 0, 0)
			else
				_CFrame = Panel3D.GetHeadLookXZ(true) * CFrame.Angles(0.39269908169872414, 0, 0) * CFrame.new(0, -1, -5)
			end
		elseif v6 and v6.TextBox then
			v6.TextBox.Text = ""
		elseif BufferText ~= "" then
			BufferText = ""
			Frame:SetTextFromInput(BufferText)
			SetTextFieldCursorPosition(ClampResult)
		end
		ContextActionService:BindCoreAction("VirtualKeyboardControllerInput", function(_, UserInputState, Input)
			-- upvalues: SetTextFieldCursorPosition (upval), ClampResult (upval), p5 (copy), v9 (upval), List1 (upval)
			if UserInputState == Enum.UserInputState.End then
				if Input.KeyCode == Enum.KeyCode.ButtonL1 then
					SetTextFieldCursorPosition(ClampResult - 1)
					
					return
				end
				if Input.KeyCode == Enum.KeyCode.ButtonR1 then
					SetTextFieldCursorPosition(ClampResult + 1)
					
					return
				end
				if Input.KeyCode == Enum.KeyCode.ButtonX then
					p5:BackspaceAtCursor()
					
					return
				end
				if Input.KeyCode == Enum.KeyCode.ButtonY then
					p5:SubmitCharacter(" ", false)
					
					return
				end
				if Input.KeyCode == Enum.KeyCode.ButtonL2 then
					if v9 then
						p5:SetCurrentKeyset(v9 % #List1 + 1)
						
						return
					end
				elseif Input.KeyCode == Enum.KeyCode.ButtonL3 then
					p5:SetCaps(not p5:GetCaps())
					
					return
				else
					if Input.KeyCode == Enum.KeyCode.ButtonB then
						p5:Close(false)
					end
				end
			end
		end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL2, Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonB)
		p5.Parent = Keyboard:GetGUI()
		Keyboard:SetType(Panel3D.Type.Fixed, { CFrame = _CFrame })
		Keyboard:SetCanFade(false)
		Keyboard:SetVisible(true, true)
		Keyboard:ForceShowUntilLookedAt()
		
		function Keyboard:OnUpdate() end
		
		BindableEvent:Fire()
	end)
	rawset(ExtendedInstanceResult, "Close", function(p5, Enabled)
		-- upvalues: Flag (ref), ChangedConnection (ref), FocusLostConnection (ref), EventConnection (ref), ContextActionService (upval), Keyboard (copy), Parent (copy), Panel3D (copy), BindableEvent1 (copy)
		local IsEnabled = Enabled == true
		
		if not Flag then return end
		Flag = false
		
		if ChangedConnection then
			ChangedConnection:disconnect()
		end
		ChangedConnection = nil
		
		if FocusLostConnection then
			FocusLostConnection:disconnect()
		end
		FocusLostConnection = nil
		
		if EventConnection then
			EventConnection:disconnect()
		end
		EventConnection = nil
		ContextActionService:UnbindCoreAction("VirtualKeyboardControllerInput")
		Keyboard:OnMouseLeave()
		Keyboard:SetVisible(false, true)
		Parent.Visible = false
		Panel3D.Get("Topbar3D"):SetVisible(true)
		p5:SubmitText(IsEnabled, false)
		BindableEvent1:Fire()
	end)
	rawset(ExtendedInstanceResult, "SubmitText", function(_, Submitted, p5)
		-- upvalues: v6 (ref), BufferText (ref), Panel3D (copy), Keyboard (copy), Flag1 (ref)
		local TextBox = v6 and v6.TextBox
		
		if TextBox then
			if Submitted then
				TextBox.Text = if v6 and v6.TextBox then v6.TextBox.Text else BufferText
			end
			local ContainerOf = Panel3D.FindContainerOf(TextBox)
			local IsLinkedToMatch: boolean = p5 and (ContainerOf and ContainerOf.linkedTo == Keyboard)
			
			if IsLinkedToMatch then
				Flag1 = true
			end
			TextBox:ReleaseFocus(Submitted)
			
			if IsLinkedToMatch then
				TextBox:CaptureFocus()
				Flag1 = false
			end
		end
	end)
	rawset(ExtendedInstanceResult, "GetCurrentOptions", function(_)
		-- upvalues: v6 (ref)
		return v6
	end)
	rawset(ExtendedInstanceResult, "BackspaceAtCursor", function(_)
		-- upvalues: ClampResult (ref), v6 (ref), BufferText (ref), Frame (copy), SetTextFieldCursorPosition (copy)
		if ClampResult >= 1 then
			local Text = if v6 and v6.TextBox then v6.TextBox.Text else BufferText
			local Text1 = string.sub(Text, 1, ClampResult - 1) .. string.sub(Text, ClampResult + 1, #Text)
			local ClampResultDelta = ClampResult - 1
			
			if v6 and v6.TextBox then
				v6.TextBox.Text = Text1
			elseif BufferText ~= Text1 then
				BufferText = Text1
				Frame:SetTextFromInput(BufferText)
				SetTextFieldCursorPosition(ClampResult)
			end
			SetTextFieldCursorPosition(ClampResultDelta)
		end
	end)
	rawset(ExtendedInstanceResult, "SubmitCharacter", function(p5, Text, p6)
		-- upvalues: v6 (ref), BufferText (ref), ClampResult (ref), Frame (copy), SetTextFieldCursorPosition (copy)
		local Text1 = if v6 and v6.TextBox then v6.TextBox.Text else BufferText
		local Text2 = string.sub(Text1, 1, ClampResult) .. Text .. string.sub(Text1, ClampResult + 1, #Text1)
		
		if v6 and v6.TextBox then
			v6.TextBox.Text = Text2
		elseif BufferText ~= Text2 then
			BufferText = Text2
			Frame:SetTextFromInput(BufferText)
			SetTextFieldCursorPosition(ClampResult)
		end
		SetTextFieldCursorPosition(ClampResult + #Text)
		
		if p6 and p5:GetShift() then
			p5:SetShift(false)
		end
	end)
	
	for _, value in pairs(List) do
		local Keys = {}
		local Container = CreateFunction("Frame")({
			Name = "KeyboardSizeConstrainer",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -20),
			Position = UDim2.new(0, 0, 0, 20),
			Parent = Parent
		})
		local Largest = 0
		local Largest1 = 0
		local NewY = 0
		
		for _, value1 in pairs(value) do
			local NewX = 0
			local W = 1
			local H = 1
			local W2 = nil
			local H2 = nil
			local X2 = nil
			local Y2 = nil
			
			for _, Text in pairs(value1) do
				if type(Text) ~= "table" then
					if type(Text) == "string" then
						if Text == "" then
							Text = " "
						end
						local config = {
							x = NewX,
							y = NewY,
							width = W,
							height = H,
							x2 = X2,
							y2 = Y2,
							width2 = W2,
							height2 = H2
						}
						local List2 = {}
						
						for i in string.gmatch(Text, "([^\n]+)") do
							table.insert(List2, i)
						end
						table.insert(Keys, (CreateKeyboardKey(ExtendedInstanceResult, config, List2)))
						NewX += W
						Largest = math.max(Largest, NewX)
						Largest1 = math.max(Largest1, NewY + H)
						W = 1
						H = 1
						W2 = nil
						H2 = nil
						X2 = nil
						Y2 = nil
					end
					continue
				end
				if Text.w then
					W = Text.w
				end
				if Text.h then
					H = Text.h
				end
				if Text.x then
					NewX += Text.x
				end
				if Text.y then
					NewY += Text.y
				end
				if Text.x2 then
					X2 = Text.x2
				end
				if Text.y2 then
					Y2 = Text.y2
				end
				if Text.w2 then
					W2 = Text.w2
				end
				if Text.h2 then
					H2 = Text.h2
				end
			end
			NewY += 1
		end
		for _, key in pairs(Keys) do
			key.Position = UDim2.new(key.Position.X.Scale / Largest, 0, key.Position.Y.Scale / Largest1, 0)
			key.Size = UDim2.new(key.Size.X.Scale / Largest, 0, key.Size.Y.Scale / Largest1, 0)
			key.Parent = Container
		end
		Container.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Container.Size = UDim2.new(1, 0, -Largest1 / Largest, 0)
		Container.Position = UDim2.new(0, 0, 1, 0)
		Container.Visible = false
		table.insert(List1, { keys = Keys, container = Container })
	end
	ExtendedInstanceResult:SetCurrentKeyset(1)
	Frame.MouseButton1Click:connect(function()
		-- upvalues: SetTextFieldCursorPosition (copy), calculateTextCursorPosition (copy), Keyboard (copy)
		SetTextFieldCursorPosition((calculateTextCursorPosition(Keyboard.lookAtPixel.X, Keyboard.lookAtPixel.Y)))
	end)
	VRButton.MouseButton1Click:connect(function()
		-- upvalues: ExtendedInstanceResult (copy)
		ExtendedInstanceResult:Close(false)
	end)
	VRButton1.MouseButton1Click:connect(function()
		-- upvalues: config2 (upval), CreateBaseVoiceState (upval), SoundService (upval)
		if config2:GetCurrentState().Name == "Listening" then
			local Processing = CreateBaseVoiceState()
			Processing.Name = "Processing"
			local v10 = false
			local v11 = nil
			
			function Processing:TransitionTo()
				-- upvalues: v11 (ref), SoundService (upval), v10 (ref)
				coroutine.wrap(function()
					-- upvalues: v11 (upval), SoundService (upval), v10 (upval)
					pcall(function()
						-- upvalues: v11 (upval), SoundService (upval)
						v11 = SoundService:EndRecording()
					end)
					v10 = true
				end)()
			end
			
			function Processing:GetResultAsync()
				-- upvalues: v10 (ref), v11 (ref)
				while not v10 do
					wait()
				end
				return v11
			end
			
			config2:TransitionState(Processing)
		end
	end)
	
	local function onVoiceProcessingStateChanged(CurrentState)
		-- upvalues: v4 (copy), v5 (copy), t (upval), v6 (ref), BufferText (ref), Frame (copy), SetTextFieldCursorPosition (copy), ClampResult (ref), config2 (upval), CreateBaseVoiceState (upval), ExtendedInstanceResult (copy)
		if CurrentState.Name == "Listening" then
			v4.Text = "Listening..."
		elseif CurrentState.Name == "Processing" then
			v4.Text = "Processing..."
		elseif CurrentState.Name == "Waiting" then
			v4.Text = "Done"
		end
		if CurrentState.Name == "Processing" then
			coroutine.wrap(function()
				-- upvalues: v5 (upval), CurrentState (copy), t (upval), v6 (upval), BufferText (upval), Frame (upval), SetTextFieldCursorPosition (upval), ClampResult (upval), v4 (upval), config2 (upval), CreateBaseVoiceState (upval)
				v5:StopAnimation()
				local ResultAsync = CurrentState:GetResultAsync()
				
				if ResultAsync and ResultAsync.Status == t.ASR_STATUS_OK then
					local Response = ResultAsync.Response
					
					if v6 and v6.TextBox then
						v6.TextBox.Text = Response
					elseif BufferText ~= Response then
						BufferText = Response
						Frame:SetTextFromInput(BufferText)
						SetTextFieldCursorPosition(ClampResult)
					end
				else
					v4.Text = "An error occurred, please try again."
					wait(2)
				end
				local Waiting = CreateBaseVoiceState()
				Waiting.Name = "Waiting"
				config2:TransitionState(Waiting)
			end)()
			
			return
		end
		if CurrentState.Name == "Listening" then
			v5:StartAnimation()
			
			return
		end
		if CurrentState.Name == "Waiting" then
			ExtendedInstanceResult:SetVoiceMode(false)
		end
	end
	
	config2.StateTransitionedEvent:connect(onVoiceProcessingStateChanged)
	onVoiceProcessingStateChanged(config2:GetCurrentState())
	
	return ExtendedInstanceResult
end

local v10 = nil

local _ = function()
	-- upvalues: v10 (ref), ConstructKeyboardUI (copy), SymW8W24Speaker (copy), W22AbcW8W24Speaker (copy)
	if v10 == nil then
		v10 = ConstructKeyboardUI({ SymW8W24Speaker, W22AbcW8W24Speaker })
	end
	return v10
end

local VirtualKeyboardModule = {
	CreateVirtualKeyboardOptions = function(_, TextBox)
		return { TextBox = TextBox }
	end,
	ShowVirtualKeyboard = function(_, _) end,
	CloseVirtualKeyboard = function(_) end
}

if v10 == nil then
	v10 = ConstructKeyboardUI({ SymW8W24Speaker, W22AbcW8W24Speaker })
end
VirtualKeyboardModule.OpenedEvent = v10.OpenedEvent

if v10 == nil then
	v10 = ConstructKeyboardUI({ SymW8W24Speaker, W22AbcW8W24Speaker })
end
VirtualKeyboardModule.ClosedEvent = v10.ClosedEvent

return VirtualKeyboardModule