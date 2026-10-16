local Parent = script:FindFirstAncestor("Moments").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local SnapMathModule = require(script.Parent.snapMath)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function() --[[ Line: 64 | Named "createPagerStore" ]]
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), SnapMathModule (copy), CryoModule (copy), SignalsExperimentalModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(1)
	
	return {
		getItems = Signal,
		getCount = CreateComputedFunction(function(p1): number --[[ Line: 68 ]]
			-- upvalues: Signal (copy)
			return #Signal(p1)
		end),
		getCurrentIndex = Signal1,
		getCurrentItem = CreateComputedFunction(function(p1) --[[ Line: 72 ]]
			-- upvalues: Signal (copy), Signal1 (copy)
			return Signal(p1)[Signal1(p1)]
		end),
		addItems = function(p1) --[[ Line: 91 ]]
			-- upvalues: Signal2 (copy), CryoModule (upval), Signal (copy)
			if #p1 ~= 0 then
				Signal2((CryoModule.List.join(Signal(false), p1)))
				
				return
			end
		end,
		addItemAt = function(Value: number, p1) --[[ Line: 100 ]]
			-- upvalues: Signal (copy), SignalsExperimentalModule (upval), Signal2 (copy), Signal1 (copy), Signal2_1 (copy), SnapMathModule (upval)
			local SignalResult = Signal(false)
			local CountSignalResult = #SignalResult
			local ClampedValue = math.clamp(Value, 1, CountSignalResult + 1)
			local Copy = table.clone(SignalResult)
			table.insert(Copy, ClampedValue, p1)
			SignalsExperimentalModule.batch(function() --[[ Line: 110 ]]
				-- upvalues: Signal2 (upval), Copy (copy), CountSignalResult (copy), Signal1 (upval), ClampedValue (copy), Signal2_1 (upval), SnapMathModule (upval)
				Signal2(Copy)
				
				if CountSignalResult > 0 then
					local SignalResult: number = Signal1(false)
					
					if ClampedValue <= SignalResult then
						Signal2_1(SnapMathModule.clampIndex(SignalResult + 1, #Copy))
					end
				end
			end)
		end,
		removeItem = function(Index: number) --[[ Line: 123 ]]
			-- upvalues: Signal (copy), SignalsExperimentalModule (upval), Signal2 (copy), Signal2_1 (copy), SnapMathModule (upval), Signal1 (copy)
			local SignalResult = Signal(false)
			
			if Index >= 1 and #SignalResult >= Index then
				local Copy = table.clone(SignalResult)
				table.remove(Copy, Index)
				SignalsExperimentalModule.batch(function() --[[ Line: 135 ]]
					-- upvalues: Signal2 (upval), Copy (copy), Signal2_1 (upval), SnapMathModule (upval), Signal1 (upval), Index (copy)
					Signal2(Copy)
					Signal2_1(SnapMathModule.reindexAfterRemoval(Signal1(false), Index, #Copy))
				end)
				
				return
			end
		end,
		setItems = function(Tbl) --[[ Line: 143 ]]
			-- upvalues: SignalsExperimentalModule (upval), Signal2 (copy), Signal2_1 (copy), SnapMathModule (upval), Signal1 (copy)
			SignalsExperimentalModule.batch(function() --[[ Line: 144 ]]
				-- upvalues: Signal2 (upval), Tbl (copy), Signal2_1 (upval), SnapMathModule (upval), Signal1 (upval)
				Signal2(table.clone(Tbl))
				Signal2_1(SnapMathModule.clampIndex(Signal1(false), #Tbl))
			end)
		end,
		reset = function() --[[ Line: 151 ]]
			-- upvalues: SignalsExperimentalModule (upval), Signal2 (copy), Signal2_1 (copy)
			SignalsExperimentalModule.batch(function() --[[ Line: 152 ]]
				-- upvalues: Signal2 (upval), Signal2_1 (upval)
				Signal2({})
				Signal2_1(1)
			end)
		end,
		nextItem = function() --[[ Line: 81 ]]
			-- upvalues: Signal1 (copy), Signal2_1 (copy), SnapMathModule (upval), Signal (copy)
			Signal2_1(SnapMathModule.clampIndex(Signal1(false) + 1, #Signal(false)))
		end,
		previousItem = function() --[[ Line: 85 ]]
			-- upvalues: Signal1 (copy), Signal2_1 (copy), SnapMathModule (upval), Signal (copy)
			Signal2_1(SnapMathModule.clampIndex(Signal1(false) - 1, #Signal(false)))
		end,
		goToItem = function(p1) --[[ Line: 77 ]]
			-- upvalues: Signal2_1 (copy), SnapMathModule (upval), Signal (copy)
			Signal2_1(SnapMathModule.clampIndex(p1, #Signal(false)))
		end,
		dispose = function() --[[ Line: 158 ]] end
	}
end