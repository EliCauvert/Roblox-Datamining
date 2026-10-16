local PromiseModule = require(script:FindFirstAncestor("HttpRequest").Parent.Promise)
local HttpRequestModule = require(script.Parent.HttpRequest)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: HttpRequestModule (copy), PromiseModule (copy)
	assert(type(p1.requestFunction) == "function", "Expected requestFunction to be a function")
	
	return function(p2, Text: string, p3) --[[ Line: 9 ]]
		-- upvalues: HttpRequestModule (upval), p1 (copy), PromiseModule (upval)
		assert(type(p2) == "string", "Expected url to be a string")
		assert(type(Text) == "string", "Expected requestMethod to be a string")
		assert(not p3 or type(p3) == "table", "Expected options to be a table")
		local NewHttpRequest = HttpRequestModule.new(p1, p2, string.upper(Text), p3)
		
		return PromiseModule.new(function(p4, p5) --[[ Line: 17 ]]
			-- upvalues: NewHttpRequest (copy)
			coroutine.wrap(function() --[[ Line: 18 ]]
				-- upvalues: NewHttpRequest (upval), p4 (copy), p5 (copy)
				NewHttpRequest:start(p4, p5)
			end)()
		end), function() --[[ Line: 23 | Named "cancel" ]]
			-- upvalues: NewHttpRequest (copy)
			NewHttpRequest:cancel()
		end
	end
end