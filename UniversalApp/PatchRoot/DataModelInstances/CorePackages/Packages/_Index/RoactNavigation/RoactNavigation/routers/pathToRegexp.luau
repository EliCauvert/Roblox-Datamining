local parent = script.Parent.Parent.Parent
local array = require(parent.LuauPolyfill).Array
local regExpModule = require(parent.RegExp)

local function _(p0)
	return p0
end

local t = {}
local escapeString = nil
local flags = nil

local function lexer(p1)
	local var26
	local t = {}
	local var8 = 1
	
	local function _(p2)
		-- upvalues: var8 (write)
		var8 += 1
		
		return p2
	end
	
	local _ = function(p3)
		-- upvalues: p1 (ref)
		return string.sub(p1, p3, p3)
	end
	
	local var9 = string.len(p1)
	while var8 <= var9 do
		local var13, var20
		local substring = string.sub(p1, var8, var8)
		
		if substring == "*" or substring == "+" or substring == "?" then
			var26 = { type = "MODIFIER", index = var8 }
			var13 = var8
			var8 += 1
			local var37 = var13
			var26.value = string.sub(p1, var37, var37)
			table.insert(t, var26)
		elseif substring == "\\" then
			local t_1 = { type = "ESCAPED_CHAR" }
			local var12 = var8
			var8 += 1
			t_1.index = var12
			var13 = var8
			var8 += 1
			local var14 = var13
			t_1.value = string.sub(p1, var14, var14)
			table.insert(t, t_1)
		elseif substring == "{" then
			local t_1 = { type = "OPEN", index = var8 }
			var13 = var8
			var8 += 1
			local var16 = var13
			t_1.value = string.sub(p1, var16, var16)
			table.insert(t, t_1)
		elseif substring == "}" then
			local t_1 = { type = "CLOSE", index = var8 }
			var13 = var8
			var8 += 1
			local var18 = var13
			t_1.value = string.sub(p1, var18, var18)
			table.insert(t, t_1)
		elseif substring == ":" then
			local var19 = ""
			var20 = var8 + 1
			
			local _ = function(p4)
				-- upvalues: var20 (write)
				var20 += 1
				
				return p4
			end
			while var20 <= var9 do
				local byteValue = string.byte(p1, var20)
				
				if (byteValue < 48 or byteValue > 57) and (byteValue < 65 or byteValue > 90) and ((byteValue < 97 or byteValue > 122) and byteValue ~= 95) then break end
				local var22 = var19
				local var23 = var20
				var20 += 1
				local var24 = var23
				var19 = var22 .. string.sub(p1, var24, var24)
			end
			if var19 == "" then
				error(("Missing parameter name at %d"):format(var8))
			end
			table.insert(t, { type = "NAME", index = var8, value = var19 })
			var8 = var20
		elseif substring == "(" then
			local var25 = 1
			var20 = ""
			var26 = var8 + 1
			local var27 = var26
			
			if string.sub(p1, var27, var27) == "?" then
				error(("Pattern cannot start with \"?\" at %d"):format(var26))
			end
			local function byteValue(p5)
				-- upvalues: var26 (write)
				var26 += 1
				
				return p5
			end
			while var26 <= var9 do
				var13 = var26
				
				if string.sub(p1, var13, var13) == "\\" then
					local var28 = var20
					local var29 = var26
					var26 += 1
					local substring_1 = string.sub(p1, var29, var29)
					local var31 = var26
					var26 += 1
					local var32 = var31
					var20 = var28 .. (substring_1 .. string.sub(p1, var32, var32))
				end
				var13 = var26
				
				if string.sub(p1, var13, var13) == ")" then
					var25 -= 1
					
					if var25 ~= 0 then
						local var33 = var20
						local var34 = var26
						var26 += 1
						local var35 = var34
						var20 = var33 .. string.sub(p1, var35, var35)
						continue
					end
					var26 += 1
					break
				else
					var13 = var26
					
					if string.sub(p1, var13, var13) == "(" then
						var25 += 1
						var13 = var26 + 1
						
						if string.sub(p1, var13, var13) ~= "?" then
							error(("Capturing groups are not allowed at %d"):format(var26))
						end
					end
				end
			end
			if var25 ~= 0 then
				error(("Unbalanced pattern at %d"):format(var8))
			end
			if var20 == "" then
				error(("Missing pattern at %d"):format(var8))
			end
			table.insert(t, { type = "PATTERN", index = var8, value = var20 })
			var8 = var26
		else
			var26 = { type = "CHAR", index = var8 }
			var13 = var8
			var8 += 1
			local var36 = var13
			var26.value = string.sub(p1, var36, var36)
			table.insert(t, var26)
		end
	end
	table.insert(t, { type = "END", value = "", index = var8 })
	
	return t
