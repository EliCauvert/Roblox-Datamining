local loggerModule = require(script.Parent.Parent.Logger)

local _ = function(p0, p1) --[[ line: 3 ]]
	return (p0.UnixTimestampMillis - p1.UnixTimestampMillis) / 1000
end

return function(p2) --[[ line: 23 | named "SimpleTimer" ]]
	-- upvalues: loggerModule (ref)
	local var1 = nil
	local var2 = nil
	local var3 = nil
	local var4 = nil
	local var5 = if p2 then p2.timeoutThreshold else nil
	local var6 = if p2 then p2.onReachingThreshold else nil
	
	local _ = function() --[[ line: 33 ]]
		-- upvalues: var1 (write), var2 (write)
		return if var1 and var2 then var2 - var1 else -1
	end
	
	local var7 = function() --[[ line: 40 ]]
		-- upvalues: var1 (write), var2 (write), loggerModule (copy)
		local processTime = nil
		
		if var1 and not var2 then
			processTime = os.clock()
		elseif var1 then
			loggerModule:warning("Timer has been already stopped")
		else
			loggerModule:warning("Timer has not been started yet")
		end
		return if var1 and processTime then processTime - var1 else -1
	end
	
	local _ = function() --[[ line: 54 ]]
		-- upvalues: var4 (write)
		if var4 then
			task.cancel(var4)
		end
	end
	
	local _ = function() --[[ line: 66 ]]
		-- upvalues: var5 (ref), var6 (ref), var4 (write)
		if var5 and var6 then
			var4 = task.delay(var5, function() --[[ line: 73 ]]
				-- upvalues: var4 (copy), var6 (ref)
				var4 = nil
				var6()
			end)
			
			return
		end
	end
	
	return {
		start = function(p3) --[[ line: 79 ]]
			-- upvalues: var1 (write), var3 (write), var5 (ref), var6 (ref), var4 (write), loggerModule (copy)
			if var1 then
				loggerModule:warning("Timer has been already started")
			else
				var1 = os.clock()
				var3 = p3 or DateTime.now()
				
				if p3 then
					var1 = (var3.UnixTimestampMillis - DateTime.now().UnixTimestampMillis) / 1000
				end
				if not var5 then return end
				if var6 then
					local var9 = var6
					var4 = task.delay(var5, function() --[[ line: 73 ]]
						-- upvalues: var4 (copy), var9 (ref)
						var4 = nil
						var9()
					end)
					
					return
				end
				return
			end
		end,
		getStartTimestamp = function() --[[ line: 106 ]]
			-- upvalues: var3 (write), loggerModule (copy)
			if var3 then
				return var3
			end
			loggerModule:warning("Timer has not been started yet")
			
			return nil
		end,
		stop = function() --[[ line: 92 ]]
			-- upvalues: var4 (write), var1 (write), var2 (write), loggerModule (copy)
			if var4 then
				task.cancel(var4)
			end
			if var1 and not var2 then
				var2 = os.clock()
			elseif var1 then
				loggerModule:warning("Timer has been already stopped")
			else
				loggerModule:warning("Timer has not been started yet")
			end
			return if var1 and var2 then var2 - var1 else -1
		end,
		clear = function() --[[ line: 60 ]]
			-- upvalues: var1 (write), var2 (write), var4 (write)
			var1 = nil
			var2 = nil
			
			if var4 then
				task.cancel(var4)
			end
		end,
		getTime = var7
	}
end