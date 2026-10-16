local Parent = script:FindFirstAncestor("SocialExperienceJoin").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local Computed = SignalsModule.createComputed(function(_) --[[ Line: 27 ]]
	-- upvalues: CreateSignalFunction (copy), CryoModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	
	return {
		getPlayabilityEntries = Signal,
		getUserSettings = Signal1,
		setPlayabilityEntry = function(p1, p2) --[[ Line: 31 ]]
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			if p1 and p1 ~= "" then
				Signal2(CryoModule.Dictionary.join(Signal(false), { [p1] = p2 }))
				
				return
			end
		end,
		setUserSettings = function(p1) --[[ Line: 39 ]]
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end,
		clearPlayabilityEntry = function(p1) --[[ Line: 43 ]]
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			if not p1 or p1 == "" then return end
			local SignalResult = Signal(false)
			
			if SignalResult[p1] ~= nil then
				Signal2(CryoModule.Dictionary.join(SignalResult, { [p1] = CryoModule.None }))
				
				return
			end
		end,
		clearCache = function(p1) --[[ Line: 54 ]]
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval), Signal2_1 (copy)
			if p1 and p1 ~= "" then
				Signal2(CryoModule.Dictionary.join(Signal(false), { [p1] = CryoModule.None }))
			else
				Signal2({})
			end
			Signal2_1(nil)
		end
	}
end)

return {
	get = function() --[[ Line: 75 ]]
		-- upvalues: Computed (copy)
		return Computed(false)
	end
}