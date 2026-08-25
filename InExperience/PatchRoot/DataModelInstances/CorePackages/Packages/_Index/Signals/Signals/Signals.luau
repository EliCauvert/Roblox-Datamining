local signalsSchedulerModule = require(script.Parent.Parent.SignalsScheduler)
local flush = signalsSchedulerModule.flush
local schedule = signalsSchedulerModule.schedule
local callUserSpaceModule = require(script.Parent.callUserSpace)
local frozen = table.freeze({ __mode = "k" })

local function _(value)
	-- upvalues: frozen (ref)
	return setmetatable(value, frozen)
end

local function defaultEquals(p0, p1)
	return p0 == p1
end

local function handleError(p2, ...)
	if not p2 then
		error(...)
	end
end

local function handleScopeValidation(p3, p4, ...)
	-- upvalues: handleError (ref)
	p3()
	handleError(p4, ...)
	
	return ...
end

local var6 = if _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__ then function(p5, p6)
	-- upvalues: handleScopeValidation (ref), callUserSpaceModule (ref)
	local var7 = true
	
	return handleScopeValidation(function()
		-- upvalues: var7 (write)
		var7 = false
	end, pcall(callUserSpaceModule, p5, function(p7)
		-- upvalues: var7 (write), p6 (ref)
		if not var7 then
			error("attempted to use scope beyond scope's lifetime")
		end
		return p6(p7)
	end))
end else callUserSpaceModule

return {
	createSignal = function(value, p8)
		-- upvalues: defaultEquals (ref), callUserSpaceModule (ref), frozen (ref), flush (ref)
		local var8 = false
		local var9 = 0
		local var10 = nil
		local var11 = nil
		local var12 = if p8 ~= nil then defaultEquals else p8
		
		local function ensureInitialized()
			-- upvalues: var8 (write), var10 (write), value (ref), callUserSpaceModule (copy), var9 (write), var11 (write), frozen (copy)
			if not var8 then
				var8 = true
				var10 = if typeof(value) == "function" then callUserSpaceModule(value) else value
				var9 = os.clock()
				var11 = setmetatable({}, frozen)
			end
		end
		
		local function source(p9, p10)
			-- upvalues: var11 (write), var9 (write)
			if p9 == nil then
				return var9
			elseif p10 then
				var11[p9] = nil
			else
				var11[p9] = true
			end
			return 0
		end
		
		local function _(p11)
			-- upvalues: source (ref), var11 (write)
			if p11 then
				var11[p11(source)] = true
			end
		end
		
		local _ = function()
			-- upvalues: var11 (write)
			for i in var11 do
				i()
			end
			table.clear(var11)
		end
		
		return function(p12)
			-- upvalues: ensureInitialized (ref), source (ref), var11 (write), var10 (write)
			ensureInitialized()
			
			if p12 then
				var11[p12(source)] = true
			end
			return var10
		end, function(value)
			-- upvalues: ensureInitialized (ref), callUserSpaceModule (copy), var10 (write), var12 (ref), var9 (write), var11 (write), flush (copy)
			ensureInitialized()
			local var15 = if typeof(value) == "function" then callUserSpaceModule(value, var10) else value
			
			if not callUserSpaceModule(var12, var10, var15) then
				var10 = var15
				var9 = os.clock()
				
				for i in var11 do
					i()
				end
				table.clear(var11)
				flush()
			end
		end
	end,
	createComputed = function(p13, p14)
		-- upvalues: defaultEquals (ref), frozen (ref), var6 (ref), callUserSpaceModule (ref)
		local var16 = false
		local var17 = false
		local var18 = 0
		local var19 = 0
		local var20 = nil
		local var21 = nil
		local var22 = nil
		local var23 = if p14 ~= nil then defaultEquals else p14
		
		local function _()
			-- upvalues: var22 (write)
			for i in var22 do
				i()
			end
			table.clear(var22)
		end
		
		local function observer()
			-- upvalues: var17 (write), var22 (write)
			if not var17 then
				var17 = true
				
				for i in var22 do
					i()
				end
				table.clear(var22)
			end
		end
		
		local function scope(p15)
			-- upvalues: var21 (write), observer (ref)
			var21[p15] = true
			
			return observer
		end
		
		local function ensureInitialized()
			-- upvalues: var16 (write), var22 (write), frozen (copy), var21 (write), var20 (write), var6 (copy), p13 (ref), scope (ref), var19 (write), var18 (write)
			if not var16 then
				var16 = true
				var22 = setmetatable({}, frozen)
				var21 = {}
				var20 = var6(p13, scope)
				var19 = os.clock()
				var18 = var19
			end
		end
		
		local _ = function()
			-- upvalues: var21 (write), observer (ref)
			for i in var21 do
				i(observer, true)
			end
			table.clear(var21)
		end
		
		local function flushNotifications()
			-- upvalues: var17 (write), var21 (write), var19 (write), observer (ref), var6 (copy), p13 (ref), scope (ref), callUserSpaceModule (copy), var23 (ref), var20 (write), var18 (write)
			if var17 then
				var17 = false
				
				for i in var21 do
					if var19 < i() then
						for i_2 in var21 do
							i_2(observer, true)
						end
						table.clear(var21)
						local var29 = var6(p13, scope)
						var19 = os.clock()
						
						if not callUserSpaceModule(var23, var20, var29) then
							var20 = var29
							var18 = var19
						end
						return
					end
				end
				for i in var21 do
					i(observer)
				end
			end
		end
		
		local function source(p16, p17)
			-- upvalues: var22 (write), flushNotifications (ref), var18 (write)
			if p16 == nil then
				flushNotifications()
				
				return var18
			elseif p17 then
				var22[p16] = nil
			else
				var22[p16] = true
			end
			return 0
		end
		
		local _ = function(p18)
			-- upvalues: source (ref), var22 (write)
			if p18 then
				var22[p18(source)] = true
			end
		end
		
		return function(p19)
			-- upvalues: ensureInitialized (ref), flushNotifications (ref), source (ref), var22 (write), var20 (write)
			ensureInitialized()
			flushNotifications()
			
			if p19 then
				var22[p19(source)] = true
			end
			return var20
		end
	end,
	createEffect = function(p20)
		-- upvalues: var6 (ref), schedule (ref)
		local var30 = false
		local var31 = false
		local var32 = 0
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
			-- upvalues: var31 (write), t (ref), observer (write)
			var31 = true
			
			for i in t do
				i(observer, true)
			end
			table.clear(t)
		end
		
		local function scope(p21)
			-- upvalues: t (ref), observer (write)
			t[p21] = true
			
			return observer
		end
		
		local function processNotification()
			-- upvalues: var31 (write), var30 (write), t (ref), var32 (write), observer (write), var6 (copy), p20 (ref), scope (ref)
			if not var31 then
				var30 = false
				
				for i in t do
					if var32 < i() then
						for i_2 in t do
							i_2(observer, true)
						end
						table.clear(t)
						var6(p20, scope)
						var32 = os.clock()
						
						return
					end
				end
				for i in t do
					i(observer)
				end
			end
		end
		
		observer = function()
			-- upvalues: var31 (write), var30 (write), schedule (copy), processNotification (ref)
			if not var31 and not var30 then
				var30 = true
				schedule(processNotification)
			end
		end
		
		var6(p20, scope)
		var32 = os.clock()
		
		return dispose
	end
}