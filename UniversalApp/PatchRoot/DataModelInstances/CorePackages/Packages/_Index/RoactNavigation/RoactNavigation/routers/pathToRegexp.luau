local parent = script.Parent.Parent.Parent
local array = require(parent.LuauPolyfill).Array
local regExpModule = require(parent.RegExp)

local function _(p1)
	return p1
end

local t = {}
local escapeString = nil
local flags = nil

local function lexer(p1)
	local var1
	local t = {}
	local var2 = 1
	
	local function _(p2)
		-- upvalues: var2 (write)
		var2 += 1
		
		return p2
	end
	
	local _ = function(p2)
		-- upvalues: p1 (ref)
		return string.sub(p1, p2, p2)
	end
	
	local var3 = string.len(p1)
	while var2 <= var3 do
		local var4, var5
		local substring = string.sub(p1, var2, var2)
		
		if substring == "*" or substring == "+" or substring == "?" then
			var1 = { type = "MODIFIER", index = var2 }
			var4 = var2
			var2 += 1
			local var6 = var4
			var1.value = string.sub(p1, var6, var6)
			table.insert(t, var1)
		elseif substring == "\\" then
			local t_1 = { type = "ESCAPED_CHAR" }
			local var7 = var2
			var2 += 1
			t_1.index = var7
			var4 = var2
			var2 += 1
			local var8 = var4
			t_1.value = string.sub(p1, var8, var8)
			table.insert(t, t_1)
		elseif substring == "{" then
			local t_1 = { type = "OPEN", index = var2 }
			var4 = var2
			var2 += 1
			local var9 = var4
			t_1.value = string.sub(p1, var9, var9)
			table.insert(t, t_1)
		elseif substring == "}" then
			local t_1 = { type = "CLOSE", index = var2 }
			var4 = var2
			var2 += 1
			local var10 = var4
			t_1.value = string.sub(p1, var10, var10)
			table.insert(t, t_1)
		elseif substring == ":" then
			local var11 = ""
			var5 = var2 + 1
			
			local _ = function(p2)
				-- upvalues: var5 (write)
				var5 += 1
				
				return p2
			end
			while var5 <= var3 do
				local byteValue = string.byte(p1, var5)
				
				if (byteValue < 48 or byteValue > 57) and (byteValue < 65 or byteValue > 90) and ((byteValue < 97 or byteValue > 122) and byteValue ~= 95) then break end
				local var12 = var11
				local var13 = var5
				var5 += 1
				local var14 = var13
				var11 = var12 .. string.sub(p1, var14, var14)
			end
			if var11 == "" then
				error(("Missing parameter name at %d"):format(var2))
			end
			table.insert(t, { type = "NAME", index = var2, value = var11 })
			var2 = var5
		elseif substring == "(" then
			local var15 = 1
			var5 = ""
			var1 = var2 + 1
			local var16 = var1
			
			if string.sub(p1, var16, var16) == "?" then
				error(("Pattern cannot start with \"?\" at %d"):format(var1))
			end
			local function byteValue(p2)
				-- upvalues: var1 (write)
				var1 += 1
				
				return p2
			end
			while var1 <= var3 do
				var4 = var1
				
				if string.sub(p1, var4, var4) == "\\" then
					local var17 = var5
					local var18 = var1
					var1 += 1
					local substring_1 = string.sub(p1, var18, var18)
					local var19 = var1
					var1 += 1
					local var20 = var19
					var5 = var17 .. (substring_1 .. string.sub(p1, var20, var20))
				end
				var4 = var1
				
				if string.sub(p1, var4, var4) == ")" then
					var15 -= 1
					
					if var15 ~= 0 then
						local var21 = var5
						local var22 = var1
						var1 += 1
						local var23 = var22
						var5 = var21 .. string.sub(p1, var23, var23)
						continue
					end
					var1 += 1
					break
				else
					var4 = var1
					
					if string.sub(p1, var4, var4) == "(" then
						var15 += 1
						var4 = var1 + 1
						
						if string.sub(p1, var4, var4) ~= "?" then
							error(("Capturing groups are not allowed at %d"):format(var1))
						end
					end
				end
			end
			if var15 ~= 0 then
				error(("Unbalanced pattern at %d"):format(var2))
			end
			if var5 == "" then
				error(("Missing pattern at %d"):format(var2))
			end
			table.insert(t, { type = "PATTERN", index = var2, value = var5 })
			var2 = var1
		else
			var1 = { type = "CHAR", index = var2 }
			var4 = var2
			var2 += 1
			local var24 = var4
			var1.value = string.sub(p1, var24, var24)
			table.insert(t, var1)
		end
	end
	table.insert(t, { type = "END", value = "", index = var2 })
	
	return t
