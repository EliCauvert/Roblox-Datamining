local parent = script.Parent.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local getNavigation = roactNavigationModule.getNavigation
local actions = roactNavigationModule.Actions
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local signalsExperimentalModule = require(parent.SignalsExperimental)
local _ = require(script.Parent.types)
local dEV = _G.__DEV__ or _G.__TESTEZ_RUNNING_TEST__

return function(p1)
	-- upvalues: createSignal (ref), actions (ref), signalsExperimentalModule (ref), dEV (ref), createComputed (ref), getNavigation (ref)
	local t = {}
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(function()
		-- upvalues: p1 (ref), actions (copy)
		return p1.getStateForAction(actions.init())
	end)
	local var5 = nil
	local t_1 = {}
	
	local function setDispatch(value)
		-- upvalues: var5 (write), t_1 (write)
		var5 = value
		
		if #t_1 > 0 then
			local var6 = t_1
			t_1 = {}
			
			for i, v in var6 do
				value(v)
			end
		end
	end
	
	local function clearDispatch()
		-- upvalues: var5 (write)
		var5 = nil
	end
	
	local function update(p2)
		-- upvalues: signalsExperimentalModule (copy), var4 (ref), var2 (ref)
		if p2 == nil then
			return
		end
		signalsExperimentalModule.batch(function()
			-- upvalues: var4 (copy), p2 (ref), var2 (copy)
			var4(p2)
			var2(p2.isTransitioning == true)
		end)
	end
	
	local function dispatch(p2)
		-- upvalues: dEV (copy), signalsExperimentalModule (copy), var4 (ref), p1 (ref), actions (copy), var2 (ref), var5 (write), var3 (ref), t_1 (write)
		if dEV and p2.type == "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION" then
			signalsExperimentalModule.batch(function()
				-- upvalues: var4 (copy), p1 (copy), actions (copy), var2 (copy)
				var4(p1.getStateForAction(actions.init()))
				var2(false)
			end)
			
			return true
		elseif var5 ~= nil then
			var5(p2)
			
			return true
		end
		local var7 = var3(false)
		local stateForAction = p1.getStateForAction(p2, var7)
		
		if stateForAction ~= nil and stateForAction ~= var7 then
			var4(stateForAction)
		end
		table.insert(t_1, p2)
		
		return true
	end
	
	local function notifyEvents() end
	
	local var7 = function()
		return nil
	end
	
	local var8 = createComputed(function(p2)
		-- upvalues: var3 (ref), getNavigation (copy), p1 (ref), dispatch (ref), t (ref), var7 (write)
		return getNavigation(p1, var3(p2), dispatch, t, function(_, p3)
			return p3
		end, function()
			-- upvalues: var7 (copy)
			return var7()
		end)
	end)
	var7 = var8
	
	return {
		dispatch = dispatch,
		notifyEvents = notifyEvents,
		getState = var3,
		getNavigation = var8,
		getIsNavigating = var1,
		update = update,
		setDispatch = setDispatch,
		clearDispatch = clearDispatch
	}
end