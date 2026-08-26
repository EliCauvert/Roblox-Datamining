local dEV = _G.__DEV__
local parent = script.Parent
local isArrayModule = require(parent.isArray)
local _ = require(parent.Parent.Parent.ES7Types)

local function flat(p1, p2)
	-- upvalues: dEV (ref), isArrayModule (ref), flat (ref)
	if dEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.flat called on %s", typeof(p1)))
		end
		if p2 ~= nil and typeof(p2) ~= "number" then
			error("depth is not a number or nil")
		end
	end
	p2 = p2 or 1
	local t = {}
	
	for i, v in p1 do
		if not isArrayModule(v) then
			table.insert(t, v)
			continue
		end
		for i_1, v_1 in if p2 > 1 then flat(v, p2 - 1) else v do
			table.insert(t, v_1)
		end
	end
	return t
end

return flat