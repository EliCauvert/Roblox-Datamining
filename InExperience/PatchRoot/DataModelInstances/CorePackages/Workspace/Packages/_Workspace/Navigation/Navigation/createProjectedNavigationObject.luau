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

return function(p0) --[[ line: 44 | named "createProjectedNavigationObject" ]]
	-- upvalues: createSignal (ref), actions (ref), signalsExperimentalModule (ref), dEV (ref), createComputed (ref), getNavigation (ref)
	local t = {}
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(function() --[[ line: 52 ]]
		-- upvalues: p0 (ref), actions (copy)
		return p0.getStateForAction(actions.init())
	end)
	local var9 = nil
	local t_1 = {}
	
	local function setDispatch(value) --[[ line: 61 ]]
		-- upvalues: var9 (write), t_1 (write)
		var9 = value
		
		if #t_1 > 0 then
			local var18 = t_1
			t_1 = {}
			
			for i, v in var18 do
				value(v)
			end
		end
	end
	
	local function clearDispatch() --[[ line: 72 ]]
		-- upvalues: var9 (write)
		var9 = nil
	end
	
	local function update(p1) --[[ line: 79 ]]
		-- upvalues: signalsExperimentalModule (copy), var8 (ref), var6 (ref)
		if p1 == nil then
			return
		end
		signalsExperimentalModule.batch(function() --[[ line: 83 ]]
			-- upvalues: var8 (copy), p1 (ref), var6 (copy)
			var8(p1)
			var6(p1.isTransitioning == true)
		end)
	end
	
	local function dispatch(p2) --[[ line: 94 ]]
		-- upvalues: dEV (copy), signalsExperimentalModule (copy), var8 (ref), p0 (ref), actions (copy), var6 (ref), var9 (write), var7 (ref), t_1 (write)
		if dEV and p2.type == "RESET_NAVIGATION_FOR_TESTING_ONLY__DO_NOT_USE_IN_PRODUCTION" then
			signalsExperimentalModule.batch(function() --[[ line: 96 ]]
				-- upvalues: var8 (copy), p0 (copy), actions (copy), var6 (copy)
				var8(p0.getStateForAction(actions.init()))
				var6(false)
			end)
			
			return true
		elseif var9 ~= nil then
			var9(p2)
			
			return true
		end
		local var19 = var7(false)
		local stateForAction = p0.getStateForAction(p2, var19)
		
		if stateForAction ~= nil and stateForAction ~= var19 then
			var8(stateForAction)
		end
		table.insert(t_1, p2)
		
		return true
	end
	
	local function notifyEvents() --[[ line: 118 ]] end
	
	local var16 = function() --[[ line: 123 ]]
		return nil
	end
	
	local var17 = createComputed(function(p3) --[[ line: 126 ]]
		-- upvalues: var7 (ref), getNavigation (copy), p0 (ref), dispatch (ref), t (ref), var16 (write)
		return getNavigation(p0, var7(p3), dispatch, t, function(_, p4) --[[ line: 128 ]]
			return p4
		end, function() --[[ line: 130 ]]
			-- upvalues: var16 (copy)
			return var16()
		end)
	end)
	var16 = var17
	
	return {
		dispatch = dispatch,
		notifyEvents = notifyEvents,
		getState = var7,
		getNavigation = var17,
		getIsNavigating = var5,
		update = update,
		setDispatch = setDispatch,
		clearDispatch = clearDispatch
	}
end