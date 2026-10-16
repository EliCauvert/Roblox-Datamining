local Parent = script:FindFirstAncestor("Moments").Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function() --[[ Line: 18 | Named "createModeratedItemsStore" ]]
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), CryoModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local t = {}
	
	return {
		getItems = Signal,
		getIsModerated = function(Value) --[[ Line: 22 ]]
			-- upvalues: t (copy), CreateComputedFunction (upval), Signal (copy)
			if t[Value] == nil then
				t[Value] = CreateComputedFunction(function(p1): boolean --[[ Line: 24 ]]
					-- upvalues: Signal (upval), Value (copy)
					return table.find(Signal(p1), Value) ~= nil
				end)
			end
			return t[Value]
		end,
		markReported = function(Value) --[[ Line: 31 ]]
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local SignalResult = Signal(false)
			
			if not table.find(SignalResult, Value) then
				Signal2((CryoModule.List.join(SignalResult, { Value })))
			end
		end,
		addModeratedItems = function(List) --[[ Line: 38 ]]
			-- upvalues: Signal (copy), Signal2 (copy), CryoModule (upval)
			local SignalResult = Signal(false)
			local List1 = {}
			
			for _, value in List do
				if not table.find(SignalResult, value) then
					table.insert(List1, value)
				end
			end
			if #List1 > 0 then
				Signal2((CryoModule.List.join(SignalResult, List1)))
			end
		end
	}
end