local dEV = _G.__DEV__
local parent = script.Parent
local parent_1 = parent.Parent
local inspectModule = require(parent.inspect)
local isArrayModule = require(parent.Array.isArray)
local forEachModule = require(parent.Array.forEach)
local fromStringModule = require(parent.Array.from.fromString)
local _ = require(parent_1.ES7Types)
local t = {
	__iter = function(p1)
		return next, p1._array
	end,
	__tostring = function(p1)
		-- upvalues: inspectModule (ref)
		local var1 = "Set "
		
		if #p1._array > 0 then
			var1 ..= "(" .. tostring(#p1._array) .. ") "
		end
		return var1 .. inspectModule(p1._array)
	end
}
t.__index = t

function t.new(p1)
	-- upvalues: isArrayModule (ref), dEV (ref), fromStringModule (ref), t (ref)
	local list
	local _ = nil
	local t_1 = {}
	
	if p1 == nil then
		list = {}
	else
		local var1 = nil
		
		if typeof(p1) == "table" then
			if isArrayModule(p1) then
				var1 = table.clone(p1)
			else
				local var2 = getmetatable(p1)
				
				if var2 and rawget(var2, "__iter") then
					var1 = p1
				elseif dEV then
					error("cannot create array from an object-like table")
				end
			end
		elseif typeof(p1) == "string" then
			var1 = fromStringModule(p1)
		else
			error(("cannot create array from value of type `%s`"):format(typeof(p1)))
		end
		if var1 then
			list = table.create(#var1)
			
			for i, v in var1 do
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

function t:add(p2)
	if not self._map[p2] then
		self.size += 1
		self._map[p2] = true
		table.insert(self._array, p2)
	end
	return self
end

function t:clear()
	self.size = 0
	table.clear(self._map)
	table.clear(self._array)
end

function t:delete(p2)
	if not self._map[p2] then
		return false
	end
	self.size -= 1
	self._map[p2] = nil
	local index = table.find(self._array, p2)
	
	if index then
		table.remove(self._array, index)
	end
	return true
end

function t:forEach(p2, p3)
	-- upvalues: forEachModule (ref)
	if typeof(p2) ~= "function" then
		error("callback is not a function")
	end
	forEachModule(self._array, function(p4)
		-- upvalues: p3 (ref), p2 (ref), self (ref)
		if p3 == nil then
			p2(p4, p4, self)
			
			return
		end
		p2(p3, p4, p4, self)
	end)
end

function t:has(p2)
	return self._map[p2] ~= nil
end

function t:ipairs()
	-- upvalues: dEV (ref)
	if dEV then
		warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2))
	end
	return ipairs(self._array)
end

return t