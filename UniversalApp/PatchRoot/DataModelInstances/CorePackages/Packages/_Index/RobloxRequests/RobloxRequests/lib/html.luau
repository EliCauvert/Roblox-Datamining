local function _(p1)
	return p1 and (#p1 > 0 and p1)
end

local _ = function(p1)
	return type(p1) == "table" and p1
end

local _ = function()
	if math.random() <= 0.004 then
		wait()
	end
	return true
end

local var1 = function() end

local _ = function(p1)
	return string.gsub(p1, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
end

local _tostring = tostring
local char = string.char
local t = {}
local var2 = if t.silent then var1 else function(p1, p2, ...)
	-- upvalues: t (ref)
	local _ = if p1 == "i" then "stdout" else "stderr"
	print("[HTMLParser]" .. (" [%s] "):format(p1:upper()) .. p4:format(...) .. (t.nonl or "\n"))
end
local var3 = if t.noerr then var1 else function(p1, ...)
	-- upvalues: var2 (ref)
	var2("e", p1, ...)
end
local _ = if t.noout then var1 else function(p1, ...)
	-- upvalues: var2 (ref)
	var2("i", p1, ...)
end
local var4 = if t.debug then function(p1, ...)
	-- upvalues: var2 (ref), var1 (ref), _tostring (ref)
	var2("d", p1:gsub("#LINE#", _tostring(var1(3))), ...)
end else var1
local elementNodeModule = require(script.ElementNode)
local voidelementsModule = require(script.voidelements)

return {
	parse = function(p1, p2, p3)
		-- upvalues: t (ref), _tostring (ref), char (ref), var4 (ref), var3 (ref), elementNodeModule (ref), voidelementsModule (ref)
		local var5 = t and (#t > 0 and t) or ({} or {})
		var5.looplimit = var5.looplimit or 100000000
		local var6 = _tostring(p1)
		p2 = p2 or (var5.looplimit or 100000000)
		local var7 = false
		
		if not var5.keep_comments then
			var6 = var6:gsub("<!%-%-.-%-%->", "")
		end
		local t_1 = {}
		
		if not var5.keep_danger_placeholders then
			local t_2 = {}
			local var8 = 0
			-- [0.001s] <RUNTIME-ERROR> : Error block 44 analysis at pc 0 (34)
		end
		local var9 = 0
		local var10 = elementNodeModule:new(var9, _tostring(var6))
		var10.page_url = p3
		local var11 = var10
		local var12 = true
		local var13 = 1
		local t_2 = {}
		while true do
			if math.random() <= 0.004 then
				wait()
			end
			if var9 == p2 then
				var3("Main loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", p2)
				break
			end
			local _ = nil
			local var14 = nil
			local var15, var16, var17 = var10._text:find("<([%w-]+)[^>]*>", var13)
			local var18 = var15
			var13 = var16
			var14 = var17
			var4("[MainLoop]:#LINE# openstart=%s || tpos=%s || name=%s", _tostring(var18), _tostring(var13), _tostring(var14))
			
			if not var14 then break end
			var9 += 1
			local var19 = elementNodeModule:new(var9, _tostring(var14), var11 or {}, var12, var18, var13)
			var19.page_url = p3
			local var11 = var19
			local var20 = nil
			local text = var19:gettext()
			local var21 = 1
			while true do
				if math.random() <= 0.004 then
					wait()
				end
				if var20 == p2 then
					var3("Tag parsing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", p2)
					break
				end
				local _ = nil
				local var22 = nil
				local _ = nil
				local _ = nil
				local var23 = nil
				local _ = nil
				local var24, var25, var26, _, var27, var28, var29 = text:find("%s+([^%s=/>]+)([%s]-)(=?)([%s]-)(['\"]?)", var21)
				local var30 = var24
				var21 = var25
				var22 = var26
				local var31 = var27
				local var32 = var29
				var4("[TagLoop]:#LINE# start=%s || apos=%s || k=%s || zsp='%s' || eq='%s', quote=[%s]", _tostring(var30), _tostring(var21), _tostring(var22), _tostring(var28), _tostring(var31), _tostring(var32))
				
				if not var22 or var22 == "/>" or var22 == ">" then break end
				if var31 == "=" then
					local var33 = if var32 ~= "" then var32 .. "([^" .. var40 .. "]*)" .. var40 else "=([^%s>]*)"
					local var34, var35, var36 = text:find(var33, var21)
					local var37 = var34
					var21 = var35
					var23 = var36
					var4("[TagLoop]:#LINE# start=%s || apos=%s || v=%s || pattern=%s", _tostring(var37), _tostring(var21), _tostring(var23), _tostring(var33))
				end
				var23 = var23 or ""
				var4("[TagLoop]:#LINE# k=%s || v=%s", _tostring(var22), _tostring(var23))
				var19:addattribute(var22, var23)
				var20 = (var20 or 0) + 1
				if voidelementsModule[var19.name:lower()] then
					var12 = false
					var19:close()
				else
					t_2[var19.name] = t_2[var19.name] or {}
					table.insert(t_2[var19.name], var19)
				end
				local var38 = var13
				local var39 = nil
				while true do
					if math.random() <= 0.004 then
						wait()
					end
					if var39 == p2 then
						var3("Tag closing loop reached loop limit (%d). Consider either increasing it or checking HTML-code for syntax errors", p2)
						break
					end
					local _ = nil
					local var40 = nil
					local _ = nil
					local var41, var42, var43, var44 = var10._text:find("[^<]*<(/?)([%w-]+)", var38)
					local var45 = var41
					var38 = var42
					var40 = var43
					local var46 = var44
					var4("[TagCloseLoop]:#LINE# closestart=%s || closeend=%s || closing=%s || closename=%s", _tostring(var45), _tostring(var38), _tostring(var40), _tostring(var46))
					
					if not var40 or var40 == "" then
						continue
						break
					end
					var19 = table.remove(t_2[var46] or {}) or var19
					var45 = var10._text:find("<", var45)
					var4("[TagCloseLoop]:#LINE# closestart=%s", _tostring(var45))
					var19:close(var45, var38 + 1)
					local var11 = var19.parent
					var12 = true
					var39 = (var39 or 0) + 1
				end
			end
			return var10
		end
	end
}