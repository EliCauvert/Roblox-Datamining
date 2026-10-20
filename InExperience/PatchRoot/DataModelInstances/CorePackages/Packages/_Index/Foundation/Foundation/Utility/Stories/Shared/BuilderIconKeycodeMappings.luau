local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local DashModule = require(Parent.Dash)
local _ = require(Foundation.Enums.InputPlatform)

local function _(p1)
	-- upvalues: BuilderIconsModule (copy)
	local IconEntry = BuilderIconsModule.Icon[p1]
	
	return if typeof(IconEntry) == "string" and IconEntry ~= "" then IconEntry else nil
end

local function forEachBuilderIcon(Callback: (any, any) -> ())
	-- upvalues: BuilderIconsModule (copy)
	for i, value in BuilderIconsModule.Icon do
		if typeof(i) == "string" and typeof(value) == "string" then
			Callback(i, value)
		end
	end
end

local function buildResolvedMappings(PS)
	-- upvalues: BuilderIconsModule (copy)
	local t = {}
	
	for i, p in PS do
		local IconEntry = BuilderIconsModule.Icon[p]
		local IconEntry1 = if typeof(IconEntry) == "string" and IconEntry ~= "" then IconEntry else nil
		
		if IconEntry1 then
			t[i] = IconEntry1
		end
	end
	return t
end

local config = {
	ButtonA = "PsX",
	ButtonB = "PsCircle",
	ButtonX = "PsSquare",
	ButtonY = "PsTriagle",
	ButtonL1 = "PsL1",
	ButtonL2 = "PsL2",
	ButtonL3 = "PsL3",
	ButtonR1 = "PsR1",
	ButtonR2 = "PsR2",
	ButtonR3 = "PsR3",
	Thumbstick1 = "PsStickLeft",
	Thumbstick2 = "PsStickRight",
	DPadDown = "PsDpadDown",
	DPadUp = "PsDpadUp",
	DPadLeft = "PsDpadLeft",
	DPadRight = "PsDpadRight"
}
local config1 = {
	PS4 = DashModule.join(config, { ButtonStart = "Ps4Options", ButtonSelect = "Ps4Share" }),
	PS5 = DashModule.join(config, { ButtonStart = "Ps5Options", ButtonSelect = "Ps5Share" }),
	Xbox = {
		ButtonA = "XboxA",
		ButtonB = "XboxB",
		ButtonX = "XboxX",
		ButtonY = "XboxY",
		ButtonL1 = "XboxLb",
		ButtonL2 = "XboxLt",
		ButtonL3 = "XboxStickLeft",
		ButtonR1 = "XboxRb",
		ButtonR2 = "XboxRt",
		ButtonR3 = "XboxStickRight",
		ButtonStart = "XboxMenu",
		ButtonSelect = "XboxView",
		Thumbstick1 = "XboxStickLeftDirectional",
		Thumbstick2 = "XboxStickRightDirectional",
		DPadDown = "XboxDpadDown",
		DPadUp = "XboxDpadUp",
		DPadLeft = "XboxDpadLeft",
		DPadRight = "XboxDpadRight"
	},
	Default = {
		LeftAlt = "KeyAlt",
		RightAlt = "KeyAlt",
		Down = "KeyArrowDown",
		Up = "KeyArrowUp",
		Left = "KeyArrowLeft",
		Right = "KeyArrowRight",
		Asterisk = "KeyAsterisk",
		Backspace = "KeyBackspace",
		CapsLock = "KeyCapsLock",
		Caret = "KeyCaret",
		Comma = "KeyComma",
		LeftControl = "KeyControl",
		RightControl = "KeyControl",
		Backquote = "KeyGraveAccent",
		Period = "KeyPeriod",
		Return = "KeyReturn",
		LeftShift = "KeyShift",
		RightShift = "KeyShift",
		Space = "KeySpace",
		Tab = "KeyTab"
	}
}
local config2 = {
	PS4 = buildResolvedMappings(config1.PS4),
	PS5 = buildResolvedMappings(config1.PS5),
	Xbox = buildResolvedMappings(config1.Xbox),
	Default = buildResolvedMappings(config1.Default)
}
local list = { "PS4", "PS5", "Xbox" }
local list1 = { "PS4", "PS5", "Xbox", "Default" }
local config21 = {
	Alt = "LeftAlt",
	Apostrophe = "Quote",
	ArrowDown = "Down",
	ArrowUp = "Up",
	ArrowLeft = "Left",
	ArrowRight = "Right",
	Asterisk = "Asterisk",
	Backspace = "Backspace",
	CapsLock = "CapsLock",
	Caret = "Caret",
	Comma = "Comma",
	Control = "LeftControl",
	GraveAccent = "Backquote",
	Period = "Period",
	Return = "Return",
	Shift = "LeftShift",
	Space = "Space",
	Tab = "Tab"
}
local config3 = {
	PsX = { "ButtonA" },
	PsCircle = { "ButtonB" },
	PsSquare = { "ButtonX" },
	PsTriagle = { "ButtonY" },
	PsL1 = { "ButtonL1" },
	PsL2 = { "ButtonL2" },
	PsL3 = { "ButtonL3" },
	PsR1 = { "ButtonR1" },
	PsR2 = { "ButtonR2" },
	PsR3 = { "ButtonR3" },
	PsStickLeft = { "Thumbstick1" },
	PsStickRight = { "Thumbstick2" },
	PsDpadDown = { "DPadDown" },
	PsDpadUp = { "DPadUp" },
	PsDpadLeft = { "DPadLeft" },
	PsDpadRight = { "DPadRight" },
	PsDpad = { "DPadDown", "DPadUp", "DPadLeft", "DPadRight" },
	Ps4Options = { "ButtonStart" },
	Ps4Share = { "ButtonSelect" },
	Ps5Options = { "ButtonStart" },
	Ps5Share = { "ButtonSelect" },
	XboxA = { "ButtonA" },
	XboxAPressed = { "ButtonA" },
	XboxAUnpressed = { "ButtonA" },
	XboxB = { "ButtonB" },
	XboxX = { "ButtonX" },
	XboxY = { "ButtonY" },
	XboxLb = { "ButtonL1" },
	XboxLt = { "ButtonL2" },
	XboxRb = { "ButtonR1" },
	XboxRt = { "ButtonR2" },
	XboxMenu = { "ButtonStart" },
	XboxView = { "ButtonSelect" },
	XboxStickLeft = { "ButtonL3", "Thumbstick1" },
	XboxStickLeftDirectional = { "Thumbstick1" },
	XboxStickLeftHorizontal = { "Thumbstick1" },
	XboxStickLeftVertical = { "Thumbstick1" },
	XboxStickRight = { "ButtonR3", "Thumbstick2" },
	XboxStickRightDirectional = { "Thumbstick2" },
	XboxStickRightHorizontal = { "Thumbstick2" },
	XboxStickRightVertical = { "Thumbstick2" },
	XboxDpadDown = { "DPadDown" },
	XboxDpadUp = { "DPadUp" },
	XboxDpadLeft = { "DPadLeft" },
	XboxDpadRight = { "DPadRight" },
	XboxDpad = { "DPadDown", "DPadUp", "DPadLeft", "DPadRight" },
	MouseButtonLeft = { "MouseLeftButton" },
	MouseButtonRight = { "MouseRightButton" },
	MouseScrollwheel = { "MouseWheel" }
}

