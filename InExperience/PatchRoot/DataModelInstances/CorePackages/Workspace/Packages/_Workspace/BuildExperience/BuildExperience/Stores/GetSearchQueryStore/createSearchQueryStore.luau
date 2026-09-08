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
	local var5, var6 = signalsModule.createSignal(false)
	local var7 = signalsModule.createComputed(function(p2)
		-- upvalues: var5 (ref), var1 (ref)
		return var5(p2) and var1(p2) == ""
	end)
	local var8 = nil
	
	local function _()
		-- upvalues: var8 (write), cancel (ref)
		if var8 ~= nil then
			pcall(cancel, var8)
			var8 = nil
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
		getIsSearchActive = var5,
		useIsSearchActive = function()
			-- upvalues: signalsReactModule (copy), var5 (ref)
			return signalsReactModule.useSignalState(var5)
		end,
		getShowEmptyState = var7,
		useShowEmptyState = function()
			-- upvalues: signalsReactModule (copy), var7 (ref)
			return signalsReactModule.useSignalState(var7)
		end,
		setQuery = function(value)
			-- upvalues: var2 (ref), var8 (write), cancel (ref), var3 (ref), debounceMs (ref), schedule (ref), var4 (ref)
			var2(value)
			
			if var8 ~= nil then
				pcall(cancel, var8)
				var8 = nil
			end
			if value == var3() then
				return
			end
			var8 = schedule(debounceMs / 1000, function()
				-- upvalues: var8 (copy), var4 (copy), value (ref)
				var8 = nil
				var4(value)
			end)
		end,
		setIsSearchActive = var6,
		beginSearch = function()
			-- upvalues: var6 (ref)
			var6(true)
		end,
		endSearch = function()
			-- upvalues: var8 (write), cancel (ref), var2 (ref), var4 (ref), var6 (ref)
			if var8 ~= nil then
				pcall(cancel, var8)
				var8 = nil
			end
			var2("")
			var4("")
			var6(false)
		end,
		endSearchIfEmpty = function()
			-- upvalues: var1 (ref), var6 (ref)
			if var1() == "" then
				var6(false)
			end
		end,
		clear = function()
			-- upvalues: var8 (write), cancel (ref), var2 (ref), var4 (ref)
			if var8 ~= nil then
				pcall(cancel, var8)
				var8 = nil
			end
			var2("")
			var4("")
		end,
		destroy = function()
			-- upvalues: var8 (write), cancel (ref)
			if var8 ~= nil then
				pcall(cancel, var8)
				var8 = nil
			end
		end
	}
end