local parent = script.Parent
local formatValueModule = require(parent.formatValue)
local splitOnModule = require(parent.splitOn)
local startsWithModule = require(parent.startsWith)
local concat = table.concat
local insert = table.insert

return function(p1, ...)
	-- upvalues: splitOnModule (ref), insert (ref), startsWithModule (ref), formatValueModule (ref), concat (ref)
	local var1
	local list = { ... }
	local var2 = 1
	local var3, var4 = splitOnModule(p1, "{[^{}]*}")
	local t = {}
	
	for i, v in var3 do
		insert(t, v:gsub("{{", "{"):gsub("}}", "}"))
		var1 = var4[i] and var4[i]:sub(2, -2)
		
		if var1 then
			local var5 = v:gmatch("{+$")()
			
			if var5 and #var5 % 2 == 1 then
				insert(t, var1)
				continue
			end
			local var6 = splitOnModule(var1, ":")
			local var7 = startsWithModule(var6[1], "#")
			local var8 = var7 and var6[1]:sub(2) or var6[1]
			local var9 = tonumber(var8)
			local var10 = var6[2]
			local var11 = "nil"
			
			if var9 then
				var11 = list[var9]
			elseif var8:len() > 0 then
				local var12 = list[1] and list[1][var8]
				
				if var12 ~= nil then
					var11 = var12
				end
			else
				var11 = list[var2]
				var2 += 1
			end
			if var7 then
				var11 = #var11
			end
			insert(t, formatValueModule(var11, var10 or ""))
		end
	end
	return concat(t, "")
end