end

function t.parse(p2, p3)
	-- upvalues: lexer (ref), escapeString (write)
	p3 = p3 or {}
	local var25 = lexer(p2)
	local var26 = if not (p3.prefixes == nil or p3.prefixes == "") then p3.prefixes else "./"
	local formattedText = string.format("[^%s]+?", escapeString(p3.delimiter or "/#?"))
	local t = {}
	local var27 = 0
	local var28 = 1
	local var29 = ""
	
	local function _(p4)
		-- upvalues: var28 (write)
		var28 += 1
		
		return p4
	end
	
	local _ = function(p4)
		-- upvalues: var27 (write)
		var27 += 1
		
		return p4
	end
	
	local _ = function(p4)
		-- upvalues: var28 (write), var25 (ref)
		if var28 <= #var25 and var25[var28].type == p4 then
			local var30 = var25
			local var31 = var28
			var28 += 1
			
			return var30[var31].value
		end
		return nil
	end
	
	local function mustConsume(p4)
		-- upvalues: var28 (write), var25 (ref)
		local value
		if var28 <= #var25 and var25[var28].type == p4 then
			local var30 = var25
			local var31 = var28
			var28 += 1
			value = var30[var31].value
		else
			value = nil
		end
		if value ~= nil then
			return value
		end
		local var32 = var25[var28]
		
		if var32 == nil then
			error(("Expected token %s, got nil"):format(p4))
		end
		error(("Unexpected %s at %d, expected %s"):format(var32.type, var32.index, p4))
	end
	
	local function consumeText()
		-- upvalues: var28 (write), var25 (ref)
		local var30
		local var31 = ""
		
		if var28 <= #var25 and var25[var28].type == "CHAR" then
			local var32 = var25
			local var33 = var28
			var28 += 1
			var30 = var32[var33].value
		else
			var30 = nil
		end
		if not var30 then
			if var28 <= #var25 and var25[var28].type == "ESCAPED_CHAR" then
				local var34 = var25
				local var35 = var28
				var28 += 1
				var30 = var34[var35].value
			else
				var30 = nil
			end
		end
		while var30 and var30 ~= "" do
			local value
			var31 ..= var30
			
			if var28 <= #var25 and var25[var28].type == "CHAR" then
				local var36 = var25
				local var37 = var28
				var28 += 1
				value = var36[var37].value
			else
				value = nil
			end
			if not value then
				if var28 <= #var25 and var25[var28].type == "ESCAPED_CHAR" then
					local var38 = var25
					local var39 = var28
					var28 += 1
					value = var38[var39].value
				else
					value = nil
				end
			end
			var30 = value
		end
		return var31
	end
	while var28 <= #var25 do
		local value, var40
		if var28 <= #var25 and var25[var28].type == "CHAR" then
			var40 = var28
			var28 += 1
			value = var25[var40].value
		else
			value = nil
		end
		local value_1, var41
		if var28 <= #var25 and var25[var28].type == "NAME" then
			var41 = var28
			var28 += 1
			value_1 = var25[var41].value
		else
			value_1 = nil
		end
		local value_2
		if var28 <= #var25 and var25[var28].type == "PATTERN" then
			local var42 = var28
			var28 += 1
			value_2 = var25[var42].value
		else
			value_2 = nil
		end
		if value_1 and value_1 ~= "" or value_2 and value_2 ~= "" then
			var40 = value or ""
			
			if string.find(var26, var40) == nil then
				var29 ..= var40
				var40 = ""
			end
			if var29 ~= nil and var29 ~= "" then
				table.insert(t, var29)
				var29 = ""
			end
			var41 = value_1
			
			if value_1 == nil or value_1 == "" then
				local var43 = var27
				var27 += 1
				var41 = var43
			end
			local value_5
			local t_1 = {
				suffix = "",
				name = var41,
				prefix = var40,
				pattern = if value_2 == nil or value_2 == "" then formattedText else value_2
			}
			
			if var28 <= #var25 and var25[var28].type == "MODIFIER" then
				local var44 = var28
				var28 += 1
				value_5 = var25[var44].value
			else
				value_5 = nil
			end
			t_1.modifier = value_5 or ""
			table.insert(t, t_1)
		else
			local var45
			var40 = value
			
			if not var40 then
				if var28 <= #var25 and var25[var28].type == "ESCAPED_CHAR" then
					local var46 = var28
					var28 += 1
					var40 = var25[var46].value
				else
					var40 = nil
				end
			end
			if var40 and var40 ~= "" then
				var29 ..= var40
			elseif var29 and var29 ~= "" then
				table.insert(t, var29)
				var29 = ""
			end
			if var28 <= #var25 and var25[var28].type == "OPEN" then
				var45 = var28
				var28 += 1
				var41 = var25[var45].value
			else
				var41 = nil
			end
			if var41 and var41 ~= "" then
				local var47 = consumeText()
				
				if var28 <= #var25 and var25[var28].type == "NAME" then
					local var48 = var28
					var28 += 1
					var45 = var25[var48].value
				else
					var45 = nil
				end
				local value_3
				local var49 = var45 or ""
				
				if var28 <= #var25 and var25[var28].type == "PATTERN" then
					local var50 = var28
					var28 += 1
					value_3 = var25[var50].value
				else
					value_3 = nil
				end
				var45 = value_3 or ""
				local var51 = consumeText()
				mustConsume("CLOSE")
				
				if var49 == "" and var45 ~= "" then
					local var52 = var27
					var27 += 1
					var49 = var52
				end
				if var49 ~= "" and var49 ~= 0 and (var45 == nil or var45 == "") then
					var45 = formattedText
				end
				local value_4
				local t_1 = {
					name = var49,
					pattern = var45,
					prefix = var47,
					suffix = var51
				}
				
				if var28 <= #var25 and var25[var28].type == "MODIFIER" then
					local var53 = var28
					var28 += 1
					value_4 = var25[var53].value
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