end

function t.parse(p6, p7)
	-- upvalues: lexer (ref), escapeString (write)
	p7 = p7 or {}
	local var39 = lexer(p6)
	local var40 = if not (p7.prefixes == nil or p7.prefixes == "") then p7.prefixes else "./"
	local formattedText = string.format("[^%s]+?", escapeString(p7.delimiter or "/#?"))
	local t = {}
	local var43 = 0
	local var44 = 1
	local var45 = ""
	
	local function _(p8)
		-- upvalues: var44 (write)
		var44 += 1
		
		return p8
	end
	
	local _ = function(p9)
		-- upvalues: var43 (write)
		var43 += 1
		
		return p9
	end
	
	local _ = function(p10)
		-- upvalues: var44 (write), var39 (ref)
		if var44 <= #var39 and var39[var44].type == p10 then
			local var64 = var39
			local var65 = var44
			var44 += 1
			
			return var64[var65].value
		end
		return nil
	end
	
	local function mustConsume(p11)
		-- upvalues: var44 (write), var39 (ref)
		local value
		if var44 <= #var39 and var39[var44].type == p11 then
			local var66 = var39
			local var67 = var44
			var44 += 1
			value = var66[var67].value
		else
			value = nil
		end
		if value ~= nil then
			return value
		end
		local var68 = var39[var44]
		
		if var68 == nil then
			error(("Expected token %s, got nil"):format(p11))
		end
		error(("Unexpected %s at %d, expected %s"):format(var68.type, var68.index, p11))
	end
	
	local function consumeText()
		-- upvalues: var44 (write), var39 (ref)
		local var70
		local var69 = ""
		
		if var44 <= #var39 and var39[var44].type == "CHAR" then
			local var71 = var39
			local var72 = var44
			var44 += 1
			var70 = var71[var72].value
		else
			var70 = nil
		end
		if not var70 then
			if var44 <= #var39 and var39[var44].type == "ESCAPED_CHAR" then
				local var73 = var39
				local var74 = var44
				var44 += 1
				var70 = var73[var74].value
			else
				var70 = nil
			end
		end
		while var70 and var70 ~= "" do
			local value
			var69 ..= var70
			
			if var44 <= #var39 and var39[var44].type == "CHAR" then
				local var75 = var39
				local var76 = var44
				var44 += 1
				value = var75[var76].value
			else
				value = nil
			end
			if not value then
				if var44 <= #var39 and var39[var44].type == "ESCAPED_CHAR" then
					local var77 = var39
					local var78 = var44
					var44 += 1
					value = var77[var78].value
				else
					value = nil
				end
			end
			var70 = value
		end
		return var69
	end
	while var44 <= #var39 do
		local value, var48
		if var44 <= #var39 and var39[var44].type == "CHAR" then
			var48 = var44
			var44 += 1
			value = var39[var48].value
		else
			value = nil
		end
		local value_1, var49
		if var44 <= #var39 and var39[var44].type == "NAME" then
			var49 = var44
			var44 += 1
			value_1 = var39[var49].value
		else
			value_1 = nil
		end
		local value_2
		if var44 <= #var39 and var39[var44].type == "PATTERN" then
			local var50 = var44
			var44 += 1
			value_2 = var39[var50].value
		else
			value_2 = nil
		end
		if value_1 and value_1 ~= "" or value_2 and value_2 ~= "" then
			var48 = value or ""
			
			if string.find(var40, var48) == nil then
				var45 ..= var48
				var48 = ""
			end
			if var45 ~= nil and var45 ~= "" then
				table.insert(t, var45)
				var45 = ""
			end
			var49 = value_1
			
			if value_1 == nil or value_1 == "" then
				local var61 = var43
				var43 += 1
				var49 = var61
			end
			local value_5
			local t_1 = {
				suffix = "",
				name = var49,
				prefix = var48,
				pattern = if value_2 == nil or value_2 == "" then formattedText else value_2
			}
			
			if var44 <= #var39 and var39[var44].type == "MODIFIER" then
				local var63 = var44
				var44 += 1
				value_5 = var39[var63].value
			else
				value_5 = nil
			end
			t_1.modifier = value_5 or ""
			table.insert(t, t_1)
		else
			local var52
			var48 = value
			
			if not var48 then
				if var44 <= #var39 and var39[var44].type == "ESCAPED_CHAR" then
					local var51 = var44
					var44 += 1
					var48 = var39[var51].value
				else
					var48 = nil
				end
			end
			if var48 and var48 ~= "" then
				var45 ..= var48
			elseif var45 and var45 ~= "" then
				table.insert(t, var45)
				var45 = ""
			end
			if var44 <= #var39 and var39[var44].type == "OPEN" then
				var52 = var44
				var44 += 1
				var49 = var39[var52].value
			else
				var49 = nil
			end
			if var49 and var49 ~= "" then
				local var53 = consumeText()
				
				if var44 <= #var39 and var39[var44].type == "NAME" then
					local var54 = var44
					var44 += 1
					var52 = var39[var54].value
				else
					var52 = nil
				end
				local value_3
				local var52_1 = var52 or ""
				
				if var44 <= #var39 and var39[var44].type == "PATTERN" then
					local var56 = var44
					var44 += 1
					value_3 = var39[var56].value
				else
					value_3 = nil
				end
				var52 = value_3 or ""
				local var57 = consumeText()
				mustConsume("CLOSE")
				
				if var52_1 == "" and var52 ~= "" then
					local var58 = var43
					var43 += 1
					var52_1 = var58
				end
				if var52_1 ~= "" and var52_1 ~= 0 and (var52 == nil or var52 == "") then
					var52 = formattedText
				end
				local value_4
				local t_1 = {
					name = var52_1,
					pattern = var52,
					prefix = var53,
					suffix = var57
				}
				
				if var44 <= #var39 and var39[var44].type == "MODIFIER" then
					local var60 = var44
					var44 += 1
					value_4 = var39[var60].value
				else
					value_4 = nil
				end
				t_1.modifier = value_4 or ""
				table.insert(t, t_1)
			else
				mustConsume("END")
			end
		end
	end
	return t
