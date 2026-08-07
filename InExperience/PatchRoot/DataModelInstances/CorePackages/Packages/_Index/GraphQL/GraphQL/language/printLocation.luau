local parent = script.Parent
local luauPolyfillModule = require(parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String
local getLocation = require(parent.location).getLocation
local whitespace = nil
local leftPad = nil
local printSourceLocation = nil
local printPrefixedLines = nil

local function printLocation(p0) --[[ line: 27 ]]
	-- upvalues: printSourceLocation (write), getLocation (ref)
	return printSourceLocation(p0.source, getLocation(p0.source, p0.start))
end

printSourceLocation = function(p1, p2) --[[ line: 34 | named "printSourceLocation" ]]
	-- upvalues: whitespace (write), string (ref), printPrefixedLines (write), array (ref)
	local var6 = p1.locationOffset.column - 1
	local text = whitespace(var6) .. p1.body
	local var8 = p2.line - 1 + 1
	local var9 = p2.line + (p1.locationOffset.line - 1)
	local var10 = p2.column + (if p2.line == 1 then var6 else 0)
	local text_1 = p1.name .. ":" .. var9 .. ":" .. var10 .. "\n"
	local var12 = string.split(text, { "\r\n", "\n", "\r" })
	local var13 = var12[var8]
	
	if string.len(var13) <= 120 then
		return text_1 .. printPrefixedLines({
			{ var9 - 1, var12[var8 - 1] },
			{ var9, var13 },
			{ "", whitespace(var10 - 1) .. "^" },
			{ var9 + 1, var12[var8 + 1] }
		})
	end
	local var14 = math.floor(var10 / 80) + 1
	local var15 = var10 % 80
	local t = {}
	
	for i = 1, string.len(var13), 80 do
		table.insert(t, string.slice(var13, i, i + 80))
	end
	return text_1 .. printPrefixedLines(array.concat({ { tostring(var9), t[1] } }, array.map(array.slice(t, 2, var14 + 1), function(p3) --[[ line: 61 ]]
		return { "", p3 }
	end), { { " ", whitespace(var15 - 1) .. "^" } }, { { "", t[var14 + 1] } }))
end

printPrefixedLines = function(p4) --[[ line: 83 | named "printPrefixedLines" ]]
	-- upvalues: array (ref), leftPad (write)
	local var17 = array.filter(p4, function(p5) --[[ line: 84 ]]
		return p5[2] ~= nil
	end)
	local maxValue = math.max(table.unpack(array.map(var17, function(p6) --[[ line: 89 ]]
		return string.len(p6[1])
	end)))
	
	return array.join(array.map(var17, function(p7) --[[ line: 94 ]]
		-- upvalues: leftPad (copy), maxValue (ref)
		local var21
		local var19 = p7[2]
		local var20 = leftPad(maxValue, p7[1])
		
		if var19 and var19 ~= "" then
			var21 = " | " .. var19 or " |"
		end
		return var20 .. var21
	end), "\n")
end

whitespace = function(p8) --[[ line: 103 | named "whitespace" ]]
	return string.rep(" ", p8)
end

leftPad = function(p9, p10) --[[ line: 107 | named "leftPad" ]]
	-- upvalues: whitespace (write)
	return whitespace(p9 - string.len(p10)) .. p10
end

return {
	printSourceLocation = printSourceLocation,
	printLocation = printLocation
}