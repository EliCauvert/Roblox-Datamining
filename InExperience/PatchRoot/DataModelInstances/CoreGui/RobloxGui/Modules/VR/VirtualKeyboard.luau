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
local var1 = httpService:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"Q\",\n    \"W\",\n    \"E\",\n    \"R\",\n    \"T\",\n    \"Y\",\n    \"U\",\n    \"I\",\n    \"O\",\n    \"P\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"Caps\",\n    \"A\",\n    \"S\",\n    \"D\",\n    \"F\",\n    \"G\",\n    \"H\",\n    \"J\",\n    \"K\",\n    \"L\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"Shift\",\n    \"Z\",\n    \"X\",\n    \"C\",\n    \"V\",\n    \"B\",\n    \"N\",\n    \"M\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"123/sym\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
local var2 = httpService:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"1\",\n    \"2\",\n    \"3\",\n    \"4\",\n    \"5\",\n    \"6\",\n    \"7\",\n    \"8\",\n    \"9\",\n    \"0\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"!\",\n    \"@\",\n    \"#\",\n    \"$\",\n    \"%\",\n    \"^\",\n    \"&\",\n    \"(\",\n    \")\",\n    \"=\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 1.2\n    },\n    \"/\",\n    \"-\",\n    \"+\",\n    \"_\",\n    \":\",\n    \";\",\n    \"'\",\n    \"\\\"\",\n    \",\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"abc\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n")
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
local function _(p1, p2)
	local t = {}
	
	for i in string.gmatch(p1, "([^" .. p1 .. "]+)") do
		table.insert(t, i)
	end
	return t
end

local _ = function(p3)
	local match = string.match(p3.Name, "%d+")
	
	return match and tostring(match) or 12
end

local _ = function(p3, p4, p5)
	p4 = p4.unit
	p3 = p3.Unit
	local direction = p4:Dot(p3.Direction)
	
	if direction == 0 then
		return nil
	end
	local var3 = p4:Dot(p5 - p3.Origin) / direction
	
	return if var3 < 0 then nil else p3.Origin + p3.Direction * var3
end

function Clamp(value, minValue, maxValue)
	return math.max(value, math.min(minValue, maxValue))
end

local _ = function(p3, p4, p5)
	local absolutePosition = p3.AbsolutePosition
	local var3 = p3.AbsolutePosition + p3.AbsoluteSize
	
	return absolutePosition.X <= p4 and p4 <= var3.X and (absolutePosition.Y <= p5 and p5 <= var3.Y)
end

local function FindAncestorOfType(p3, p4)
	-- upvalues: FindAncestorOfType (ref)
	if not p3 then
		return nil
	end
	local parent = p3.Parent
	
	return if parent and parent:IsA(p4) then parent else FindAncestorOfType(parent, p4)
end

local function ExtendedInstance(p3)
	local t = {}
	setmetatable(t, {
		__index = function(_, p4)
			-- upvalues: p3 (ref)
			return p3[p4]
		end,
		__newindex = function(_, p4, p5)
			-- upvalues: p3 (ref)
			p3[p4] = p5
		end
	})
	
	return t
end

local function CreateVRButton(p3)
	-- upvalues: ExtendedInstance (ref)
	local var3 = ExtendedInstance(p3)
	rawset(var3, "OnEnter", function(_) end)
	rawset(var3, "OnLeave", function(_) end)
	rawset(var3, "OnDown", function(_) end)
	rawset(var3, "OnUp", function(_) end)
	rawset(var3, "ContainsPoint", function(_, p4, p5)
		-- upvalues: p3 (ref)
		local absolutePosition = p3.AbsolutePosition
		local var4 = p3.AbsolutePosition + p3.AbsoluteSize
		
		return absolutePosition.X <= p4 and p4 <= var4.X and (absolutePosition.Y <= p5 and p5 <= var4.Y)
	end)
	rawset(var3, "Update", function(_) end)
	
	return var3
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

