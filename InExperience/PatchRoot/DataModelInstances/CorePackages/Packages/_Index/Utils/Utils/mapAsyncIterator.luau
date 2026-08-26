local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local promiseModule = require(parent.Promise)
local asyncMapValue = nil
local iteratorResult = nil
local t = {
	mapAsyncIterator = function(p1, p2, p3)
		-- upvalues: promiseModule (ref), boolean (ref), asyncMapValue (write), iteratorResult (write)
		local _return = nil
		local var1 = nil
		
		if typeof(p1["return"]) == "function" then
			_return = p1["return"]
			
			var1 = function(p4)
				-- upvalues: promiseModule (copy), _return (write), p1 (ref)
				local function rethrow()
					-- upvalues: promiseModule (copy), p4 (ref)
					return promiseModule.reject(p4)
				end
				
				return _return(p1):andThen(rethrow, rethrow)
			end
		end
		local function mapResult(p4)
			-- upvalues: boolean (copy), asyncMapValue (copy), p2 (ref), iteratorResult (copy), var1 (write)
			return if boolean.toJSBoolean(p4.done) then p4 else asyncMapValue(p4.value, p2):andThen(iteratorResult, var1)
		end
		
		local var2 = if p3 then function(p4)
			-- upvalues: asyncMapValue (copy), p3 (ref), iteratorResult (copy), var1 (write)
			return asyncMapValue(p4, p3):andThen(iteratorResult, var1)
		end else nil
		
		return {
			next = function(_)
				-- upvalues: p1 (ref), mapResult (ref), var2 (write)
				return p1:next():andThen(mapResult, var2)
			end,
			["return"] = function(_)
				-- upvalues: boolean (copy), _return (write), p1 (ref), mapResult (ref), var2 (write), promiseModule (copy)
				return if boolean.toJSBoolean(_return) then _return(p1):andThen(mapResult, var2) else promiseModule.resolve({ value = nil, done = true })
			end,
			throw = function(_, p4)
				-- upvalues: p1 (ref), mapResult (ref), var2 (write), promiseModule (copy), var1 (write)
				return if typeof(p1.throw) == "function" then p1:throw(p4):andThen(mapResult, var2) else promiseModule.reject(p4):catch(var1)
			end
		}
	end
}

asyncMapValue = function(p1, p2)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		return p3(p2(p1))
	end)
end

iteratorResult = function(p1)
	return { done = false, value = p1 }
end

return t