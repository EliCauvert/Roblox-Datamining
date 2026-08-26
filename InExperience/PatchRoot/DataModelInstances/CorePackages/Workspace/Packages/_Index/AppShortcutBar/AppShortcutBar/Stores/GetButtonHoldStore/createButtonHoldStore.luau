local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.FocusNavigationUtils)

return function()
	-- upvalues: signalsModule (ref), reactModule (ref), signalsReactModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	local function updateButtonHoldState(p1, p2)
		-- upvalues: var2 (ref)
		var2(function(p3)
			-- upvalues: p1 (ref), p2 (ref)
			if p3[p1] == p2 then
				return p3
			end
			local cloned = table.clone(p3)
			cloned[p1] = p2
			
			return cloned
		end)
	end
	
	return {
		getButtonHoldState = var1,
		setButtonHoldState = var2,
		useDispatchButtonHoldStarted = function()
			-- upvalues: reactModule (copy), var2 (ref), updateButtonHoldState (ref)
			return reactModule.useCallback(function(p1, p2)
				-- upvalues: var2 (copy)
				var2(function(p3)
					-- upvalues: p1 (ref), p2 (ref)
					if p3[p1] == p2 then
						return p3
					end
					local cloned = table.clone(p3)
					cloned[p1] = p2
					
					return cloned
				end)
			end, { updateButtonHoldState })
		end,
		useDispatchButtonHoldEnded = function()
			-- upvalues: reactModule (copy), var2 (ref), updateButtonHoldState (ref)
			return reactModule.useCallback(function(p1)
				-- upvalues: var2 (copy)
				local var3 = nil
				var2(function(p2)
					-- upvalues: p1 (ref), var3 (ref)
					if p2[p1] == var3 then
						return p2
					end
					local cloned = table.clone(p2)
					cloned[p1] = var3
					
					return cloned
				end)
			end, { updateButtonHoldState })
		end,
		useHeldProgressByEvent = function()
			-- upvalues: signalsReactModule (copy), var1 (ref)
			return signalsReactModule.useSignalState(var1)
		end
	}
end