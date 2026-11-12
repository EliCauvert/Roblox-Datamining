local TransientUIOverlay = script:FindFirstAncestor("TransientUIOverlay")
local SignalsModule = require(TransientUIOverlay.Parent.Signals)
local _ = require(TransientUIOverlay.Types)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local Signal4, Signal2_3 = SignalsModule.createSignal(0)
	
	local function _(p1)
		-- upvalues: Signal2_2 (copy)
		Signal2_2(p1)
	end
	
	local _ = function()
		-- upvalues: Signal3 (copy), Signal2_2 (copy)
		local SignalResult = Signal3(false)
		
		if SignalResult then
			task.cancel(SignalResult)
			Signal2_2(nil)
		end
	end
	
	return {
		currentSnackbar = Signal,
		currentDialog = Signal1,
		dialogPresentationId = Signal4,
		displaySnackbar = function(p1, Delay)
			-- upvalues: Signal3 (copy), Signal2_2 (copy), Signal2 (copy)
			local SignalResult = Signal3(false)
			
			if SignalResult then
				task.cancel(SignalResult)
				Signal2_2(nil)
			end
			Signal2(p1)
			Signal2_2((task.delay(Delay, function()
				-- upvalues: Signal2_2 (upval), Signal2 (upval)
				Signal2_2(nil)
				Signal2(nil)
			end)))
		end,
		displayDialog = function(p1)
			-- upvalues: Signal2_3 (copy), Signal4 (copy), Signal2_1 (copy)
			Signal2_3(Signal4(false) + 1)
			Signal2_1(p1)
		end,
		clearSnackbar = function()
			-- upvalues: Signal3 (copy), Signal2_2 (copy), Signal2 (copy)
			local SignalResult = Signal3(false)
			
			if SignalResult then
				task.cancel(SignalResult)
				Signal2_2(nil)
			end
			Signal2(nil)
		end,
		clearDialog = function()
			-- upvalues: Signal2_1 (copy)
			Signal2_1(nil)
		end
	}
end