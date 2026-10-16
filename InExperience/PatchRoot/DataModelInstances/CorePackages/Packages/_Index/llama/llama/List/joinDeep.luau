local NoneModule = require(script.Parent.Parent.None)
local CopyDeepModule = require(script.Parent.copyDeep)

local function joinDeep(...) --[[ Line: 5 ]]
	-- upvalues: CopyDeepModule (copy), joinDeep (copy), NoneModule (copy)
	local t = {}
	local Count = 1
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected then
			for i1 = 1, #Selected do
				if type(Selected[i1]) == "table" then
					if t[Count] == nil or type(t[Count] ~= "table") then
						t[Count] = CopyDeepModule(Selected[i1])
					else
						t[Count] = joinDeep(t[Count], Selected[i1])
					end
				elseif Selected[i1] ~= NoneModule then
					t[Count] = Selected[i1]
				end
				Count += 1
			end
		end
	end
	return t
end

return joinDeep