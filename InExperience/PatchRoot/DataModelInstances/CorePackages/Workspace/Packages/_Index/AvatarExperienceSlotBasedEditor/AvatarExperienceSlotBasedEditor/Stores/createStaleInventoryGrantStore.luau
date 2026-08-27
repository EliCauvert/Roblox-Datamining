local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	return {
		getStaleSearchUuids = var1,
		isSearchUuidStale = function(p1)
			-- upvalues: var1 (ref)
			return var1(false)[p1] == true
		end,
		markSearchUuidStale = function(p1)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			if var1(false)[p1] == true then
				return
			end
			var2(cryoModule.Dictionary.join(var1(false), { [p1] = true }))
		end,
		clearSearchUuidStale = function(p1)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			if var1(false)[p1] == true then
				var2(cryoModule.Dictionary.join(var1(false), { [p1] = cryoModule.None }))
				
				return
			end
		end
	}
end