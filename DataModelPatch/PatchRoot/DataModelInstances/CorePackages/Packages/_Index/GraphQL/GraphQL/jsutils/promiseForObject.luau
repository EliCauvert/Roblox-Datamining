local Parent = script.Parent.Parent.Parent
local PromiseModule = require(Parent.Promise)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local _ = require(script.Parent.ObjMap)

return {
	promiseForObject = function(p1)
		-- upvalues: Object (copy), Array (copy), PromiseModule (copy)
		local KeysResult = Object.keys(p1)
		
		return PromiseModule.all((Array.map(KeysResult, function(p2)
			-- upvalues: p1 (copy), PromiseModule (upval)
			local v1 = p1[p2]
			
			return if PromiseModule.is(v1) then v1 else PromiseModule.resolve(v1)
		end))):andThen(function(Result)
			-- upvalues: Array (upval), KeysResult (copy)
			return Array.reduce(Result, function(p2, p3, p4)
				-- upvalues: KeysResult (upval)
				p2[KeysResult[p4]] = p3
				
				return p2
			end, {})
		end)
	end
}