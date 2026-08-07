local function _(p0) --[[ line: 3 | named "rine" ]]
	return p0 and (#p0 > 0 and p0)
end

local _ = function(p1) --[[ line: 6 | named "rit" ]]
	return type(p1) == "table" and p1
end

local _ = function() --[[ line: 10 | named "dont_crash" ]]
	if math.random() <= 0.004 then
		wait()
	end
	return true
end

local var0 = function() --[[ line: 18 ]] end

local _ = function(p2) --[[ line: 19 ]]
	return string.gsub(p2, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

local _tostring = tostring
local char = string.char
local t = {}
local var3 = if t.silent then var0 else function(p3, p4, ...) --[[ line: 26 ]]
	-- upvalues: t (ref)
	local _ = if p3 == "i" then "stdout" else "stderr"
	print("[HTMLParser]" .. (" [%s] "):format(p3:upper()) .. p4:format(...) .. (t.nonl or "\n"))
end
local var4 = if t.noerr then var0 else function(p5, ...) --[[ line: 32 ]]
	-- upvalues: var3 (ref)
	var3("e", p5, ...)
end
local _ = if t.noout then var0 else function(p6, ...) --[[ line: 36 ]]
	-- upvalues: var3 (ref)
	var3("i", p6, ...)
end
local var5 = if t.debug then function(p7, ...) --[[ line: 41 ]]
	-- upvalues: var3 (ref), var0 (ref), _tostring (ref)
	var3("d", p7:gsub("#LINE#", _tostring(var0(3))), ...)
end else var0
local elementNodeModule = require(script.ElementNode)
local voidelementsModule = require(script.voidelements)

return {
	parse = function(p8, p9, p10) --[[ line: 53 ]]
		-- upvalues: t (ref), _tostring (ref), char (ref), var5 (ref), var4 (ref), elementNodeModule (ref), voidelementsModule (ref)
		local var8 = t and (#t > 0 and t) or ({} or {})
		var8.looplimit = var8.looplimit or 100000000
		local var9 = _tostring(p8)
		p9 = p9 or (var8.looplimit or 100000000)
		local var11 = false
		
		if not var8.keep_comments then
			var9 = var9:gsub("<!%-%-.-%-%->", "")
		end
		local t_1 = {}
		
		if not var8.keep_danger_placeholders then
			local t_2 = {}
			local var14 = 0
			-- [0.001s] <RUNTIME-ERROR> : Error block 44 analysis at pc 0 (34)
		end
		local var16 = 0
		local var17 = elementNodeModule:new(var16, _tostring(var9))
		var17.page_url = p10
		local var15 = var17
		local var18 = true
		local var19 = 1
		local t_2 = {}
		while true do
			if math.random() <= 0.004 then
				wait()
			end
			if var16 == p9 then
				var4("Main loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", p9)
				break
			end
			local _ = nil
			local var21 = nil
			local var22, var23, var24 = var17._text:find("<([%w-]+)[^>]*>", var19)
			local var25 = var22
			var19 = var23
			var21 = var24
			var5("[MainLoop]:#LINE# openstart=%s || tpos=%s || name=%s", _tostring(var25), _tostring(var19), _tostring(var21))
			
			if not var21 then break end
			var16 += 1
			local var26 = elementNodeModule:new(var16, _tostring(var21), var15 or {}, var18, var25, var19)
			var26.page_url = p10
			local var15 = var26
			local var27 = nil
			local text = var26:gettext()
			local var29 = 1
			while true do
				if math.random() <= 0.004 then
					wait()
				end
				if var27 == p9 then
					var4("Tag parsing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", p9)
					break
				end
				local _ = nil
				local var30 = nil
				local _ = nil
				local _ = nil
				local var31 = nil
				local _ = nil
				local var32, var33, var34, _, var35, var36, var37 = text:find("%s+([^%s=/>]+)([%s]-)(=?)([%s]-)(['\"]?)", var29)
				local var38 = var32
				var29 = var33
				var30 = var34
				local var39 = var35
				local var40 = var37
				var5("[TagLoop]:#LINE# start=%s || apos=%s || k=%s || zsp='%s' || eq='%s', quote=[%s]", _tostring(var38), _tostring(var29), _tostring(var30), _tostring(var36), _tostring(var39), _tostring(var40))
				
				if not var30 or var30 == "/>" or var30 == ">" then break end
				if var39 == "=" then
					local var41 = if var40 ~= "" then var40 .. "([^" .. var40 .. "]*)" .. var40 else "=([^%s>]*)"
					local var42, var43, var44 = text:find(var41, var29)
					local var45 = var42
					var29 = var43
					var31 = var44
					var5("[TagLoop]:#LINE# start=%s || apos=%s || v=%s || pattern=%s", _tostring(var45), _tostring(var29), _tostring(var31), _tostring(var41))
				end
				var31 = var31 or ""
				var5("[TagLoop]:#LINE# k=%s || v=%s", _tostring(var30), _tostring(var31))
				var26:addattribute(var30, var31)
				var27 = (var27 or 0) + 1
				if voidelementsModule[var26.name:lower()] then
					var18 = false
					var26:close()
				else
					t_2[var26.name] = t_2[var26.name] or {}
					table.insert(t_2[var26.name], var26)
				end
				local var46 = var19
				local var47 = nil
				while true do
					if math.random() <= 0.004 then
						wait()
					end
					if var47 == p9 then
						var4("Tag closing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", p9)
						break
					end
					local _ = nil
					local var48 = nil
					local _ = nil
					local var49, var50, var51, var52 = var17._text:find("[^<]*<(/?)([%w-]+)", var46)
					local var53 = var49
					var46 = var50
					var48 = var51
					local var54 = var52
					var5("[TagCloseLoop]:#LINE# closestart=%s || closeend=%s || closing=%s || closename=%s", _tostring(var53), _tostring(var46), _tostring(var48), _tostring(var54))
					
					if not var48 or var48 == "" then
						continue
						break
					end
					var26 = table.remove(t_2[var54] or {}) or var26
					var53 = var17._text:find("<", var53)
					var5("[TagCloseLoop]:#LINE# closestart=%s", _tostring(var53))
					var26:close(var53, var46 + 1)
					local var15 = var26.parent
					var18 = true
					var47 = (var47 or 0) + 1
				end
			end
			return var17
		end
	end
}