local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local myStatsExperienceSearchDebounceMs = game:DefineFastInt("MyStatsExperienceSearchDebounceMs", 200)

return function(p1)
	-- upvalues: myStatsExperienceSearchDebounceMs (ref), signalsModule (ref), signalsReactModule (ref)
	p1 = p1 or {}
	local debounceMs = p1.debounceMs or myStatsExperienceSearchDebounceMs
	local schedule = p1.schedule or task.delay
	local cancel = p1.cancel or task.cancel
	local var1, var2 = signalsModule.createSignal("")
	local var3, var4 = signalsModule.createSignal("")
	local var5 = nil
	
	local function _()
		-- upvalues: var5 (write), cancel (ref)
		if var5 ~= nil then
			pcall(cancel, var5)
			var5 = nil
		end
	end
	
	return {
		getDraftQuery = var1,
		useDraftQuery = function()
			-- upvalues: signalsReactModule (copy), var1 (ref)
			return signalsReactModule.useSignalState(var1)
		end,
		getDebouncedQuery = var3,
		useDebouncedQuery = function()
			-- upvalues: signalsReactModule (copy), var3 (ref)
			return signalsReactModule.useSignalState(var3)
		end,
		setQuery = function(value)
			-- upvalues: var2 (ref), var5 (write), cancel (ref), var3 (ref), debounceMs (ref), schedule (ref), var4 (ref)
			var2(value)
			
			if var5 ~= nil then
				pcall(cancel, var5)
				var5 = nil
			end
			if value == var3() then
				return
			end
			var5 = schedule(debounceMs / 1000, function()
				-- upvalues: var5 (copy), var4 (copy), value (ref)
				var5 = nil
				var4(value)
			end)
		end,
		clear = function()
			-- upvalues: var5 (write), cancel (ref), var2 (ref), var4 (ref)
			if var5 ~= nil then
				pcall(cancel, var5)
				var5 = nil
			end
			var2("")
			var4("")
		end,
		destroy = function()
			-- upvalues: var5 (write), cancel (ref)
			if var5 ~= nil then
				pcall(cancel, var5)
				var5 = nil
			end
		end
	}
end