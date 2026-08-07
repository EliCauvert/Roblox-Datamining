local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createSignal = require(momentsCreation.Parent.Signals).createSignal

return function() --[[ line: 21 | named "createEditSession" ]]
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(nil)
	local var3, var4 = createSignal(false)
	local var5 = nil
	
	return {
		getDraft = var1,
		getIsDirty = var3,
		begin = function(p0) --[[ line: 26 ]]
			-- upvalues: var5 (write), var2 (ref), var4 (ref)
			var5 = p0
			var2(p0)
			var4(false)
		end,
		update = function(p1) --[[ line: 32 ]]
			-- upvalues: var2 (ref), var4 (ref)
			var2(p1)
			var4(true)
		end,
		commit = function() --[[ line: 37 ]]
			-- upvalues: var1 (ref), var5 (write), var4 (ref)
			local var6 = var1(false)
			var5 = var6
			var4(false)
			
			return var6
		end,
		discard = function() --[[ line: 44 ]]
			-- upvalues: var2 (ref), var5 (write), var4 (ref)
			var2(var5)
			var4(false)
		end
	}
end