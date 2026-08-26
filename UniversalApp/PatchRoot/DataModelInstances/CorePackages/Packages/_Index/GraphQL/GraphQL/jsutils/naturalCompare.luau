local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local string = luauPolyfillModule.String
local isNaN = luauPolyfillModule.Number.isNaN
local var1 = nil
local var2 = nil
local _ = nil

local function naturalCompare(p1, p2)
	-- upvalues: string (ref), var1 (write), var2 (write)
	local var3, var4
	local var5 = 1
	local var6 = 1
	while var5 <= #p1 and var6 <= #p2 do
		var3 = string.charCodeAt(p1, var5)
		var4 = string.charCodeAt(p2, var6)
		
		if not var1(var3) or not var1(var4) then
			if var3 >= var4 then
				if var4 >= var3 then
					var5 += 1
					var6 += 1
					continue
				end
				return 1
			end
			return -1
		end
		local var7 = 0
		repeat
			var5 += 1
			var7 = var7 * 10 + var3 - var2
			var3 = string.charCodeAt(p1, var5)
		until not (var1(var3) and var7 > 0)
		local var8 = 0
		repeat
			var6 += 1
			var8 = var8 * 10 + var4 - var2
			var4 = string.charCodeAt(p2, var6)
		until not (var1(var4) and var8 > 0)
		if var7 >= var8 then
			if var8 < var7 then
				return 1
			end
		end
		return -1
	end
	return #p1 - #p2
end

var2 = 48
local var9 = 57

var1 = function(p3)
	-- upvalues: isNaN (ref), var2 (write), var9 (write)
	return not isNaN(p3) and (var2 <= p3 and p3 <= var9)
end

return { naturalCompare = naturalCompare }