local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String
local var1 = nil
local _ = nil
local _ = nil

local function dedentBlockStringValue(p1)
	-- upvalues: string (ref), var1 (write), array (ref)
	local var2 = string.split(p1, { "\r\n", "\n", "\r" })
	local var3 = var1(p1)
	
	if var3 ~= 0 then
		for i = 2, #var2 do
			var2[i] = string.slice(var2[i], var3 + 1)
		end
	end
	local var4 = 0
	while var4 < #var2 and isBlank(var2[var4 + 1]) do
		var4 += 1
	end
	local var3Count = #var2
	while var4 < var3Count and isBlank(var2[var3Count - 1 + 1]) do
		var3Count -= 1
	end
	return array.join(array.slice(var2, var4 + 1, var3Count + 1), "\n")
end

function isBlank(p2)
	for i = 1, #p2 do
		local substring = string.sub(p2, i, i)
		
		if substring == " " or substring == "\t" then
			continue
		end
		return false
	end
	return true
end

return {
	getBlockStringIndentation = function(p3)
		-- upvalues: string (ref)
		local var5 = true
		local var6 = true
		local var7 = 0
		local var8 = nil
		local var9 = 1
		local var10 = string.len(p3)
		while var9 <= var10 do
			local var11 = string.charCodeAt(p3, var9)
			
			if var11 == 13 and string.charCodeAt(p3, var9 + 1) == 10 then
				var9 += 1
			end
			if var11 == 10 then
				var5 = false
				var6 = true
				var7 = 0
			elseif var11 == 9 or var11 == 32 then
				var7 += 1
			elseif var6 and var5 ~= true and (var8 == nil or var7 < var8) then
				var8 = var7
			end
			var6 = false
			var9 += 1
		end
		return var8 or 0
	end,
	dedentBlockStringValue = dedentBlockStringValue,
	printBlockString = function(p4, p5, p6)
		p5 = p5 or ""
		local var12 = if p6 == nil then false else p6
		local var13 = string.find(p4, "\n") == nil
		local var14 = if string.sub(p4, 1, 1) ~= " " then string.sub(p4, 1, 1) == "\t" else true
		local var15 = if var13 == true then string.sub(p4, #p4, #p4) == "\"" or (string.sub(p4, #p4, #p4) == "\\" or var12) else true
		local var16 = ""
		
		if var15 and (var13 and var14) ~= true then
			var16 ..= "\n" .. p4
		end
		var16 ..= p5 ~= "" and string.gsub(p4, "\n", "\n" .. p4) or p4
		
		if var15 then
			var16 ..= "\n"
		end
		return "\"\"\"" .. string.gsub(var16, "\"\"\"", "\\\"\"\"") .. "\"\"\""
	end
}