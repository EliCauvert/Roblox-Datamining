local httpService = game:GetService("HttpService")
local simpleTimerModule = require(script.Parent.SimpleTimer)
local loggerModule = require(script.Parent.Parent.Logger)

return function(p0)
	-- upvalues: loggerModule (ref), httpService (ref), simpleTimerModule (ref)
	local t = {}
	
	local _ = function(p1)
		-- upvalues: t (ref), loggerModule (copy)
		if t[p1] then
			t[p1].clear()
			t[p1] = nil
			
			return
		end
		loggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p1))
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
	
	local var4 = function(p4)
		-- upvalues: httpService (copy), t (ref), simpleTimerModule (copy), p0 (ref), loggerModule (copy)
		p4 = p4 or httpService:GenerateGUID(false)
		
		if t[p4] then
			loggerModule:warning("(Start) Timer with this key already exists: " .. tostring(p4))
			
			return p4
		end
		local var6 = t
		local t_1 = {
			timeoutThreshold = if p0 then p0.timeoutThreshold else nil
		}
		local onReachingThreshold = p0.onReachingThreshold
		t_1.onReachingThreshold = if p0 then if onReachingThreshold then function()
			-- upvalues: p4 (ref), t (copy), loggerModule (copy), onReachingThreshold (ref)
			if t[p4] then
				t[p4].clear()
				t[p4] = nil
			else
				loggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p4))
			end
			onReachingThreshold()
		end else nil else nil
		var6[p4] = simpleTimerModule(t_1)
		
		return p4
	end
	
	return {
		start = function(p5, p6)
			-- upvalues: var4 (ref), t (ref)
			local var8 = var4(p5)
			t[var8].start(p6)
			
			return var8
		end,
		stop = function(p7)
			-- upvalues: t (ref), loggerModule (copy)
			if not t[p7] then
				loggerModule:warning("(Stop) Timer with this key doesn't exist: " .. tostring(p7))
				
				return -1
			end
			local var9 = t[p7].stop()
			
			if t[p7] then
				t[p7].clear()
				t[p7] = nil
				
				return var9
			end
			loggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p7))
			
			return var9
		end,
		getTime = function(p8)
			-- upvalues: t (ref), loggerModule (copy)
			if t[p8] then
				return t[p8].getTime()
			end
			loggerModule:warning("(getTime) Timer with this key doesn't exist: " .. tostring(p8))
			
			return -1
		end,
		getStartTimestamp = function(p9)
			-- upvalues: t (ref), loggerModule (copy)
			if t[p9] then
				return t[p9].getStartTimestamp()
			end
			loggerModule:warning("(startTimeStamp) Timer with this key doesn't exist: " .. tostring(p9))
			
			return nil
		end
	}
end