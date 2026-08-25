local parent = script.Parent
local _ = require(parent.Types)

local function _(p0)
	-- upvalues: parent (ref)
	require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(p0)
end

local var0 = function()
	return {}
end

local function class(p1, p2)
	-- upvalues: var0 (ref), class (ref), parent (ref)
	p2 = p2 or var0
	local t = { name = p1 }
	
	function t.new(...)
		-- upvalues: p2 (ref), t (ref)
		local var4 = p2(...)
		setmetatable(var4, {
			__index = t,
			__tostring = t.toString,
			__eq = t.equals,
			__lt = t.__lt,
			__le = t.__le,
			__add = t.__add,
			__sub = t.__sub,
			__mul = t.__mul,
			__div = t.__div,
			__mod = t.__mod
		})
		var4.Class = t
		var4:_init(...)
		
		return var4
	end
	
	function t._init(_) end
	
	function t.isInstance(p3)
		-- upvalues: t (ref)
		local ok, status = pcall(function()
			-- upvalues: p3 (ref), t (copy)
			local var5 = getmetatable(p3)
			while var5 do
				if var5.__index ~= t then
					var5 = getmetatable(var5.__index)
					continue
				end
				return true
			end
			return false
		end)
		
		return ok and status
	end
	
	function t.extend(p4, p5, p6)
		-- upvalues: class (copy), t (ref)
		local var6 = class(p5, p6 or t.new)
		setmetatable(var6, { __index = p4 })
		
		return var6
	end
	
	function t.toString(p7)
		return p7.name
	end
	
	function t.equals(p8, p9)
		return rawequal(p8, p9)
	end
	
	function t:__lt(_)
		-- upvalues: p1 (ref), parent (copy)
		require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__lt", className = p1 })
	end
	
	function t:__le(_)
		-- upvalues: p1 (ref), parent (copy)
		require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__le", className = p1 })
	end
	
	function t:__add()
		-- upvalues: p1 (ref), parent (copy)
		require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__add", className = p1 })
	end
	
	function t:__sub()
		-- upvalues: p1 (ref), parent (copy)
		require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__sub", className = p1 })
	end
	
	function t:__mul()
		-- upvalues: p1 (ref), parent (copy)
		require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__mul", className = p1 })
	end
	
	function t:__div()
		-- upvalues: p1 (ref), parent (copy)
		require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__div", className = p1 })
	end
	
	function t:__mod()
		-- upvalues: p1 (ref), parent (copy)
		require(parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__mod", className = p1 })
	end
	
	return t
end

return class