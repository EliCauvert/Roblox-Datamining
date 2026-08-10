local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local myStatsExperienceSearchDebounceMs = game:DefineFastInt("MyStatsExperienceSearchDebounceMs", 200)

return function(p0) --[[ line: 47 | named "createSearchQueryStore" ]]
	-- upvalues: myStatsExperienceSearchDebounceMs (ref), signalsModule (ref), signalsReactModule (ref)
	p0 = p0 or {}
	local debounceMs = p0.debounceMs or myStatsExperienceSearchDebounceMs
	local schedule = p0.schedule or task.delay
	local cancel = p0.cancel or task.cancel
	local var7, var8 = signalsModule.createSignal("")
	local var9, var10 = signalsModule.createSignal("")
	local var11 = nil
	
	local function _() --[[ line: 58 | named "cancelPending" ]]
		-- upvalues: var11 (write), cancel (ref)
		if var11 ~= nil then
			pcall(cancel, var11)
			var11 = nil
		end
	end
	
	return {
		getDraftQuery = var7,
		useDraftQuery = function() --[[ line: 94 ]]
			-- upvalues: signalsReactModule (copy), var7 (ref)
			return signalsReactModule.useSignalState(var7)
		end,
		getDebouncedQuery = var9,
		useDebouncedQuery = function() --[[ line: 98 ]]
			-- upvalues: signalsReactModule (copy), var9 (ref)
			return signalsReactModule.useSignalState(var9)
		end,
		setQuery = function(value) --[[ line: 68 ]]
			-- upvalues: var8 (ref), var11 (write), cancel (ref), var9 (ref), debounceMs (ref), schedule (ref), var10 (ref)
			var8(value)
			
			if var11 ~= nil then
				pcall(cancel, var11)
				var11 = nil
			end
			if value == var9() then
				return
			end
			var11 = schedule(debounceMs / 1000, function() --[[ line: 78 ]]
				-- upvalues: var11 (copy), var10 (copy), value (ref)
				var11 = nil
				var10(value)
			end)
		end,
		clear = function() --[[ line: 84 ]]
			-- upvalues: var11 (write), cancel (ref), var8 (ref), var10 (ref)
			if var11 ~= nil then
				pcall(cancel, var11)
				var11 = nil
			end
			var8("")
			var10("")
		end,
		destroy = function() --[[ line: 90 ]]
			-- upvalues: var11 (write), cancel (ref)
			if var11 ~= nil then
				pcall(cancel, var11)
				var11 = nil
			end
		end
	}
end