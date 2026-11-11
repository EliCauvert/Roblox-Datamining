local Parent = script.Parent.Parent
local Boolean = require(Parent.LuauPolyfill).Boolean
local PromiseModule = require(Parent.Promise)
local Callback = nil
local IteratorResult = nil
local MapAsyncIteratorModule = {
	mapAsyncIterator = function(p1, p2, p3)
		-- upvalues: PromiseModule (copy), Boolean (copy), Callback (ref), IteratorResult (ref)
		local ReturnFunction = nil
		local v1: ((any) -> any)? = nil
		
		if typeof(p1["return"]) == "function" then
			ReturnFunction = p1["return"]
			
			v1 = function(Err)
				-- upvalues: PromiseModule (upval), ReturnFunction (ref), p1 (copy)
				local function rethrow()
					-- upvalues: PromiseModule (upval), Err (copy)
					return PromiseModule.reject(Err)
				end
				
				return ReturnFunction(p1):andThen(rethrow, rethrow)
			end
		end
		local function mapResult(Result)
			-- upvalues: Boolean (upval), Callback (upval), p2 (copy), IteratorResult (upval), v1 (ref)
			return if Boolean.toJSBoolean(Result.done) then Result else Callback(Result.value, p2):andThen(IteratorResult, v1)
		end
		
		local v2 = if p3 then function(p4)
			-- upvalues: Callback (upval), p3 (copy), IteratorResult (upval), v1 (ref)
			return Callback(p4, p3):andThen(IteratorResult, v1)
		end else nil
		
		return {
			next = function(_)
				-- upvalues: p1 (copy), mapResult (copy), v2 (ref)
				return p1:next():andThen(mapResult, v2)
			end,
			["return"] = function(_)
				-- upvalues: Boolean (upval), ReturnFunction (ref), p1 (copy), mapResult (copy), v2 (ref), PromiseModule (upval)
				return if Boolean.toJSBoolean(ReturnFunction) then ReturnFunction(p1):andThen(mapResult, v2) else PromiseModule.resolve({ value = nil, done = true })
			end,
			throw = function(_, p4)
				-- upvalues: p1 (copy), mapResult (copy), v2 (ref), PromiseModule (upval), v1 (ref)
				return if typeof(p1.throw) == "function" then p1.throw(p1, p4):andThen(mapResult, v2) else PromiseModule.reject(p4):catch(v1)
			end
		}
	end
}

Callback = function(p1, Callback)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback1)
		-- upvalues: Callback (copy), p1 (copy)
		return Callback1(Callback(p1))
	end)
end

IteratorResult = function(Result)
	return { done = false, value = Result }
end

return MapAsyncIteratorModule