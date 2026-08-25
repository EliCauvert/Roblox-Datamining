local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var0, var1 = createSessionScopedSignal(function()
		return nil
	end)
	
	return {
		getDraft = var0,
		setDraft = function(p0, p1, p2)
			-- upvalues: var1 (ref)
			var1({ placeId = p0, title = p1, description = p2 })
		end,
		clearDraft = function(p3)
			-- upvalues: var0 (ref), var1 (ref)
			local var2 = var0()
			
			if var2 ~= nil and var2.placeId == p3 then
				var1(nil)
			end
		end,
		reset = function()
			-- upvalues: var1 (ref)
			var1(nil)
		end
	}
end