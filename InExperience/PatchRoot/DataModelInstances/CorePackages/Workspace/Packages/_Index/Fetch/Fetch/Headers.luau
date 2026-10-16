local Array = require(script.Parent.Parent.LuauPolyfill).Array
local Module = {}
Module.__index = Module

function Module.new(List) --[[ Line: 36 ]]
	-- upvalues: Array (copy), Module (copy)
	local t = {}
	local HeaderList = nil
	
	if Array.isArray(List) then
		HeaderList = {}
		
		for _, value in List do
			HeaderList[value[1]] = value[2]
		end
	else
		HeaderList = List or {}
	end
	t.headerList = HeaderList
	t.guard = "none"
	setmetatable(t, Module)
	
	return t
end

function Module:append(p1, p2) --[[ Line: 56 ]]
	if self.guard == "immutable" then
		error("TypeError: tried to append header to immutable Headers object")
	end
	self.headerList[p1] = p2
end

function Module:delete(p1) --[[ Line: 64 ]]
	if self.guard == "immutable" then
		error("TypeError: tried to delete key on immutable Headers object")
	end
	if self:has(p1) then
		self.headerList[p1] = nil
		
		return
	end
end

function Module:get(p1) --[[ Line: 76 ]]
	return self.headerList[p1]
end

function Module:has(p1): boolean --[[ Line: 80 ]]
	return self.headerList[p1] ~= nil
end

function Module:set(p1, p2) --[[ Line: 84 ]]
	if self.guard == "immutable" then
		error("TypeError: tried to set key on immutable Headers object")
	end
	self.headerList[p1] = p2
end

function Module:__iter() --[[ Line: 91 ]]
	return next, self.headerList
end

return { Headers = Module }