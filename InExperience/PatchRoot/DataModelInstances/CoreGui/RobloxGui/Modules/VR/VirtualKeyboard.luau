local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local _ = game:GetService("UserInputService")
local _ = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local contextActionService = game:GetService("ContextActionService")
local _ = game:GetService("Players")
local soundService = game:GetService("SoundService")
local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local _ = coreGuiService:WaitForChild("RobloxGui")
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local color3 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
local color3_1 = Color3.new(0.192156862745, 0.192156862745, 0.192156862745)
local color3_2 = Color3.new(0, 0.635294117647, 1)
local color3_3 = Color3.new(0, 0.635294117647, 1)
local color3_4 = Color3.new(1, 1, 1)
local var12 = httpService:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"Q\",\n    \"W\",\n    \"E\",\n    \"R\",\n    \"T\",\n    \"Y\",\n    \"U\",\n    \"I\",\n    \"O\",\n    \"P\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"Caps\",\n    \"A\",\n    \"S\",\n    \"D\",\n    \"F\",\n    \"G\",\n    \"H\",\n    \"J\",\n    \"K\",\n    \"L\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"Shift\",\n    \"Z\",\n    \"X\",\n    \"C\",\n    \"V\",\n    \"B\",\n    \"N\",\n    \"M\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"123/sym\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
local var13 = httpService:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"1\",\n    \"2\",\n    \"3\",\n    \"4\",\n    \"5\",\n    \"6\",\n    \"7\",\n    \"8\",\n    \"9\",\n    \"0\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"!\",\n    \"@\",\n    \"#\",\n    \"$\",\n    \"%\",\n    \"^\",\n    \"&\",\n    \"(\",\n    \")\",\n    \"=\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 1.2\n    },\n    \"/\",\n    \"-\",\n    \"+\",\n    \"_\",\n    \":\",\n    \";\",\n    \"'\",\n    \"\\\"\",\n    \",\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"abc\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
local t = {}