local function isKeycodeRelatedIconKey(p1): boolean
	return p1:match("^Key") ~= nil or (p1:match("^Ps") ~= nil or (p1:match("^Xbox") ~= nil or p1:match("^Mouse") ~= nil)) or (p1 == "GenericDpad" or (p1 == "Controller" or (p1 == "ControllerWithCog" or (p1 == "Keyboard" or (p1 == "Playstation" or p1 == "PlaystationCircle")))))
end

local function getKeycodeNamesForIconKey(Name)
	-- upvalues: config3 (copy), config21 (copy)
	if config3[Name] then
		return config3[Name]
	end
	local Key = Name:match("^Key(.+)$")
	
	if Key then
		local Entry = config21[Key]
		
		if Entry then
			return { Entry }
		end
	end
	return {}
end

local function addIconToKeycode(p1, Key, Value)
	if Value == nil or Value == "" then return end
	if p1[Key] == nil then
		p1[Key] = {}
	end
	if not table.find(p1[Key], Value) then
		table.insert(p1[Key], Value)
	end
end

local v1 = (function()
	-- upvalues: list1 (copy), config2 (copy), addIconToKeycode (copy), forEachBuilderIcon (copy), isKeycodeRelatedIconKey (copy), getKeycodeNamesForIconKey (copy)
	local t = {}
	
	for _, value in list1 do
		for i, value1 in config2[value] do
			addIconToKeycode(t, i, value1)
		end
	end
	forEachBuilderIcon(function(p1, p2)
		-- upvalues: isKeycodeRelatedIconKey (upval), getKeycodeNamesForIconKey (upval), addIconToKeycode (upval), t (copy)
		if isKeycodeRelatedIconKey(p1) then
			for _, value in getKeycodeNamesForIconKey(p1) do
				addIconToKeycode(t, value, p2)
			end
		end
	end)
	
	for _, value2 in t do
		table.sort(value2)
	end
	return t
end)()
local List = {}
local t = {}
local t1 = {}

for _, value in v1 do
	for _, value1 in value do
		t1[value1] = true
	end
