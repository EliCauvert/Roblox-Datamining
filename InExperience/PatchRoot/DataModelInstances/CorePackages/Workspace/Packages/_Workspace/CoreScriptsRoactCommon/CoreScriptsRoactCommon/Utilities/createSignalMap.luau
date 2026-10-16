local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)

return function(List) --[[ Line: 22 | Named "createSignalMap" ]]
	-- upvalues: SignalsModule (copy), CryoModule (copy)
	local t = {}
	local Count = 0
	
	if List then
		for i, value in pairs(List) do
			t[i] = value
			Count += 1
		end
	end
	local Signal, Signal2 = SignalsModule.createSignal(t)
	local Signal1, Signal2_1 = SignalsModule.createSignal(Count)
	
	return {
		getData = function(p1, p2) --[[ Line: 35 ]]
			-- upvalues: Signal (copy)
			return Signal(p2)[p1]
		end,
		setData = function(p1, p2, p3) --[[ Line: 39 ]]
			-- upvalues: Signal (copy), CryoModule (upval), Signal2_1 (copy), Signal1 (copy), Signal2 (copy)
			local SignalResult = Signal(p3)
			local JoinResult = CryoModule.Dictionary.join(SignalResult, { [p1] = p2 })
			
			if not SignalResult[p1] then
				Signal2_1(Signal1(p3) + 1)
			end
			Signal2(JoinResult)
		end,
		removeData = function(p1, p2) --[[ Line: 49 ]]
			-- upvalues: Signal (copy), CryoModule (upval), Signal2_1 (copy), Signal1 (copy), Signal2 (copy)
			local SignalResult = Signal(p2)
			
			if SignalResult[p1] then
				local JoinResult = CryoModule.Dictionary.join(SignalResult, { [p1] = CryoModule.None })
				Signal2_1(Signal1(p2) - 1)
				Signal2(JoinResult)
			end
		end,
		getCount = Signal1,
		iterateData = function(Callback, p1) --[[ Line: 64 ]]
			-- upvalues: SignalsModule (upval), Signal (copy)
			return SignalsModule.createEffect(function() --[[ Line: 65 ]]
				-- upvalues: Signal (upval), p1 (copy), Callback (copy)
				for i, value in pairs((Signal(p1))) do
					Callback(i, value)
				end
			end)
		end,
		getAllData = SignalsModule.createComputed(function(p2) --[[ Line: 60 ]]
			-- upvalues: Signal (copy)
			return Signal(p2)
		end)
	}
end