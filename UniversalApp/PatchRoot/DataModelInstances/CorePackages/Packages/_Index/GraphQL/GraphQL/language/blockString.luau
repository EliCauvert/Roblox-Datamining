local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local string = luauPolyfillModule.String
local var1 = nil
local _ = nil
local _ = nil

local function dedentBlockStringValue(p0)
	-- upvalues: string (ref), var1 (write), array (ref)
	local var3 = string.split(p0, { "\r\n", "\n", "\r" })
	local var4 = var1(p0)
	
	if var4 ~= 0 then
		for i = 2, #var3 do
			var3[i] = string.slice(var3[i], var4 + 1)
		end
	end
	local var5 = 0
	while var5 < #var3 and isBlank(var3[var5 + 1]) do
		var5 += 1
	end
	local var3Count = #var3
	while var5 < var3Count and isBlank(var3[var3Count - 1 + 1]) do
		var3Count -= 1
	end
	return array.join(array.slice(var3, var5 + 1, var3Count + 1), "\n")
end

function isBlank(p1)
	for i = 1, #p1 do
		local substring = string.sub(p1, i, i)
		
		if substring == " " or substring == "\t" then
			continue
		end
		return false
	end
	return true
end

return {
	getBlockStringIndentation = function(p2)
		-- upvalues: string (ref)
		local var8 = true
		local var9 = true
		local var10 = 0
		local var11 = nil
		local var12 = 1
		local var13 = string.len(p2)
		while var12 <= var13 do
			local var14 = string.charCodeAt(p2, var12)
			
			if var14 == 13 and string.charCodeAt(p2, var12 + 1) == 10 then
				var12 += 1
			end
			if var14 == 10 then
				var8 = false
				var9 = true
				var10 = 0
			elseif var14 == 9 or var14 == 32 then
				var10 += 1
			elseif var9 and var8 ~= true and (var11 == nil or var10 < var11) then
				var11 = var10
			end
			var9 = false
			var12 += 1
		end
		return var11 or 0
	end,
	dedentBlockStringValue = dedentBlockStringValue,
	printBlockString = function(p3, p4, p5)
		p4 = p4 or ""
		local var16 = if p5 == nil then false else p5
		local var17 = string.find(p3, "\n") == nil
		local var18 = if string.sub(p3, 1, 1) ~= " " then string.sub(p3, 1, 1) == "\t" else true
		local var19 = if var17 == true then string.sub(p3, #p3, #p3) == "\"" or (string.sub(p3, #p3, #p3) == "\\" or var16) else true
		local var20 = ""
		
		if var19 and (var17 and var18) ~= true then
			var20 ..= "\n" .. p4
		end
		var20 ..= p4 ~= "" and string.gsub(p3, "\n", "\n" .. p4) or p3
		
		if var19 then
			var20 ..= "\n"
		end
		return "\"\"\"" .. string.gsub(var20, "\"\"\"", "\\\"\"\"") .. "\"\"\""
	end
}