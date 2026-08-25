local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local promiseModule = require(parent.Promise)
local asyncMapValue = nil
local iteratorResult = nil
local t = {
	mapAsyncIterator = function(p0, p1, p2)
		-- upvalues: promiseModule (ref), boolean (ref), asyncMapValue (write), iteratorResult (write)
		local _return = nil
		local var4 = nil
		
		if typeof(p0["return"]) == "function" then
			_return = p0["return"]
			
			var4 = function(p3)
				-- upvalues: promiseModule (copy), _return (write), p0 (ref)
				local function rethrow()
					-- upvalues: promiseModule (copy), p3 (ref)
					return promiseModule.reject(p3)
				end
				
				return _return(p0):andThen(rethrow, rethrow)
			end
		end
		local function mapResult(p4)
			-- upvalues: boolean (copy), asyncMapValue (copy), p1 (ref), iteratorResult (copy), var4 (write)
			return if boolean.toJSBoolean(p4.done) then p4 else asyncMapValue(p4.value, p1):andThen(iteratorResult, var4)
		end
		
		local var6 = if p2 then function(p5)
			-- upvalues: asyncMapValue (copy), p2 (ref), iteratorResult (copy), var4 (write)
			return asyncMapValue(p5, p2):andThen(iteratorResult, var4)
		end else nil
		
		return {
			next = function(_)
				-- upvalues: p0 (ref), mapResult (ref), var6 (write)
				return p0:next():andThen(mapResult, var6)
			end,
			["return"] = function(_)
				-- upvalues: boolean (copy), _return (write), p0 (ref), mapResult (ref), var6 (write), promiseModule (copy)
				return if boolean.toJSBoolean(_return) then _return(p0):andThen(mapResult, var6) else promiseModule.resolve({ value = nil, done = true })
			end,
			throw = function(_, p6)
				-- upvalues: p0 (ref), mapResult (ref), var6 (write), promiseModule (copy), var4 (write)
				return if typeof(p0.throw) == "function" then p0:throw(p6):andThen(mapResult, var6) else promiseModule.reject(p6):catch(var4)
			end
		}
	end
}

asyncMapValue = function(p7, p8)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p9)
		-- upvalues: p8 (ref), p7 (ref)
		return p9(p8(p7))
	end)
end

iteratorResult = function(p10)
	return { done = false, value = p10 }
end

return t