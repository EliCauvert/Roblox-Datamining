local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local myStatsExperienceSearchDebounceMs = game:DefineFastInt("MyStatsExperienceSearchDebounceMs", 200)

return function(p0)
	-- upvalues: myStatsExperienceSearchDebounceMs (ref), signalsModule (ref), signalsReactModule (ref)
	p0 = p0 or {}
	local debounceMs = p0.debounceMs or myStatsExperienceSearchDebounceMs
	local schedule = p0.schedule or task.delay
	local cancel = p0.cancel or task.cancel
	local var7, var8 = signalsModule.createSignal("")
	local var9, var10 = signalsModule.createSignal("")
	local var11, var12 = signalsModule.createSignal(false)
	local var13 = signalsModule.createComputed(function(p1)
		-- upvalues: var11 (ref), var7 (ref)
		return var11(p1) and var7(p1) == ""
	end)
	local var14 = nil
	
	local function _()
		-- upvalues: var14 (write), cancel (ref)
		if var14 ~= nil then
			pcall(cancel, var14)
			var14 = nil
		end
	end
	
	return {
		getDraftQuery = var7,
		useDraftQuery = function()
			-- upvalues: signalsReactModule (copy), var7 (ref)
			return signalsReactModule.useSignalState(var7)
		end,
		getDebouncedQuery = var9,
		useDebouncedQuery = function()
			-- upvalues: signalsReactModule (copy), var9 (ref)
			return signalsReactModule.useSignalState(var9)
		end,
		getIsSearchActive = var11,
		useIsSearchActive = function()
			-- upvalues: signalsReactModule (copy), var11 (ref)
			return signalsReactModule.useSignalState(var11)
		end,
		getShowEmptyState = var13,
		useShowEmptyState = function()
			-- upvalues: signalsReactModule (copy), var13 (ref)
			return signalsReactModule.useSignalState(var13)
		end,
		setQuery = function(value)
			-- upvalues: var8 (ref), var14 (write), cancel (ref), var9 (ref), debounceMs (ref), schedule (ref), var10 (ref)
			var8(value)
			
			if var14 ~= nil then
				pcall(cancel, var14)
				var14 = nil
			end
			if value == var9() then
				return
			end
			var14 = schedule(debounceMs / 1000, function()
				-- upvalues: var14 (copy), var10 (copy), value (ref)
				var14 = nil
				var10(value)
			end)
		end,
		setIsSearchActive = var12,
		beginSearch = function()
			-- upvalues: var12 (ref)
			var12(true)
		end,
		endSearch = function()
			-- upvalues: var14 (write), cancel (ref), var8 (ref), var10 (ref), var12 (ref)
			if var14 ~= nil then
				pcall(cancel, var14)
				var14 = nil
			end
			var8("")
			var10("")
			var12(false)
		end,
		endSearchIfEmpty = function()
			-- upvalues: var7 (ref), var12 (ref)
			if var7() == "" then
				var12(false)
			end
		end,
		clear = function()
			-- upvalues: var14 (write), cancel (ref), var8 (ref), var10 (ref)
			if var14 ~= nil then
				pcall(cancel, var14)
				var14 = nil
			end
			var8("")
			var10("")
		end,
		destroy = function()
			-- upvalues: var14 (write), cancel (ref)
			if var14 ~= nil then
				pcall(cancel, var14)
				var14 = nil
			end
		end
	}
end