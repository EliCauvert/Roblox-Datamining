local list = {
	"Letters", "Numbers", "Keypad", "Function keys", "Arrows", "Navigation",
	"Modifiers", "Punctuation", "Gamepad", "Mouse and touch", "Other", "Deprecated"
}
local config = {
	MouseBackButton = true,
	MouseNoButton = true,
	MouseX = true,
	MouseY = true
}
local config1 = {
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
local config2 = {
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
local List = {
	Enum.KeyCode.Zero, Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three,
	Enum.KeyCode.Four, Enum.KeyCode.Five, Enum.KeyCode.Six, Enum.KeyCode.Seven,
	Enum.KeyCode.Eight, Enum.KeyCode.Nine
}
local config3 = {
	LeftShift = true,
	RightShift = true,
	LeftControl = true,
	RightControl = true,
	LeftAlt = true,
	RightAlt = true,
	CapsLock = true
}
local config4 = { Up = true, Down = true, Left = true, Right = true }
local config5 = {
	Insert = true,
	Home = true,
	End = true,
	PageUp = true,
	PageDown = true
}
local config6 = {
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

local function _(p1): boolean
	-- upvalues: config (copy)
	return if config[p1] then true else p1:match("^World%d+$") ~= nil
end

local _ = function(p1): boolean
	return p1:match("^Button") ~= nil or p1:match("^DPad") ~= nil or p1:match("^Thumbstick") ~= nil
end

local function getCategory(p1): string
	-- upvalues: config (copy), config1 (copy), config2 (copy), config4 (copy), config5 (copy), config3 (copy), config6 (copy)
	local Name = p1.Name
	local Name1 = nil
	
	if Name == "" then
		local EnumKeyCode = tostring(p1):match("^Enum%.KeyCode%.(.+)$")
		Name1 = if EnumKeyCode then EnumKeyCode else tostring(p1)
	else
		Name1 = Name
	end
	if if config[Name1] then true else Name1:match("^World%d+$") ~= nil then
		return "Deprecated"
	else
		local HasButton: boolean = Name1:match("^Button") ~= nil or Name1:match("^DPad") ~= nil or Name1:match("^Thumbstick") ~= nil
		
		return if HasButton then "Gamepad" elseif config1[Name1] then "Mouse and touch" elseif Name1:match("^Keypad") then "Keypad" elseif Name1:match("^[A-Z]$") then "Letters" elseif config2[Name1] then "Numbers" elseif Name1:match("^F%d+$") then "Function keys" elseif config4[Name1] then "Arrows" elseif config5[Name1] then "Navigation" elseif config3[Name1] then "Modifiers" elseif config6[Name1] then "Punctuation" else "Other"
	end
end

local function sortInCategory(p1, List1)
	-- upvalues: List (copy)
	if p1 == "Numbers" then
		table.sort(List1, function(Value, Value1): boolean
			-- upvalues: List (upval)
			return (table.find(List, Value) or 0) < (table.find(List, Value1) or 0)
		end)
		
		return
	end
	if p1 == "Function keys" then
		table.sort(List1, function(A, B): boolean
			local Name = A.Name
			local Name1 = nil
			
			if Name == "" then
				local EnumKeyCode = tostring(A):match("^Enum%.KeyCode%.(.+)$")
				Name1 = if EnumKeyCode then EnumKeyCode else tostring(A)
			else
				Name1 = Name
			end
			local Number: number = tonumber((Name1:match("^F(%d+)$"))) or 0
			local Name2 = B.Name
			local Name21 = nil
			
			if Name2 == "" then
				local EnumKeyCode = tostring(B):match("^Enum%.KeyCode%.(.+)$")
				Name21 = if EnumKeyCode then EnumKeyCode else tostring(B)
			else
				Name21 = Name2
			end
			return Number < (tonumber((Name21:match("^F(%d+)$"))) or 0)
		end)
		
		return
	end
	if p1 == "Deprecated" then
		table.sort(List1, function(A, B): boolean
			local Name = A.Name
			local Name1 = nil
			
			if Name == "" then
				local EnumKeyCode = tostring(A):match("^Enum%.KeyCode%.(.+)$")
				Name1 = if EnumKeyCode then EnumKeyCode else tostring(A)
			else
				Name1 = Name
			end
			local Name2 = B.Name
			local Name21 = nil
			
			if Name2 == "" then
				local EnumKeyCode = tostring(B):match("^Enum%.KeyCode%.(.+)$")
				Name21 = if EnumKeyCode then EnumKeyCode else tostring(B)
			else
				Name21 = Name2
			end
			local Number: number? = tonumber(Name1:match("^World(%d+)$"))
			local Number1: number? = tonumber(Name21:match("^World(%d+)$"))
			
			return if Number and Number1 then Number < Number1 elseif Number then true else not Number1 and Name1 < Name21
		end)
		
		return
	else
		table.sort(List1, function(A, B): boolean
			local Name = A.Name
			local Name1 = nil
			
			if Name == "" then
				local EnumKeyCode = tostring(A):match("^Enum%.KeyCode%.(.+)$")
				Name1 = if EnumKeyCode then EnumKeyCode else tostring(A)
			else
				Name1 = Name
			end
			local Name2 = B.Name
			local Name21 = nil
			
			if Name2 == "" then
				local EnumKeyCode = tostring(B):match("^Enum%.KeyCode%.(.+)$")
				Name21 = if EnumKeyCode then EnumKeyCode else tostring(B)
			else
				Name21 = Name2
			end
			return Name1 < Name21
		end)
	end
end

return {
	CATEGORY_ORDER = list,
	getKeyCodeName = function(p1)
		local Name = p1.Name
		
		if Name == "" then
			local EnumKeyCode = tostring(p1):match("^Enum%.KeyCode%.(.+)$")
			
			return if EnumKeyCode then EnumKeyCode else tostring(p1)
		else
			return Name
		end
	end,
	getCategory = getCategory,
	groupByCategory = function(List)
		-- upvalues: list (copy), getCategory (copy), sortInCategory (copy)
		local t = {}
		
		for i = 1, #list do
			t[list[i]] = {}
		end
		for _, value in List do
			table.insert(t[getCategory(value)], value)
		end
		for i1 = 1, #list do
			local Entry = list[i1]
			sortInCategory(Entry, t[Entry])
		end
		return t
	end,
	getNonEmptyCategories = function(p1)
		-- upvalues: list (copy)
		local List = {}
		
		for i = 1, #list do
			local Entry = list[i]
			
			if #p1[Entry] > 0 then
				table.insert(List, Entry)
			end
		end
		return List
	end,
	sortInCategory = sortInCategory
}