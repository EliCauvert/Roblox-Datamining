local dEV = _G.__DEV__
local parent = script.Parent
local parent_1 = parent.Parent
local inspectModule = require(parent.inspect)
local isArrayModule = require(parent.Array.isArray)
local forEachModule = require(parent.Array.forEach)
local fromStringModule = require(parent.Array.from.fromString)
local _ = require(parent_1.ES7Types)
local t = {
	__iter = function(p0)
		return next, p0._array
	end,
	__tostring = function(p1)
		-- upvalues: inspectModule (ref)
		local var5 = "Set "
		
		if #p1._array > 0 then
			var5 ..= "(" .. tostring(#p1._array) .. ") "
		end
		return var5 .. inspectModule(p1._array)
	end
}
t.__index = t

function t.new(p2)
	-- upvalues: isArrayModule (ref), dEV (ref), fromStringModule (ref), t (ref)
	local list
	local _ = nil
	local t_1 = {}
	
	if p2 == nil then
		list = {}
	else
		local var7 = nil
		
		if typeof(p2) == "table" then
			if isArrayModule(p2) then
				var7 = table.clone(p2)
			else
				local var8 = getmetatable(p2)
				
				if var8 and rawget(var8, "__iter") then
					var7 = p2
				elseif dEV then
					error("cannot create array from an object-like table")
				end
			end
		elseif typeof(p2) == "string" then
			var7 = fromStringModule(p2)
		else
			error(("cannot create array from value of type `%s`"):format(typeof(p2)))
		end
		if var7 then
			list = table.create(#var7)
			
			for i, v in var7 do
				if not t_1[v] then
					t_1[v] = true
					table.insert(list, v)
				end
			end
		else
			list = {}
		end
	end
	return setmetatable({ size = #list, _map = t_1, _array = list }, t)
end

function t:add(p3)
	if not self._map[p3] then
		self.size += 1
		self._map[p3] = true
		table.insert(self._array, p3)
	end
	return self
end

function t:clear()
	self.size = 0
	table.clear(self._map)
	table.clear(self._array)
end

function t:delete(p4)
	if not self._map[p4] then
		return false
	end
	self.size -= 1
	self._map[p4] = nil
	local index = table.find(self._array, p4)
	
	if index then
		table.remove(self._array, index)
	end
	return true
end

function t:forEach(p5, p6)
	-- upvalues: forEachModule (ref)
	if typeof(p5) ~= "function" then
		error("callback is not a function")
	end
	forEachModule(self._array, function(p7)
		-- upvalues: p6 (ref), p5 (ref), self (ref)
		if p6 == nil then
			p5(p7, p7, self)
			
			return
		end
		p5(p6, p7, p7, self)
	end)
end

function t:has(p8)
	return self._map[p8] ~= nil
end

function t:ipairs()
	-- upvalues: dEV (ref)
	if dEV then
		warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2))
	end
	return ipairs(self._array)
end

return t