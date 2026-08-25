local array = require(script.Parent.Parent.LuauPolyfill).Array
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: array (ref), t (ref)
	local t_2
	local t_1 = {}
	local _ = nil
	
	if array.isArray(p0) then
		t_2 = {}
		
		for i, v in p0 do
			t_2[v[1]] = v[2]
		end
	else
		t_2 = p0 or {}
	end
	t_1.headerList = t_2
	t_1.guard = "none"
	setmetatable(t_1, t)
	
	return t_1
end

function t:append(p1, p2)
	if self.guard == "immutable" then
		error("TypeError: tried to append header to immutable Headers object")
	end
	self.headerList[p1] = p2
end

function t:delete(p3)
	if self.guard == "immutable" then
		error("TypeError: tried to delete key on immutable Headers object")
	end
	if self:has(p3) then
		self.headerList[p3] = nil
		
		return
	end
end

function t:get(p4)
	return self.headerList[p4]
end

function t:has(p5)
	return self.headerList[p5] ~= nil
end

function t:set(p6, p7)
	if self.guard == "immutable" then
		error("TypeError: tried to set key on immutable Headers object")
	end
	self.headerList[p6] = p7
end

function t:__iter()
	return next, self.headerList
end

return { Headers = t }