end
forEachBuilderIcon(function(p3, Key)
	-- upvalues: isKeycodeRelatedIconKey (copy), t (copy), List (copy)
	if isKeycodeRelatedIconKey(p3) and Key ~= "" and not t[Key] then
		t[Key] = true
		table.insert(List, Key)
	end
end)
table.sort(List, function(A, B): boolean
	return A < B
end)
local List1 = {}
forEachBuilderIcon(function(p3, Value)
	-- upvalues: isKeycodeRelatedIconKey (copy), t1 (copy), List1 (copy)
	if isKeycodeRelatedIconKey(p3) and Value ~= "" and not t1[Value] and not table.find(List1, Value) then
		table.insert(List1, Value)
	end
end)
table.sort(List1)
local t2 = {}
forEachBuilderIcon(function(p3, Key)
	-- upvalues: t2 (copy)
	if Key ~= "" then
		t2[Key] = p3
	end
end)

for _, value2 in v1 do
	table.sort(value2, function(A, B): boolean
		-- upvalues: t2 (copy)
		return (t2[A] or A) < (t2[B] or B)
	end)
end
local t3 = {}
local t4 = {}

for _, value3 in list1 do
	for i, value4 in config1[value3] do
		t4[i] = value4
		local IconEntry = BuilderIconsModule.Icon[value4]
		
		if (if typeof(IconEntry) == "string" and IconEntry ~= "" then IconEntry else nil) == nil then
			t3[i] = true
		end
	end
end
local _ = function(p3)
	-- upvalues: t4 (copy)
	return t4[p3]
end

local _ = function(p3)
	-- upvalues: t2 (copy)
	return t2[p3] or p3
end

local _ = function(p3): boolean
	-- upvalues: getKeycodeNamesForIconKey (copy), t3 (copy)
	local KeycodeNamesForIconKey = getKeycodeNamesForIconKey(p3)
	
	return #KeycodeNamesForIconKey == 1 and t3[KeycodeNamesForIconKey[1]] == true
end

return {
	GAMEPAD_PLATFORM_ORDER = list,
	INPUT_PLATFORM_ORDER = list1,
	getAllIconNamesForKeyCode = function(p3)
		-- upvalues: v1 (copy), t2 (copy)
		local List = {}
		local v2 = v1[p3.Name] or {}
		for _, value in v2 do
			table.insert(List, t2[value] or value)
		end
		return List
	end,
	getAllIconsWithNamesForKeyCode = function(p4)
		-- upvalues: v1 (copy), t2 (copy)
		local List = {}
		local Icons = v1[p4.Name] or {}
		for _, icon in Icons do
			table.insert(List, { icon = icon, name = t2[icon] or icon })
		end
		return List
	end,
	getAllIconsForKeyCode = function(p5)
		-- upvalues: v1 (copy)
		return v1[p5.Name] or {}
	end,
	getAllIconsForKeyName = function(p5)
		-- upvalues: v1 (copy)
		return v1[p5] or {}
	end,
	getAllKeycodeIconAssets = function()
		-- upvalues: List (copy)
		return List
	end,
	getBrokenKeycodeMappingNote = function(p5): string?
		-- upvalues: t3 (copy), t4 (copy)
		if t3[p5] == true then
			local Entry = t4[p5]
			
			return if Entry then `KeycodeMappings references {Entry}, but the icon asset is missing from BuilderIcons.` else "KeycodeMappings declares this KeyCode, but the icon asset resolves to nil."
		else
			return nil
		end
	end,
	getIconForKeyCode = function(p5, p6)
		-- upvalues: config2 (copy)
		return config2[p6][p5.Name]
	end,
	getIconForKeyName = function(p5, p6)
		-- upvalues: config2 (copy)
		return config2[p6][p5]
	end,
	getInputPlatformColumnHeaders = function()
		-- upvalues: list1 (copy)
		local List = {}
		
		for i = 1, #list1 do
			table.insert(List, list1[i])
		end
		return List
	end,
	getMappedKeyNames = function()
		-- upvalues: list1 (copy), config2 (copy)
		local t = {}
		
		for _, value in list1 do
			for i in config2[value] do
				t[i] = true
			end
		end
		local List = {}
		
		for i1 in t do
			table.insert(List, i1)
		end
		table.sort(List)
		
		return List
	end,
	getUnmappedKeycodeIconEntries = function()
		-- upvalues: List1 (copy), t2 (copy), getKeycodeNamesForIconKey (copy), t3 (copy)
		local List = {}
		
		for _, Icon in List1 do
			local Entry = t2[Icon] or Icon
			local KeycodeNamesForIconKey = getKeycodeNamesForIconKey(Entry)
			table.insert(List, {
				icon = Icon,
				name = Entry,
				isBrokenLink = #KeycodeNamesForIconKey == 1 and t3[KeycodeNamesForIconKey[1]] == true
			})
		end
		return List
	end,
	getUnmappedKeycodeIcons = function()
		-- upvalues: List1 (copy)
		return List1
	end,
	isBrokenKeycodeMapping = function(p5): boolean
		-- upvalues: t3 (copy)
		return t3[p5] == true
	end,
	isBrokenKeycodeMappingForKeyCode = function(p5): boolean
		-- upvalues: t3 (copy)
		return t3[p5.Name] == true
	end
}