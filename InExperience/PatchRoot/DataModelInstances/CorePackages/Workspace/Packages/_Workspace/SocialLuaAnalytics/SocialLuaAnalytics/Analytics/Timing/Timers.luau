local httpService = game:GetService("HttpService")
local simpleTimerModule = require(script.Parent.SimpleTimer)
local loggerModule = require(script.Parent.Parent.Logger)

return function(p1)
	-- upvalues: loggerModule (ref), httpService (ref), simpleTimerModule (ref)
	local t = {}
	
	local _ = function(p2)
		-- upvalues: t (ref), loggerModule (copy)
		if t[p2] then
			t[p2].clear()
			t[p2] = nil
			
			return
		end
		loggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p2))
	end
	
	local _ = function(p2, p3)
		-- upvalues: t (ref), loggerModule (copy)
		return if p3 then function()
			-- upvalues: p2 (ref), t (copy), loggerModule (copy), p3 (ref)
			if t[p2] then
				t[p2].clear()
				t[p2] = nil
			else
				loggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p2))
			end
			p3()
		end else nil
	end
	
	local var1 = function(p2)
		-- upvalues: httpService (copy), t (ref), simpleTimerModule (copy), p1 (ref), loggerModule (copy)
		p2 = p2 or httpService:GenerateGUID(false)
		
		if t[p2] then
			loggerModule:warning("(Start) Timer with this key already exists: " .. tostring(p2))
			
			return p2
		end
		local var2 = t
		local t_1 = {
			timeoutThreshold = if p1 then p1.timeoutThreshold else nil
		}
		local onReachingThreshold = p1.onReachingThreshold
		t_1.onReachingThreshold = if p1 then if onReachingThreshold then function()
			-- upvalues: p2 (ref), t (copy), loggerModule (copy), onReachingThreshold (ref)
			if t[p2] then
				t[p2].clear()
				t[p2] = nil
			else
				loggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p2))
			end
			onReachingThreshold()
		end else nil else nil
		var2[p2] = simpleTimerModule(t_1)
		
		return p2
	end
	
	return {
		start = function(p2, p3)
			-- upvalues: var1 (ref), t (ref)
			local var2 = var1(p2)
			t[var2].start(p3)
			
			return var2
		end,
		stop = function(p2)
			-- upvalues: t (ref), loggerModule (copy)
			if not t[p2] then
				loggerModule:warning("(Stop) Timer with this key doesn't exist: " .. tostring(p2))
				
				return -1
			end
			local var2 = t[p2].stop()
			
			if t[p2] then
				t[p2].clear()
				t[p2] = nil
				
				return var2
			end
			loggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p2))
			
			return var2
		end,
		getTime = function(p2)
			-- upvalues: t (ref), loggerModule (copy)
			if t[p2] then
				return t[p2].getTime()
			end
			loggerModule:warning("(getTime) Timer with this key doesn't exist: " .. tostring(p2))
			
			return -1
		end,
		getStartTimestamp = function(p2)
			-- upvalues: t (ref), loggerModule (copy)
			if t[p2] then
				return t[p2].getStartTimestamp()
			end
			loggerModule:warning("(startTimeStamp) Timer with this key doesn't exist: " .. tostring(p2))
			
			return nil
		end
	}
end