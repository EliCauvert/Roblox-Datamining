local t = {}
local languageModule = require(script.Language)
local keyword = languageModule.keyword
local builtin = languageModule.builtin
local libraries = languageModule.libraries
t.language = languageModule
local list = {
	{ "^[%c%s]*[%a_][%w_]*[%c%s]*", "var" },
	{ "^[%c%s]*0[xX][%da-fA-F_]+[%c%s]*", "number" },
	{ "^[%c%s]*0[bB][01_]+[%c%s]*", "number" },
	{ "^[%c%s]*%d+%.?%d*[eE][%+%-]?%d+[%c%s]*", "number" },
	{ "^[%c%s]*%d+[%._]?[%d_eE]*[%c%s]*", "number" },
	{ "^[%c%s]*(['\"])%1[%c%s]*", "string" },
	{ "^[%c%s]*(['\"])[^\n]-([^\\]%1)[%c%s]*", "string" },
	{ "^[%c%s]*(['\"]).-\n[%c%s]*", "string" },
	{ "^[%c%s]*(['\"])[^\n]*[%c%s]*", "string" },
	{ "^[%c%s]*%[(=*)%[.-%]%1%][%c%s]*", "string" },
	{ "^[%c%s]*%[=*%[.-.*[%c%s]*", "string" },
	{ "^[%c%s]*`[^\n]-`[%c%s]*", "string_inter" },
	{ "^[%c%s]*%-%-%[(=*)%[.-%]%1%][%c%s]*", "comment" },
	{ "^[%c%s]*%-%-%[=*%[.-.*[%c%s]*", "comment" },
	{ "^[%c%s]*%-%-.-\n[%c%s]*", "comment" },
	{ "^[%c%s]*%-%-.*[%c%s]*", "comment" },
	{
		"^[%c%s]*[:;<>/~%*%(%)%-={},%.#%^%+%%]+[%c%s]*",
		"operator"
	},
	{ "^[%c%s]*[%[%]]+[%c%s]*", "operator" },
	{
		"^[%c%s]*[%z\1-\127\194-\244][\128-\191]+[%c%s]*",
		"iden"
	},
	{ "^.", "iden" }
}
local t_1 = {}
local t_2 = {}

for i, v in list do
	t_1[i] = v[1]
	t_2[i] = v[2]
end
function t.scan(p0)
	-- upvalues: t_1 (ref), t_2 (ref), keyword (ref), builtin (ref), libraries (ref), t (ref)
	local var5 = 1
	local p0Count = #p0
	local var7 = ""
	local var8 = ""
	local var9 = ""
	local var10 = ""
	local thread = coroutine.create(function()
		-- upvalues: var5 (write), p0Count (ref), t_1 (copy), p0 (ref), t_2 (copy), keyword (copy), builtin (copy), var7 (write), var10 (write), var8 (write), libraries (copy), var9 (write), t (copy)
		local substring, var17, var20
		while var5 <= p0Count do
			local matchIndex, matchIndex_1
			local var12 = false
			
			for i, v in ipairs(t_1) do
				matchIndex, matchIndex_1 = string.find(p0, v, var5)
				
				if matchIndex ~= nil then
					local replaced, var19
					var5 = matchIndex_1 + 1
					var12 = true
					substring = string.sub(p0, matchIndex, matchIndex_1)
					local var16 = t_2[i]
					var17 = var16
					
					if var16 == "var" then
						replaced = string.gsub(substring, "[%c%s]+", "")
						
						if keyword[replaced] then
							var17 = "keyword"
						elseif builtin[replaced] then
							var17 = "builtin"
						elseif string.find(var7, "%.[%s%c]*$") and var10 ~= "comment" then
							var19 = libraries[string.gsub(var8, "[%c%s]+", "")]
							var17 = if var19 and var19[replaced] and not string.find(var9, "%.[%s%c]*$") then "builtin" else "iden"
						else
							var17 = "iden"
						end
					elseif var16 == "string_inter" then
						if string.find(substring, "[^\\]{") then
							var17 = nil
							replaced = true
							var20 = 1
							var19 = #substring
							while var20 <= var19 do
								local matchIndex_2, matchIndex_3 = string.find(substring, "^.-[^\\][{}]", var20)
								
								if matchIndex_2 == nil then
									coroutine.yield("string", string.sub(substring, var20))
									break
								elseif replaced then
									var20 = matchIndex_3 + 1
									coroutine.yield("string", string.sub(substring, matchIndex_2, matchIndex_3))
									replaced = false
								else
									var20 = matchIndex_3
									
									for i_1, v_1 in t.scan(string.sub(substring, matchIndex_2, matchIndex_3 - 1)) do
										coroutine.yield(i_1, v_1)
									end
									replaced = true
								end
							end
						else
							var17 = "string"
						end
					end
					var9 = var8
					var8 = var7
					var7 = substring
					var10 = var17 or var16
					
					if not var17 then break end
					coroutine.yield(var17, substring)
					break
				end
			end
			if not var12 then return end
		end
	end)
	
	return function()
		-- upvalues: thread (ref)
		if coroutine.status(thread) == "dead" then return end
		local var23, var24, var25 = coroutine.resume(thread)
		
		if var23 and var24 then
			return var24, var25
		end
	end
end

function t.navigator()
	-- upvalues: t (ref)
	local t_1 = {
		Source = "",
		_RealIndex = 0,
		_UserIndex = 0,
		_ScanThread = nil,
		TokenCache = table.create(50),
		Destroy = function(p1)
			p1.Source = nil
			p1._RealIndex = nil
			p1._UserIndex = nil
			p1.TokenCache = nil
			p1._ScanThread = nil
		end,
		SetSource = function(value, p2)
			-- upvalues: t (copy)
			value.Source = p2
			value._RealIndex = 0
			value._UserIndex = 0
			table.clear(value.TokenCache)
			value._ScanThread = coroutine.create(function()
				-- upvalues: t (copy), value (ref)
				for i, v in t.scan(value.Source) do
					value._RealIndex += 1
					value.TokenCache[value._RealIndex] = { i, v }
					coroutine.yield(i, v)
				end
			end)
		end
	}
	
	function t_1.Next()
		-- upvalues: t_1 (ref)
		t_1._UserIndex += 1
		
		if t_1._UserIndex <= t_1._RealIndex then
			return table.unpack(t_1.TokenCache[t_1._UserIndex])
		elseif coroutine.status(t_1._ScanThread) == "dead" then return end
		local var27, var28, var29 = coroutine.resume(t_1._ScanThread)
		
		if var27 and var28 then
			return var28, var29
		end
	end
	
	function t_1.Peek(p3)
		-- upvalues: t_1 (ref)
		local var30 = t_1._UserIndex + p3
		
		if var30 <= t_1._RealIndex then
			if var30 > 0 then
				return table.unpack(t_1.TokenCache[var30])
			end
			return
		elseif coroutine.status(t_1._ScanThread) == "dead" then return end
		local var36, var37
		local var31 = var30 - t_1._RealIndex
		local _ = nil
		local _ = nil
		local _ = nil
		
		for _ = 1, var31 do
			local var32, var33, var34 = coroutine.resume(t_1._ScanThread)
			local var35 = var32
			var36 = var33
			var37 = var34
			
			if not var35 and not var36 then break end
		end
		return var36, var37
	end
	
	return t_1
end

return t