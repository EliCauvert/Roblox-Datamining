local parent = script:FindFirstAncestor("Moments").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local snapMathModule = require(script.Parent.snapMath)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function() --[[ line: 64 | named "createPagerStore" ]]
	-- upvalues: createSignal (ref), createComputed (ref), snapMathModule (ref), cryoModule (ref), signalsExperimentalModule (ref)
	local var4, var5 = createSignal({})
	local var6, var7 = createSignal(1)
	
	return {
		getItems = var4,
		getCount = createComputed(function(p0) --[[ line: 68 ]]
			-- upvalues: var4 (ref)
			return #var4(p0)
		end),
		getCurrentIndex = var6,
		getCurrentItem = createComputed(function(p1) --[[ line: 72 ]]
			-- upvalues: var4 (ref), var6 (ref)
			return var4(p1)[var6(p1)]
		end),
		addItems = function(p2) --[[ line: 91 ]]
			-- upvalues: var5 (ref), cryoModule (copy), var4 (ref)
			if #p2 == 0 then
				return
			end
			var5(cryoModule.List.join(var4(false), p2))
		end,
		addItemAt = function(p3, p4) --[[ line: 100 ]]
			-- upvalues: var4 (ref), signalsExperimentalModule (copy), var5 (ref), var6 (ref), var7 (ref), snapMathModule (copy)
			local var8 = var4(false)
			local var8Count = #var8
			local clampedValue = math.clamp(p3, 1, var8Count + 1)
			local cloned = table.clone(var8)
			table.insert(cloned, clampedValue, p4)
			signalsExperimentalModule.batch(function() --[[ line: 110 ]]
				-- upvalues: var5 (copy), cloned (ref), var8Count (ref), var6 (copy), clampedValue (ref), var7 (copy), snapMathModule (copy)
				var5(cloned)
				
				if var8Count > 0 then
					local var12 = var6(false)
					
					if clampedValue <= var12 then
						var7(snapMathModule.clampIndex(var12 + 1, #cloned))
					end
				end
			end)
		end,
		removeItem = function(p5) --[[ line: 123 ]]
			-- upvalues: var4 (ref), signalsExperimentalModule (copy), var5 (ref), var7 (ref), snapMathModule (copy), var6 (ref)
			local var13 = var4(false)
			
			if p5 < 1 or #var13 < p5 then
				return
			end
			local cloned = table.clone(var13)
			table.remove(cloned, p5)
			signalsExperimentalModule.batch(function() --[[ line: 135 ]]
				-- upvalues: var5 (copy), cloned (ref), var7 (copy), snapMathModule (copy), var6 (copy), p5 (ref)
				var5(cloned)
				var7(snapMathModule.reindexAfterRemoval(var6(false), p5, #cloned))
			end)
		end,
		setItems = function(value) --[[ line: 143 ]]
			-- upvalues: signalsExperimentalModule (copy), var5 (ref), var7 (ref), snapMathModule (copy), var6 (ref)
			signalsExperimentalModule.batch(function() --[[ line: 144 ]]
				-- upvalues: var5 (copy), value (ref), var7 (copy), snapMathModule (copy), var6 (copy)
				var5(table.clone(value))
				var7(snapMathModule.clampIndex(var6(false), #value))
			end)
		end,
		reset = function() --[[ line: 151 ]]
			-- upvalues: signalsExperimentalModule (copy), var5 (ref), var7 (ref)
			signalsExperimentalModule.batch(function() --[[ line: 152 ]]
				-- upvalues: var5 (copy), var7 (copy)
				var5({})
				var7(1)
			end)
		end,
		nextItem = function() --[[ line: 81 ]]
			-- upvalues: var6 (ref), var7 (ref), snapMathModule (copy), var4 (ref)
			var7(snapMathModule.clampIndex(var6(false) + 1, #var4(false)))
		end,
		previousItem = function() --[[ line: 85 ]]
			-- upvalues: var6 (ref), var7 (ref), snapMathModule (copy), var4 (ref)
			var7(snapMathModule.clampIndex(var6(false) - 1, #var4(false)))
		end,
		goToItem = function(p6) --[[ line: 77 ]]
			-- upvalues: var7 (ref), snapMathModule (copy), var4 (ref)
			var7(snapMathModule.clampIndex(p6, #var4(false)))
		end,
		dispose = function() --[[ line: 158 ]] end
	}
end