local function CreateKeyboardKey(p3, p4, p5)
	-- upvalues: create (ref), color3_4 (ref), color3 (ref), CreateVRButton (ref), t_1 (ref), color3_2 (ref), color3_1 (ref), color3_3 (ref)
	local y2 = p4.width2 and (p4.height2 and (p4.x2 and p4.y2))
	local var3 = create("ImageButton")({
		BorderSizePixel = 0,
		Image = "",
		BackgroundTransparency = 1,
		ZIndex = 1,
		Name = p5[1],
		Position = UDim2.new(p4.x, 0, p4.y, 0),
		Size = UDim2.new(p4.width, 0, p4.height, 0)
	})
	local var4 = create("TextLabel")({
		Name = "KeyText",
		BackgroundTransparency = 1,
		Selectable = true,
		ZIndex = 2,
		Text = p5[#p5],
		Position = UDim2.new(0, -10, 0, -10),
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = color3_4,
		Parent = var3
	})
	local var5 = create("Frame")({
		Name = "KeyBackground",
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -10, 1, -10),
		Position = UDim2.new(0, -5, 0, -5),
		BackgroundColor3 = color3,
		Parent = var3
	})
	local var6 = create("ImageLabel")({
		Name = "SelectionObject",
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png",
		ImageTransparency = 0,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(12, 12, 52, 52)
	})
	var3.SelectionImageObject = create("ImageLabel")({ Visible = false })
	local var7 = nil
	local var8 = nil
	local var9 = nil
	local var10 = nil
	
	if y2 then
		var7 = create("ImageButton")({
			Name = "KeyBackground",
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Position = UDim2.new(p4.x2 / p4.width, -5, p4.y2 / p4.height, -5),
			Size = UDim2.new(p4.width2 / p4.width, 0, p4.height2 / p4.height, -10),
			BackgroundColor3 = color3,
			SelectionImageObject = var3.SelectionImageObject,
			Parent = var3
		})
		
		if p4.x2 <= 0 then
			var4.Size = var7.Size - UDim2.new(0, 10, 0, 0)
			var4.Position = var7.Position
			var7.Size -= UDim2.new(1, 0, 0, 0)
		end
		var8 = create("Frame")({
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
		var9 = var8:Clone()
		var9.Size = UDim2.new(1, 0, 0.5, 5)
		var9.Position = UDim2.new(0, 0, 0, 0)
		var9.Borders.Size = UDim2.new(1, 0, 1, 30)
		var9.Borders.Position = UDim2.new(0, 0, 0, 0)
		var10 = var8:Clone()
		var10.Size = UDim2.new(1, 5, 1, 0)
		var10.Position = UDim2.new(0, 0, 0, 0)
		var10.Borders.Size = UDim2.new(1, 30, 1, 0)
		var10.Borders.Position = UDim2.new(0, 0, 0, 0)
	end
	local var11 = CreateVRButton(var3)
	local var12 = false
	local var13 = false
	local var14 = #p5 == 1 and (type(p5[1]) == "string" and (#p5[1] == 1 and (string.byte(p5[1]) >= 65 and string.byte(p5[1]) <= 122)))
	local var15 = nil
	
	if p5[1] and t_1[p5[1]] then
		var4.Visible = false
		var15 = create("ImageLabel")({
			Name = "KeyIcon",
			BackgroundTransparency = 1,
			Size = UDim2.new(t_1[p5[1]].AspectRatio, -20, 1, -20),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Image = t_1[p5[1]].Asset,
			Parent = var5
		})
		var15.Changed:connect(function(p6)
			-- upvalues: var15 (write)
			if p6 == "AbsoluteSize" then
				var15.Position = UDim2.new(0.5, -var15.AbsoluteSize.X / 2, 0.5, -var15.AbsoluteSize.Y / 2)
			end
		end)
		var15.Position = UDim2.new(0.5, -var15.AbsoluteSize.X / 2, 0.5, -var15.AbsoluteSize.Y / 2)
	end
	local function onClicked()
		-- upvalues: var11 (ref), p3 (ref), var14 (ref)
		local var16 = nil
		local currentKeyValue = var11:GetCurrentKeyValue()
		
		if currentKeyValue == "Shift" then
			p3:SetShift(not p3:GetShift())
		elseif currentKeyValue == "Caps" then
			p3:SetCaps(not p3:GetCaps())
		elseif currentKeyValue == "Enter" then
			p3:SubmitText(true, true)
		elseif currentKeyValue == "Delete" then
			p3:BackspaceAtCursor()
		elseif currentKeyValue == "123/sym" then
			p3:SetCurrentKeyset(2)
		elseif currentKeyValue == "abc" then
			p3:SetCurrentKeyset(1)
		elseif currentKeyValue == "<Speaker>" then
			p3:SetVoiceMode(true)
		else
			var16 = if currentKeyValue == "Tab" then "\t" else currentKeyValue
		end
		if var16 ~= nil then
			p3:SubmitCharacter(var16, var14)
		end
	end
	
	local function _(value, p6)
		-- upvalues: var5 (ref), var7 (write), y2 (ref), var8 (write), var9 (write), var10 (write), var6 (ref)
		var5.BackgroundColor3 = value
		
		if var7 then
			var7.BackgroundColor3 = value
		end
		if y2 then
			var8.Parent = if p6 then var5 else nil
			var9.Parent = if p6 then var5 else nil
			var10.Parent = if p6 then var7 else nil
			
			return
		end
		var6.Parent = if p6 then var5 else nil
	end
	
	local function update()
		-- upvalues: var11 (ref), var13 (write), color3_2 (copy), var5 (ref), var7 (write), y2 (ref), var8 (write), var9 (write), var10 (write), var6 (ref), var12 (write), color3_1 (copy), p3 (ref), color3_3 (copy), color3 (copy), var15 (write), var4 (ref)
		local currentKeyValue = var11:GetCurrentKeyValue()
		
		if var13 then
			local var16 = color3_2
			var5.BackgroundColor3 = var16
			
			if var7 then
				var7.BackgroundColor3 = var16
			end
			if y2 then
				var8.Parent = nil
				var9.Parent = nil
				var10.Parent = nil
			else
				var6.Parent = nil
			end
		elseif var12 then
			local var17 = color3_1
			var5.BackgroundColor3 = var17
			
			if var7 then
				var7.BackgroundColor3 = var17
			end
			if y2 then
				var8.Parent = var5 or nil
				var9.Parent = var5 or nil
				var10.Parent = var7 or nil
			else
				var6.Parent = var5 or nil
			end
		elseif currentKeyValue == "Caps" and p3:GetCaps() then
			local var18 = color3_3
			var5.BackgroundColor3 = var18
			
			if var7 then
				var7.BackgroundColor3 = var18
			end
			if y2 then
				var8.Parent = nil
				var9.Parent = nil
				var10.Parent = nil
			else
				var6.Parent = nil
			end
		elseif currentKeyValue == "Shift" and p3:GetShift() then
			local var19 = color3_3
			var5.BackgroundColor3 = var19
			
			if var7 then
				var7.BackgroundColor3 = var19
			end
			if y2 then
				var8.Parent = nil
				var9.Parent = nil
				var10.Parent = nil
			else
				var6.Parent = nil
			end
		elseif currentKeyValue == "abc" then
			local var20 = color3_3
			var5.BackgroundColor3 = var20
			
			if var7 then
				var7.BackgroundColor3 = var20
			end
			if y2 then
				var8.Parent = nil
				var9.Parent = nil
				var10.Parent = nil
			else
				var6.Parent = nil
			end
		else
			local var21 = color3
			var5.BackgroundColor3 = var21
			
			if var7 then
				var7.BackgroundColor3 = var21
			end
			if y2 then
				var8.Parent = nil
				var9.Parent = nil
				var10.Parent = nil
			else
				var6.Parent = nil
			end
		end
		if var15 then
			var15.ImageTransparency = 0.5
		end
		var4.Text = var11:GetCurrentKeyValue()
	end
	
	local t = {}
	rawset(var11, "OnEnter", function(_)
		-- upvalues: var12 (write), update (ref)
		var12 = true
		update()
	end)
	rawset(var11, "OnLeave", function(_)
		-- upvalues: t (ref), var12 (write), var13 (write), update (ref)
		if not next(t) then
			var12 = false
			var13 = false
			update()
		end
	end)
	rawset(var11, "OnDown", function(_)
		-- upvalues: var13 (write), update (ref), onClicked (ref)
		var13 = true
		update()
		onClicked()
	end)
	rawset(var11, "OnUp", function(_)
		-- upvalues: var13 (write), update (ref)
		var13 = false
		update()
	end)
	rawset(var11, "GetCurrentKeyValue", function(_)
		-- upvalues: p3 (ref), var14 (ref), p5 (ref)
		local shift = p3:GetShift()
		local caps = p3:GetCaps()
		
		return if var14 then if caps and shift then string.lower(p5[#p5]) elseif caps or shift then p5[1] else string.lower(p5[#p5]) elseif shift then p5[1] else p5[#p5]
	end)
	rawset(var11, "ContainsPoint", function(_, p6, p7)
		-- upvalues: var5 (ref), var7 (write)
		local var16
		local var17 = var5
		local absolutePosition = var17.AbsolutePosition
		local var18 = var17.AbsolutePosition + var17.AbsoluteSize
		
		if absolutePosition.X <= p6 and p6 <= var18.X and absolutePosition.Y <= p7 then
			var16 = p7 > var18.Y
		end
		if not var16 then
			var16 = var7
			
			if var16 then
				local var19 = var7
				local absolutePosition_1 = var19.AbsolutePosition
				local var20 = var19.AbsolutePosition + var19.AbsoluteSize
				
				if absolutePosition_1.X <= p6 and p6 <= var20.X and (absolutePosition_1.Y <= p7 and p7 <= var20.Y) then
					return true
				end
				var16 = false
			end
		end
		return var16
	end)
	rawset(var11, "Update", function(_)
		-- upvalues: update (ref)
		update()
	end)
	rawset(var11, "GetInstance", function(_)
		-- upvalues: var3 (ref)
		return var3
	end)
	var3.MouseButton1Down:connect(function()
		-- upvalues: var11 (ref)
		var11:OnDown()
	end)
	var3.MouseButton1Up:connect(function()
		-- upvalues: var11 (ref)
		var11:OnUp()
	end)
	var3.SelectionGained:connect(function()
		-- upvalues: t (ref), var3 (ref), var11 (ref)
		t[var3] = true
		var11:OnEnter()
	end)
	var3.SelectionLost:connect(function()
		-- upvalues: t (ref), var3 (ref), var11 (ref)
		t[var3] = nil
		var11:OnLeave()
	end)
	
	if var7 then
		var7.MouseButton1Down:connect(function()
			-- upvalues: var11 (ref)
			var11:OnDown()
		end)
		var7.MouseButton1Up:connect(function()
			-- upvalues: var11 (ref)
			var11:OnUp()
		end)
		var7.SelectionGained:connect(function()
			-- upvalues: t (ref), var7 (write), var11 (ref)
			t[var7] = true
			var11:OnEnter()
		end)
		var7.SelectionLost:connect(function()
			-- upvalues: t (ref), var7 (write), var11 (ref)
			t[var7] = nil
			var11:OnLeave()
		end)
	end
	update()
	
	return var11
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
	local var3 = false
	local var4 = nil
	
	function processing.TransitionTo(_)
		-- upvalues: var4 (write), soundService (copy), var3 (write)
		coroutine.wrap(function()
			-- upvalues: var4 (copy), soundService (copy), var3 (copy)
			pcall(function()
				-- upvalues: var4 (copy), soundService (copy)
				var4 = soundService:EndRecording()
			end)
			var3 = true
		end)()
	end
	
	function processing.GetResultAsync(_)
		-- upvalues: var3 (write), var4 (write)
		while not var3 do
			wait()
		end
		return var4
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

function t_3.TransitionState(p3, p4)
	-- upvalues: t_2 (ref), bindableEvent (ref)
	if t_2[p3.CurrentState.Name][p4.Name] then
		p3.CurrentState:TransitionFrom()
		p3.CurrentState = p4
		p3.CurrentState:TransitionTo()
		bindableEvent:Fire(p3.CurrentState)
		
		return true
	end
	return false
end

function t_3.GetCurrentState(p3)
	return p3.CurrentState
end

t_3.StateTransitionedEvent = bindableEvent.Event

local function ConstructKeyboardUI(p3)
	-- upvalues: corePackagesService (ref), create (ref), color3_3 (ref), CreateVRButton (ref), color3 (ref), color3_4 (ref), runService (ref), ExtendedInstance (ref), textService (ref), t_3 (ref), CreateBaseVoiceState (ref), soundService (ref), contextActionService (ref), CreateKeyboardKey (ref), t (ref)
	local panel3D = require(corePackagesService.Workspace.Packages.VrCommon).Panel3D
	local keyboard = panel3D.Get("Keyboard")
	keyboard:SetVisible(false)
	local t_1 = {}
	local var5 = create("Frame")({
		Name = "VirtualKeyboard",
		BackgroundTransparency = 1,
		Active = true,
		Visible = false,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	})
	local var6 = create("TextButton")({
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
				Parent = var5
			})
		})
	})
	local var7 = create("Frame")({
		Name = "TextfieldCursor",
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Visible = true,
		ZIndex = 2,
		Size = UDim2.new(0, 5, 0.9, 0),
		Position = UDim2.new(0, 0, 0.05, 0),
		BackgroundColor3 = color3_3,
		Parent = var6
	})
	local var8 = create("ImageButton")({
		Name = "CloseButton",
		Image = "rbxasset://textures/ui/Keyboard/close_button_background.png",
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Size = UDim2.new(0.075, -10, 0.198, -10),
		Position = UDim2.new(0, -5, 0, -35),
		Parent = var5
	})
	var8.SelectionImageObject = create("ImageLabel")({
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
		Parent = var8
	})
	local var9 = CreateVRButton(var8)
	table.insert(t_1, var9)
	local var10 = create("Frame")({
		Name = "VoiceRecognitionContainer",
		BackgroundTransparency = 1,
		Active = true,
		Visible = false,
		Size = UDim2.new(1, 0, 0.85, 0),
		Position = UDim2.new(0, 0, 0.15, 0),
		Parent = var5
	})
	local var11 = create("Frame")({
		Name = "voiceRecognitionBackground1",
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Active = true,
		Size = UDim2.new(1, 0, 0.75, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = color3,
		Parent = var10
	}):Clone()
	var11.Size = UDim2.new(0.8, 0, 0.25, 0)
	var11.Position = UDim2.new(0, 0, 0.75, 0)
	var11.Parent = var10
	local var12 = CreateVRButton(create("TextButton")({
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
		Parent = var10
	}))
	table.insert(t_1, var12)
	local var13 = create("TextLabel")({
		Name = "VoiceProcessingStatus",
		Text = "",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.33, 0),
		Font = Enum.Font.SourceSansBold,
		FontSize = Enum.FontSize.Size96,
		TextColor3 = color3_4,
		Parent = var10
	})
	local var14 = (function()
		-- upvalues: create (copy), color3_4 (copy), runService (copy)
		local t = {}
		local t_1 = {}
		local var15 = create("Frame")({
			Name = "VoiceVisualizerContainer",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		})
		t.Container = var15
		
		for i = 1, 50 do
			table.insert(t_1, create("Frame")({
				Name = "Bar",
				BackgroundTransparency = 0,
				Size = UDim2.new(0.02, -4, 1, 0),
				Position = UDim2.new(i / 50, 0, 0, 0),
				BackgroundColor3 = color3_4,
				Parent = var15
			}))
		end
		function t.StartAnimation(_)
			-- upvalues: runService (copy), t_1 (ref)
			runService:UnbindFromRenderStep("VoiceVisualizerWidget")
			runService:BindToRenderStep("VoiceVisualizerWidget", Enum.RenderPriority.First.Value, function()
				-- upvalues: t_1 (copy)
				for i, v in pairs(t_1) do
					local var16 = ((math.abs(math.sin(tick() * 2.5 + i * 0.502654824574)) + math.abs(math.cos(tick() * 2.5 + i * 0.502654824574))) / 2 - 0.3) * 1.428571428571
					v.Size = UDim2.new(0.02, -4, var16, 0)
					v.Position = UDim2.new(i / 50, 0, (1 - var16) / 2, 0)
				end
			end)
		end
		
		function t.StopAnimation(_)
			-- upvalues: runService (copy)
			runService:UnbindFromRenderStep("VoiceVisualizerWidget")
		end
		
		return t
	end)()
	var14.Container.Parent = var10
	var14.Container.Size = UDim2.new(0.5, 0, 0.4, 0)
	var14.Container.Position = UDim2.new(0.25, 0, 0.4, 0)
	local var16 = ExtendedInstance(var5)
	local var17 = nil
	local t_2 = {}
	local var18 = false
	local var19 = false
	local var20 = 0
	local bindableEvent = Instance.new("BindableEvent")
	local bindableEvent_1 = Instance.new("BindableEvent")
	local var21 = false
	
	local function SetTextFieldCursorPosition(value)
		-- upvalues: var20 (write), var6 (ref), textService (copy), var7 (ref)
		var20 = if not var6.TextFits then #var6.Text else Clamp(0, #var6.Text, value)
		local match = string.match(var6.FontSize.Name, "%d+")
		var7.Position = UDim2.new(0, textService:GetTextSize(string.sub(var6.Text, 1, var20), if match then tostring(match) else 12, var6.Font, var6.AbsoluteSize).x, var7.Position.Y.Scale, var7.Position.Y.Offset)
	end
	
	local function _(p4)
		-- upvalues: var6 (ref), SetTextFieldCursorPosition (ref), var20 (write)
		var6:SetTextFromInput(p4)
		SetTextFieldCursorPosition(var20)
	end
	
	local var22 = ""
	
	local _ = function()
		-- upvalues: var17 (write), var22 (write)
		return if var17 and var17.TextBox then var17.TextBox.Text else var22
	end
	
	local _ = function(value)
		-- upvalues: var17 (write), var22 (write), var6 (ref), SetTextFieldCursorPosition (ref), var20 (write)
		if var17 and var17.TextBox then
			var17.TextBox.Text = value
			
			return
		elseif var22 ~= value then
			var22 = value
			var6:SetTextFromInput(var22)
			SetTextFieldCursorPosition(var20)
		end
	end
	
	local function calculateTextCursorPosition(p4, p5)
		-- upvalues: var6 (ref), textService (copy)
		p4 -= var6.AbsolutePosition.x
		p5 -= var6.AbsolutePosition.y
		
		for i = 1, #var6.Text do
			local match = string.match(var6.FontSize.Name, "%d+")
			
			if p4 >= textService:GetTextSize(string.sub(var6.Text, 1, i), if match then tostring(match) else 12, var6.Font, var6.AbsoluteSize).x then
				continue
			end
			return i - 1
		end
		return #var6.Text
	end
	
	local var23 = nil
	rawset(var16, "OpenedEvent", bindableEvent.Event)
	rawset(var16, "ClosedEvent", bindableEvent_1.Event)
	rawset(var16, "GetCurrentKeyset", function(_)
		-- upvalues: t_2 (ref), var23 (write)
		return t_2[var23]
	end)
	rawset(var16, "SetCurrentKeyset", function(_, p6)
		-- upvalues: var23 (write), t_2 (ref)
		if p6 ~= var23 and t_2[p6] ~= nil then
			if t_2[var23] and t_2[var23].container then
				t_2[var23].container.Visible = false
			end
			var23 = p6
			
			if t_2[var23] and t_2[var23].container then
				t_2[var23].container.Visible = true
			end
		end
	end)
	rawset(var16, "SetVoiceMode", function(p6, _)
		-- upvalues: var10 (ref), t_3 (copy), CreateBaseVoiceState (copy), soundService (copy)
		var120 = false
		local currentKeyset = p6:GetCurrentKeyset()
		
		if currentKeyset and currentKeyset.container then
			currentKeyset.container.Visible = not var120
		end
		var10.Visible = var120
	end)
	rawset(var16, "GetCaps", function(_)
		-- upvalues: var18 (write)
		return var18
	end)
	rawset(var16, "SetCaps", function(p6, p7)
		-- upvalues: var18 (write)
		var18 = p7
		
		for i, v in pairs(p6:GetCurrentKeyset().keys) do
			v:Update()
		end
	end)
	rawset(var16, "GetShift", function(_)
		-- upvalues: var19 (write)
		return var19
	end)
	rawset(var16, "SetShift", function(p8, p9)
		-- upvalues: var19 (write)
		var19 = p9
		
		for i, v in pairs(p8:GetCurrentKeyset().keys) do
			v:Update()
		end
	end)
	local var24 = false
	local var25 = nil
	local var26 = nil
	local var27 = nil
	
	local _ = function()
		-- upvalues: var25 (write), var26 (write), var27 (write)
		if var25 then
			var25:disconnect()
		end
		var25 = nil
		
		if var26 then
			var26:disconnect()
		end
		var26 = nil
		
		if var27 then
			var27:disconnect()
		end
		var27 = nil
	end
	
	rawset(var16, "Open", function(p10, p11)
		-- upvalues: var21 (write), var17 (write), var5 (ref), keyboard (ref), var25 (write), var26 (write), var27 (write), var6 (ref), SetTextFieldCursorPosition (ref), var20 (write), var24 (write), var22 (write), panel3D (ref), contextActionService (copy), var23 (write), t_2 (ref), bindableEvent (ref)
		if var21 then return end
		var21 = true
		var17 = p11
		p10:SetCurrentKeyset(1)
		p10:SetVoiceMode(false)
		var5.Visible = true
		keyboard:ResizeStuds(5.9, 2.25, 320)
		local cFrame = CFrame.new()
		
		if var25 then
			var25:disconnect()
		end
		var25 = nil
		
		if var26 then
			var26:disconnect()
		end
		var26 = nil
		
		if var27 then
			var27:disconnect()
		end
		var27 = nil
		
		if p11.TextBox then
			var25 = p11.TextBox.Changed:connect(function(p12)
				-- upvalues: p11 (ref), var6 (copy), SetTextFieldCursorPosition (copy), var20 (copy)
				if p12 == "Text" then
					var6:SetTextFromInput(p11.TextBox.Text)
					SetTextFieldCursorPosition(var20)
				end
			end)
			var26 = p11.TextBox.FocusLost:connect(function(p12)
				-- upvalues: var24 (copy), p10 (ref)
				if not var24 then
					p10:Close(p12)
				end
			end)
			
			if not p11.TextBox.ClearTextOnFocus then
				var6:SetTextFromInput(p11.TextBox.Text)
				SetTextFieldCursorPosition(var20)
			elseif var17 and var17.TextBox then
				var17.TextBox.Text = ""
			elseif var22 ~= "" then
				var22 = ""
				var6:SetTextFromInput(var22)
				SetTextFieldCursorPosition(var20)
			end
			local var28 = panel3D.FindContainerOf(p11.TextBox)
			
			if var28 then
				var27 = panel3D.OnPanelClosed.Event:connect(function(p12)
					-- upvalues: var28 (ref), p10 (ref)
					if p12 == var28.name then
						p10:Close(false)
					end
				end)
				cFrame = var28:GetCFrameInCameraSpace() * CFrame.new(var28:GetGuiPositionInPanelSpace(p11.TextBox.AbsolutePosition + Vector2.new(0.5, 1) * p11.TextBox.AbsoluteSize)) * CFrame.new(0, -keyboard.height * 0.65, 0.5) * CFrame.Angles(-0.392699081699, 0, 0)
			else
				cFrame = panel3D.GetHeadLookXZ(true) * CFrame.Angles(0.392699081699, 0, 0) * CFrame.new(0, -1, -5)
			end
		elseif var17 and var17.TextBox then
			var17.TextBox.Text = ""
		elseif var22 ~= "" then
			var22 = ""
			var6:SetTextFromInput(var22)
			SetTextFieldCursorPosition(var20)
		end
		contextActionService:BindCoreAction("VirtualKeyboardControllerInput", function(_, p12, p13)
			-- upvalues: SetTextFieldCursorPosition (copy), var20 (copy), p10 (ref), var23 (copy), t_2 (copy)
			if p12 == Enum.UserInputState.End then
				if p13.KeyCode == Enum.KeyCode.ButtonL1 then
					SetTextFieldCursorPosition(var20 - 1)
					
					return
				elseif p13.KeyCode == Enum.KeyCode.ButtonR1 then
					SetTextFieldCursorPosition(var20 + 1)
					
					return
				elseif p13.KeyCode == Enum.KeyCode.ButtonX then
					p10:BackspaceAtCursor()
					
					return
				elseif p13.KeyCode == Enum.KeyCode.ButtonY then
					p10:SubmitCharacter(" ", false)
					
					return
				elseif p13.KeyCode == Enum.KeyCode.ButtonL2 then
					if var23 then
						p10:SetCurrentKeyset(var23 % #t_2 + 1)
						
						return
					end
				elseif p13.KeyCode == Enum.KeyCode.ButtonL3 then
					p10:SetCaps(not p10:GetCaps())
					
					return
				elseif p13.KeyCode == Enum.KeyCode.ButtonB then
					p10:Close(false)
				end
			end
		end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL2, Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonB)
		p10.Parent = keyboard:GetGUI()
		keyboard:SetType(panel3D.Type.Fixed, { CFrame = cFrame })
		keyboard:SetCanFade(false)
		keyboard:SetVisible(true, true)
		keyboard:ForceShowUntilLookedAt()
		
		function keyboard.OnUpdate(_) end
		
		bindableEvent:Fire()
	end)
	rawset(var16, "Close", function(p10, p11)
		-- upvalues: var21 (write), var25 (write), var26 (write), var27 (write), contextActionService (copy), keyboard (ref), var5 (ref), panel3D (ref), bindableEvent_1 (ref)
		p11 = p11 == true
		
		if not var21 then return end
		var21 = false
		
		if var25 then
			var25:disconnect()
		end
		var25 = nil
		
		if var26 then
			var26:disconnect()
		end
		var26 = nil
		
		if var27 then
			var27:disconnect()
		end
		var27 = nil
		contextActionService:UnbindCoreAction("VirtualKeyboardControllerInput")
		keyboard:OnMouseLeave()
		keyboard:SetVisible(false, true)
		var5.Visible = false
		panel3D.Get("Topbar3D"):SetVisible(true)
		p10:SubmitText(p11, false)
		bindableEvent_1:Fire()
	end)
	rawset(var16, "SubmitText", function(_, p10, p11)
		-- upvalues: var17 (write), var22 (write), panel3D (ref), keyboard (ref), var24 (write)
		local textBox = var17 and var17.TextBox
		
		if textBox then
			if p10 then
				textBox.Text = if var17 and var17.TextBox then var17.TextBox.Text else var22
			end
			local var28 = panel3D.FindContainerOf(textBox)
			local var29 = p11 and (var28 and var28.linkedTo == keyboard)
			
			if var29 then
				var24 = true
			end
			textBox:ReleaseFocus(p10)
			
			if var29 then
				textBox:CaptureFocus()
				var24 = false
			end
		end
	end)
	rawset(var16, "GetCurrentOptions", function(_)
		-- upvalues: var17 (write)
		return var17
	end)
	rawset(var16, "BackspaceAtCursor", function(_)
		-- upvalues: var20 (write), var17 (write), var22 (write), var6 (ref), SetTextFieldCursorPosition (ref)
		if var20 >= 1 then
			local var28 = if var17 and var17.TextBox then var17.TextBox.Text else var22
			local text = string.sub(var28, 1, var20 - 1) .. string.sub(var28, var20 + 1, #var28)
			local var29 = var20 - 1
			
			if var17 and var17.TextBox then
				var17.TextBox.Text = text
			elseif var22 ~= text then
				var22 = text
				var6:SetTextFromInput(var22)
				SetTextFieldCursorPosition(var20)
			end
			SetTextFieldCursorPosition(var29)
		end
	end)
	rawset(var16, "SubmitCharacter", function(p10, p11, p12)
		-- upvalues: var17 (write), var22 (write), var20 (write), var6 (ref), SetTextFieldCursorPosition (ref)
		local var28 = if var17 and var17.TextBox then var17.TextBox.Text else var22
		local text = string.sub(var28, 1, var20) .. p50 .. string.sub(var28, var20 + 1, #var28)
		
		if var17 and var17.TextBox then
			var17.TextBox.Text = text
		elseif var22 ~= text then
			var22 = text
			var6:SetTextFromInput(var22)
			SetTextFieldCursorPosition(var20)
		end
		SetTextFieldCursorPosition(var20 + #p11)
		
		if p12 and p10:GetShift() then
			p10:SetShift(false)
		end
	end)
	
	for i, v in pairs(p3) do
		local t_4 = {}
		local var28 = create("Frame")({
			Name = "KeyboardSizeConstrainer",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -20),
			Position = UDim2.new(0, 0, 0, 20),
			Parent = var5
		})
		local var29 = 0
		local var30 = 0
		local var31 = 0
		
		for i_1, v_1 in pairs(v) do
			local var32 = 0
			local var33 = 1
			local var34 = 1
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
							x = var32,
							y = var31,
							width = var33,
							height = var34,
							x2 = x2,
							y2 = y2,
							width2 = w2,
							height2 = h2
						}
						local t_6 = {}
						
						for i_4 in string.gmatch(v_3, "([^\n]+)") do
							table.insert(t_6, i_4)
						end
						table.insert(t_4, CreateKeyboardKey(var16, t_5, t_6))
						var32 += var33
						var29 = math.max(var29, var32)
						var30 = math.max(var30, var31 + var34)
						var33 = 1
						var34 = 1
						w2 = nil
						h2 = nil
						x2 = nil
						y2 = nil
					end
				end
				if v_3.w then
					var33 = v_3.w
				end
				if v_3.h then
					var34 = v_3.h
				end
				if v_3.x then
					var32 += v_3.x
				end
				if v_3.y then
					var31 += v_3.y
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
			var31 += 1
		end
		for i_1, v_1 in pairs(t_4) do
			v_1.Position = UDim2.new(v_1.Position.X.Scale / var29, 0, v_1.Position.Y.Scale / var30, 0)
			v_1.Size = UDim2.new(v_1.Size.X.Scale / var29, 0, v_1.Size.Y.Scale / var30, 0)
			v_1.Parent = var28
		end
		var28.SizeConstraint = Enum.SizeConstraint.RelativeXX
		var28.Size = UDim2.new(1, 0, -var30 / var29, 0)
		var28.Position = UDim2.new(0, 0, 1, 0)
		var28.Visible = false
		table.insert(t_2, { keys = t_4, container = var28 })
	end
	var16:SetCurrentKeyset(1)
	var6.MouseButton1Click:connect(function()
		-- upvalues: SetTextFieldCursorPosition (ref), calculateTextCursorPosition (ref), keyboard (ref)
		SetTextFieldCursorPosition(calculateTextCursorPosition(keyboard.lookAtPixel.X, keyboard.lookAtPixel.Y))
	end)
	var9.MouseButton1Click:connect(function()
		-- upvalues: var16 (ref)
		var16:Close(false)
	end)
	var12.MouseButton1Click:connect(function()
		-- upvalues: t_3 (copy), CreateBaseVoiceState (copy), soundService (copy)
		if t_3:GetCurrentState().Name == "Listening" then
			local var35 = t_3
			local processing = CreateBaseVoiceState()
			processing.Name = "Processing"
			local var36 = false
			local var37 = nil
			
			function processing.TransitionTo(_)
				-- upvalues: var37 (write), soundService (copy), var36 (write)
				coroutine.wrap(function()
					-- upvalues: var37 (copy), soundService (copy), var36 (copy)
					pcall(function()
						-- upvalues: var37 (copy), soundService (copy)
						var4 = soundService:EndRecording()
					end)
					var3 = true
				end)()
			end
			
			function processing.GetResultAsync(_)
				-- upvalues: var36 (write), var37 (write)
				while true do
					while not var36 do
						wait()
					end
					return var37
				end
			end
			
			var35:TransitionState(processing)
		end
	end)
	
	local function onVoiceProcessingStateChanged(p10)
		-- upvalues: var13 (ref), var14 (ref), t (copy), var17 (write), var22 (write), var6 (ref), SetTextFieldCursorPosition (ref), var20 (write), t_3 (copy), CreateBaseVoiceState (copy), var16 (ref)
		if p10.Name == "Listening" then
			var13.Text = "Listening..."
		elseif p10.Name == "Processing" then
			var13.Text = "Processing..."
		elseif p10.Name == "Waiting" then
			var13.Text = "Done"
		end
		if p10.Name == "Processing" then
			coroutine.wrap(function()
				-- upvalues: var14 (copy), p10 (ref), t (copy), var17 (copy), var22 (copy), var6 (copy), SetTextFieldCursorPosition (copy), var20 (copy), var13 (copy), t_3 (copy), CreateBaseVoiceState (copy)
				var14:StopAnimation()
				local resultAsync = p10:GetResultAsync()
				
				if resultAsync and resultAsync.Status == t.ASR_STATUS_OK then
					local response = resultAsync.Response
					
					if var17 and var17.TextBox then
						var17.TextBox.Text = response
					elseif var22 ~= response then
						var22 = response
						var6:SetTextFromInput(var22)
						SetTextFieldCursorPosition(var20)
					end
				else
					var13.Text = "An error occurred, please try again."
					wait(2)
				end
				local waiting = CreateBaseVoiceState()
				waiting.Name = "Waiting"
				t_3:TransitionState(waiting)
			end)()
			
			return
		elseif p10.Name == "Listening" then
			var14:StartAnimation()
			
			return
		elseif p10.Name == "Waiting" then
			var16:SetVoiceMode(false)
		end
	end
	
	t_3.StateTransitionedEvent:connect(onVoiceProcessingStateChanged)
	onVoiceProcessingStateChanged(t_3:GetCurrentState())
	
	return var16
end

local var38 = nil

local _ = function()
	-- upvalues: var38 (write), ConstructKeyboardUI (ref), var1 (ref), var2 (ref)
	if var38 == nil then
		var38 = ConstructKeyboardUI({ var1, var2 })
	end
	return var38
end

local t_4 = {
	CreateVirtualKeyboardOptions = function(_, p10)
		return { TextBox = p10 }
	end,
	ShowVirtualKeyboard = function(_, _) end,
	CloseVirtualKeyboard = function(_) end
}

if var38 == nil then
	var38 = ConstructKeyboardUI({ var1, var2 })
end
t_4.OpenedEvent = var38.OpenedEvent

if var38 == nil then
	var38 = ConstructKeyboardUI({ var1, var2 })
end
t_4.ClosedEvent = var38.ClosedEvent

return t_4