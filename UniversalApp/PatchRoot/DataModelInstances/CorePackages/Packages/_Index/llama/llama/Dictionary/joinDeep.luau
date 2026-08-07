local noneModule = require(script.Parent.Parent.None)
local copyDeepModule = require(script.Parent.copyDeep)

local function joinDeep(...) --[[ line: 5 ]]
	-- upvalues: noneModule (ref), copyDeepModule (ref), joinDeep (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		local var4 = select(i, ...)
		
		if not var4 then
			continue
		end
		for i, v in pairs(var4) do
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