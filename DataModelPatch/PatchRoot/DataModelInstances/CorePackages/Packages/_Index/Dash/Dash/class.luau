local Parent = script.Parent
local _ = require(Parent.Types)

local function _(p1)
	-- upvalues: Parent (copy)
	require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(p1)
end

local function v3()
	return {}
end

local function class(ClassName, p1)
	-- upvalues: v3 (copy), class (copy), Parent (copy)
	local Callback = p1 or v3
	local Class = { name = ClassName }
	
	function Class.new(...)
		-- upvalues: Callback (copy), Class (copy)
		local CallbackResult = Callback(...)
		setmetatable(CallbackResult, {
			__index = Class,
			__tostring = Class.toString,
			__eq = Class.equals,
			__lt = Class.__lt,
			__le = Class.__le,
			__add = Class.__add,
			__sub = Class.__sub,
			__mul = Class.__mul,
			__div = Class.__div,
			__mod = Class.__mod
		})
		CallbackResult.Class = Class
		CallbackResult:_init(...)
		
		return CallbackResult
	end
	
	function Class:_init() end
	
	function Class.isInstance(p2)
		-- upvalues: Class (copy)
		local Success, Result = pcall(function(): boolean
			-- upvalues: p2 (copy), Class (upval)
			local Meta = getmetatable(p2)
			while Meta do
				if Meta.__index == Class then
					return true
				end
				Meta = getmetatable(Meta.__index)
			end
			return false
		end)
		
		return Success and Result
	end
	
	function Class.extend(p3, ClassName, p4)
		-- upvalues: class (upval), Class (copy)
		local ClassResult = class(ClassName, p4 or Class.new)
		setmetatable(ClassResult, { __index = p3 })
		
		return ClassResult
	end
	
	function Class.toString(p3)
		return p3.name
	end
	
	function Class.equals(p3, p4)
		return (rawequal(p3, p4))
	end
	
	function Class:__lt(_)
		-- upvalues: ClassName (copy), Parent (upval)
		require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__lt", className = ClassName })
	end
	
	function Class:__le(_)
		-- upvalues: ClassName (copy), Parent (upval)
		require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__le", className = ClassName })
	end
	
	function Class:__add()
		-- upvalues: ClassName (copy), Parent (upval)
		require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__add", className = ClassName })
	end
	
	function Class:__sub()
		-- upvalues: ClassName (copy), Parent (upval)
		require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__sub", className = ClassName })
	end
	
	function Class:__mul()
		-- upvalues: ClassName (copy), Parent (upval)
		require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__mul", className = ClassName })
	end
	
	function Class:__div()
		-- upvalues: ClassName (copy), Parent (upval)
		require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__div", className = ClassName })
	end
	
	function Class:__mod()
		-- upvalues: ClassName (copy), Parent (upval)
		require(Parent.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw({ methodName = "__mod", className = ClassName })
	end
	
	return Class
end

return class