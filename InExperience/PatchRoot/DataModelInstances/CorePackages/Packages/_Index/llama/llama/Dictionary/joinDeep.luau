local noneModule = require(script.Parent.Parent.None)
local copyDeepModule = require(script.Parent.copyDeep)

local function joinDeep(...)
	-- upvalues: noneModule (ref), copyDeepModule (ref), joinDeep (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		local var1 = select(i, ...)
		
		if not var1 then
			continue
		end
		for i, v in pairs(var1) do
			if v == noneModule then
				t[i] = nil
			elseif type(v) ~= "table" then
				t[i] = v
			elseif t[i] == nil or type(t[i] ~= "table") then
				t[i] = copyDeepModule(v)
			else
				t[i] = joinDeep(t[i], v)
			end
		end
	end
	return t
end

return joinDeep