function t.compile(p4, p5)
	-- upvalues: t (ref)
	return t.tokensToFunction(t.parse(p4, p5), p5)
end

function t.tokensToFunction(p4, p5)
	-- upvalues: flags (write), array (ref), regExpModule (ref)
	if p5 == nil then
		p5 = {}
	end
	local var54 = flags(p5)
	local encode = p5.encode or function(p6)
		return p6
	end
	local validate = p5.validate
	
	if validate == nil then
		validate = true
	end
	local var55 = array.map(p4, function(p6)
		-- upvalues: regExpModule (copy), var54 (ref)
		return if type(p6) == "table" then regExpModule(("^(?:%s)$"):format(p6.pattern), var54) else nil
	end)
	
	return function(p6)
		-- upvalues: p4 (ref), array (copy), encode (ref), validate (write), var55 (ref)
		local var56 = ""
		
		for i, v in p4 do
			if type(v) == "string" then
				var56 ..= v
				continue
			end
			local var57 = if p6 then p6[tostring(v.name)] else nil
			local var58 = if v.modifier ~= "?" then v.modifier == "*" else true
			local var59 = if v.modifier ~= "*" then v.modifier == "+" else true
			
			if array.isArray(var57) then
				if not var59 then
					error(("Expected \"%s\" to not repeat, but got an array"):format(v.name))
				end
				if #var57 == 0 then
					if not var58 then
						error(("Expected \"%s\" to not be empty"):format(v.name))
					end
				end
				for i_1, v_1 in var57 do
					local var60 = encode(v_1, v)
					
					if validate and not var55[i]:test(var60) then
						error(("Expected all \"%s\" to match \"%s\", but got \"%s\""):format(v.name, v.pattern, var60))
					end
					var56 ..= v.prefix .. var88 .. v.suffix
				end
			else
				local var61 = type(var57)
				
				if var61 == "string" or var61 == "number" then
					local var62 = encode(tostring(var57), v)
					
					if validate and not var55[i]:test(var62) then
						error(("Expected \"%s\" to match \"%s\", but got \"%s\""):format(v.name, v.pattern, var62))
					end
					var56 ..= v.prefix .. var87 .. v.suffix
				elseif not var58 then
					error(("Expected \"%s\" to be %s"):format(tostring(v.name), if var59 then "an array" else "a string"))
				end
			end
		end
		return var56
	end
end

function t.match(p7, p8)
	-- upvalues: t (ref)
	local t_1 = {}
	
	return t.regexpToFunction(t.pathToRegexp(p7, t_1, p8), t_1, p8)
end

