local parent = script:FindFirstAncestor("Moments").Parent
local cryoModule = require(parent.Cryo)
local createSignal = require(parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref), cryoModule (ref)
	local var1, var2 = createSignal({})
	
	return {
		getDeletedIds = var1,
		markDeleted = function(p1)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = var1(false)
			
			if not table.find(var3, p1) then
				var2(cryoModule.List.join(var3, { p1 }))
			end
		end
	}
end