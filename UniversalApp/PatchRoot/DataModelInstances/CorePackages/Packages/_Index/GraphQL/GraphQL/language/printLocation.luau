local parent = script.Parent
local luauPolyfillModule = require(parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String
local getLocation = require(parent.location).getLocation
local whitespace = nil
local leftPad = nil
local printSourceLocation = nil
local printPrefixedLines = nil

local function printLocation(p1)
	-- upvalues: printSourceLocation (write), getLocation (ref)
	return printSourceLocation(p1.source, getLocation(p1.source, p1.start))
end

printSourceLocation = function(p1, p2)
	-- upvalues: whitespace (write), string (ref), printPrefixedLines (write), array (ref)
	local var1 = p1.locationOffset.column - 1
	local text = whitespace(var1) .. p1.body
	local var2 = p2.line - 1 + 1
	local var3 = p2.line + (p1.locationOffset.line - 1)
	local var4 = p2.column + (if p2.line == 1 then var1 else 0)
	local text_1 = p1.name .. ":" .. var9 .. ":" .. var10 .. "\n"
	local var5 = string.split(text, { "\r\n", "\n", "\r" })
	local var6 = var5[var2]
	
	if string.len(var6) <= 120 then
		return text_1 .. printPrefixedLines({
			{ var3 - 1, var5[var2 - 1] },
			{ var3, var6 },
			{ "", whitespace(var4 - 1) .. "^" },
			{ var3 + 1, var5[var2 + 1] }
		})
	end
	local var7 = math.floor(var4 / 80) + 1
	local var8 = var4 % 80
	local t = {}
	
	for i = 1, string.len(var6), 80 do
		table.insert(t, string.slice(var6, i, i + 80))
	end
	return text_1 .. printPrefixedLines(array.concat({ { tostring(var3), t[1] } }, array.map(array.slice(t, 2, var7 + 1), function(p3)
		return { "", p3 }
	end), { { " ", whitespace(var8 - 1) .. "^" } }, { { "", t[var7 + 1] } }))
end

printPrefixedLines = function(p3)
	-- upvalues: array (ref), leftPad (write)
	local var9 = array.filter(p3, function(p4)
		return p4[2] ~= nil
	end)
	local maxValue = math.max(table.unpack(array.map(var9, function(p4)
		return string.len(p4[1])
	end)))
	
	return array.join(array.map(var9, function(p4)
		-- upvalues: leftPad (copy), maxValue (ref)
		local var10
		local var11 = p4[2]
		local var12 = leftPad(maxValue, p4[1])
		
		if var11 and var11 ~= "" then
			var10 = " | " .. var19 or " |"
		end
		return var12 .. var21
	end), "\n")
end

whitespace = function(p3)
	return string.rep(" ", p3)
end

leftPad = function(p3, p4)
	-- upvalues: whitespace (write)
	return whitespace(p3 - string.len(p4)) .. p10
end

return {
	printSourceLocation = printSourceLocation,
	printLocation = printLocation
}