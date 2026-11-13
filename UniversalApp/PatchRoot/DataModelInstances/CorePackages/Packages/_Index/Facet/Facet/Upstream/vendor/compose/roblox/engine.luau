local DynamicModule = require("../core/dynamic")
local _ = require("./types")
local v1 = nil

return {
	ambient = function()
		-- upvalues: v1 (ref)
		local V2 = v1 or require("./ambient")
		v1 = V2
		
		return V2.ambient()
	end,
	designEnvironment = function(p1)
		-- upvalues: v1 (ref)
		local V2 = v1 or require("./ambient")
		v1 = V2
		
		return V2.designEnvironment(p1)
	end,
	descendants = function(p1)
		-- upvalues: v1 (ref)
		local V2 = v1 or require("./ambient")
		v1 = V2
		
		return V2.descendants(p1)
	end,
	invoke = function(Callback, p1, p2, ...)
		-- upvalues: DynamicModule (copy)
		return DynamicModule.invoke(Callback(p1, p2), p1, ...)
	end,
	readMember = DynamicModule.read,
	writeMember = DynamicModule.write,
	service = function(p1)
		-- upvalues: v1 (ref)
		local V2 = v1 or require("./ambient")
		v1 = V2
		
		return V2.service(p1)
	end,
	cancelThread = function(p1)
		-- upvalues: v1 (ref)
		local V2 = v1 or require("./ambient")
		v1 = V2
		
		return V2.cancelThread(p1)
	end
}