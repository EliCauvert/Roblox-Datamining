local Parent = script:FindFirstAncestor("Foundation").Parent
local DashModule = require(Parent.Dash)
local ReactIsModule = require(Parent.ReactIs)

local function _(p1): boolean --[[ Line: 7 | Named "isTableNotBinding" ]]
	-- upvalues: ReactIsModule (copy)
	return type(p1) == "table" and not ReactIsModule.isBinding(p1)
end

local function deepJoin(Tbl, List) --[[ Line: 11 ]]
	-- upvalues: ReactIsModule (copy), deepJoin (copy)
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		if type(value) == "table" and not ReactIsModule.isBinding(value) then
			local Entry = Copy[i]
			
			if type(Entry) == "table" and not ReactIsModule.isBinding(Entry) then
				Copy[i] = deepJoin(Copy[i], value)
				continue
			end
		end
		Copy[i] = value
	end
	return Copy
end

return function(p1, List) --[[ Line: 23 | Named "withDefaults" ]]
	-- upvalues: deepJoin (copy), DashModule (copy)
	local t = {}
	
	if type(p1) == "table" and type(List) == "table" then
		for i, _ in List do
			t[i] = p1[i]
		end
	end
	return (DashModule.union(p1, (deepJoin(List, t))))
end