local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local string = luauPolyfillModule.String
local isNaN = luauPolyfillModule.Number.isNaN
local var1 = nil
local var2 = nil
local _ = nil

local function naturalCompare(p0, p1)
	-- upvalues: string (ref), var1 (write), var2 (write)
	local var7, var8
	local var5 = 1
	local var6 = 1
	while var5 <= #p0 and var6 <= #p1 do
		var7 = string.charCodeAt(p0, var5)
		var8 = string.charCodeAt(p1, var6)
		
		if not var1(var7) or not var1(var8) then
			if var7 >= var8 then
				if var8 >= var7 then
					var5 += 1
					var6 += 1
					continue
				end
				return 1
			end
			return -1
		end
		local var9 = 0
		repeat
			var5 += 1
			var9 = var9 * 10 + var7 - var2
			var7 = string.charCodeAt(p0, var5)
		until not (var1(var7) and var9 > 0)
		local var10 = 0
		repeat
			var6 += 1
			var10 = var10 * 10 + var8 - var2
			var8 = string.charCodeAt(p1, var6)
		until not (var1(var8) and var10 > 0)
		if var9 >= var10 then
			if var10 < var9 then
				return 1
			end
		end
		return -1
	end
	return #p0 - #p1
end

var2 = 48
local var4 = 57

var1 = function(p2)
	-- upvalues: isNaN (ref), var2 (write), var4 (write)
	return not isNaN(p2) and (var2 <= p2 and p2 <= var4)
end

return { naturalCompare = naturalCompare }