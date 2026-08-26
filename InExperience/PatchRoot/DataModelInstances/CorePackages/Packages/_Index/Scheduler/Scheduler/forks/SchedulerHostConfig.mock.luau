local t = {}
local var1 = 0
local var2 = nil
local var3 = nil
local var4 = -1
local var5 = nil
local var6 = -1
local var7 = false
local var8 = false
local var9 = false
local var10 = false
local parent = script.Parent.Parent.Parent
local console = require(parent.Shared).console
local disabledLog = require(parent.Shared).ConsolePatchingDev.disabledLog

function t.requestHostCallback(p1)
	-- upvalues: var2 (write)
	var2 = p1
end

function t.cancelHostCallback()
	-- upvalues: var2 (write)
	var2 = nil
end

function t.requestHostTimeout(p1, p2)
	-- upvalues: var3 (write), var4 (write), var1 (write)
	var3 = p1
	var4 = var1 + p2
end

function t.cancelHostTimeout()
	-- upvalues: var3 (write), var4 (write)
	var3 = nil
	var4 = -1
end

function t.shouldYieldToHost()
	-- upvalues: var5 (write), var6 (write), var10 (write), var9 (write), var7 (write)
	if (var6 == -1 or var5 == nil or var6 > #var5) and (not var10 or not var9) then
		return false
	end
	var7 = true
	
	return true
end

function t.getCurrentTime()
	-- upvalues: var1 (write)
	return var1
end

function t.forceFrameRate() end

function t.reset()
	-- upvalues: var8 (write), var1 (write), var2 (write), var3 (write), var4 (write), var5 (write), var6 (write), var7 (write), var9 (write)
	if var8 then
		error("Cannot reset while already flushing work.")
	end
	var1 = 0
	var2 = nil
	var3 = nil
	var4 = -1
	var5 = nil
	var6 = -1
	var7 = false
	var8 = false
	var9 = false
end

function t.unstable_flushNumberOfYields(p1)
	-- upvalues: var8 (write), var2 (write), var6 (write), var1 (write), var7 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 ~= nil then
		local var11 = var2
		var6 = p1
		var8 = true
		local ok, status = pcall(function()
			-- upvalues: var11 (ref), var1 (copy), var7 (copy), var2 (copy)
			local var12
			local _ = true
			repeat
				var12 = var11(true, var1)
			until not (var12 and not var7)
			if not var12 then
				var2 = nil
			end
		end)
		var6 = -1
		var7 = false
		var8 = false
		
		if not ok then
			error(status)
		end
	end
end

function t.unstable_flushUntilNextPaint()
	-- upvalues: var8 (write), var2 (write), var10 (write), var9 (write), var1 (write), var7 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 ~= nil then
		local var11 = var2
		var10 = true
		var9 = false
		var8 = true
		local ok, status = pcall(function()
			-- upvalues: var11 (ref), var1 (copy), var7 (copy), var2 (copy)
			local var12
			local _ = true
			repeat
				var12 = var11(true, var1)
			until not (var12 and not var7)
			if not var12 then
				var2 = nil
			end
		end)
		var10 = false
		var7 = false
		var8 = false
		
		if not ok then
			error(status)
		end
	end
end

function t.unstable_flushExpired()
	-- upvalues: var8 (write), var2 (write), var1 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 ~= nil then
		var8 = true
		local ok, status = pcall(function()
			-- upvalues: var2 (copy), var1 (copy)
			if not var2(false, var1) then
				var2 = nil
			end
		end)
		var8 = false
		
		if not ok then
			error(status)
		end
	end
end

function t.unstable_flushAllWithoutAsserting()
	-- upvalues: var8 (write), var2 (write), var1 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 == nil then
		return false
	end
	local var11 = var2
	var8 = true
	local ok, status = pcall(function()
		-- upvalues: var11 (ref), var1 (copy), var2 (copy)
		local var12
		local _ = true
		repeat
			var12 = var11(true, var1)
		until not var12
		if not var12 then
			var2 = nil
		end
	end)
	var8 = false
	
	if not ok then
		error(status)
	end
	return true
end

function t.unstable_clearYields()
	-- upvalues: var5 (write)
	if var5 == nil then
		return {}
	end
	var5 = nil
	
	return var5
end

function t.unstable_flushAll()
	-- upvalues: var5 (write), t (ref)
	if var5 ~= nil then
		error("Log is not empty. Assert on the log of yielded values before flushing additional work.")
	end
	t.unstable_flushAllWithoutAsserting()
	
	if var5 ~= nil then
		error("While flushing work, something yielded a value. Use an assertion helper to assert on the log of yielded values, e.g. expect(Scheduler).toFlushAndYield([...])")
	end
end

function t.unstable_yieldValue(p1)
	-- upvalues: console (ref), disabledLog (ref), var5 (write)
	if console.log == disabledLog then return end
	if var5 == nil then
		var5 = { p1 }
		
		return
	end
	table.insert(var5, p1)
end

function t.unstable_advanceTime(p1)
	-- upvalues: console (ref), disabledLog (ref), var1 (write), var3 (write), var4 (write)
	if console.log == disabledLog then return end
	var1 += p1
	
	if var3 ~= nil and var4 <= var1 then
		var3(var1)
		var4 = -1
		var3 = nil
	end
end

function t.requestPaint()
	-- upvalues: var9 (write)
	var9 = true
end

return t