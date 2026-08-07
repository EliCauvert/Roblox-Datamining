-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local function tracebackReporter(p0) --[[ line: 9 ]]
	return debug.traceback(p0)
end

return function(p1) --[[ line: 13 | named "makeThunkMiddleware" ]]
	-- upvalues: tracebackReporter (ref)
	return function(p2, p3) --[[ line: 14 | named "thunkMiddleware" ]]
		-- upvalues: p1 (ref), tracebackReporter (copy)
		return function(p4) --[[ line: 15 ]]
			-- upvalues: p3 (ref), p1 (copy), tracebackReporter (copy), p2 (ref)
			if typeof(p4) ~= "function" then
				return p2(p4)
			end
			local ok, status = xpcall(function() --[[ line: 17 ]]
				-- upvalues: p4 (ref), p3 (copy), p1 (copy)
				return p4(p3, p1)
			end, tracebackReporter)
			
			if ok then
				return status
			end
			p3._errorReporter.reportReducerError(p3:getState(), p4, { message = "Caught error in thunk", thrownValue = status })
			
			return nil
		end
	end
end