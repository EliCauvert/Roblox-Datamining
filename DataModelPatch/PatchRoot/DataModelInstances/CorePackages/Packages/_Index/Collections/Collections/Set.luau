local DEV = _G.__DEV__
local Parent = script.Parent
local InspectModule = require(Parent.inspect)
local IsArrayModule = require(Parent.Array.isArray)
local ForEachModule = require(Parent.Array.forEach)
local FromStringModule = require(Parent.Array.from.fromString)
local _ = require(Parent.Parent.ES7Types)
local SetModule = {
	__iter = function(p1)
		return next, p1._array
	end,
	__tostring = function(p1): string
		-- upvalues: InspectModule (copy)
		local Text = "Set "
		
		if #p1._array > 0 then
			Text ..= "(" .. tostring(#p1._array) .. ") "
		end
		return Text .. InspectModule(p1._array)
	end
}
SetModule.__index = SetModule

function SetModule.new(Tbl)
	-- upvalues: IsArrayModule (copy), DEV (copy), FromStringModule (copy), SetModule (copy)
	local _map = {}
	local _array = nil
	
	if Tbl == nil then
		_array = {}
	else
		local v1 = nil
		
		if typeof(Tbl) == "table" then
			if IsArrayModule(Tbl) then
				v1 = table.clone(Tbl)
			else
				local Meta = getmetatable(Tbl)
				
				if Meta and rawget(Meta, "__iter") then
					v1 = Tbl
				elseif DEV then
					error("cannot create array from an object-like table")
				end
			end
		elseif typeof(Tbl) == "string" then
			v1 = FromStringModule(Tbl)
		else
			error(("cannot create array from value of type `%s`"):format((typeof(Tbl))))
		end
		if v1 then
			_array = table.create(#v1)
			
			for _, value in v1 do
				if not _map[value] then
					_map[value] = true
					table.insert(_array, value)
				end
			end
		else
			_array = {}
		end
	end
	return (setmetatable({ size = #_array, _map = _map, _array = _array }, SetModule))
end

function SetModule:add(p1)
	if not self._map[p1] then
		self.size += 1
		self._map[p1] = true
		table.insert(self._array, p1)
	end
	return self
end

function SetModule:clear()
	self.size = 0
	table.clear(self._map)
	table.clear(self._array)
end

function SetModule:delete(Value): boolean
	if not self._map[Value] then
		return false
	end
	self.size -= 1
	self._map[Value] = nil
	local FoundIndex: number? = table.find(self._array, Value)
	
	if FoundIndex then
		table.remove(self._array, FoundIndex)
	end
	return true
end

function SetModule:forEach(Callback, p1)
	-- upvalues: ForEachModule (copy)
	if typeof(Callback) ~= "function" then
		error("callback is not a function")
	end
	ForEachModule(self._array, function(p2)
		-- upvalues: p1 (copy), Callback (copy), self (copy)
		if p1 == nil then
			Callback(p2, p2, self)
			
			return
		else
			Callback(p1, p2, p2, self)
		end
	end)
end

function SetModule:has(p1): boolean
	return self._map[p1] ~= nil
end

function SetModule:ipairs()
	-- upvalues: DEV (copy)
	if DEV then
		warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2))
	end
	return ipairs(self._array)
end

return SetModule