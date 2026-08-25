local parent = script.Parent.Parent.Parent
local promiseModule = require(parent.Promise)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local _ = require(script.Parent.ObjMap)

return {
	promiseForObject = function(p0)
		-- upvalues: object (ref), array (ref), promiseModule (ref)
		local var2 = object.keys(p0)
		
		return promiseModule.all(array.map(var2, function(p5)
			-- upvalues: p0 (ref), promiseModule (copy)
			local var3 = p0[p5]
			
			return if promiseModule.is(var3) then var3 else promiseModule.resolve(var3)
		end)):andThen(function(p1)
			-- upvalues: array (copy), var2 (ref)
			return array.reduce(p1, function(p2, p3, p4)
				-- upvalues: var2 (copy)
				p2[var2[p4]] = p3
				
				return p2
			end, {})
		end)
	end
}