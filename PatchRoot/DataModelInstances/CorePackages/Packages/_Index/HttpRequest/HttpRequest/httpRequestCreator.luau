-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local promiseModule = require(script:FindFirstAncestor("HttpRequest").Parent.Promise)
local httpRequestModule = require(script.Parent.HttpRequest)

return function(p0) --[[ line: 6 ]]
	-- upvalues: httpRequestModule (ref), promiseModule (ref)
	assert(type(p0.requestFunction) == "function", "Expected requestFunction to be a function")
	
	return function(p1, p2, p3) --[[ line: 9 ]]
		-- upvalues: httpRequestModule (copy), p0 (ref), promiseModule (copy)
		assert(type(p1) == "string", "Expected url to be a string")
		assert(type(p2) == "string", "Expected requestMethod to be a string")
		assert(not p3 or type(p3) == "table", "Expected options to be a table")
		local var2 = httpRequestModule.new(p0, p1, string.upper(p2), p3)
		
		return promiseModule.new(function(p4, p5) --[[ line: 17 ]]
			-- upvalues: var2 (ref)
			coroutine.wrap(function() --[[ line: 18 ]]
				-- upvalues: var2 (copy), p4 (ref), p5 (ref)
				var2:start(p4, p5)
			end)()
		end), function() --[[ line: 23 | named "cancel" ]]
			-- upvalues: var2 (ref)
			var2:cancel()
		end
	end
end