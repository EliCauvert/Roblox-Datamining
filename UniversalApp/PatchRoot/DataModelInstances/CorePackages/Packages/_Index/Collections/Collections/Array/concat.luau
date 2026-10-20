local DEV = _G.__DEV__
local Parent = script.Parent
local IsArrayModule = require(Parent.isArray)
local _ = require(Parent.Parent.Parent.ES7Types)

return function(Tbl, ...)
	-- upvalues: IsArrayModule (copy), DEV (copy)
	local v1 = 0
	local Copy = nil
	local CountTbl = nil
	
	if IsArrayModule(Tbl) then
		Copy = table.clone(Tbl)
		CountTbl = #Tbl
	else
		CountTbl = v1 + 1
		Copy = { [CountTbl] = Tbl }
	end
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		local ValueType = typeof(Selected)
		
		if Selected ~= nil then
			if ValueType ~= "table" then
				CountTbl += 1
				Copy[CountTbl] = Selected
				continue
			end
			if DEV and not IsArrayModule(Selected) then
				error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`")
			end
			for i1 = 1, #Selected do
				CountTbl += 1
				Copy[CountTbl] = Selected[i1]
			end
		end
	end
	return Copy
end