local signalsSchedulerModule = require(script.Parent.Parent.SignalsScheduler)
local flush = signalsSchedulerModule.flush
local schedule = signalsSchedulerModule.schedule
local callUserSpaceModule = require(script.Parent.callUserSpace)
local frozen = table.freeze({ __mode = "k" })

local function _(value)
	-- upvalues: frozen (ref)
	return setmetatable(value, frozen)
end

local function defaultEquals(p1, p2)
	return p1 == p2
end

local function handleError(p1, ...)
	if not p1 then
		error(...)
	end
end

local function handleScopeValidation(p1, p2, ...)
	-- upvalues: handleError (ref)
	p1()
	handleError(p2, ...)
	
	return ...
end

local var1 = if _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__ then function(p3, p4)
	-- upvalues: handleScopeValidation (ref), callUserSpaceModule (ref)
	local var2 = true
	
	return handleScopeValidation(function()
		-- upvalues: var2 (write)
		var2 = false
	end, pcall(callUserSpaceModule, p3, function(p5)
		-- upvalues: var2 (write), p4 (ref)
		if not var2 then
			error("attempted to use scope beyond scope's lifetime")
		end
		return p4(p5)
	end))
end else callUserSpaceModule

return {
	createSignal = function(value, p3)
		-- upvalues: defaultEquals (ref), callUserSpaceModule (ref), frozen (ref), flush (ref)
		local var2 = false
		local var3 = 0
		local var4 = nil
		local var5 = nil
		local var6 = if p3 ~= nil then defaultEquals else p3
		
		local function ensureInitialized()
			-- upvalues: var2 (write), var4 (write), value (ref), callUserSpaceModule (copy), var3 (write), var5 (write), frozen (copy)
			if not var2 then
				var2 = true
				var4 = if typeof(value) == "function" then callUserSpaceModule(value) else value
				var3 = os.clock()
				var5 = setmetatable({}, frozen)
			end
		end
		
		local function source(p4, p5)
			-- upvalues: var5 (write), var3 (write)
			if p4 == nil then
				return var3
			elseif p5 then
				var5[p4] = nil
			else
				var5[p4] = true
			end
			return 0
		end
		
		local function _(p4)
			-- upvalues: source (ref), var5 (write)
			if p4 then
				var5[p4(source)] = true
			end
		end
		
		local _ = function()
			-- upvalues: var5 (write)
			for i in var5 do
				i()
			end
			table.clear(var5)
		end
		
		return function(p4)
			-- upvalues: ensureInitialized (ref), source (ref), var5 (write), var4 (write)
			ensureInitialized()
			
			if p4 then
				var5[p4(source)] = true
			end
			return var4
		end, function(value)
			-- upvalues: ensureInitialized (ref), callUserSpaceModule (copy), var4 (write), var6 (ref), var3 (write), var5 (write), flush (copy)
			ensureInitialized()
			local var7 = if typeof(value) == "function" then callUserSpaceModule(value, var4) else value
			
			if not callUserSpaceModule(var6, var4, var7) then
				var4 = var7
				var3 = os.clock()
				
				for i in var5 do
					i()
				end
				table.clear(var5)
				flush()
			end
		end
	end,
	createComputed = function(p4, p5)
		-- upvalues: defaultEquals (ref), frozen (ref), var1 (ref), callUserSpaceModule (ref)
		local var7 = false
		local var8 = false
		local var9 = 0
		local var10 = 0
		local var11 = nil
		local var12 = nil
		local var13 = nil
		local var14 = if p5 ~= nil then defaultEquals else p5
		
		local function _()
			-- upvalues: var13 (write)
			for i in var13 do
				i()
			end
			table.clear(var13)
		end
		
		local function observer()
			-- upvalues: var8 (write), var13 (write)
			if not var8 then
				var8 = true
				
				for i in var13 do
					i()
				end
				table.clear(var13)
			end
		end
		
		local function scope(p6)
			-- upvalues: var12 (write), observer (ref)
			var12[p6] = true
			
			return observer
		end
		
		local function ensureInitialized()
			-- upvalues: var7 (write), var13 (write), frozen (copy), var12 (write), var11 (write), var1 (copy), p4 (ref), scope (ref), var10 (write), var9 (write)
			if not var7 then
				var7 = true
				var13 = setmetatable({}, frozen)
				var12 = {}
				var11 = var1(p4, scope)
				var10 = os.clock()
				var9 = var10
			end
		end
		
		local _ = function()
			-- upvalues: var12 (write), observer (ref)
			for i in var12 do
				i(observer, true)
			end
			table.clear(var12)
		end
		
		local function flushNotifications()
			-- upvalues: var8 (write), var12 (write), var10 (write), observer (ref), var1 (copy), p4 (ref), scope (ref), callUserSpaceModule (copy), var14 (ref), var11 (write), var9 (write)
			if var8 then
				var8 = false
				
				for i in var12 do
					if var10 < i() then
						for i_2 in var12 do
							i_2(observer, true)
						end
						table.clear(var12)
						local var15 = var1(p4, scope)
						var10 = os.clock()
						
						if not callUserSpaceModule(var14, var11, var15) then
							var11 = var15
							var9 = var10
						end
						return
					end
				end
				for i in var12 do
					i(observer)
				end
			end
		end
		
		local function source(p6, p7)
			-- upvalues: var13 (write), flushNotifications (ref), var9 (write)
			if p6 == nil then
				flushNotifications()
				
				return var9
			elseif p7 then
				var13[p6] = nil
			else
				var13[p6] = true
			end
			return 0
		end
		
		local _ = function(p6)
			-- upvalues: source (ref), var13 (write)
			if p6 then
				var13[p6(source)] = true
			end
		end
		
		return function(p6)
			-- upvalues: ensureInitialized (ref), flushNotifications (ref), source (ref), var13 (write), var11 (write)
			ensureInitialized()
			flushNotifications()
			
			if p6 then
				var13[p6(source)] = true
			end
			return var11
		end
	end,
	createEffect = function(p6)
		-- upvalues: var1 (ref), schedule (ref)
		local var16 = false
		local var17 = false
		local var18 = 0
		local t = {}
		local observer = nil
		
		local function _()
			-- upvalues: t (ref), observer (write)
			for i in t do
				i(observer, true)
			end
			table.clear(t)
		end
		
		local function dispose()
			-- upvalues: var17 (write), t (ref), observer (write)
			var17 = true
			
			for i in t do
				i(observer, true)
			end
			table.clear(t)
		end
		
		local function scope(p7)
			-- upvalues: t (ref), observer (write)
			t[p7] = true
			
			return observer
		end
		
		local function processNotification()
			-- upvalues: var17 (write), var16 (write), t (ref), var18 (write), observer (write), var1 (copy), p6 (ref), scope (ref)
			if not var17 then
				var16 = false
				
				for i in t do
					if var18 < i() then
						for i_2 in t do
							i_2(observer, true)
						end
						table.clear(t)
						var1(p6, scope)
						var18 = os.clock()
						
						return
					end
				end
				for i in t do
					i(observer)
				end
			end
		end
		
		observer = function()
			-- upvalues: var17 (write), var16 (write), schedule (copy), processNotification (ref)
			if not var17 and not var16 then
				var16 = true
				schedule(processNotification)
			end
		end
		
		var1(p6, scope)
		var18 = os.clock()
		
		return dispose
	end
}