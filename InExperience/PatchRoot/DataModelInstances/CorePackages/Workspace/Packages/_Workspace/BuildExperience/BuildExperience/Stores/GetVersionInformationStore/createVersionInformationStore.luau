local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var1, var2 = createSessionScopedSignal(function()
		return nil
	end)
	
	return {
		getDraft = var1,
		setDraft = function(p1, p2, p3)
			-- upvalues: var2 (ref)
			var2({ placeId = p1, title = p2, description = p3 })
		end,
		clearDraft = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local var3 = var1()
			
			if var3 ~= nil and var3.placeId == p1 then
				var2(nil)
			end
		end,
		reset = function()
			-- upvalues: var2 (ref)
			var2(nil)
		end
	}
end