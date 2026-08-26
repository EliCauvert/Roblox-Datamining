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

local function getKeyCodeName(p1)
	local name = p1.Name
	
	if name ~= "" then
		return name
	end
	local var1 = tostring(p1):match("^Enum%.KeyCode%.(.+)$")
	
	return var1 or tostring(p1)
end

local function _(p1)
	-- upvalues: t (ref)
	return if t[p1] then true else p1:match("^World%d+$") ~= nil
end

local _ = function(p1)
	return if p1:match("^Button") == nil then if p1:match("^DPad") == nil then p1:match("^Thumbstick") ~= nil else true else true
end

local function getCategory(p1)
	-- upvalues: t (ref), t_1 (ref), t_2 (ref), t_4 (ref), t_5 (ref), t_3 (ref), t_6 (ref)
	local var1
	local name = p1.Name
	
	if name == "" then
		local var2 = tostring(p1):match("^Enum%.KeyCode%.(.+)$")
		var1 = var2 or tostring(p1)
	else
		var1 = name
	end
	return if if t[var1] then true else var1:match("^World%d+$") ~= nil then "Deprecated" elseif if var1:match("^Button") == nil then if var1:match("^DPad") == nil then var1:match("^Thumbstick") ~= nil else true else true then "Gamepad" elseif t_1[var1] then "Mouse and touch" elseif var1:match("^Keypad") then "Keypad" elseif var1:match("^[A-Z]$") then "Letters" elseif t_2[var1] then "Numbers" elseif var1:match("^F%d+$") then "Function keys" elseif t_4[var1] then "Arrows" elseif t_5[var1] then "Navigation" elseif t_3[var1] then "Modifiers" elseif t_6[var1] then "Punctuation" else "Other"
end

local function sortInCategory(p1, p2)
	-- upvalues: list_1 (ref)
	if p1 == "Numbers" then
		table.sort(p2, function(p3, p4)
			-- upvalues: list_1 (copy)
			return (table.find(list_1, p3) or 0) < (table.find(list_1, p4) or 0)
		end)
		
		return
	elseif p1 == "Function keys" then
		table.sort(p2, function(p3, p4)
			local var1
			local name = p3.Name
			
			if name == "" then
				local var2 = tostring(p3):match("^Enum%.KeyCode%.(.+)$")
				var1 = var2 or tostring(p3)
			else
				var1 = name
			end
			local var3
			local var4 = tonumber(var1:match("^F(%d+)$")) or 0
			local name_1 = p4.Name
			
			if name_1 == "" then
				local var5 = tostring(p4):match("^Enum%.KeyCode%.(.+)$")
				var3 = var5 or tostring(p4)
			else
				var3 = name_1
			end
			return var4 < (tonumber(var3:match("^F(%d+)$")) or 0)
		end)
		
		return
	elseif p1 == "Deprecated" then
		table.sort(p2, function(p3, p4)
			local var1
			local name = p3.Name
			
			if name == "" then
				local var2 = tostring(p3):match("^Enum%.KeyCode%.(.+)$")
				var1 = var2 or tostring(p3)
			else
				var1 = name
			end
			local var3
			local name_1 = p4.Name
			
			if name_1 == "" then
				local var4 = tostring(p4):match("^Enum%.KeyCode%.(.+)$")
				var3 = var4 or tostring(p4)
			else
				var3 = name_1
			end
			local var5 = tonumber(var1:match("^World(%d+)$"))
			local var6 = tonumber(var3:match("^World(%d+)$"))
			
			return if var5 and var6 then var5 < var6 elseif var5 then true elseif var6 then false else var1 < var3
		end)
		
		return
	end
	table.sort(p2, function(p3, p4)
		local var1
		local name = p3.Name
		
		if name == "" then
			local var2 = tostring(p3):match("^Enum%.KeyCode%.(.+)$")
			var1 = var2 or tostring(p3)
		else
			var1 = name
		end
		local var3
		local name_1 = p4.Name
		
		if name_1 == "" then
			local var4 = tostring(p4):match("^Enum%.KeyCode%.(.+)$")
			var3 = var4 or tostring(p4)
		else
			var3 = name_1
		end
		return var1 < var3
	end)
end

return {
	CATEGORY_ORDER = list,
	getKeyCodeName = getKeyCodeName,
	getCategory = getCategory,
	groupByCategory = function(p1)
		-- upvalues: list (ref), getCategory (ref), sortInCategory (ref)
		local t = {}
		
		for i = 1, #list do
			t[list[i]] = {}
		end
		for i_1, v in p1 do
			table.insert(t[getCategory(v)], v)
		end
		for i_2 = 1, #list do
			local var1 = list[i_2]
			sortInCategory(var1, t[var1])
		end
		return t
	end,
	getNonEmptyCategories = function(p2)
		-- upvalues: list (ref)
		local t = {}
		
		for i = 1, #list do
			local var2 = list[i]
			
			if #p2[var2] > 0 then
				table.insert(t, var2)
			end
		end
		return t
	end,
	sortInCategory = sortInCategory
}