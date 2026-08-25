local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.FocusNavigationUtils)

return function()
	-- upvalues: signalsModule (ref), reactModule (ref), signalsReactModule (ref)
	local var3, var4 = signalsModule.createSignal({})
	
	local function updateButtonHoldState(p0, p1)
		-- upvalues: var4 (ref)
		var4(function(p2)
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
		useDispatchButtonHoldStarted = function()
			-- upvalues: reactModule (copy), var4 (ref), updateButtonHoldState (ref)
			return reactModule.useCallback(function(p3, p4)
				-- upvalues: var4 (copy)
				var4(function(p5)
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
		useDispatchButtonHoldEnded = function()
			-- upvalues: reactModule (copy), var4 (ref), updateButtonHoldState (ref)
			return reactModule.useCallback(function(p6)
				-- upvalues: var4 (copy)
				local var7 = nil
				var4(function(p7)
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
		useHeldProgressByEvent = function()
			-- upvalues: signalsReactModule (copy), var3 (ref)
			return signalsReactModule.useSignalState(var3)
		end
	}
end