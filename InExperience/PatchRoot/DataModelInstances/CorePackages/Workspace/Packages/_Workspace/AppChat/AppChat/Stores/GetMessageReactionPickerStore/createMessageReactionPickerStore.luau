local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	
	local function _(p1)
		-- upvalues: Signal1 (copy), Signal2_1 (copy)
		local SignalResult = Signal1(false)
		Signal2_1(p1)
		
		if SignalResult ~= nil and SignalResult ~= p1 then
			SignalResult.onShownEnded()
		end
	end
	
	return {
		getOpenPicker = Signal,
		getShownPicker = Signal1,
		openPicker = function(p1)
			-- upvalues: Signal2 (copy), Signal1 (copy), Signal2_1 (copy)
			Signal2(p1)
			local SignalResult = Signal1(false)
			Signal2_1(p1)
			
			if SignalResult ~= nil and SignalResult ~= p1 then
				SignalResult.onShownEnded()
			end
		end,
		closePicker = function()
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end,
		closePickerForMessage = function(MessageId)
			-- upvalues: Signal (copy), Signal2 (copy), Signal1 (copy), Signal2_1 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult ~= nil and SignalResult.messageId == MessageId then
				Signal2(nil)
			end
			local SignalResult1 = Signal1(false)
			
			if SignalResult1 ~= nil and SignalResult1.messageId == MessageId then
				local SignalResult2 = Signal1(false)
				Signal2_1(nil)
				
				if SignalResult2 ~= nil and SignalResult2 ~= nil then
					SignalResult2.onShownEnded()
				end
			end
		end,
		onPickerClosed = function()
			-- upvalues: Signal (copy), Signal1 (copy), Signal2_1 (copy)
			if Signal(false) == nil then
				local SignalResult = Signal1(false)
				Signal2_1(nil)
				
				if SignalResult ~= nil and SignalResult ~= nil then
					SignalResult.onShownEnded()
				end
			end
		end
	}
end