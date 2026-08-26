local parent = script:FindFirstAncestor("Foundation").Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)

local function _(value)
	-- upvalues: builderIconsModule (ref)
	local var1 = builderIconsModule.Icon[value]
	
	return if typeof(var1) == "string" and var1 ~= "" then var1 else nil
end

local function forEachBuilderIcon(p1)
	-- upvalues: builderIconsModule (ref)
	for i, v in builderIconsModule.Icon do
		if typeof(i) == "string" and typeof(v) == "string" then
			p1(i, v)
		end
	end
end

local function buildResolvedMappings(p2)
	-- upvalues: builderIconsModule (ref)
	local t = {}
	
	for i, v in p2 do
		local var1 = builderIconsModule.Icon[v]
		local var2 = if typeof(var1) == "string" and var1 ~= "" then var1 else nil
		
		if var2 then
			t[i] = var2
		end
	end
	return t
end

local t = {
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
local t_1 = {
	PS4 = dashModule.join(t, { ButtonStart = "Ps4Options", ButtonSelect = "Ps4Share" }),
	PS5 = dashModule.join(t, { ButtonStart = "Ps5Options", ButtonSelect = "Ps5Share" }),
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
local t_2 = {
	PS4 = buildResolvedMappings(t_1.PS4),
	PS5 = buildResolvedMappings(t_1.PS5),
	Xbox = buildResolvedMappings(t_1.Xbox),
	Default = buildResolvedMappings(t_1.Default)
}
local list = { "PS4", "PS5", "Xbox" }
local list_1 = { "PS4", "PS5", "Xbox", "Default" }
local t_3 = {
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
local t_4 = {
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

local function isKeycodeRelatedIconKey(p3)
	return if p3:match("^Key") == nil then if p3:match("^Ps") == nil then if p3:match("^Xbox") == nil then if p3:match("^Mouse") == nil then if p3 ~= "GenericDpad" then if p3 ~= "Controller" then if p3 ~= "ControllerWithCog" then if p3 ~= "Keyboard" then if p3 ~= "Playstation" then p3 == "PlaystationCircle" else true else true else true else true else true else true else true else true else true
end

local function getKeycodeNamesForIconKey(p3)
	-- upvalues: t_4 (ref), t_3 (ref)
	if t_4[p3] then
		return t_4[p3]
	end
	local var3 = p3:match("^Key(.+)$")
	
	if var3 then
		local var4 = t_3[var3]
		
		return if var4 then { var4 } else {}
	end
end

local function addIconToKeycode(p3, p4, p5)
	if p5 == nil or p5 == "" then return end
	if p3[p4] == nil then
		p3[p4] = {}
	end
	if not table.find(p3[p4], p5) then
		table.insert(p3[p4], p5)
	end
end

local var3 = (function()
	-- upvalues: list_1 (ref), t_2 (ref), addIconToKeycode (ref), forEachBuilderIcon (ref), isKeycodeRelatedIconKey (ref), getKeycodeNamesForIconKey (ref)
	local t = {}
	
	for i, v in list_1 do
		for i_2, v_1 in t_2[v] do
			addIconToKeycode(t, i_2, v_1)
		end
	end
	forEachBuilderIcon(function(p3, p4)
		-- upvalues: isKeycodeRelatedIconKey (copy), getKeycodeNamesForIconKey (copy), addIconToKeycode (copy), t (ref)
		if isKeycodeRelatedIconKey(p3) then
			for i, v in getKeycodeNamesForIconKey(p3) do
				addIconToKeycode(t, v, p4)
			end
		end
	end)
	
	for i, v_1 in t do
		table.sort(v_1)
	end
	return t
end)()
local t_5 = {}
local t_6 = {}
local t_7 = {}

for i, v in var3 do
	for i_1, v_1 in v do
		t_7[v_1] = true
	end
end
forEachBuilderIcon(function(p5, p6)
	-- upvalues: isKeycodeRelatedIconKey (ref), t_6 (ref), t_5 (ref)
	if isKeycodeRelatedIconKey(p5) and p6 ~= "" and not t_6[p6] then
		t_6[p6] = true
		table.insert(t_5, p6)
	end
end)
table.sort(t_5, function(p5, p6)
	return p5 < p6
end)
local t_8 = {}
forEachBuilderIcon(function(p5, p6)
	-- upvalues: isKeycodeRelatedIconKey (ref), t_7 (ref), t_8 (ref)
	if isKeycodeRelatedIconKey(p5) and p6 ~= "" and (not t_7[p6] and not table.find(t_8, p6)) then
		table.insert(t_8, p6)
	end
end)
table.sort(t_8)
local t_9 = {}
forEachBuilderIcon(function(p5, p6)
	-- upvalues: t_9 (ref)
	if p6 ~= "" then
		t_9[p6] = p5
	end
end)

for i_1, v_1 in var3 do
	table.sort(v_1, function(p5, p6)
		-- upvalues: t_9 (ref)
		return (t_9[p5] or p5) < (t_9[p6] or p6)
	end)
end
local t_10 = {}
local t_11 = {}

for i_2, v_2 in list_1 do
	for i_3, v_3 in t_1[v_2] do
		t_11[i_3] = v_3
		local var4 = builderIconsModule.Icon[v_3]
		
		if (if typeof(var4) == "string" and var4 ~= "" then var4 else nil) == nil then
			t_10[i_3] = true
		end
	end
end
local _ = function(p5)
	-- upvalues: t_11 (ref)
	return t_11[p5]
end

local function isBrokenKeycodeMapping(p5)
	-- upvalues: t_10 (ref)
	return t_10[p5] == true
end

local function isBrokenKeycodeMappingForKeyCode(p5)
	-- upvalues: t_10 (ref)
	return t_10[p5.Name] == true
end

local function getBrokenKeycodeMappingNote(p5)
	-- upvalues: t_10 (ref), t_11 (ref)
	if t_10[p5] ~= true then
		return nil
	end
	local var5 = t_11[p5]
	
	return if var5 then `KeycodeMappings references {var5}, but the icon asset is missing from BuilderIcons.` else "KeycodeMappings declares this KeyCode, but the icon asset resolves to nil."
end

local function getIconForKeyName(p5, p6)
	-- upvalues: t_2 (ref)
	return t_2[p6][p5]
end

local function getIconForKeyCode(p5, p6)
	-- upvalues: t_2 (ref)
	return t_2[p6][p5.Name]
end

local function getAllIconsForKeyCode(p5)
	-- upvalues: var3 (ref)
	return var3[p5.Name] or {}
end

local function getAllIconsForKeyName(p5)
	-- upvalues: var3 (ref)
	return var3[p5] or {}
end

local _ = function(value)
	-- upvalues: t_9 (ref)
	return t_9[value] or value
end

local _ = function(p5)
	-- upvalues: getKeycodeNamesForIconKey (ref), t_10 (ref)
	local var5 = getKeycodeNamesForIconKey(p5)
	
	return #var5 == 1 and t_10[var5[1]] == true
end

return {
	GAMEPAD_PLATFORM_ORDER = list,
	INPUT_PLATFORM_ORDER = list_1,
	getAllIconNamesForKeyCode = function(p5)
		-- upvalues: var3 (ref), t_9 (ref)
		local t = {}
		
		for i, v in var3[p5.Name] or {} do
			table.insert(t, t_9[v] or v)
		end
		return t
	end,
	getAllIconsWithNamesForKeyCode = function(p6)
		-- upvalues: var3 (ref), t_9 (ref)
		local t = {}
		
		for i, v in var3[p6.Name] or {} do
			table.insert(t, { icon = v, name = t_9[v] or v })
		end
		return t
	end,
	getAllIconsForKeyCode = getAllIconsForKeyCode,
	getAllIconsForKeyName = getAllIconsForKeyName,
	getAllKeycodeIconAssets = function()
		-- upvalues: t_5 (ref)
		return t_5
	end,
	getBrokenKeycodeMappingNote = getBrokenKeycodeMappingNote,
	getIconForKeyCode = getIconForKeyCode,
	getIconForKeyName = getIconForKeyName,
	getInputPlatformColumnHeaders = function()
		-- upvalues: list_1 (ref)
		local t = {}
		
		for i = 1, #list_1 do
			table.insert(t, list_1[i])
		end
		return t
	end,
	getMappedKeyNames = function()
		-- upvalues: list_1 (ref), t_2 (ref)
		local t = {}
		
		for i, v in list_1 do
			for i_1 in t_2[v] do
				t[i_1] = true
			end
		end
		local t_1 = {}
		
		for i_1 in t do
			table.insert(t_1, i_1)
		end
		table.sort(t_1)
		
		return t_1
	end,
	getUnmappedKeycodeIconEntries = function()
		-- upvalues: t_8 (ref), t_9 (ref), getKeycodeNamesForIconKey (ref), t_10 (ref)
		local t = {}
		
		for i, v in t_8 do
			local var5 = t_9[v] or v
			local t_1 = { icon = v, name = var5 }
			local var6 = getKeycodeNamesForIconKey(var5)
			t_1.isBrokenLink = #var6 ~= 1 and t_10[var6[1]] == true
			table.insert(t, t_1)
		end
		return t
	end,
	getUnmappedKeycodeIcons = function()
		-- upvalues: t_8 (ref)
		return t_8
	end,
	isBrokenKeycodeMapping = isBrokenKeycodeMapping,
	isBrokenKeycodeMappingForKeyCode = isBrokenKeycodeMappingForKeyCode
}