function t.regexpToFunction(p7, p8, p9)
	-- upvalues: array (ref)
	if p9 == nil then
		p9 = {}
	end
	local decode = p9.decode or function(p10)
		return p10
	end
	
	return function(p10)
		-- upvalues: p7 (ref), p8 (ref), array (copy), decode (ref)
		local var63 = p7:exec(p10)
		
		if not var63 then
			return false
		end
		local var64 = var63[1]
		local index = var63.index or 0
		local t = {}
		
		for i = 2, var63.n do
			if var63[i] == nil then
				continue
			end
			local var65 = p8[i - 1]
			
			if var65.modifier == "*" or var65.modifier == "+" then
				t[var65.name] = array.map(string.split(var63[i], var65.prefix .. var95.suffix), function(p11)
					-- upvalues: decode (copy), var65 (ref)
					return decode(p11, var65)
				end)
			else
				t[var65.name] = decode(var63[i], var65)
			end
		end
		return { path = var64, index = index, params = t }
	end
end

escapeString = function(p10)
	return string.gsub(p10, "[%.%+%*%?=%^!:${}%(%)%[%]|/\\]", function(p11)
		return "\\" .. p28
	end)
end

flags = function(p10)
	return if p10 and p10.sensitive then "" else "i"
end

local function arrayToRegexp(p10, p11, p12)
	-- upvalues: array (ref), t (ref), regExpModule (ref), flags (write)
	return regExpModule(("(?:%s)"):format(table.concat(array.map(p10, function(p13)
		-- upvalues: t (copy), p11 (ref), p12 (ref)
		return t.pathToRegexp(p13, p11, p12).source
	end), "|")), flags(p12))
end

local function stringToRegexp(p10, p11, p12)
	-- upvalues: t (ref)
	return t.tokensToRegexp(t.parse(p10, p12), p11, p12)
end

function t.tokensToRegexp(p10, p11, p12)
	-- upvalues: escapeString (write), regExpModule (ref), flags (write)
	local var63 = if p12 ~= nil then p12 else {}
	local strict = var63.strict
	
	if strict == nil then
		strict = false
	end
	local start = var63.start
	
	if start == nil then
		start = true
	end
	local _end = var63.end_
	
	if _end == nil then
		_end = true
	end
	local encode = var63.encode or function(p13)
		return p13
	end
	local var64 = if var63.endsWith then ("[%s]|$"):format(escapeString(var63.endsWith or "")) else "$"
	local var65 = ("[%s]"):format(escapeString(var63.delimiter or "/#?"))
	local var66 = if start then "^" else ""
	
	for i, v in p10 do
		if type(v) == "string" then
			var66 ..= escapeString(encode(v))
		else
			local var67 = escapeString(encode(v.prefix))
			local var68 = escapeString(encode(v.suffix))
			
			if v.pattern and v.pattern ~= "" then
				if p11 then
					table.insert(p11, v)
				end
				var66 = if (not var67 or var67 == "") and (not var68 or var68 == "") then if v.modifier == "+" or v.modifier == "*" then var66 .. ("(?:%s((?:%s)(?:%s%s(?:%s))*)%s)%s"):format(var67, v.pattern, var68, var67, v.pattern, var68, if v.modifier == "*" then "?" else "") else var66 .. ("(?:%s(%s)%s)%s"):format(var67, v.pattern, var68, v.modifier) else var66 .. ("(%s)%s"):format(v.pattern, v.modifier)
			else
				var66 ..= ("(?:%s%s)%s"):format(var67, var68, v.modifier)
			end
		end
	end
	if _end then
		if not strict then
			var66 ..= ("%s?"):format(var65)
		end
		var66 = if var63.endsWith and var63.endsWith ~= "" then var66 .. ("(?=%s)"):format(var64) else var66 .. "$"
	else
		local var69 = p10[#p10]
		local var70 = if type(var69) == "string" then string.find(var65, var69:sub(-1)) ~= nil else var69 == nil
		
		if not strict then
			var66 ..= string.format("(?:%s(?=%s))?", var65, var64)
		end
		if not var70 then
			var66 ..= string.format("(?=%s|%s)", var65, var64)
		end
	end
	return regExpModule(var66, flags(var63))
end

function t.pathToRegexp(p13, p14, p15)
	-- upvalues: array (ref), arrayToRegexp (ref), stringToRegexp (ref)
	return if array.isArray(p13) then arrayToRegexp(p13, p14, p15) else stringToRegexp(p13, p14, p15)
end

return t