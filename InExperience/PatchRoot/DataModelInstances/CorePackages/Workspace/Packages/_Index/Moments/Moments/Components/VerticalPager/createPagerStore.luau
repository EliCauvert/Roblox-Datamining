local parent = script:FindFirstAncestor("Moments").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local snapMathModule = require(script.Parent.snapMath)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), createComputed (ref), snapMathModule (ref), cryoModule (ref), signalsExperimentalModule (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal(1)
	
	return {
		getItems = var1,
		getCount = createComputed(function(p1)
			-- upvalues: var1 (ref)
			return #var1(p1)
		end),
		getCurrentIndex = var3,
		getCurrentItem = createComputed(function(p1)
			-- upvalues: var1 (ref), var3 (ref)
			return var1(p1)[var3(p1)]
		end),
		addItems = function(p1)
			-- upvalues: var2 (ref), cryoModule (copy), var1 (ref)
			if #p1 == 0 then
				return
			end
			var2(cryoModule.List.join(var1(false), p1))
		end,
		addItemAt = function(p1, p2)
			-- upvalues: var1 (ref), signalsExperimentalModule (copy), var2 (ref), var3 (ref), var4 (ref), snapMathModule (copy)
			local var5 = var1(false)
			local var8Count = #var5
			local clampedValue = math.clamp(p1, 1, var8Count + 1)
			local cloned = table.clone(var5)
			table.insert(cloned, clampedValue, p2)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), cloned (ref), var8Count (ref), var3 (copy), clampedValue (ref), var4 (copy), snapMathModule (copy)
				var2(cloned)
				
				if var8Count > 0 then
					local var6 = var3(false)
					
					if clampedValue <= var6 then
						var4(snapMathModule.clampIndex(var6 + 1, #cloned))
					end
				end
			end)
		end,
		removeItem = function(p1)
			-- upvalues: var1 (ref), signalsExperimentalModule (copy), var2 (ref), var4 (ref), snapMathModule (copy), var3 (ref)
			local var5 = var1(false)
			
			if p1 < 1 or #var5 < p1 then
				return
			end
			local cloned = table.clone(var5)
			table.remove(cloned, p1)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), cloned (ref), var4 (copy), snapMathModule (copy), var3 (copy), p1 (ref)
				var2(cloned)
				var4(snapMathModule.reindexAfterRemoval(var3(false), p1, #cloned))
			end)
		end,
		setItems = function(value)
			-- upvalues: signalsExperimentalModule (copy), var2 (ref), var4 (ref), snapMathModule (copy), var3 (ref)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), value (ref), var4 (copy), snapMathModule (copy), var3 (copy)
				var2(table.clone(value))
				var4(snapMathModule.clampIndex(var3(false), #value))
			end)
		end,
		reset = function()
			-- upvalues: signalsExperimentalModule (copy), var2 (ref), var4 (ref)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), var4 (copy)
				var2({})
				var4(1)
			end)
		end,
		nextItem = function()
			-- upvalues: var3 (ref), var4 (ref), snapMathModule (copy), var1 (ref)
			var4(snapMathModule.clampIndex(var3(false) + 1, #var1(false)))
		end,
		previousItem = function()
			-- upvalues: var3 (ref), var4 (ref), snapMathModule (copy), var1 (ref)
			var4(snapMathModule.clampIndex(var3(false) - 1, #var1(false)))
		end,
		goToItem = function(p1)
			-- upvalues: var4 (ref), snapMathModule (copy), var1 (ref)
			var4(snapMathModule.clampIndex(p1, #var1(false)))
		end,
		dispose = function() end
	}
end