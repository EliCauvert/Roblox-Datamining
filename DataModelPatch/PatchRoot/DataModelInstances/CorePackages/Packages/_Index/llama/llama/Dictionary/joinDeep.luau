local NoneModule = require(script.Parent.Parent.None)
local CopyDeepModule = require(script.Parent.copyDeep)

local function joinDeep(...)
	-- upvalues: NoneModule (copy), CopyDeepModule (copy), joinDeep (copy)
	local NoneModules = {}
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected then
			for i1, value in pairs(Selected) do
				if value == NoneModule then
					NoneModules[i1] = nil
				elseif type(value) ~= "table" then
					NoneModules[i1] = value
				elseif NoneModules[i1] == nil or type(NoneModules[i1] ~= "table") then
					NoneModules[i1] = CopyDeepModule(value)
				else
					NoneModules[i1] = joinDeep(NoneModules[i1], value)
				end
			end
		end
	end
	return NoneModules
end

return joinDeep