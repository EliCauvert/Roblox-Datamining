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
function t.scan(p1)
	-- upvalues: t_1 (ref), t_2 (ref), keyword (ref), builtin (ref), libraries (ref), t (ref)
	local var1 = 1
	local p0Count = #p1
	local var2 = ""
	local var3 = ""
	local var4 = ""
	local var5 = ""
	local thread = coroutine.create(function()
		-- upvalues: var1 (write), p0Count (ref), t_1 (copy), p1 (ref), t_2 (copy), keyword (copy), builtin (copy), var2 (write), var5 (write), var3 (write), libraries (copy), var4 (write), t (copy)
		local substring, var6, var7
		while var1 <= p0Count do
			local matchIndex, matchIndex_1
			local var8 = false
			
			for i, v in ipairs(t_1) do
				matchIndex, matchIndex_1 = string.find(p1, v, var1)
				
				if matchIndex ~= nil then
					local replaced, var9
					var1 = matchIndex_1 + 1
					var8 = true
					substring = string.sub(p1, matchIndex, matchIndex_1)
					local var10 = t_2[i]
					var6 = var10
					
					if var10 == "var" then
						replaced = string.gsub(substring, "[%c%s]+", "")
						
						if keyword[replaced] then
							var6 = "keyword"
						elseif builtin[replaced] then
							var6 = "builtin"
						elseif string.find(var2, "%.[%s%c]*$") and var5 ~= "comment" then
							var9 = libraries[string.gsub(var3, "[%c%s]+", "")]
							var6 = if var9 and var9[replaced] and not string.find(var4, "%.[%s%c]*$") then "builtin" else "iden"
						else
							var6 = "iden"
						end
					elseif var10 == "string_inter" then
						if string.find(substring, "[^\\]{") then
							var6 = nil
							replaced = true
							var7 = 1
							var9 = #substring
							while var7 <= var9 do
								local matchIndex_2, matchIndex_3 = string.find(substring, "^.-[^\\][{}]", var7)
								
								if matchIndex_2 == nil then
									coroutine.yield("string", string.sub(substring, var7))
									break
								elseif replaced then
									var7 = matchIndex_3 + 1
									coroutine.yield("string", string.sub(substring, matchIndex_2, matchIndex_3))
									replaced = false
								else
									var7 = matchIndex_3
									
									for i_1, v_1 in t.scan(string.sub(substring, matchIndex_2, matchIndex_3 - 1)) do
										coroutine.yield(i_1, v_1)
									end
									replaced = true
								end
							end
						else
							var6 = "string"
						end
					end
					var4 = var3
					var3 = var2
					var2 = substring
					var5 = var6 or var10
					
					if not var6 then break end
					coroutine.yield(var6, substring)
					break
				end
			end
			if not var8 then return end
		end
	end)
	
	return function()
		-- upvalues: thread (ref)
		if coroutine.status(thread) == "dead" then return end
		local var11, var12, var13 = coroutine.resume(thread)
		
		if var11 and var12 then
			return var12, var13
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
		Destroy = function(p2)
			p2.Source = nil
			p2._RealIndex = nil
			p2._UserIndex = nil
			p2.TokenCache = nil
			p2._ScanThread = nil
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
		local var11, var12, var13 = coroutine.resume(t_1._ScanThread)
		
		if var11 and var12 then
			return var12, var13
		end
	end
	
	function t_1.Peek(p3)
		-- upvalues: t_1 (ref)
		local var11 = t_1._UserIndex + p3
		
		if var11 <= t_1._RealIndex then
			if var11 > 0 then
				return table.unpack(t_1.TokenCache[var11])
			end
			return
		elseif coroutine.status(t_1._ScanThread) == "dead" then return end
		local var12, var13
		local var14 = var11 - t_1._RealIndex
		local _ = nil
		local _ = nil
		local _ = nil
		
		for _ = 1, var14 do
			local var15, var16, var17 = coroutine.resume(t_1._ScanThread)
			local var18 = var15
			var12 = var16
			var13 = var17
			
			if not var18 and not var12 then break end
		end
		return var12, var13
	end
	
	return t_1
end

return t