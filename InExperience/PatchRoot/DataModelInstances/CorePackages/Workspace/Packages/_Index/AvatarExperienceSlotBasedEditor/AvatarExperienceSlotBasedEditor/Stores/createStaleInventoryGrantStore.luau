local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)

return function() --[[ line: 18 | named "createStaleInventoryGrantStore" ]]
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var2, var3 = signalsModule.createSignal({})
	
	return {
		getStaleSearchUuids = var2,
		isSearchUuidStale = function(p0) --[[ line: 21 ]]
			-- upvalues: var2 (ref)
			return var2(false)[p0] == true
		end,
		markSearchUuidStale = function(p1) --[[ line: 25 ]]
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			if var2(false)[p1] == true then
				return
			end
			var3(cryoModule.Dictionary.join(var2(false), { [p1] = true }))
		end,
		clearSearchUuidStale = function(p2) --[[ line: 32 ]]
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			if var2(false)[p2] == true then
				var3(cryoModule.Dictionary.join(var2(false), { [p2] = cryoModule.None }))
				
				return
			end
		end
	}
end