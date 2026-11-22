local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local _ = require(Parent.Foundation)
local CreateSignalFunction = require(Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Count = 0
	
	return {
		getToast = Signal,
		getToastId = Signal1,
		show = function(p1): number
			-- upvalues: Signal (copy), Count (ref), Signal2 (copy), Signal2_1 (copy)
			local SignalResult = Signal(false)
			Count += 1
			local Count1: number = Count
			Signal2(p1)
			Signal2_1(Count1)
			
			if SignalResult and SignalResult.onDismiss then
				SignalResult.onDismiss()
			end
			return Count1
		end,
		dismiss = function(p1)
			-- upvalues: Signal1 (copy), Signal2 (copy), Signal2_1 (copy)
			if Signal1(false) == p1 then
				Signal2(nil)
				Signal2_1(nil)
			end
		end,
		expire = function(p1)
			-- upvalues: Signal (copy), Signal1 (copy), Signal2 (copy), Signal2_1 (copy)
			local SignalResult = Signal(false)
			
			if Signal1(false) ~= p1 or SignalResult == nil then return end
			if Signal1(false) == p1 then
				Signal2(nil)
				Signal2_1(nil)
			end
			if SignalResult.onDismiss then
				SignalResult.onDismiss()
			end
		end
	}
end