end

function t.compile(p12, p13)
	-- upvalues: t (ref)
	return t.tokensToFunction(t.parse(p12, p13), p13)
end

function t.tokensToFunction(p14, p15)
	-- upvalues: flags (write), array (ref), regExpModule (ref)
	if p15 == nil then
		p15 = {}
	end
	local var79 = flags(p15)
	local encode = p15.encode or function(p16)
		return p16
	end
	local validate = p15.validate
	
	if validate == nil then
		validate = true
	end
	local var81 = array.map(p14, function(p17)
		-- upvalues: regExpModule (copy), var79 (ref)
		return if type(p17) == "table" then regExpModule(("^(?:%s)$"):format(p17.pattern), var79) else nil
	end)
	
	return function(p18)
		-- upvalues: p14 (ref), array (copy), encode (ref), validate (write), var81 (ref)
		local var82 = ""
		
		for i, v in p14 do
			if type(v) == "string" then
				var82 ..= v
				continue
			end
			local var83 = if p18 then p18[tostring(v.name)] else nil
			local var84 = if v.modifier ~= "?" then v.modifier == "*" else true
			local var85 = if v.modifier ~= "*" then v.modifier == "+" else true
			
			if array.isArray(var83) then
				if not var85 then
					error(("Expected \"%s\" to not repeat, but got an array"):format(v.name))
				end
				if #var83 == 0 then
					if not var84 then
						error(("Expected \"%s\" to not be empty"):format(v.name))
					end
				end
				for i_1, v_1 in var83 do
					local var88 = encode(v_1, v)
					
					if validate and not var81[i]:test(var88) then
						error(("Expected all \"%s\" to match \"%s\", but got \"%s\""):format(v.name, v.pattern, var88))
					end
					var82 ..= v.prefix .. var88 .. v.suffix
				end
			else
				local var86 = type(var83)
				
				if var86 == "string" or var86 == "number" then
					local var87 = encode(tostring(var83), v)
					
					if validate and not var81[i]:test(var87) then
						error(("Expected \"%s\" to match \"%s\", but got \"%s\""):format(v.name, v.pattern, var87))
					end
					var82 ..= v.prefix .. var87 .. v.suffix
				elseif not var84 then
					error(("Expected \"%s\" to be %s"):format(tostring(v.name), if var85 then "an array" else "a string"))
				end
			end
		end
		return var82
	end
end

function t.match(p19, p20)
	-- upvalues: t (ref)
	local t_1 = {}
	
	return t.regexpToFunction(t.pathToRegexp(p19, t_1, p20), t_1, p20)
end

