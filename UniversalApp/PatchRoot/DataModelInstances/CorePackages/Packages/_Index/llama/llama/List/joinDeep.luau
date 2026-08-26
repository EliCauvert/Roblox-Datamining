local noneModule = require(script.Parent.Parent.None)
local copyDeepModule = require(script.Parent.copyDeep)

local function joinDeep(...)
	-- upvalues: copyDeepModule (ref), joinDeep (ref), noneModule (ref)
	local t = {}
	local var1 = 1
	
	for i_1 = 1, select("#", ...) do
		local var2 = select(i_1, ...)
		
		if not var2 then
			continue
		end
		for i = 1, #var2 do
			if type(var2[i]) == "table" then
				if t[var1] == nil or type(t[var1] ~= "table") then
					t[var1] = copyDeepModule(var2[i])
				else
					t[var1] = joinDeep(t[var1], var2[i])
				end
			elseif var2[i] ~= noneModule then
				t[var1] = var2[i]
			end
			var1 += 1
		end
	end
	return t
end

return joinDeep