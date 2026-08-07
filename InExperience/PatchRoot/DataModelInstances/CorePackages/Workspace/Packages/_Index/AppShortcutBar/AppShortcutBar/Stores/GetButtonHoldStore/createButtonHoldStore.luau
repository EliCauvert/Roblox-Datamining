local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.FocusNavigationUtils)

return function() --[[ line: 21 | named "createButtonHoldStore" ]]
	-- upvalues: signalsModule (ref), reactModule (ref), signalsReactModule (ref)
	local var3, var4 = signalsModule.createSignal({})
	
	local function updateButtonHoldState(p0, p1) --[[ line: 24 ]]
		-- upvalues: var4 (ref)
		var4(function(p2) --[[ line: 25 ]]
			-- upvalues: p0 (ref), p1 (ref)
			if p2[p0] == p1 then
				return p2
			end
			local cloned = table.clone(p2)
			cloned[p0] = p1
			
			return cloned
		end)
	end
	
	return {
		getButtonHoldState = var3,
		setButtonHoldState = var4,
		useDispatchButtonHoldStarted = function() --[[ line: 35 ]]
			-- upvalues: reactModule (copy), var4 (ref), updateButtonHoldState (ref)
			return reactModule.useCallback(function(p3, p4) --[[ line: 37 ]]
				-- upvalues: var4 (copy)
				var4(function(p5) --[[ line: 25 ]]
					-- upvalues: p3 (ref), p4 (ref)
					if p5[p3] == p4 then
						return p5
					end
					local cloned = table.clone(p5)
					cloned[p3] = p4
					
					return cloned
				end)
			end, { updateButtonHoldState })
		end,
		useDispatchButtonHoldEnded = function() --[[ line: 45 ]]
			-- upvalues: reactModule (copy), var4 (ref), updateButtonHoldState (ref)
			return reactModule.useCallback(function(p6) --[[ line: 46 ]]
				-- upvalues: var4 (copy)
				local var7 = nil
				var4(function(p7) --[[ line: 25 ]]
					-- upvalues: p6 (ref), var7 (ref)
					if p7[p6] == var7 then
						return p7
					end
					local cloned = table.clone(p7)
					cloned[p6] = var7
					
					return cloned
				end)
			end, { updateButtonHoldState })
		end,
		useHeldProgressByEvent = function() --[[ line: 52 ]]
			-- upvalues: signalsReactModule (copy), var3 (ref)
			return signalsReactModule.useSignalState(var3)
		end
	}
end