local function tracebackReporter(p1)
	return debug.traceback(p1)
end

return function(p1)
	-- upvalues: tracebackReporter (ref)
	return function(p2, p3)
		-- upvalues: p1 (ref), tracebackReporter (copy)
		return function(p4)
			-- upvalues: p3 (ref), p1 (copy), tracebackReporter (copy), p2 (ref)
			if typeof(p4) ~= "function" then
				return p2(p4)
			end
			local ok, status = xpcall(function()
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