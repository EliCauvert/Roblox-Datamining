local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

local function _(p1, p2, p3)
	return p1.universeId == p2 and (if p1.sessionId ~= nil then p1.sessionId == p3 else true)
end

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getPendingDraft = var1,
		queueDraft = function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end,
		consumeDraft = function(p1, p2)
			-- upvalues: var1 (ref), var2 (ref)
			local var3 = var1()
			
			if var3 ~= nil then
				if var3.universeId == p1 and (if var3.sessionId ~= nil then var3.sessionId == p2 else true) then
					var2(nil)
					
					return var3.text
				end
			end
			return nil
		end,
		reset = function()
			-- upvalues: var2 (ref)
			var2(nil)
		end
	}
end