for i, v in pairs({
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
	t[v] = i - 1
end
local function _(p0, p1)
	local t = {}
	
	for i in string.gmatch(p0, "([^" .. p1 .. "]+)") do
		table.insert(t, i)
	end
	return t
end

local _ = function(p2)
	local match = string.match(p2.Name, "%d+")
	
	return match and tostring(match) or 12
end

local _ = function(p3, p4, p5)
	p4 = p4.unit
	p3 = p3.Unit
	local direction = p4:Dot(p3.Direction)
	
	if direction == 0 then
		return nil
	end
	local var31 = p4:Dot(p5 - p3.Origin) / direction
	
	return if var31 < 0 then nil else p3.Origin + p3.Direction * var31
end

function Clamp(value, minValue, maxValue)
	return math.max(value, math.min(minValue, maxValue))
end

local _ = function(p6, p7, p8)
	local absolutePosition = p6.AbsolutePosition
	local var32 = p6.AbsolutePosition + p6.AbsoluteSize
	
	return absolutePosition.X <= p7 and p7 <= var32.X and (absolutePosition.Y <= p8 and p8 <= var32.Y)
end

local function FindAncestorOfType(p9, p10)
	-- upvalues: FindAncestorOfType (ref)
	if not p9 then
		return nil
	end
	local parent = p9.Parent
	
	return if parent and parent:IsA(p10) then parent else FindAncestorOfType(parent, p10)
end

local function ExtendedInstance(p11)
	local t = {}
	setmetatable(t, {
		__index = function(_, p12)
			-- upvalues: p11 (ref)
			return p11[p12]
		end,
		__newindex = function(_, p13, p14)
			-- upvalues: p11 (ref)
			p11[p13] = p14
		end
	})
	
	return t
end

local function CreateVRButton(p15)
	-- upvalues: ExtendedInstance (ref)
	local var34 = ExtendedInstance(p15)
	rawset(var34, "OnEnter", function(_) end)
	rawset(var34, "OnLeave", function(_) end)
	rawset(var34, "OnDown", function(_) end)
	rawset(var34, "OnUp", function(_) end)
	rawset(var34, "ContainsPoint", function(_, p16, p17)
		-- upvalues: p15 (ref)
		local absolutePosition = p15.AbsolutePosition
		local var35 = p15.AbsolutePosition + p15.AbsoluteSize
		
		return absolutePosition.X <= p16 and p16 <= var35.X and (absolutePosition.Y <= p17 and p17 <= var35.Y)
	end)
	rawset(var34, "Update", function(_) end)
	
	return var34
end

local _ = create("ImageLabel")({
	Name = "SelectionRing",
	Image = "rbxasset://textures/ui/menu/buttonHover.png",
	BackgroundTransparency = 1,
	Size = UDim2.new(1, -6, 1, -6),
	Position = UDim2.new(0, 4, 0, 3),
	ScaleType = Enum.ScaleType.Slice,
	SliceCenter = Rect.new(47, 47, 47, 47)
})
local t_1 = {
	["<Speaker>"] = {
		Asset = "rbxasset://textures/ui/Keyboard/mic_icon.png",
		AspectRatio = 0.615
	}
}

local function CreateKeyboardKey(p18, p19, p20)
	-- upvalues: create (ref), color3_4 (ref), color3 (ref), CreateVRButton (ref), t_1 (ref), color3_2 (ref), color3_1 (ref), color3_3 (ref)
	local y2 = p19.width2 and (p19.height2 and (p19.x2 and p19.y2))
	local var37 = create("ImageButton")({
		BorderSizePixel = 0,
		Image = "",
		BackgroundTransparency = 1,
		ZIndex = 1,
		Name = p20[1],
		Position = UDim2.new(p19.x, 0, p19.y, 0),
		Size = UDim2.new(p19.width, 0, p19.height, 0)
	})
	local var38 = create("TextLabel")({
		Name = "KeyText",
		BackgroundTransparency = 1,
		Selectable = true,
		ZIndex = 2,
		Text = p20[#p20],
		Position = UDim2.new(0, -10, 0, -10),
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = color3_4,
		Parent = var37
	})
	local var39 = create("Frame")({
		Name = "KeyBackground",
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -10, 1, -10),
		Position = UDim2.new(0, -5, 0, -5),
		BackgroundColor3 = color3,
		Parent = var37
	})
	local var40 = create("ImageLabel")({
		Name = "SelectionObject",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png",
		ImageTransparency = 0,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(12, 12, 52, 52)
	})
	var37.SelectionImageObject = create("ImageLabel")({ Visible = false })
	local var41 = nil
	local var42 = nil
	local var43 = nil
	local var44 = nil
	
	if y2 then
		var41 = create("ImageButton")({
			Name = "KeyBackground",
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Position = UDim2.new(p19.x2 / p19.width, -5, p19.y2 / p19.height, -5),
			Size = UDim2.new(p19.width2 / p19.width, 0, p19.height2 / p19.height, -10),
			BackgroundColor3 = color3,
			SelectionImageObject = var37.SelectionImageObject,
			Parent = var37
		})
		
		if p19.x2 <= 0 then
			var38.Size = var41.Size - UDim2.new(0, 10, 0, 0)
			var38.Position = var41.Position
			var41.Size -= UDim2.new(1, 0, 0, 0)
		end
		var42 = create("Frame")({
			Name = "SpecialSelectionObject",
			Size = UDim2.new(1, 0, 0.5, 0),
			Position = UDim2.new(0, 0, 0.5, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			create("ImageLabel")({
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
		var43 = var42:Clone()
		var43.Size = UDim2.new(1, 0, 0.5, 5)
		var43.Position = UDim2.new(0, 0, 0, 0)
		var43.Borders.Size = UDim2.new(1, 0, 1, 30)
		var43.Borders.Position = UDim2.new(0, 0, 0, 0)
		var44 = var42:Clone()
		var44.Size = UDim2.new(1, 5, 1, 0)
		var44.Position = UDim2.new(0, 0, 0, 0)
		var44.Borders.Size = UDim2.new(1, 30, 1, 0)
		var44.Borders.Position = UDim2.new(0, 0, 0, 0)
	end
	local var45 = CreateVRButton(var37)
	local var46 = false
	local var47 = false
	local var48 = #p20 == 1 and (type(p20[1]) == "string" and (#p20[1] == 1 and (string.byte(p20[1]) >= 65 and string.byte(p20[1]) <= 122)))
	local var49 = nil
	
	if p20[1] and t_1[p20[1]] then
		var38.Visible = false
		var49 = create("ImageLabel")({
			Name = "KeyIcon",
			BackgroundTransparency = 1,
			Size = UDim2.new(t_1[p20[1]].AspectRatio, -20, 1, -20),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Image = t_1[p20[1]].Asset,
			Parent = var39
		})
		var49.Changed:connect(function(p21)
			-- upvalues: var49 (write)
			if p21 == "AbsoluteSize" then
				var49.Position = UDim2.new(0.5, -var49.AbsoluteSize.X / 2, 0.5, -var49.AbsoluteSize.Y / 2)
			end
		end)
		var49.Position = UDim2.new(0.5, -var49.AbsoluteSize.X / 2, 0.5, -var49.AbsoluteSize.Y / 2)
	end
	local function onClicked()
		-- upvalues: var45 (ref), p18 (ref), var48 (ref)
		local var53 = nil
		local currentKeyValue = var45:GetCurrentKeyValue()
		
		if currentKeyValue == "Shift" then
			p18:SetShift(not p18:GetShift())
		elseif currentKeyValue == "Caps" then
			p18:SetCaps(not p18:GetCaps())
		elseif currentKeyValue == "Enter" then
			p18:SubmitText(true, true)
		elseif currentKeyValue == "Delete" then
			p18:BackspaceAtCursor()
		elseif currentKeyValue == "123/sym" then
			p18:SetCurrentKeyset(2)
		elseif currentKeyValue == "abc" then
			p18:SetCurrentKeyset(1)
		elseif currentKeyValue == "<Speaker>" then
			p18:SetVoiceMode(true)
		else
			var53 = if currentKeyValue == "Tab" then "\t" else currentKeyValue
		end
		if var53 ~= nil then
			p18:SubmitCharacter(var53, var48)
		end
	end
	
	local function _(value, p22)
		-- upvalues: var39 (ref), var41 (write), y2 (ref), var42 (write), var43 (write), var44 (write), var40 (ref)
		var39.BackgroundColor3 = value
		
		if var41 then
			var41.BackgroundColor3 = value
		end
		if y2 then
			var42.Parent = if p22 then var39 else nil
			var43.Parent = if p22 then var39 else nil
			var44.Parent = if p22 then var41 else nil
			
			return
		end
		var40.Parent = if p22 then var39 else nil
	end
	
	local function update()
		-- upvalues: var45 (ref), var47 (write), color3_2 (copy), var39 (ref), var41 (write), y2 (ref), var42 (write), var43 (write), var44 (write), var40 (ref), var46 (write), color3_1 (copy), p18 (ref), color3_3 (copy), color3 (copy), var49 (write), var38 (ref)
		local currentKeyValue = var45:GetCurrentKeyValue()
		
		if var47 then
			local var56 = color3_2
			var39.BackgroundColor3 = var56
			
			if var41 then
				var41.BackgroundColor3 = var56
			end
			if y2 then
				var42.Parent = nil
				var43.Parent = nil
				var44.Parent = nil
			else
				var40.Parent = nil
			end
		elseif var46 then
			local var57 = color3_1
			var39.BackgroundColor3 = var57
			
			if var41 then
				var41.BackgroundColor3 = var57
			end
			if y2 then
				var42.Parent = var39 or nil
				var43.Parent = var39 or nil
				var44.Parent = var41 or nil
			else
				var40.Parent = var39 or nil
			end
		elseif currentKeyValue == "Caps" and p18:GetCaps() then
			local var61 = color3_3
			var39.BackgroundColor3 = var61
			
			if var41 then
				var41.BackgroundColor3 = var61
			end
			if y2 then
				var42.Parent = nil
				var43.Parent = nil
				var44.Parent = nil
			else
				var40.Parent = nil
			end
		elseif currentKeyValue == "Shift" and p18:GetShift() then
			local var60 = color3_3
			var39.BackgroundColor3 = var60
			
			if var41 then
				var41.BackgroundColor3 = var60
			end
			if y2 then
				var42.Parent = nil
				var43.Parent = nil
				var44.Parent = nil
			else
				var40.Parent = nil
			end
		elseif currentKeyValue == "abc" then
			local var58 = color3_3
			var39.BackgroundColor3 = var58
			
			if var41 then
				var41.BackgroundColor3 = var58
			end
			if y2 then
				var42.Parent = nil
				var43.Parent = nil
				var44.Parent = nil
			else
				var40.Parent = nil
			end
		else
			local var59 = color3
			var39.BackgroundColor3 = var59
			
			if var41 then
				var41.BackgroundColor3 = var59
			end
			if y2 then
				var42.Parent = nil
				var43.Parent = nil
				var44.Parent = nil
			else
				var40.Parent = nil
			end
		end
		if var49 then
			var49.ImageTransparency = 0.5
		end
		var38.Text = var45:GetCurrentKeyValue()
	end
	
	local t = {}
	rawset(var45, "OnEnter", function(_)
		-- upvalues: var46 (write), update (ref)
		var46 = true
		update()
	end)
	rawset(var45, "OnLeave", function(_)
		-- upvalues: t (ref), var46 (write), var47 (write), update (ref)
		if not next(t) then
			var46 = false
			var47 = false
			update()
		end
	end)
	rawset(var45, "OnDown", function(_)
		-- upvalues: var47 (write), update (ref), onClicked (ref)
		var47 = true
		update()
		onClicked()
	end)
	rawset(var45, "OnUp", function(_)
		-- upvalues: var47 (write), update (ref)
		var47 = false
		update()
	end)
	rawset(var45, "GetCurrentKeyValue", function(_)
		-- upvalues: p18 (ref), var48 (ref), p20 (ref)
		local shift = p18:GetShift()
		local caps = p18:GetCaps()
		
		return if var48 then if caps and shift then string.lower(p20[#p20]) elseif caps or shift then p20[1] else string.lower(p20[#p20]) elseif shift then p20[1] else p20[#p20]
	end)
	rawset(var45, "ContainsPoint", function(_, p23, p24)
		-- upvalues: var39 (ref), var41 (write)
		local var66
		local var64 = var39
		local absolutePosition = var64.AbsolutePosition
		local var65 = var64.AbsolutePosition + var64.AbsoluteSize
		
		if absolutePosition.X <= p23 and p23 <= var65.X and absolutePosition.Y <= p24 then
			var66 = p24 > var65.Y
		end
		if not var66 then
			var66 = var41
			
			if var66 then
				local var67 = var41
				local absolutePosition_1 = var67.AbsolutePosition
				local var68 = var67.AbsolutePosition + var67.AbsoluteSize
				
				if absolutePosition_1.X <= p23 and p23 <= var68.X and (absolutePosition_1.Y <= p24 and p24 <= var68.Y) then
					return true
				end
				var66 = false
			end
		end
		return var66
	end)
	rawset(var45, "Update", function(_)
		-- upvalues: update (ref)
		update()
	end)
	rawset(var45, "GetInstance", function(_)
		-- upvalues: var37 (ref)
		return var37
	end)
	var37.MouseButton1Down:connect(function()
		-- upvalues: var45 (ref)
		var45:OnDown()
	end)
	var37.MouseButton1Up:connect(function()
		-- upvalues: var45 (ref)
		var45:OnUp()
	end)
	var37.SelectionGained:connect(function()
		-- upvalues: t (ref), var37 (ref), var45 (ref)
		t[var37] = true
		var45:OnEnter()
	end)
	var37.SelectionLost:connect(function()
		-- upvalues: t (ref), var37 (ref), var45 (ref)
		t[var37] = nil
		var45:OnLeave()
	end)
	
	if var41 then
		var41.MouseButton1Down:connect(function()
			-- upvalues: var45 (ref)
			var45:OnDown()
		end)
		var41.MouseButton1Up:connect(function()
			-- upvalues: var45 (ref)
			var45:OnUp()
		end)
		var41.SelectionGained:connect(function()
			-- upvalues: t (ref), var41 (write), var45 (ref)
			t[var41] = true
			var45:OnEnter()
		end)
		var41.SelectionLost:connect(function()
			-- upvalues: t (ref), var41 (write), var45 (ref)
			t[var41] = nil
			var45:OnLeave()
		end)
	end
	update()
	
	return var45
end

local function CreateBaseVoiceState()
	return {
		Name = "Base",
		TransitionFrom = function(_) end,
		TransitionTo = function(_) end
	}
end

local _ = function()
	-- upvalues: CreateBaseVoiceState (ref), soundService (ref)
	local listening = CreateBaseVoiceState()
	listening.Name = "Listening"
	
	function listening.TransitionTo(_)
		-- upvalues: soundService (copy)
		pcall(function()
			-- upvalues: soundService (copy)
			soundService:BeginRecording()
		end)
	end
	
	return listening
end

local _ = function()
	-- upvalues: CreateBaseVoiceState (ref), soundService (ref)
	local processing = CreateBaseVoiceState()
	processing.Name = "Processing"
	local var71 = false
	local var72 = nil
	
	function processing.TransitionTo(_)
		-- upvalues: var72 (write), soundService (copy), var71 (write)
		coroutine.wrap(function()
			-- upvalues: var72 (copy), soundService (copy), var71 (copy)
			pcall(function()
				-- upvalues: var72 (copy), soundService (copy)
				var72 = soundService:EndRecording()
			end)
			var71 = true
		end)()
	end
	
	function processing.GetResultAsync(_)
		-- upvalues: var71 (write), var72 (write)
		while not var71 do
			wait()
		end
		return var72
	end
	
	return processing
end

local _ = function()
	-- upvalues: CreateBaseVoiceState (ref)
	local waiting = CreateBaseVoiceState()
	waiting.Name = "Waiting"
	
	return waiting
end

local t_2 = {
	Listening = { Processing = true },
	Processing = { Waiting = true },
	Waiting = { Listening = true }
}
local t_3 = {}
local waiting = CreateBaseVoiceState()
waiting.Name = "Waiting"
t_3.CurrentState = waiting
local bindableEvent = Instance.new("BindableEvent")

function t_3.TransitionState(p25, p26)
	-- upvalues: t_2 (ref), bindableEvent (ref)
	if t_2[p25.CurrentState.Name][p26.Name] then
		p25.CurrentState:TransitionFrom()
		p25.CurrentState = p26
		p25.CurrentState:TransitionTo()
		bindableEvent:Fire(p25.CurrentState)
		
		return true
	end
	return false
end

function t_3.GetCurrentState(p27)
	return p27.CurrentState
end

t_3.StateTransitionedEvent = bindableEvent.Event

local function ConstructKeyboardUI(p28)
	-- upvalues: corePackagesService (ref), create (ref), color3_3 (ref), CreateVRButton (ref), color3 (ref), color3_4 (ref), runService (ref), ExtendedInstance (ref), textService (ref), t_3 (ref), CreateBaseVoiceState (ref), soundService (ref), contextActionService (ref), CreateKeyboardKey (ref), t (ref)
	local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
	local keyboard = panel3D.Get("Keyboard")
	keyboard:SetVisible(false)
	local t_1 = {}
	local var76 = create("Frame")({
		Name = "VirtualKeyboard",
		BackgroundTransparency = 1,
		Active = true,
		Visible = false,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	})
	local var77 = create("TextButton")({
		Name = "TextEntryField",
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 4, 0, 4),
		Size = UDim2.new(1, -8, 1, -8),
		Font = Enum.Font.SourceSans,
		FontSize = Enum.FontSize.Size60,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = create("Frame")({
			Name = "TextfieldBackground",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Visible = true,
			Position = UDim2.new(0, 2, 0, 2),
			Size = UDim2.new(1, -4, 1, -4),
			BackgroundColor3 = Color3.new(0.819607843137, 0.847058823529, 0.866666666667),
			Parent = create("ImageLabel")({
				Name = "TextEntryBackground",
				Image = "",
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Size = UDim2.new(0.5, 0, 0.125, 0),
				Position = UDim2.new(0.25, 0, 0, 0),
				BackgroundColor3 = Color3.new(0.121568627451, 0.121568627451, 0.121568627451),
				Parent = var76
			})
		})
	})
	local var78 = create("Frame")({
		Name = "TextfieldCursor",
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ZIndex = 2,
		Size = UDim2.new(0, 5, 0.9, 0),
		Position = UDim2.new(0, 0, 0.05, 0),
		BackgroundColor3 = color3_3,
		Parent = var77
	})
	local var79 = create("ImageButton")({
		Name = "CloseButton",
		Image = "rbxasset://textures/ui/Keyboard/close_button_background.png",
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Size = UDim2.new(0.075, -10, 0.198, -10),
		Position = UDim2.new(0, -5, 0, -35),
		Parent = var76
	})
	var79.SelectionImageObject = create("ImageLabel")({
		Name = "Selection",
		Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.9, 0, 0.9, 0),
		Position = UDim2.new(0.05, 0, 0.05, 0)
	})
	create("ImageLabel")({
		Name = "Icon",
		Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0.25, 0, 0.25, 0),
		Parent = var79
	})
	local var80 = CreateVRButton(var79)
	table.insert(t_1, var80)
	local var81 = create("Frame")({
		Name = "VoiceRecognitionContainer",
		BackgroundTransparency = 1,
		Active = true,
		Visible = false,
		Size = UDim2.new(1, 0, 0.85, 0),
		Position = UDim2.new(0, 0, 0.15, 0),
		Parent = var76
	})
	local var82 = create("Frame")({
		Name = "voiceRecognitionBackground1",
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Active = true,
		Size = UDim2.new(1, 0, 0.75, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = color3,
		Parent = var81
	}):Clone()
	var82.Size = UDim2.new(0.8, 0, 0.25, 0)
	var82.Position = UDim2.new(0, 0, 0.75, 0)
	var82.Parent = var81
	local var83 = CreateVRButton(create("TextButton")({
		Name = "DoneButton",
		Text = "Done",
		BackgroundTransparency = 0,
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Size = UDim2.new(0.2, -5, 0.25, -5),
		Position = UDim2.new(0.8, 5, 0.75, 5),
		BackgroundColor3 = color3_3,
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = color3_4,
		Parent = var81
	}))
	table.insert(t_1, var83)
	local var84 = create("TextLabel")({
		Name = "VoiceProcessingStatus",
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.33, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = color3_4,
		Parent = var81
	})
	local var85 = (function()
		-- upvalues: create (copy), color3_4 (copy), runService (copy)
		local t = {}
		local t_1 = {}
		local var116 = create("Frame")({
			Name = "VoiceVisualizerContainer",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		})
		t.Container = var116
		
		for i = 1, 50 do
			table.insert(t_1, create("Frame")({
				Name = "Bar",
				BackgroundTransparency = 0,
				Size = UDim2.new(0.02, -4, 1, 0),
				Position = UDim2.new(i / 50, 0, 0, 0),
				BackgroundColor3 = color3_4,
				Parent = var116
			}))
		end
		function t.StartAnimation(_)
			-- upvalues: runService (copy), t_1 (ref)
			runService:UnbindFromRenderStep("VoiceVisualizerWidget")
			runService:BindToRenderStep("VoiceVisualizerWidget", Enum.RenderPriority.First.Value, function()
				-- upvalues: t_1 (copy)
				for i, v in pairs(t_1) do
					local var117 = ((math.abs(math.sin(tick() * 2.5 + i * 0.502654824574)) + math.abs(math.cos(tick() * 2.5 + i * 0.502654824574))) / 2 - 0.3) * 1.428571428571
					v.Size = UDim2.new(0.02, -4, var117, 0)
					v.Position = UDim2.new(i / 50, 0, (1 - var117) / 2, 0)
				end
			end)
		end
		
		function t.StopAnimation(_)
			-- upvalues: runService (copy)
			runService:UnbindFromRenderStep("VoiceVisualizerWidget")
		end
		
		return t
	end)()
	var85.Container.Parent = var81
	var85.Container.Size = UDim2.new(0.5, 0, 0.4, 0)
	var85.Container.Position = UDim2.new(0.25, 0, 0.4, 0)
	local var86 = ExtendedInstance(var76)
	local var87 = nil
	local t_2 = {}
	local var89 = false
	local var90 = false
	local var91 = 0
	local bindableEvent = Instance.new("BindableEvent")
	local bindableEvent_1 = Instance.new("BindableEvent")
	local var94 = false
	
	local function SetTextFieldCursorPosition(value)
		-- upvalues: var91 (write), var77 (ref), textService (copy), var78 (ref)
		var91 = if not var77.TextFits then #var77.Text else Clamp(0, #var77.Text, value)
		local match = string.match(var77.FontSize.Name, "%d+")
		var78.Position = UDim2.new(0, textService:GetTextSize(string.sub(var77.Text, 1, var91), if match then tostring(match) else 12, var77.Font, var77.AbsoluteSize).x, var78.Position.Y.Scale, var78.Position.Y.Offset)
	end
	
	local function _(p29)
		-- upvalues: var77 (ref), SetTextFieldCursorPosition (ref), var91 (write)
		var77:SetTextFromInput(p29)
		SetTextFieldCursorPosition(var91)
	end
	
	local var96 = ""
	
	local _ = function()
		-- upvalues: var87 (write), var96 (write)
		return if var87 and var87.TextBox then var87.TextBox.Text else var96
	end
	
	local _ = function(value)
		-- upvalues: var87 (write), var96 (write), var77 (ref), SetTextFieldCursorPosition (ref), var91 (write)
		if var87 and var87.TextBox then
			var87.TextBox.Text = value
			
			return
		elseif var96 ~= value then
			var96 = value
			var77:SetTextFromInput(var96)
			SetTextFieldCursorPosition(var91)
		end
	end
	
	local function calculateTextCursorPosition(p30, p31)
		-- upvalues: var77 (ref), textService (copy)
		p30 -= var77.AbsolutePosition.x
		p31 -= var77.AbsolutePosition.y
		
		for i = 1, #var77.Text do
			local match = string.match(var77.FontSize.Name, "%d+")
			
			if p30 >= textService:GetTextSize(string.sub(var77.Text, 1, i), if match then tostring(match) else 12, var77.Font, var77.AbsoluteSize).x then
				continue
			end
			return i - 1
		end
		return #var77.Text
	end
	
	local var98 = nil
	rawset(var86, "OpenedEvent", bindableEvent.Event)
	rawset(var86, "ClosedEvent", bindableEvent_1.Event)
	rawset(var86, "GetCurrentKeyset", function(_)
		-- upvalues: t_2 (ref), var98 (write)
		return t_2[var98]
	end)
	rawset(var86, "SetCurrentKeyset", function(_, p32)
		-- upvalues: var98 (write), t_2 (ref)
		if p32 ~= var98 and t_2[p32] ~= nil then
			if t_2[var98] and t_2[var98].container then
				t_2[var98].container.Visible = false
			end
			var98 = p32
			
			if t_2[var98] and t_2[var98].container then
				t_2[var98].container.Visible = true
			end
		end
	end)
	rawset(var86, "SetVoiceMode", function(p33, _)
		-- upvalues: var81 (ref), t_3 (copy), CreateBaseVoiceState (copy), soundService (copy)
		var120 = false
		local currentKeyset = p33:GetCurrentKeyset()
		
		if currentKeyset and currentKeyset.container then
			currentKeyset.container.Visible = not var120
		end
		var81.Visible = var120
	end)
	rawset(var86, "GetCaps", function(_)
		-- upvalues: var89 (write)
		return var89
	end)
	rawset(var86, "SetCaps", function(p34, p35)
		-- upvalues: var89 (write)
		var89 = p35
		
		for i, v in pairs(p34:GetCurrentKeyset().keys) do
			v:Update()
		end
	end)
	rawset(var86, "GetShift", function(_)
		-- upvalues: var90 (write)
		return var90
	end)
	rawset(var86, "SetShift", function(p36, p37)
		-- upvalues: var90 (write)
		var90 = p37
		
		for i, v in pairs(p36:GetCurrentKeyset().keys) do
			v:Update()
		end
	end)
	local var99 = false
	local var100 = nil
	local var101 = nil
	local var102 = nil
	
	local _ = function()
		-- upvalues: var100 (write), var101 (write), var102 (write)
		if var100 then
			var100:disconnect()
		end
		var100 = nil
		
		if var101 then
			var101:disconnect()
		end
		var101 = nil
		
		if var102 then
			var102:disconnect()
		end
		var102 = nil
	end
	
	rawset(var86, "Open", function(p38, p39)
		-- upvalues: var94 (write), var87 (write), var76 (ref), keyboard (ref), var100 (write), var101 (write), var102 (write), var77 (ref), SetTextFieldCursorPosition (ref), var91 (write), var99 (write), var96 (write), panel3D (ref), contextActionService (copy), var98 (write), t_2 (ref), bindableEvent (ref)
		if var94 then return end
		var94 = true
		var87 = p39
		p38:SetCurrentKeyset(1)
		p38:SetVoiceMode(false)
		var76.Visible = true
		keyboard:ResizeStuds(5.9, 2.25, 320)
		local cFrame = CFrame.new()
		
		if var100 then
			var100:disconnect()
		end
		var100 = nil
		
		if var101 then
			var101:disconnect()
		end
		var101 = nil
		
		if var102 then
			var102:disconnect()
		end
		var102 = nil
		
		if p39.TextBox then
			var100 = p39.TextBox.Changed:connect(function(p40)
				-- upvalues: p39 (ref), var77 (copy), SetTextFieldCursorPosition (copy), var91 (copy)
				if p40 == "Text" then
					var77:SetTextFromInput(p39.TextBox.Text)
					SetTextFieldCursorPosition(var91)
				end
			end)
			var101 = p39.TextBox.FocusLost:connect(function(p41)
				-- upvalues: var99 (copy), p38 (ref)
				if not var99 then
					p38:Close(p41)
				end
			end)
			
			if not p39.TextBox.ClearTextOnFocus then
				var77:SetTextFromInput(p39.TextBox.Text)
				SetTextFieldCursorPosition(var91)
			elseif var87 and var87.TextBox then
				var87.TextBox.Text = ""
			elseif var96 ~= "" then
				var96 = ""
				var77:SetTextFromInput(var96)
				SetTextFieldCursorPosition(var91)
			end
			local var125 = panel3D.FindContainerOf(p39.TextBox)
			
			if var125 then
				var102 = panel3D.OnPanelClosed.Event:connect(function(p42)
					-- upvalues: var125 (ref), p38 (ref)
					if p42 == var125.name then
						p38:Close(false)
					end
				end)
				cFrame = var125:GetCFrameInCameraSpace() * CFrame.new(var125:GetGuiPositionInPanelSpace(p39.TextBox.AbsolutePosition + Vector2.new(0.5, 1) * p39.TextBox.AbsoluteSize)) * CFrame.new(0, -keyboard.height * 0.65, 0.5) * CFrame.Angles(-0.392699081699, 0, 0)
			else
				cFrame = panel3D.GetHeadLookXZ(true) * CFrame.Angles(0.392699081699, 0, 0) * CFrame.new(0, -1, -5)
			end
		elseif var87 and var87.TextBox then
			var87.TextBox.Text = ""
		elseif var96 ~= "" then
			var96 = ""
			var77:SetTextFromInput(var96)
			SetTextFieldCursorPosition(var91)
		end
		contextActionService:BindCoreAction("VirtualKeyboardControllerInput", function(_, p43, p44)
			-- upvalues: SetTextFieldCursorPosition (copy), var91 (copy), p38 (ref), var98 (copy), t_2 (copy)
			if p43 == Enum.UserInputState.End then
				if p44.KeyCode == Enum.KeyCode.ButtonL1 then
					SetTextFieldCursorPosition(var91 - 1)
					
					return
				elseif p44.KeyCode == Enum.KeyCode.ButtonR1 then
					SetTextFieldCursorPosition(var91 + 1)
					
					return
				elseif p44.KeyCode == Enum.KeyCode.ButtonX then
					p38:BackspaceAtCursor()
					
					return
				elseif p44.KeyCode == Enum.KeyCode.ButtonY then
					p38:SubmitCharacter(" ", false)
					
					return
				elseif p44.KeyCode == Enum.KeyCode.ButtonL2 then
					if var98 then
						p38:SetCurrentKeyset(var98 % #t_2 + 1)
						
						return
					end
				elseif p44.KeyCode == Enum.KeyCode.ButtonL3 then
					p38:SetCaps(not p38:GetCaps())
					
					return
				elseif p44.KeyCode == Enum.KeyCode.ButtonB then
					p38:Close(false)
				end
			end
		end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL2, Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonB)
		p38.Parent = keyboard:GetGUI()
		keyboard:SetType(panel3D.Type.Fixed, { CFrame = cFrame })
		keyboard:SetCanFade(false)
		keyboard:SetVisible(true, true)
		keyboard:ForceShowUntilLookedAt()
		
		function keyboard.OnUpdate(_) end
		
		bindableEvent:Fire()
	end)
	rawset(var86, "Close", function(p45, p46)
		-- upvalues: var94 (write), var100 (write), var101 (write), var102 (write), contextActionService (copy), keyboard (ref), var76 (ref), panel3D (ref), bindableEvent_1 (ref)
		p46 = p46 == true
		
		if not var94 then return end
		var94 = false
		
		if var100 then
			var100:disconnect()
		end
		var100 = nil
		
		if var101 then
			var101:disconnect()
		end
		var101 = nil
		
		if var102 then
			var102:disconnect()
		end
		var102 = nil
		contextActionService:UnbindCoreAction("VirtualKeyboardControllerInput")
		keyboard:OnMouseLeave()
		keyboard:SetVisible(false, true)
		var76.Visible = false
		panel3D.Get("Topbar3D"):SetVisible(true)
		p45:SubmitText(p46, false)
		bindableEvent_1:Fire()
	end)
	rawset(var86, "SubmitText", function(_, p47, p48)
		-- upvalues: var87 (write), var96 (write), panel3D (ref), keyboard (ref), var99 (write)
		local textBox = var87 and var87.TextBox
		
		if textBox then
			if p47 then
				textBox.Text = if var87 and var87.TextBox then var87.TextBox.Text else var96
			end
			local var127 = panel3D.FindContainerOf(textBox)
			local var128 = p48 and (var127 and var127.linkedTo == keyboard)
			
			if var128 then
				var99 = true
			end
			textBox:ReleaseFocus(p47)
			
			if var128 then
				textBox:CaptureFocus()
				var99 = false
			end
		end
	end)
	rawset(var86, "GetCurrentOptions", function(_)
		-- upvalues: var87 (write)
		return var87
	end)
	rawset(var86, "BackspaceAtCursor", function(_)
		-- upvalues: var91 (write), var87 (write), var96 (write), var77 (ref), SetTextFieldCursorPosition (ref)
		if var91 >= 1 then
			local var129 = if var87 and var87.TextBox then var87.TextBox.Text else var96
			local text = string.sub(var129, 1, var91 - 1) .. string.sub(var129, var91 + 1, #var129)
			local var131 = var91 - 1
			
			if var87 and var87.TextBox then
				var87.TextBox.Text = text
			elseif var96 ~= text then
				var96 = text
				var77:SetTextFromInput(var96)
				SetTextFieldCursorPosition(var91)
			end
			SetTextFieldCursorPosition(var131)
		end
	end)
	rawset(var86, "SubmitCharacter", function(p49, p50, p51)
		-- upvalues: var87 (write), var96 (write), var91 (write), var77 (ref), SetTextFieldCursorPosition (ref)
		local var132 = if var87 and var87.TextBox then var87.TextBox.Text else var96
		local text = string.sub(var132, 1, var91) .. p50 .. string.sub(var132, var91 + 1, #var132)
		
		if var87 and var87.TextBox then
			var87.TextBox.Text = text
		elseif var96 ~= text then
			var96 = text
			var77:SetTextFromInput(var96)
			SetTextFieldCursorPosition(var91)
		end
		SetTextFieldCursorPosition(var91 + #p50)
		
		if p51 and p49:GetShift() then
			p49:SetShift(false)
		end
	end)
	
	for i, v in pairs(p28) do
		local t_4 = {}
		local var105 = create("Frame")({
			Name = "KeyboardSizeConstrainer",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -20),
			Position = UDim2.new(0, 0, 0, 20),
			Parent = var76
		})
		local var106 = 0
		local var107 = 0
		local var108 = 0
		
		for i_1, v_1 in pairs(v) do
			local var109 = 0
			local var110 = 1
			local var111 = 1
			local w2 = nil
			local h2 = nil
			local x2 = nil
			local y2 = nil
			
			for i_3, v_3 in pairs(v_1) do
				local v_3
				if type(v_3) ~= "table" then
					if type(v_3) == "string" then
						if v_3 == "" then
							v_3 = " "
						end
						local t_5 = {
							x = var109,
							y = var108,
							width = var110,
							height = var111,
							x2 = x2,
							y2 = y2,
							width2 = w2,
							height2 = h2
						}
						local t_6 = {}
						
						for i_4 in string.gmatch(v_3, "([^\n]+)") do
							table.insert(t_6, i_4)
						end
						table.insert(t_4, CreateKeyboardKey(var86, t_5, t_6))
						var109 += var110
						var106 = math.max(var106, var109)
						var107 = math.max(var107, var108 + var111)
						var110 = 1
						var111 = 1
						w2 = nil
						h2 = nil
						x2 = nil
						y2 = nil
					end
				end
				if v_3.w then
					var110 = v_3.w
				end
				if v_3.h then
					var111 = v_3.h
				end
				if v_3.x then
					var109 += v_3.x
				end
				if v_3.y then
					var108 += v_3.y
				end
				if v_3.x2 then
					x2 = v_3.x2
				end
				if v_3.y2 then
					y2 = v_3.y2
				end
				if v_3.w2 then
					w2 = v_3.w2
				end
				if v_3.h2 then
					h2 = v_3.h2
				end
			end
			var108 += 1
		end
		for i_1, v_1 in pairs(t_4) do
			v_1.Position = UDim2.new(v_1.Position.X.Scale / var106, 0, v_1.Position.Y.Scale / var107, 0)
			v_1.Size = UDim2.new(v_1.Size.X.Scale / var106, 0, v_1.Size.Y.Scale / var107, 0)
			v_1.Parent = var105
		end
		var105.SizeConstraint = Enum.SizeConstraint.RelativeXX
		var105.Size = UDim2.new(1, 0, -var107 / var106, 0)
		var105.Position = UDim2.new(0, 0, 1, 0)
		var105.Visible = false
		table.insert(t_2, { keys = t_4, container = var105 })
	end
	var86:SetCurrentKeyset(1)
	var77.MouseButton1Click:connect(function()
		-- upvalues: SetTextFieldCursorPosition (ref), calculateTextCursorPosition (ref), keyboard (ref)
		SetTextFieldCursorPosition(calculateTextCursorPosition(keyboard.lookAtPixel.X, keyboard.lookAtPixel.Y))
	end)
	var80.MouseButton1Click:connect(function()
		-- upvalues: var86 (ref)
		var86:Close(false)
	end)
	var83.MouseButton1Click:connect(function()
		-- upvalues: t_3 (copy), CreateBaseVoiceState (copy), soundService (copy)
		if t_3:GetCurrentState().Name == "Listening" then
			local var134 = t_3
			local processing = CreateBaseVoiceState()
			processing.Name = "Processing"
			local var136 = false
			local var137 = nil
			
			function processing.TransitionTo(_)
				-- upvalues: var137 (write), soundService (copy), var136 (write)
				coroutine.wrap(function()
					-- upvalues: var137 (copy), soundService (copy), var136 (copy)
					pcall(function()
						-- upvalues: var137 (copy), soundService (copy)
						var72 = soundService:EndRecording()
					end)
					var71 = true
				end)()
			end
			
			function processing.GetResultAsync(_)
				-- upvalues: var136 (write), var137 (write)
				while true do
					while not var136 do
						wait()
					end
					return var137
				end
			end
			
			var134:TransitionState(processing)
		end
	end)
	
	local function onVoiceProcessingStateChanged(p52)
		-- upvalues: var84 (ref), var85 (ref), t (copy), var87 (write), var96 (write), var77 (ref), SetTextFieldCursorPosition (ref), var91 (write), t_3 (copy), CreateBaseVoiceState (copy), var86 (ref)
		if p52.Name == "Listening" then
			var84.Text = "Listening..."
		elseif p52.Name == "Processing" then
			var84.Text = "Processing..."
		elseif p52.Name == "Waiting" then
			var84.Text = "Done"
		end
		if p52.Name == "Processing" then
			coroutine.wrap(function()
				-- upvalues: var85 (copy), p52 (ref), t (copy), var87 (copy), var96 (copy), var77 (copy), SetTextFieldCursorPosition (copy), var91 (copy), var84 (copy), t_3 (copy), CreateBaseVoiceState (copy)
				var85:StopAnimation()
				local resultAsync = p52:GetResultAsync()
				
				if resultAsync and resultAsync.Status == t.ASR_STATUS_OK then
					local response = resultAsync.Response
					
					if var87 and var87.TextBox then
						var87.TextBox.Text = response
					elseif var96 ~= response then
						var96 = response
						var77:SetTextFromInput(var96)
						SetTextFieldCursorPosition(var91)
					end
				else
					var84.Text = "An error occurred, please try again."
					wait(2)
				end
				local waiting = CreateBaseVoiceState()
				waiting.Name = "Waiting"
				t_3:TransitionState(waiting)
			end)()
			
			return
		elseif p52.Name == "Listening" then
			var85:StartAnimation()
			
			return
		elseif p52.Name == "Waiting" then
			var86:SetVoiceMode(false)
		end
	end
	
	t_3.StateTransitionedEvent:connect(onVoiceProcessingStateChanged)
	onVoiceProcessingStateChanged(t_3:GetCurrentState())
	
	return var86
end

local var26 = nil

local _ = function()
	-- upvalues: var26 (write), ConstructKeyboardUI (ref), var12 (ref), var13 (ref)
	if var26 == nil then
		var26 = ConstructKeyboardUI({ var12, var13 })
	end
	return var26
end

local t_4 = {
	CreateVirtualKeyboardOptions = function(_, p53)
		return { TextBox = p53 }
	end,
	ShowVirtualKeyboard = function(_, _) end,
	CloseVirtualKeyboard = function(_) end
}

if var26 == nil then
	var26 = ConstructKeyboardUI({ var12, var13 })
end
t_4.OpenedEvent = var26.OpenedEvent

if var26 == nil then
	var26 = ConstructKeyboardUI({ var12, var13 })
end
t_4.ClosedEvent = var26.ClosedEvent

return t_4