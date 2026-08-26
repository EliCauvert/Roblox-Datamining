local promiseModule = require(script:FindFirstAncestor("HttpRequest").Parent.Promise)
local httpRequestModule = require(script.Parent.HttpRequest)

return function(p1)
	-- upvalues: httpRequestModule (ref), promiseModule (ref)
	assert(type(p1.requestFunction) == "function", "Expected requestFunction to be a function")
	
	return function(p2, p3, p4)
		-- upvalues: httpRequestModule (copy), p1 (ref), promiseModule (copy)
		assert(type(p2) == "string", "Expected url to be a string")
		assert(type(p3) == "string", "Expected requestMethod to be a string")
		assert(not p4 or type(p4) == "table", "Expected options to be a table")
		local var1 = httpRequestModule.new(p1, p2, string.upper(p3), p4)
		
		return promiseModule.new(function(p5, p6)
			-- upvalues: var1 (ref)
			coroutine.wrap(function()
				-- upvalues: var1 (copy), p5 (ref), p6 (ref)
				var1:start(p5, p6)
			end)()
		end), function()
			-- upvalues: var1 (ref)
			var1:cancel()
		end
	end
end