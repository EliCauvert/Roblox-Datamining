local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(true)
	local Callback = nil
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	
	return {
		getChromeVisible = Signal,
		setChromeVisible = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		revealChrome = function()
			-- upvalues: Callback (ref), Signal2 (copy)
			if Callback == nil then
				Signal2(true)
				
				return
			else
				Callback()
			end
		end,
		setRevealHandler = function(Value)
			-- upvalues: Callback (ref)
			Callback = Value
		end,
		getOverlayCovering = Signal1,
		setOverlayCovering = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end
	}
end