function t.regexpToFunction(p21, p22, p23)
	-- upvalues: array (ref)
	if p23 == nil then
		p23 = {}
	end
	local decode = p23.decode or function(p24)
		return p24
	end
	
	return function(p25)
		-- upvalues: p21 (ref), p22 (ref), array (copy), decode (ref)
		local var91 = p21:exec(p25)
		
		if not var91 then
			return false
		end
		local var92 = var91[1]
		local index = var91.index or 0
		local t = {}
		
		for i = 2, var91.n do
			if var91[i] == nil then
				continue
			end
			local var95 = p22[i - 1]
			
			if var95.modifier == "*" or var95.modifier == "+" then
				t[var95.name] = array.map(string.split(var91[i], var95.prefix .. var95.suffix), function(p26)
					-- upvalues: decode (copy), var95 (ref)
					return decode(p26, var95)
				end)
			else
				t[var95.name] = decode(var91[i], var95)
			end
		end
		return { path = var92, index = index, params = t }
	end
end

escapeString = function(p27)
	return string.gsub(p27, "[%.%+%*%?=%^!:${}%(%)%[%]|/\\]", function(p28)
		return "\\" .. p28
	end)
end

flags = function(p29)
	return if p29 and p29.sensitive then "" else "i"
end

local function arrayToRegexp(p30, p31, p32)
	-- upvalues: array (ref), t (ref), regExpModule (ref), flags (write)
	return regExpModule(("(?:%s)"):format(table.concat(array.map(p30, function(p33)
		-- upvalues: t (copy), p31 (ref), p32 (ref)
		return t.pathToRegexp(p33, p31, p32).source
	end), "|")), flags(p32))
end

local function stringToRegexp(p34, p35, p36)
	-- upvalues: t (ref)
	return t.tokensToRegexp(t.parse(p34, p36), p35, p36)
end

function t.tokensToRegexp(p37, p38, p39)
	-- upvalues: escapeString (write), regExpModule (ref), flags (write)
	local var96 = if p39 ~= nil then p39 else {}
	local strict = var96.strict
	
	if strict == nil then
		strict = false
	end
	local start = var96.start
	
	if start == nil then
		start = true
	end
	local _end = var96.end_
	
	if _end == nil then
		_end = true
	end
	local encode = var96.encode or function(p40)
		return p40
	end
	local var98 = if var96.endsWith then ("[%s]|$"):format(escapeString(var96.endsWith or "")) else "$"
	local var99 = ("[%s]"):format(escapeString(var96.delimiter or "/#?"))
	local var100 = if start then "^" else ""
	
	for i, v in p37 do
		if type(v) == "string" then
			var100 ..= escapeString(encode(v))
		else
			local var103 = escapeString(encode(v.prefix))
			local var104 = escapeString(encode(v.suffix))
			
			if v.pattern and v.pattern ~= "" then
				if p38 then
					table.insert(p38, v)
				end
				var100 = if (not var103 or var103 == "") and (not var104 or var104 == "") then if v.modifier == "+" or v.modifier == "*" then var100 .. ("(?:%s((?:%s)(?:%s%s(?:%s))*)%s)%s"):format(var103, v.pattern, var104, var103, v.pattern, var104, if v.modifier == "*" then "?" else "") else var100 .. ("(?:%s(%s)%s)%s"):format(var103, v.pattern, var104, v.modifier) else var100 .. ("(%s)%s"):format(v.pattern, v.modifier)
			else
				var100 ..= ("(?:%s%s)%s"):format(var103, var104, v.modifier)
			end
		end
	end
	if _end then
		if not strict then
			var100 ..= ("%s?"):format(var99)
		end
		var100 = if var96.endsWith and var96.endsWith ~= "" then var100 .. ("(?=%s)"):format(var98) else var100 .. "$"
	else
		local var101 = p37[#p37]
		local var102 = if type(var101) == "string" then string.find(var99, var101:sub(-1)) ~= nil else var101 == nil
		
		if not strict then
			var100 ..= string.format("(?:%s(?=%s))?", var99, var98)
		end
		if not var102 then
			var100 ..= string.format("(?=%s|%s)", var99, var98)
		end
	end
	return regExpModule(var100, flags(var96))
end

function t.pathToRegexp(p41, p42, p43)
	-- upvalues: array (ref), arrayToRegexp (ref), stringToRegexp (ref)
	return if array.isArray(p41) then arrayToRegexp(p41, p42, p43) else stringToRegexp(p41, p42, p43)
end

return t