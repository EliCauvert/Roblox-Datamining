local SignalsModule = require(script:FindFirstAncestor("DictationCore").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local v1 = nil
	local Count = 0
	
	return {
		getHolderId = Signal,
		createHolderId = function(): number
			-- upvalues: Count (ref)
			Count += 1
			
			return Count
		end,
		hold = function(p1, p2): boolean
			-- upvalues: Signal (copy), v1 (ref), Signal2 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult ~= nil and SignalResult ~= p1 then
				return false
			end
			v1 = p2
			
			if SignalResult == nil then
				Signal2(p1)
			end
			return true
		end,
		steal = function(p1, p2)
			-- upvalues: Signal (copy), v1 (ref), Signal2 (copy)
			local SignalResult = Signal(false)
			local Callback: () -> () = v1
			v1 = p2
			
			if SignalResult == p1 then return end
			Signal2(p1)
			
			if SignalResult ~= nil and Callback ~= nil then
				Callback()
			end
		end,
		drop = function(p1)
			-- upvalues: Signal (copy), v1 (ref), Signal2 (copy)
			if Signal(false) == p1 then
				v1 = nil
				Signal2(nil)
				
				return
			end
		end,
		reset = function()
			-- upvalues: v1 (ref), Signal2 (copy)
			v1 = nil
			Signal2(nil)
		end
	}
end