local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local MyStatsExperienceSearchDebounceMs = game:DefineFastInt("MyStatsExperienceSearchDebounceMs", 200)

return function(p1)
	-- upvalues: MyStatsExperienceSearchDebounceMs (copy), SignalsModule (copy), SignalsReactModule (copy)
	local P0 = p1 or {}
	local DebounceMs = P0.debounceMs or MyStatsExperienceSearchDebounceMs
	local Schedule = P0.schedule or task.delay
	local Cancel = P0.cancel or task.cancel
	local Signal, Signal2 = SignalsModule.createSignal("")
	local Signal1, Signal2_1 = SignalsModule.createSignal("")
	local v1 = nil
	
	local function _()
		-- upvalues: v1 (ref), Cancel (copy)
		if v1 ~= nil then
			pcall(Cancel, v1)
			v1 = nil
		end
	end
	
	return {
		getDraftQuery = Signal,
		useDraftQuery = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		getDebouncedQuery = Signal1,
		useDebouncedQuery = function()
			-- upvalues: SignalsReactModule (upval), Signal1 (copy)
			return SignalsReactModule.useSignalState(Signal1)
		end,
		setQuery = function(p2)
			-- upvalues: Signal2 (copy), v1 (ref), Cancel (copy), Signal1 (copy), DebounceMs (copy), Schedule (copy), Signal2_1 (copy)
			Signal2(p2)
			
			if v1 ~= nil then
				pcall(Cancel, v1)
				v1 = nil
			end
			if p2 ~= Signal1() then
				v1 = Schedule(DebounceMs / 1000, function()
					-- upvalues: v1 (upval), Signal2_1 (upval), p2 (copy)
					v1 = nil
					Signal2_1(p2)
				end)
				
				return
			end
		end,
		clear = function()
			-- upvalues: v1 (ref), Cancel (copy), Signal2 (copy), Signal2_1 (copy)
			if v1 ~= nil then
				pcall(Cancel, v1)
				v1 = nil
			end
			Signal2("")
			Signal2_1("")
		end,
		destroy = function()
			-- upvalues: v1 (ref), Cancel (copy)
			if v1 ~= nil then
				pcall(Cancel, v1)
				v1 = nil
			end
		end
	}
end