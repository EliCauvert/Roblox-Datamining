local parent = script.Parent.Parent.Parent
local promiseModule = require(parent.Promise)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local _ = require(script.Parent.ObjMap)

return {
	promiseForObject = function(p1)
		-- upvalues: object (ref), array (ref), promiseModule (ref)
		local var1 = object.keys(p1)
		
		return promiseModule.all(array.map(var1, function(p2)
			-- upvalues: p1 (ref), promiseModule (copy)
			local var2 = p1[p2]
			
			return if promiseModule.is(var2) then var2 else promiseModule.resolve(var2)
		end)):andThen(function(p2)
			-- upvalues: array (copy), var1 (ref)
			return array.reduce(p2, function(p3, p4, p5)
				-- upvalues: var1 (copy)
				p3[var1[p5]] = p4
				
				return p3
			end, {})
		end)
	end
}