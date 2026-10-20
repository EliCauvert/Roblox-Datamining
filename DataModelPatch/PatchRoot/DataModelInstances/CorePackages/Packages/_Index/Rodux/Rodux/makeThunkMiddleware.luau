local function tracebackReporter(Err)
	return debug.traceback(Err)
end

return function(p1)
	-- upvalues: tracebackReporter (copy)
	return function(Callback, p2)
		-- upvalues: p1 (copy), tracebackReporter (upval)
		return function(Callback1)
			-- upvalues: p2 (copy), p1 (upval), tracebackReporter (upval), Callback (copy)
			if typeof(Callback1) ~= "function" then
				return Callback(Callback1)
			end
			local Success, Result = xpcall(function()
				-- upvalues: Callback1 (copy), p2 (upval), p1 (upval)
				return Callback1(p2, p1)
			end, tracebackReporter)
			
			if Success then
				return Result
			else
				p2._errorReporter.reportReducerError(p2:getState(), Callback1, { message = "Caught error in thunk", thrownValue = Result })
				
				return nil
			end
		end
	end
end