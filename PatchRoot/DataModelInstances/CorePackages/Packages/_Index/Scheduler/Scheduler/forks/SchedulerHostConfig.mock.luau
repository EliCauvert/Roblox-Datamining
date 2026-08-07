-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:11 2026 Pacific Standard Time.

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

function t.requestHostCallback(p0) --[[ line: 28 ]]
	-- upvalues: var2 (write)
	var2 = p0
end

function t.cancelHostCallback() --[[ line: 32 ]]
	-- upvalues: var2 (write)
	var2 = nil
end

function t.requestHostTimeout(p1, p2) --[[ line: 36 ]]
	-- upvalues: var3 (write), var4 (write), var1 (write)
	var3 = p1
	var4 = var1 + p2
end

function t.cancelHostTimeout() --[[ line: 41 ]]
	-- upvalues: var3 (write), var4 (write)
	var3 = nil
	var4 = -1
end

function t.shouldYieldToHost() --[[ line: 46 ]]
	-- upvalues: var5 (write), var6 (write), var10 (write), var9 (write), var7 (write)
	if (var6 == -1 or var5 == nil or var6 > #var5) and (not var10 or not var9) then
		return false
	end
	var7 = true
	
	return true
end

function t.getCurrentTime() --[[ line: 65 ]]
	-- upvalues: var1 (write)
	return var1
end

function t.forceFrameRate() --[[ line: 69 ]] end

function t.reset() --[[ line: 73 ]]
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

function t.unstable_flushNumberOfYields(p3) --[[ line: 90 ]]
	-- upvalues: var8 (write), var2 (write), var6 (write), var1 (write), var7 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 ~= nil then
		local var11 = var2
		var6 = p3
		var8 = true
		local ok, status = pcall(function() --[[ line: 100 ]]
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

function t.unstable_flushUntilNextPaint() --[[ line: 121 ]]
	-- upvalues: var8 (write), var2 (write), var10 (write), var9 (write), var1 (write), var7 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 ~= nil then
		local var13 = var2
		var10 = true
		var9 = false
		var8 = true
		local ok, status = pcall(function() --[[ line: 132 ]]
			-- upvalues: var13 (ref), var1 (copy), var7 (copy), var2 (copy)
			local var14
			local _ = true
			repeat
				var14 = var13(true, var1)
			until not (var14 and not var7)
			if not var14 then
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

function t.unstable_flushExpired() --[[ line: 154 ]]
	-- upvalues: var8 (write), var2 (write), var1 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 ~= nil then
		var8 = true
		local ok, status = pcall(function() --[[ line: 160 ]]
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

function t.unstable_flushAllWithoutAsserting() --[[ line: 178 ]]
	-- upvalues: var8 (write), var2 (write), var1 (write)
	if var8 then
		error("Already flushing work.")
	end
	if var2 == nil then
		return false
	end
	local var15 = var2
	var8 = true
	local ok, status = pcall(function() --[[ line: 186 ]]
		-- upvalues: var15 (ref), var1 (copy), var2 (copy)
		local var16
		local _ = true
		repeat
			var16 = var15(true, var1)
		until not var16
		if not var16 then
			var2 = nil
		end
	end)
	var8 = false
	
	if not ok then
		error(status)
	end
	return true
end

function t.unstable_clearYields() --[[ line: 209 ]]
	-- upvalues: var5 (write)
	if var5 == nil then
		return {}
	end
	var5 = nil
	
	return var5
end

function t.unstable_flushAll() --[[ line: 218 ]]
	-- upvalues: var5 (write), t (ref)
	if var5 ~= nil then
		error("Log is not empty. Assert on the log of yielded values before flushing additional work.")
	end
	t.unstable_flushAllWithoutAsserting()
	
	if var5 ~= nil then
		error("While flushing work, something yielded a value. Use an assertion helper to assert on the log of yielded values, e.g. expect(Scheduler).toFlushAndYield([...])")
	end
end

function t.unstable_yieldValue(p4) --[[ line: 235 ]]
	-- upvalues: console (ref), disabledLog (ref), var5 (write)
	if console.log == disabledLog then return end
	if var5 == nil then
		var5 = { p4 }
		
		return
	end
	table.insert(var5, p4)
end

function t.unstable_advanceTime(p5) --[[ line: 252 ]]
	-- upvalues: console (ref), disabledLog (ref), var1 (write), var3 (write), var4 (write)
	if console.log == disabledLog then return end
	var1 += p5
	
	if var3 ~= nil and var4 <= var1 then
		var3(var1)
		var4 = -1
		var3 = nil
	end
end

function t.requestPaint() --[[ line: 271 ]]
	-- upvalues: var9 (write)
	var9 = true
end

return t