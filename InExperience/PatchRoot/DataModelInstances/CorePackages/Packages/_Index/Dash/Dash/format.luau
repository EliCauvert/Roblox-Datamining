local parent = script.Parent
local formatValueModule = require(parent.formatValue)
local splitOnModule = require(parent.splitOn)
local startsWithModule = require(parent.startsWith)
local concat = table.concat
local insert = table.insert

return function(p0, ...)
	-- upvalues: splitOnModule (ref), insert (ref), startsWithModule (ref), formatValueModule (ref), concat (ref)
	local var8
	local list = { ... }
	local var4 = 1
	local var5, var6 = splitOnModule(p0, "{[^{}]*}")
	local t = {}
	
	for i, v in var5 do
		insert(t, v:gsub("{{", "{"):gsub("}}", "}"))
		var8 = var6[i] and var6[i]:sub(2, -2)
		
		if var8 then
			local var9 = v:gmatch("{+$")()
			
			if var9 and #var9 % 2 == 1 then
				insert(t, var8)
				continue
			end
			local var10 = splitOnModule(var8, ":")
			local var11 = startsWithModule(var10[1], "#")
			local var12 = var11 and var10[1]:sub(2) or var10[1]
			local var13 = tonumber(var12)
			local var14 = var10[2]
			local var15 = "nil"
			
			if var13 then
				var15 = list[var13]
			elseif var12:len() > 0 then
				local var16 = list[1] and list[1][var12]
				
				if var16 ~= nil then
					var15 = var16
				end
			else
				var15 = list[var4]
				var4 += 1
			end
			if var11 then
				var15 = #var15
			end
			insert(t, formatValueModule(var15, var14 or ""))
		end
	end
	return concat(t, "")
end