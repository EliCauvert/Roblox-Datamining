local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), CryoModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		getStaleSearchUuids = Signal,
		isSearchUuidStale = function(p1): boolean
			-- upvalues: Signal (copy)
			return Signal(false)[p1] == true
		end,
		markSearchUuidStale = function(p1)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			if Signal(false)[p1] ~= true then
				Signal2(CryoModule.Dictionary.join(Signal(false), { [p1] = true }))
				
				return
			end
		end,
		clearSearchUuidStale = function(p1)
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			if Signal(false)[p1] == true then
				Signal2(CryoModule.Dictionary.join(Signal(false), { [p1] = CryoModule.None }))
				
				return
			end
		end
	}
end