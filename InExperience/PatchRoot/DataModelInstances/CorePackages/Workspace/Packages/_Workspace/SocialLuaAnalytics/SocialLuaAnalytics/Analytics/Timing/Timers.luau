local HttpService = game:GetService("HttpService")
local SimpleTimerModule = require(script.Parent.SimpleTimer)
local LoggerModule = require(script.Parent.Parent.Logger)

return function(p1)
	-- upvalues: LoggerModule (copy), HttpService (copy), SimpleTimerModule (copy)
	local t = {}
	
	local function _(Key)
		-- upvalues: t (copy), LoggerModule (upval)
		if t[Key] then
			t[Key].clear()
			t[Key] = nil
			
			return
		else
			LoggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(Key))
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: t (copy), LoggerModule (upval)
		return if p3 then function()
			-- upvalues: p2 (copy), t (upval), LoggerModule (upval), p3 (copy)
			if t[p2] then
				t[p2].clear()
				t[p2] = nil
			else
				LoggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(p2))
			end
			p3()
		end else nil
	end
	
	local function v6(p2)
		-- upvalues: HttpService (upval), t (copy), SimpleTimerModule (upval), p1 (copy), LoggerModule (upval)
		local P4 = p2 or HttpService:GenerateGUID(false)
		
		if t[P4] then
			LoggerModule:warning("(Start) Timer with this key already exists: " .. tostring(P4))
			
			return P4
		end
		local config = { timeoutThreshold = p1 and p1.timeoutThreshold or nil }
		local OnReachingThreshold = nil
		
		if p1 then
			local OnReachingThresholdFunction = p1.onReachingThreshold
			OnReachingThreshold = (if OnReachingThresholdFunction then function()
				-- upvalues: P4 (copy), t (upval), LoggerModule (upval), OnReachingThresholdFunction (copy)
				if t[P4] then
					t[P4].clear()
					t[P4] = nil
				else
					LoggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(P4))
				end
				OnReachingThresholdFunction()
			end else nil) or nil
		else
			OnReachingThreshold = nil
		end
		config.onReachingThreshold = OnReachingThreshold
		t[P4] = SimpleTimerModule(config)
		
		return P4
	end
	
	return {
		start = function(p2, p3)
			-- upvalues: v6 (copy), t (copy)
			local v1 = v6(p2)
			t[v1].start(p3)
			
			return v1
		end,
		stop = function(Key)
			-- upvalues: t (copy), LoggerModule (upval)
			if not t[Key] then
				LoggerModule:warning("(Stop) Timer with this key doesn't exist: " .. tostring(Key))
				
				return -1
			end
			local StopResult = t[Key].stop()
			
			if t[Key] then
				t[Key].clear()
				t[Key] = nil
				
				return StopResult
			else
				LoggerModule:warning("(Clear) Timer with this key doesn't exist: " .. tostring(Key))
				
				return StopResult
			end
		end,
		getTime = function(p2)
			-- upvalues: t (copy), LoggerModule (upval)
			if t[p2] then
				return t[p2].getTime()
			else
				LoggerModule:warning("(getTime) Timer with this key doesn't exist: " .. tostring(p2))
				
				return -1
			end
		end,
		getStartTimestamp = function(p2)
			-- upvalues: t (copy), LoggerModule (upval)
			if t[p2] then
				return t[p2].getStartTimestamp()
			else
				LoggerModule:warning("(startTimeStamp) Timer with this key doesn't exist: " .. tostring(p2))
				
				return nil
			end
		end
	}
end