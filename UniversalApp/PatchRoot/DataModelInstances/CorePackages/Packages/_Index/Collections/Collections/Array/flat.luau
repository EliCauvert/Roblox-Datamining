local dEV = _G.__DEV__
local parent = script.Parent
local isArrayModule = require(parent.isArray)
local _ = require(parent.Parent.Parent.ES7Types)

local function flat(p0, p1)
	-- upvalues: dEV (ref), isArrayModule (ref), flat (ref)
	if dEV then
		if typeof(p0) ~= "table" then
			error(string.format("Array.flat called on %s", typeof(p0)))
		end
		if p1 ~= nil and typeof(p1) ~= "number" then
			error("depth is not a number or nil")
		end
	end
	p1 = p1 or 1
	local t = {}
	
	for i, v in p0 do
		if not isArrayModule(v) then
			table.insert(t, v)
			continue
		end
		for i_1, v_1 in if p1 > 1 then flat(v, p1 - 1) else v do
			table.insert(t, v_1)
		end
	end
	return t
end

return flat