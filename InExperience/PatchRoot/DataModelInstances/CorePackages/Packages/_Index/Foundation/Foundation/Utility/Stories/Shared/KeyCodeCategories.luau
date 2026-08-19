local list = {
	"Letters", "Numbers", "Keypad", "Function keys", "Arrows", "Navigation",
	"Modifiers", "Punctuation", "Gamepad", "Mouse and touch", "Other", "Deprecated"
}
local t = {
	MouseBackButton = true,
	MouseNoButton = true,
	MouseX = true,
	MouseY = true
}
local t_1 = {
	MouseLeftButton = true,
	MouseRightButton = true,
	MouseMiddleButton = true,
	MousePosition = true,
	MouseWheel = true,
	MouseDelta = true,
	TouchPosition = true,
	TrackpadPan = true,
	TrackpadPinch = true
}
local t_2 = {
	Zero = true,
	One = true,
	Two = true,
	Three = true,
	Four = true,
	Five = true,
	Six = true,
	Seven = true,
	Eight = true,
	Nine = true
}
local list_1 = {
	Enum.KeyCode.Zero, Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three,
	Enum.KeyCode.Four, Enum.KeyCode.Five, Enum.KeyCode.Six, Enum.KeyCode.Seven,
	Enum.KeyCode.Eight, Enum.KeyCode.Nine
}
local t_3 = {
	LeftShift = true,
	RightShift = true,
	LeftControl = true,
	RightControl = true,
	LeftAlt = true,
	RightAlt = true,
	CapsLock = true
}
local t_4 = { Up = true, Down = true, Left = true, Right = true }
local t_5 = {
	Insert = true,
	Home = true,
	End = true,
	PageUp = true,
	PageDown = true
}
local t_6 = {
	Comma = true,
	Period = true,
	Slash = true,
	BackSlash = true,
	Semicolon = true,
	Quote = true,
	Backquote = true,
	Equals = true,
	Minus = true,
	LeftBracket = true,
	RightBracket = true
}

local function getKeyCodeName(p0) --[[ line: 127 ]]
	local name = p0.Name
	
	if name ~= "" then
		return name
	end
	local var12 = tostring(p0):match("^Enum%.KeyCode%.(.+)$")
	
	return var12 or tostring(p0)
end

local function _(p1) --[[ line: 141 | named "isDeprecatedKeyCode" ]]
	-- upvalues: t (ref)
	return if t[p1] then true else p1:match("^World%d+$") ~= nil
end

local _ = function(p2) --[[ line: 148 | named "isGamepadKeyCode" ]]
	return if p2:match("^Button") == nil then if p2:match("^DPad") == nil then p2:match("^Thumbstick") ~= nil else true else true
end

local function getCategory(p3) --[[ line: 152 ]]
	-- upvalues: t (ref), t_1 (ref), t_2 (ref), t_4 (ref), t_5 (ref), t_3 (ref), t_6 (ref)
	local var13
	local name = p3.Name
	
	if name == "" then
		local var14 = tostring(p3):match("^Enum%.KeyCode%.(.+)$")
		var13 = var14 or tostring(p3)
	else
		var13 = name
	end
	return if if t[var13] then true else var13:match("^World%d+$") ~= nil then "Deprecated" elseif if var13:match("^Button") == nil then if var13:match("^DPad") == nil then var13:match("^Thumbstick") ~= nil else true else true then "Gamepad" elseif t_1[var13] then "Mouse and touch" elseif var13:match("^Keypad") then "Keypad" elseif var13:match("^[A-Z]$") then "Letters" elseif t_2[var13] then "Numbers" elseif var13:match("^F%d+$") then "Function keys" elseif t_4[var13] then "Arrows" elseif t_5[var13] then "Navigation" elseif t_3[var13] then "Modifiers" elseif t_6[var13] then "Punctuation" else "Other"
end

local function sortInCategory(p4, p5) --[[ line: 191 ]]
	-- upvalues: list_1 (ref)
	if p4 == "Numbers" then
		table.sort(p5, function(p6, p7) --[[ line: 193 ]]
			-- upvalues: list_1 (copy)
			return (table.find(list_1, p6) or 0) < (table.find(list_1, p7) or 0)
		end)
		
		return
	elseif p4 == "Function keys" then
		table.sort(p5, function(p8, p9) --[[ line: 199 ]]
			local var15
			local name = p8.Name
			
			if name == "" then
				local var16 = tostring(p8):match("^Enum%.KeyCode%.(.+)$")
				var15 = var16 or tostring(p8)
			else
				var15 = name
			end
			local var18
			local var17 = tonumber(var15:match("^F(%d+)$")) or 0
			local name_1 = p9.Name
			
			if name_1 == "" then
				local var19 = tostring(p9):match("^Enum%.KeyCode%.(.+)$")
				var18 = var19 or tostring(p9)
			else
				var18 = name_1
			end
			return var17 < (tonumber(var18:match("^F(%d+)$")) or 0)
		end)
		
		return
	elseif p4 == "Deprecated" then
		table.sort(p5, function(p10, p11) --[[ line: 205 ]]
			local var20
			local name = p10.Name
			
			if name == "" then
				local var21 = tostring(p10):match("^Enum%.KeyCode%.(.+)$")
				var20 = var21 or tostring(p10)
			else
				var20 = name
			end
			local var22
			local name_1 = p11.Name
			
			if name_1 == "" then
				local var23 = tostring(p11):match("^Enum%.KeyCode%.(.+)$")
				var22 = var23 or tostring(p11)
			else
				var22 = name_1
			end
			local var24 = tonumber(var20:match("^World(%d+)$"))
			local var25 = tonumber(var22:match("^World(%d+)$"))
			
			return if var24 and var25 then var24 < var25 elseif var24 then true elseif var25 then false else var20 < var22
		end)
		
		return
	end
	table.sort(p5, function(p12, p13) --[[ line: 222 ]]
		local var26
		local name = p12.Name
		
		if name == "" then
			local var27 = tostring(p12):match("^Enum%.KeyCode%.(.+)$")
			var26 = var27 or tostring(p12)
		else
			var26 = name
		end
		local var28
		local name_1 = p13.Name
		
		if name_1 == "" then
			local var29 = tostring(p13):match("^Enum%.KeyCode%.(.+)$")
			var28 = var29 or tostring(p13)
		else
			var28 = name_1
		end
		return var26 < var28
	end)
end

return {
	CATEGORY_ORDER = list,
	getKeyCodeName = getKeyCodeName,
	getCategory = getCategory,
	groupByCategory = function(p14) --[[ line: 228 ]]
		-- upvalues: list (ref), getCategory (ref), sortInCategory (ref)
		local t = {}
		
		for i = 1, #list do
			t[list[i]] = {}
		end
		for i_1, v in p14 do
			table.insert(t[getCategory(v)], v)
		end
		for i_2 = 1, #list do
			local var31 = list[i_2]
			sortInCategory(var31, t[var31])
		end
		return t
	end,
	getNonEmptyCategories = function(p15) --[[ line: 248 ]]
		-- upvalues: list (ref)
		local t = {}
		
		for i = 1, #list do
			local var33 = list[i]
			
			if #p15[var33] > 0 then
				table.insert(t, var33)
			end
		end
		return t
	end,
	sortInCategory = sortInCategory
}